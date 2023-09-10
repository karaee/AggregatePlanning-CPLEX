\ENCODING=ISO-8859-1
\Problem name: IloCplex

Minimize
 obj1: 6250 P_1_1 + 6250 P_1_2 + 6250 P_1_3 + 6250 P_1_4 + 6250 P_1_5
       + 6250 P_1_6 + 6250 P_1_7 + 6250 P_1_8 + 6250 P_1_9 + 6250 P_1_10
       + 6250 P_1_11 + 6250 P_1_12 + 9750 P_2_1 + 9750 P_2_2 + 9750 P_2_3
       + 9750 P_2_4 + 9750 P_2_5 + 9750 P_2_6 + 9750 P_2_7 + 9750 P_2_8
       + 9750 P_2_9 + 9750 P_2_10 + 9750 P_2_11 + 9750 P_2_12 + 420 W_1
       + 420 W_2 + 420 W_3 + 420 W_4 + 420 W_5 + 420 W_6 + 420 W_7 + 420 W_8
       + 420 W_9 + 420 W_10 + 420 W_11 + 420 W_12 + 250 Inv_1_1 + 250 Inv_1_2
       + 250 Inv_1_3 + 250 Inv_1_4 + 250 Inv_1_5 + 250 Inv_1_6 + 250 Inv_1_7
       + 250 Inv_1_8 + 250 Inv_1_9 + 250 Inv_1_10 + 250 Inv_1_11 + 250 Inv_1_12
       + 500 Inv_2_1 + 500 Inv_2_2 + 500 Inv_2_3 + 500 Inv_2_4 + 500 Inv_2_5
       + 500 Inv_2_6 + 500 Inv_2_7 + 500 Inv_2_8 + 500 Inv_2_9 + 500 Inv_2_10
       + 500 Inv_2_11 + 500 Inv_2_12 + 140 O_1 + 140 O_2 + 140 O_3 + 140 O_4
       + 140 O_5 + 140 O_6 + 140 O_7 + 140 O_8 + 140 O_9 + 140 O_10 + 140 O_11
       + 140 O_12 + 800 H_1 + 800 H_2 + 800 H_3 + 800 H_4 + 800 H_5 + 800 H_6
       + 800 H_7 + 800 H_8 + 800 H_9 + 800 H_10 + 800 H_11 + 800 H_12
       + 1400 F_1 + 1400 F_2 + 1400 F_3 + 1400 F_4 + 1400 F_5 + 1400 F_6
       + 1400 F_7 + 1400 F_8 + 1400 F_9 + 1400 F_10 + 1400 F_11 + 1400 F_12
Subject To
 initial_inventory_i.1#0:        Inv_1_0  = 8
 initial_inventory_i.2#1:        Inv_2_0  = 3
 inventory_balance_t.1,i.1#2:    - P_1_1 - Inv_1_0 + Inv_1_1  = -28
 inventory_balance_t.2,i.1#3:    - P_1_2 - Inv_1_1 + Inv_1_2  = -20
 inventory_balance_t.3,i.1#4:    - P_1_3 - Inv_1_2 + Inv_1_3  = -26
 inventory_balance_t.4,i.1#5:    - P_1_4 - Inv_1_3 + Inv_1_4  = -24
 inventory_balance_t.5,i.1#6:    - P_1_5 - Inv_1_4 + Inv_1_5  = -18
 inventory_balance_t.6,i.1#7:    - P_1_6 - Inv_1_5 + Inv_1_6  = -10
 inventory_balance_t.7,i.1#8:    - P_1_7 - Inv_1_6 + Inv_1_7  = -22
 inventory_balance_t.8,i.1#9:    - P_1_8 - Inv_1_7 + Inv_1_8  = -20
 inventory_balance_t.9,i.1#10:   - P_1_9 - Inv_1_8 + Inv_1_9  = -18
 inventory_balance_t.10,i.1#11:  - P_1_10 - Inv_1_9 + Inv_1_10  = -32
 inventory_balance_t.11,i.1#12:  - P_1_11 - Inv_1_10 + Inv_1_11  = -34
 inventory_balance_t.12,i.1#13:  - P_1_12 - Inv_1_11 + Inv_1_12  = -36
 inventory_balance_t.1,i.2#14:   - P_2_1 - Inv_2_0 + Inv_2_1  = -14
 inventory_balance_t.2,i.2#15:   - P_2_2 - Inv_2_1 + Inv_2_2  = -10
 inventory_balance_t.3,i.2#16:   - P_2_3 - Inv_2_2 + Inv_2_3  = -4
 inventory_balance_t.4,i.2#17:   - P_2_4 - Inv_2_3 + Inv_2_4  = -4
 inventory_balance_t.5,i.2#18:   - P_2_5 - Inv_2_4 + Inv_2_5  = -6
 inventory_balance_t.6,i.2#19:   - P_2_6 - Inv_2_5 + Inv_2_6  = -8
 inventory_balance_t.7,i.2#20:   - P_2_7 - Inv_2_6 + Inv_2_7  = -10
 inventory_balance_t.8,i.2#21:   - P_2_8 - Inv_2_7 + Inv_2_8  = -12
 inventory_balance_t.9,i.2#22:   - P_2_9 - Inv_2_8 + Inv_2_9  = -6
 inventory_balance_t.10,i.2#23:  - P_2_10 - Inv_2_9 + Inv_2_10  = -8
 inventory_balance_t.11,i.2#24:  - P_2_11 - Inv_2_10 + Inv_2_11  = -14
 inventory_balance_t.12,i.2#25:  - P_2_12 - Inv_2_11 + Inv_2_12  = -6
 initial_workforce#26:           W_0  = 86
 workforce_balance_constraint_t.1#27: - W_0 + W_1 - H_1 + F_1  = 0
 workforce_balance_constraint_t.2#28: - W_1 + W_2 - H_2 + F_2  = 0
 workforce_balance_constraint_t.3#29: - W_2 + W_3 - H_3 + F_3  = 0
 workforce_balance_constraint_t.4#30: - W_3 + W_4 - H_4 + F_4  = 0
 workforce_balance_constraint_t.5#31: - W_4 + W_5 - H_5 + F_5  = 0
 workforce_balance_constraint_t.6#32: - W_5 + W_6 - H_6 + F_6  = 0
 workforce_balance_constraint_t.7#33: - W_6 + W_7 - H_7 + F_7  = 0
 workforce_balance_constraint_t.8#34: - W_7 + W_8 - H_8 + F_8  = 0
 workforce_balance_constraint_t.9#35: - W_8 + W_9 - H_9 + F_9  = 0
 workforce_balance_constraint_t.10#36: - W_9 + W_10 - H_10 + F_10  = 0
 workforce_balance_constraint_t.11#37: - W_10 + W_11 - H_11 + F_11  = 0
 workforce_balance_constraint_t.12#38: - W_11 + W_12 - H_12 + F_12  = 0
 labor_capacity_constraint_t.1#39: 380 P_1_1 + 530 P_2_1 - 180 W_1 - 40 O_1
                                 <= 0
 labor_capacity_constraint_t.2#40: 380 P_1_2 + 530 P_2_2 - 180 W_2 - 40 O_2
                                 <= 0
 labor_capacity_constraint_t.3#41: 380 P_1_3 + 530 P_2_3 - 180 W_3 - 40 O_3
                                 <= 0
 labor_capacity_constraint_t.4#42: 380 P_1_4 + 530 P_2_4 - 180 W_4 - 40 O_4
                                 <= 0
 labor_capacity_constraint_t.5#43: 380 P_1_5 + 530 P_2_5 - 180 W_5 - 40 O_5
                                 <= 0
 labor_capacity_constraint_t.6#44: 380 P_1_6 + 530 P_2_6 - 180 W_6 - 40 O_6
                                 <= 0
 labor_capacity_constraint_t.7#45: 380 P_1_7 + 530 P_2_7 - 180 W_7 - 40 O_7
                                 <= 0
 labor_capacity_constraint_t.8#46: 380 P_1_8 + 530 P_2_8 - 180 W_8 - 40 O_8
                                 <= 0
 labor_capacity_constraint_t.9#47: 380 P_1_9 + 530 P_2_9 - 180 W_9 - 40 O_9
                                 <= 0
 labor_capacity_constraint_t.10#48: 380 P_1_10 + 530 P_2_10 - 180 W_10
                                 - 40 O_10 <= 0
 labor_capacity_constraint_t.11#49: 380 P_1_11 + 530 P_2_11 - 180 W_11
                                 - 40 O_11 <= 0
 labor_capacity_constraint_t.12#50: 380 P_1_12 + 530 P_2_12 - 180 W_12
                                 - 40 O_12 <= 0
 overtime_uppermbound_t.1#51:    - W_1 + O_1 <= 0
 overtime_uppermbound_t.2#52:    - W_2 + O_2 <= 0
 overtime_uppermbound_t.3#53:    - W_3 + O_3 <= 0
 overtime_uppermbound_t.4#54:    - W_4 + O_4 <= 0
 overtime_uppermbound_t.5#55:    - W_5 + O_5 <= 0
 overtime_uppermbound_t.6#56:    - W_6 + O_6 <= 0
 overtime_uppermbound_t.7#57:    - W_7 + O_7 <= 0
 overtime_uppermbound_t.8#58:    - W_8 + O_8 <= 0
 overtime_uppermbound_t.9#59:    - W_9 + O_9 <= 0
 overtime_uppermbound_t.10#60:   - W_10 + O_10 <= 0
 overtime_uppermbound_t.11#61:   - W_11 + O_11 <= 0
 overtime_uppermbound_t.12#62:   - W_12 + O_12 <= 0
Bounds
      H_1 >= 0
      H_2 >= 0
      H_3 >= 0
      H_4 >= 0
      H_5 >= 0
      H_6 >= 0
      H_7 >= 0
      H_8 >= 0
      H_9 >= 0
      H_10 >= 0
      H_11 >= 0
      H_12 >= 0
      F_1 >= 0
      F_2 >= 0
      F_3 >= 0
      F_4 >= 0
      F_5 >= 0
      F_6 >= 0
      F_7 >= 0
      F_8 >= 0
      F_9 >= 0
      F_10 >= 0
      F_11 >= 0
      F_12 >= 0
Generals
 H_1  H_2  H_3  H_4  H_5  H_6  H_7  H_8  H_9  H_10  H_11  H_12  F_1  F_2  F_3 
 F_4  F_5  F_6  F_7  F_8  F_9  F_10  F_11  F_12 
End
