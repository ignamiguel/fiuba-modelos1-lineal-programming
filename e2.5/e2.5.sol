Problem:    e2
Rows:       7
Columns:    6
Non-zeros:  14
Status:     OPTIMAL
Objective:  z = 36000 (MAXimum)

   No.   Row name   St   Activity     Lower bound   Upper bound    Marginal
------ ------------ -- ------------- ------------- ------------- -------------
     1 z            B          36000                             
     2 procEq1      NU            70                          70           240 
     3 procEq2      NU            60                          60           320 
     4 procEq3      NS             0            -0             =             1 
     5 procEq4      NS             0            -0             =             2 
     6 procEq5      B          16800         10000               
     7 procEq6      B           9600          9000               

   No. Column name  St   Activity     Lower bound   Upper bound    Marginal
------ ------------ -- ------------- ------------- ------------- -------------
     1 ER_T1        B             70             0               
     2 ER_T2        NL             0             0                        -128 
     3 EL_T1        NL             0             0                        -304 
     4 EL_T2        B             60             0               
     5 T1           B          16800             0               
     6 T2           B           9600             0               

Karush-Kuhn-Tucker optimality conditions:

KKT.PE: max.abs.err = 1.42e-14 on row 2
        max.rel.err = 1.01e-16 on row 2
        High quality

KKT.PB: max.abs.err = 0.00e+00 on row 0
        max.rel.err = 0.00e+00 on row 0
        High quality

KKT.DE: max.abs.err = 0.00e+00 on column 0
        max.rel.err = 0.00e+00 on column 0
        High quality

KKT.DB: max.abs.err = 0.00e+00 on row 0
        max.rel.err = 0.00e+00 on row 0
        High quality

End of output
