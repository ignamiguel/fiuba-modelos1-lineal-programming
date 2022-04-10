Problem:    tp1
Rows:       8
Columns:    2
Non-zeros:  14
Status:     OPTIMAL
Objective:  z = 95 (MAXimum)

   No.   Row name   St   Activity     Lower bound   Upper bound    Marginal
------ ------------ -- ------------- ------------- ------------- -------------
     1 z            B             95                             
     2 procEq5      B             45                          45 
     3 procEq6      NL            20            20                        -0.5 
     4 procEq7      B             25            10               
     5 procEq1      NU           140                         140          0.75 
     6 procEq2      B            190                         220 
     7 procEq3      B            820                        1000 
     8 procEq4      B            130                         200 

   No. Column name  St   Activity     Lower bound   Upper bound    Marginal
------ ------------ -- ------------- ------------- ------------- -------------
     1 PL           B             20             0               
     2 PR           B             25             0               

Karush-Kuhn-Tucker optimality conditions:

KKT.PE: max.abs.err = 0.00e+00 on row 0
        max.rel.err = 0.00e+00 on row 0
        High quality

KKT.PB: max.abs.err = 0.00e+00 on row 0
        max.rel.err = 0.00e+00 on row 0
        High quality

KKT.DE: max.abs.err = 4.44e-16 on column 2
        max.rel.err = 6.34e-17 on column 2
        High quality

KKT.DB: max.abs.err = 0.00e+00 on row 0
        max.rel.err = 0.00e+00 on row 0
        High quality

End of output
