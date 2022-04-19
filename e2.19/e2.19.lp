# EJERCICIO 2.19

# == VARIABLES == #
# Bobinas
# range rollos = 1..18;
set N_ROLLOS := 1..18;

# Ai: cantidad de cortes de 64cm de ancho para la bobina i [cm/p]
# Bi: cantidad de cortes de 60cm de ancho para la bobina i [cm/p]
# Ci: cantidad de cortes de 30cm de ancho para la bobina i [cm/p]
# Di: cantidad de desperdicio para la bobina i [cm/p]
var A{i in N_ROLLOS} >= 0, integer;
var B{i in N_ROLLOS} >= 0, integer;
var C{i in N_ROLLOS} >= 0, integer;
var D{i in N_ROLLOS} >= 0;


# == FUNCIONAL == #
minimize z: sum {i in N_ROLLOS} D[i];

# == RESTRICCIONES == #
# "subject to" s.t.

# Materia Prima disponible
# 18 bobinas de papel de 1000 metros de largo
# Xi: bobina de papel de 1000 metros número i, [metros/p]
# con i = [1 - 18]

# Ai * 64 cm + Bi * 60 cm + Ci * 35 cm + Di = 215 cm

s.t. s_constraint {i in N_ROLLOS}: A[i] * 64 + B[i] * 60 + C[i] * 35 + D[i] = 215;

# Demanda mínima
# A: cantidad de bobinas de 64cm de ancho de 1000 m de largo [unidades/p]
# B: cantidad de bobinas de 60cm de ancho de 1000 m de largo [unidades/p]
# C: cantidad de bobinas de 35cm de ancho de 1000 m de largo [unidades/p]
# D: cantidad de desperdicio total en bobinas de 1000 m de largo [unidades/p]

# A >= 18 [u/p]
s.t. a_constraint: sum {i in N_ROLLOS} A[i] >= 18;

# B >= 9 [u/p]
s.t. b_constraint: sum {i in N_ROLLOS} B[i] >= 9;

# C >= 9 [u/p]
s.t. c_constraint: sum {i in N_ROLLOS} C[i] >= 9;

end;

# glpsol -m mod1.lp -o mod1.sol
