/*********************************************
 * OPL 20.1.0.0 Model
 * Author: Tomas
 * Creation Date: May 24, 2022 at 4:56:47 PM
 *********************************************/


// constantes de limite de valores
 float m = ...;
 int M = ...;

{string} origenes = ...;
{string} centros = ...;
{string} destinos = ...;
{string} medios = {"Aire", "Tierra", "Mar"};

int nOrig = card(origenes);
int nCent = card(centros);
int nDest = card(destinos);
int nMed = card(medios);

range rOrig = 1..nOrig;
range rCent = 1..nCent;
range rDest = 1..nDest;
range rMed = 1..nMed;


//ofertas por origen
int Oferta[rOrig] = ...;

//ofertas y demandas ficticias
//(el excel asegura que solo una sea distinta de y mayor a 0)
int OfertaFicticia = ...;
int DemandaFicticia = ...;
 
//Capacidades de Centros y Destinos por Medio de transporte 
int capacidadCentro[rCent][rMed] = ...;
int capacidadDestino[rDest][rMed] = ...;


//magia negra para que quede con el formato correcto
float coc1[rOrig][1..nMed*nCent] = ...;
float ccc1[rCent][1..nMed*nCent] = ...;
float ccd1[rCent][1..nMed*nDest] = ...;


float CostoOrigenCentro[a in rOrig][b in rCent][c in rMed] = coc1[a,c + nMed*(b-1)];
float CostoCentroCentro[a in rCent][b in rCent][c in rMed] = ccc1[a,c + nMed*(b-1)];
float CostoCentroDestino[a in rCent][b in rDest][c in rMed] = ccd1[a,c + nMed*(b-1)];


// cantidad de ayuda de origen i a centro j por medio m
dvar float+ xotm[rOrig][rCent][rMed];

//origen ficticio
//lo que envia del centro j por medio m
dvar float xoFicticioM[rCent][rMed];

//cantidad de ayuda de centro i a centro j por medio m
dvar float+ xttm[rCent][rCent][rMed];

//cantidad de ayuda de centro i a destino j por medio m
dvar float+ xtdm[rCent][rDest][rMed];

//destino ficticio
//lo que recibe de centro j por medio m
dvar float xdFicticioM[rCent][rMed];

dvar float+ s[rMed]; //suma de los costos o->c, c->c, c->d

//idem variables anteriores pero por todos los medios sumados
dvar float+ xot[rOrig][rCent];
dvar float+ xtt[rCent][rCent];
dvar float+ xtd[rCent][rDest];

dvar float+ xoFicticio[rCent];
dvar float+ xdFicticio[rCent];

minimize sum(i in 1..3) s[i];

subject to {
	costos_aire:   s[1] == sum(c in rCent, m in rMed) xoFicticioM[c,m] * M + sum(o in rOrig, c in rCent, m in rMed) xotm[o,c,m] * CostoOrigenCentro[o,c,m];
	costos_tierra: s[2] == sum(o,c in rCent, m in rMed) xttm[o,c,m] * CostoCentroCentro[o,c,m];
	costos_mar:    s[3] == sum(o in rCent, c in rDest, m in rMed) xtdm[o,c,m] * CostoCentroDestino[o,c,m] + sum(c in rCent, m in rMed) xdFicticioM[c,m] * M;
	
	total_origen_centro: 	forall (o in rOrig, c in rCent) xot[o,c] == xotm[o,c,1]+xotm[o,c,2]+xotm[o,c,3];
	total_centro_centro: 	forall (o,c in rCent)           xtt[o,c] == xttm[o,c,1]+xttm[o,c,2]+xttm[o,c,3];
	total_centro_destino: 	forall (o in rCent, c in rDest) xtd[o,c] == xtdm[o,c,1]+xtdm[o,c,2]+xtdm[o,c,3];
	total_origen_ficticio: 	forall(c in rCent)	 	   xoFicticio[c] == sum(m in rMed) xoFicticioM[c,m];
	total_destino_ficticio: forall(c in rCent) 		   xdFicticio[c] == sum(m in rMed) xdFicticioM[c,m];
	
//oferta origenes
	oferta_origenes: forall(o in rOrig) sum(c in rCent) xot[o,c] == Oferta[o];
	//agregamos el origen ficticio:
	oferta_ficticio: sum(c in rCent) xoFicticio[c] == OfertaFicticia;
	
//capacidad transbordos
capacidad_transbordos_medio:  
	forall(m in rMed)
		forall(c in rCent) 
	   			xoFicticioM[c,m] 
	   			+ sum(o in rOrig) xotm[o,c,m] 
	   			+ sum(c2 in rCent : c2 != c) xttm[c2,c,m]
	   						 <= capacidadCentro[c][m];

//entra transbordo == sale transbordo
entrada_igual_salida: 	
	forall(c in rCent) 
		xoFicticio[c] + sum(o in rOrig) xot[o,c] + sum(c2 in rCent : c2 != c) xtt[c2,c] 
		== 
		xdFicticio[c] + sum(d in rDest) xtd[c,d] + sum(c2 in rCent : c2 != c) xtt[c,c2];
	
//demanda destinos	
demanda_destinos_medio: 	
	forall(m in rMed) 
	  forall(d in rDest) sum(c in rCent) xtdm[c,d,m] <= capacidadDestino[d,m];
	  //agregamos el destino ficticio:
 	demanda_ficticia: sum(c in rCent) xdFicticio[c] == DemandaFicticia;
}


  


