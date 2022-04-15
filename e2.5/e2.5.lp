# EJERCICIO 2.5

# == VARIABLES == #
# ER_T1: cantidad de estampadoras rápidas destinadas a estampar Snoopy [unidades/día]
# ER_T2: cantidad de estampadoras rápidas destinadas a estampar Scooby [unidades/día]
var ER_T1 >= 0;
var ER_T2 >= 0;

# EL_T1: cantidad de estampadoras lentas destinadas a estampar Snoopy [unidades/día]
# EL_T2: cantidad de estampadoras lentas destinadas a estampar Scooby [unidades/día]
var EL_T1 >= 0;
var EL_T2 >= 0;

# Metros de tela
# T1: cantidad de metros de tela Snoopy estampada en un día [metros/día]
# T2: cantidad de metros de tela Scooby estampada en un día [metros/día]
var T1 >= 0;
var T2 >= 0;

# == FUNCIONAL == #
# Cada metro de tela Snoopy se vende a $K y un metro de tela Scooby se vende a $M.
# Z (max) = $K * T1 + $M * T2
# $K = 1, $M = 2

maximize z: 1 * T1 + 2 * T2;

# == RESTRICCIONES == #
# Relación Entrada/Salida (E/S)

# "subject to" s.t.

# Disponibilidad total de Estampadoras Rápidas
# ER_T1 + ER_T2 <= 70 [unidades/dia]
s.t. procEq1: ER_T1 + ER_T2 <= 70;

# Disponibilidad total de Estampadoras Lentas
# EL_T1 + EL_T2 <= 60 [unidades/dia]
s.t. procEq2: EL_T1 + EL_T2 <= 60;

# R = 30
s.t. procEq3: T1 = ER_T1 * 30 * 8 + EL_T1 * 2 * 8;

# L = 20
s.t. procEq4: T2 = ER_T2 * 7 * 8 + EL_T2 * 20 * 8;

# Demana mínima de 10000 metros de tela Snoopy y 9000 metros de Scooby.
s.t. procEq5: T1 >= 10000;
s.t. procEq6: T2 >= 9000;

# ---

end;

# glpsol -m mod1.lp -o mod1.sol
