# AggregatePlanning-CPLEX
Aggregate Planning Problem is solved with an MILP model using CPLEX in C++

# Problem Definition

Can Caravan is a renowned caravan manufacturer, who offers a variety of *42 models* to its
customers. These 42 models are grouped under two main categories with respect to their
manufacturing requirements, i.e. *basic* and *pro* series. For the June 2022-May 2023 period,
the company wishes to develop an aggregate production plan.

The monthly demand forecast for different caravan series for the planning period is given
below.

|         | *Basic* | *Pro* |
|---------|---------|-------|
| Jun.22  | 28      | 14    |
| Jul.22  | 20      | 10    |
| Aug.22  | 26      | 4     |
| Sep.22  | 24      | 4     |
| Oct.22  | 18      | 6     |
| Nov.22  | 10      | 8     |
| Dec.22  | 22      | 10    |
| Jan.23  | 20      | 12    |
| Feb.23  | 18      | 6     |
| Mar.23  | 32      | 8     |
| Apr.23  | 34      | 14    |
| May.23  | 36      | 6     |

Cost of producing a basic series caravan is estimated to be *$6250*, excluding cost of direct labour. This figure is *$9750* for pro series caravans. Considering the direct labour requirements, a basic series product demands *380* man.hours for production, whereas a pro series caravan requires *530* man.hours. Holding cost of a basic caravan is estimated to be *$250* per caravan per month, whereas it costs *$500* to hold one unit of pro caravan in stock for a month. At the end of May 2022, the company projects to have *8* units of basic model, and *3* units of pro model caravans in it stocks.

Currently the company employs 86 assembly workers, who work 180 hours per month on average. Average monthly salary of an assembly worker is $420. Workers can be asked to work overtime, which is limited by 40 hours per month. The hourly fee for overtime is 50% more than the regular hourly fee.

Considering the administrative costs and inefficiencies during the orientation period, cost of employing a new worker is estimated to be $800 per worker. During lay-offs, the company pays $1400 per worker.

Formulate and solve the aggregate production planning problem. To develop the aggregate plan, you will need to construct and solve a linear programming problem minimizing the overall cost comprised of production, holding inventory and
workforce related (regular time and overtime) costs. Shortages are not allowed.

The [model](https://github.com/karaee/AggregatePlanning-CPLEX/blob/main/model.lp) and the [result](https://github.com/karaee/AggregatePlanning-CPLEX/blob/main/result.txt) can be found in the repository.
