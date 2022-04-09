# == VARIABLES == #
# Resolución 1 - Contenido del archivo 1.mod. /* Declaracíon de variables */
var A >= 0;
var B >= 0;
var C >= 0;

var B_1 >= 0;
var B_2 >= 0;

# == FUNCIONAL == #
# Z = $10A + $15B_M1 + $15B_M2 + $18C
maximize z: 10 * A + 15 * B_1 + 15 * B_2 + 18 * C;

# == RESTRICCIONES == #
# Relación Entrada/Salida (E/S)

# "subject to" s.t.

# La Lana Mejorada disponible es 20 kg/sem
# 1.6 (kg/pulóver) A (pulóveres/sem) + 1.2 (kg/pulóver) C (pulóveres/sem)  <= 20 (kg/sem)
s.t. procEq1: 1.6 * A + 1.2 * C <= 20;

# La Lana Normal disponible es 36 kg/sem
# 1.8 (kg/pulóver) B (pulóveres/semana) <= 36 (kg/sem)
s.t. procEq2: 1.8 * B <= 36;

# Disponibilidad Máquina 1 es 80 (hs/semana)
# 5 (hs/pulóver) A (pulóveres/sem) + 6 (hs/pulóver) B_M1 (pulóveres/sem) <= 80 (hs/semana)
s.t. procEq3: 5 * A  + 6 * B_1 <= 80;

# Disponibilidad Máquina 2 es 80 (hs/semana)
# 4 (hs/pulóver) C (pulóveres/sem) + 4 (hs/pulóver) B_M2 (pulóveres/sem) <= 80 (hs/semana)
s.t. procEq4: 4 * C  + 4 * B_2 <= 80;

# Compromiso de B/semana
# B = B_M1 + B_M2 >= 10 unidades/semana
s.t. procEq5: B = B_1 + B_2;
s.t. procEq6: B >= 10;

end;

# glpsol -m mod1.lp -o mod1.sol
