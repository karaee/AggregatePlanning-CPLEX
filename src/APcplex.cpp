#include <iostream>
#include <ilcplex/ilocplex.h>
#include <vector>
#include <string>
#include <unordered_map>
#include <numeric>
using namespace std::literals::string_literals;

int main()
{

    IloEnv env;
    IloModel model(env);

    // Objects
    //
    // Caravan models, two categories i = 1, 2 (basic, pro)
    // Months t = 1..12 (Jun-22 ... May-23)
    // Labor
    // Stock
    // Salary
    // Overtime
    // Hiring & firing

    #pragma region Sets
    std::vector<int> I(2);
    std::iota(I.begin(), I.end(), 1);

    std::vector<int> T(12);
    std::iota(T.begin(), T.end(), 1);

    std::vector<int> T_ext(13);
    std::iota(T_ext.begin(), T_ext.end(), 0);

    #pragma endregion

    #pragma region Parameters

    std::unordered_map<int, std::vector<double>> D;
    D[1] = {NAN, 28, 20, 26, 24, 18, 10, 22, 20, 18, 32, 34, 36};
    D[2] = {NAN, 14, 10, 4, 4, 6, 8, 10, 12, 6, 8, 14, 6};

    // Initialize other variables
    std::unordered_map<int, double> c = {{1, 6250}, {2, 9750}};   // Unit production cost, i = 1,2 [$]
    std::unordered_map<int, double> w = {{1, 380}, {2, 530}};     // Labor cost of production, i = 1,2 [man*hour /caravan]
    std::unordered_map<int, double> cHold = {{1, 250}, {2, 500}}; // Holding cost, i = 1,2 [$/caravan /month]
    double W_init = 86;                                           // Initial workforce
    int Hours = 180;                                              // Available regular work time [workhours/month]
    int OThours = 40;                                             // Available overtime [workhours/month]

    double cSalary = 420;   // Salary [$/worker]
    double cSalaryOT = 140; // Overtime Salary [$/worker]
    double cHire = 800;     // Hiring cost [$ / worker]
    double cFire = 1400;    // Firing cost [$ / worker]

    std::unordered_map<int, double> I_init = {{1, 8}, {2, 3}}; // Initial inventory for both categories

    #pragma endregion

    #pragma region Variables

    // Define decision variables

    std::unordered_map<int, std::unordered_map<int, IloNumVar>> P; // Production Level; i=1,2   t = 1..12 [caravans/month]
    for (int i : I)
        for (int t : T)
        {
            P[i][t] = IloNumVar(env, 0.0, IloInfinity, ILOFLOAT);
            model.add(P[i][t]).setName(("P_"s + std::to_string(i) + "_"+ std::to_string(t)).c_str());
        }

    std::unordered_map<int, IloNumVar> W; // Average workforce during period; t = 1..12 [man-hours/workhour]
    for (int t : T_ext)
    {
        W[t] = IloNumVar(env, 0.0, IloInfinity, ILOFLOAT);
        model.add(W[t]).setName(("W_"s + std::to_string(t)).c_str());
    }

    std::unordered_map<int, std::unordered_map<int, IloNumVar>> Inv; // Average inventory i=1,2   t = 0..12 [caravans/month]
    for (int i : I)
        for (int t : T_ext)
        {
            Inv[i][t] = IloNumVar(env, 0.0, IloInfinity, ILOFLOAT);
            model.add(Inv[i][t]).setName(("Inv_"s + std::to_string(i) + "_"+ std::to_string(t)).c_str());
        }

    std::unordered_map<int, IloNumVar> O; // Overtime workforce level t = 1..12 [man-hours/workhour]
    for (int t : T)
    {
        O[t] = IloNumVar(env, 0.0, IloInfinity, ILOFLOAT);
        model.add(O[t]).setName(("O_"s + std::to_string(t)).c_str());
    }

    std::unordered_map<int, IloNumVar> H; // Hired workers t = t = 1..12
    for (int t : T)
    {
        H[t] = IloNumVar(env, 0.0, IloInfinity, ILOINT);
        model.add(H[t]).setName(("H_"s + std::to_string(t)).c_str());
    }

    std::unordered_map<int, IloNumVar> F; // Fired workers t = t = 1..12
    for (int t : T)
    {
        F[t] = IloNumVar(env, 0.0, IloInfinity, ILOINT);
        model.add(F[t]).setName(("F_"s + std::to_string(t)).c_str());
    }
    #pragma endregion

    #pragma region Constraints

    // Define constraints
    for (int i : I) {
        model.add(Inv[i][0] == I_init[i]).setName( ("initial inventory i:"s + std::to_string(i)).c_str() );
    }

    for (int i : I) {
        for (int t : T) {
               model.add(Inv[i][t] == Inv[i][t - 1] + P[i][t] - D[i][t]).setName(
                ("inventory balance t:"s + std::to_string(t) + ",i:"s + std::to_string(i)).c_str());
        }
    }

    model.add(W[0] == W_init).setName("initial workforce");

    for (int t : T) {
        model.add(W[t] == W[t - 1] + H[t] - F[t]).setName(
            ("workforce balance constraint t:"s + std::to_string(t)).c_str());
    }

    for (int t : T) {
        model.add(w[1] * P[1][t] + w[2] * P[2][t] <= Hours * W[t] + OThours * O[t]).setName(
            ("labor capacity constraint t:"s + std::to_string(t)).c_str());
    }

    for (int t : T) {
        model.add(O[t] <= W[t]).setName(
            ("overtime upper-bound t:"s + std::to_string(t)).c_str());
    }

    #pragma endregion

    #pragma region Objective Function

    IloExpr z(env);
    for (int t : T) {
        for (int i : I) {
            z += cHold[i] * Inv[i][t] + c[i] * P[i][t];
        }
        z += cHire * H[t] + cFire * F[t] + cSalary * W[t] + cSalaryOT * O[t];
    }

    model.add(IloMinimize(env, z));
    z.end();


    #pragma endregion Objective Function

    IloCplex cplex(model);
    cplex.exportModel("../model.lp");
    cplex.solve();

    std::cout << std::endl << "Optimal Objective Value: " << cplex.getObjValue() << std::endl << std::endl;

    for (int i:I){
        std::cout << "i=" << i << std::endl;
        std::cout << "\t\tProduction\tInventory" << std::endl;
        for (int t:T){
            std::cout << t << "\t\t";
            std::cout << cplex.getValue(P[i][t]) << "\t\t" << cplex.getValue(Inv[i][t]) << std::endl;
        }
        std::cout << std::endl;;
    }
    

    cplex.end();
    env.end();


    return 0;
}