# == VARIABLES == #
# PL: cantidad de Proyectos Locales a realizar en el próximo semestre [proyecto/semestre]
var PL >= 0;
# PR: cantidad de Proyectos Regionales a realizar en el próximo semestre [proyecto/semestre]
var PR >= 0;

# == FUNCIONAL == #
# Z (MAX) = $A * PL + $B * PR
# $A = $1.000.000
# $B = $3.000.000
maximize z: 1 * PL + 3 * PR;

# == RESTRICCIONES == #
# "subject to" s.t.

# Se está planificando la realización de hasta 45 proyectos en total
s.t. procEq5: PL + PR <= 45;

# Al menos 20 proyectos deben ser locales
s.t. procEq6: PL >= 20;

# Al menos 10 deben ser regionales
s.t. procEq7: PR >= 10;

# Recurso: Líder de Proyectos
# 2 [hs/proyecto] * PL [proyecto/semestre] + 4 * [hs/proyecto] * PR [proyecto/semestre] <= 140
s.t. procEq1: 2 * PL + 4 * PR <= 140;

# Recurso: Diseñador UI
# 2 [hs/proyecto] * PL [proyecto/semestre] + 6 * [hs/proyecto] * PR [proyecto/semestre] <= 220
s.t. procEq2: 2 * PL + 6 * PR <= 220;

# Recurso: Desarrollador Full Stack
# 16 [hs/proyecto] * PL [proyecto/semestre] + 20 * [hs/proyecto] * PR [proyecto/semestre] <= 1000
s.t. procEq3: 16 * PL + 20 * PR <= 1000;

# Recurso: Tester
# 4 [hs/proyecto] * PL [proyecto/semestre] + 2 * [hs/proyecto] * PR [proyecto/semestre] <= 200
s.t. procEq4: 4 * PL + 2 * PR <= 200;


end;

# glpsol -m mod1.lp -o mod1.sol
