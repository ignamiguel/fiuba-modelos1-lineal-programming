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

tuple camino {
  string origen;
  string destino;
}

//conjunto de pares <origen,destino> para cada tramo:
// origen -> centro
// centro -> centro
// centro -> destino
{camino} TablaOrigenCentro = {<o,d> | o in origenes,d in centros};
{camino} TablaCentroCentro = {<o,d> | o,d in centros};
{camino} TablaCentroDestino = {<o,d> | o in centros,d in destinos};

tuple ruta {
  camino c;
  string medio;
}

{ruta} RutasOrigenCentro = {<c,m> | c in TablaOrigenCentro, m in medios};
{ruta} RutasCentroCentro = {<c,m> | c in TablaCentroCentro, m in medios};
{ruta} RutasCentroDestino = {<c,m> | c in TablaCentroDestino, m in medios};

//ofertas por origen
int Oferta[origenes] = ...;

tuple despachos {
  int aire;
  int tierra;
  int mar;
}
 
//despachos capacidadCentro[centros] = ...;
int capacidadCentro[centros][medios] = ...;




despachos capacidadDestino[destinos] = ...;



tuple costoCentro {
  despachos SanPablo;
  despachos Panama;
  despachos NY;
  despachos Amsterdam;
  despachos Estambul;
  despachos Tokio;
}
 
tuple costoDestino {
  despachos Varsovia;
  despachos Bratislava;
  despachos Bucarest;
}



//magia negra para que quede con el formato correcto
int coc1[1..nOrig][1..3*nCent] = ...;
int ccc1[1..nCent][1..3*nCent] = ...;
int ccd1[1..nCent][1..3*nDest] = ...;


int coc2[a in 1..nOrig][b in 1..nCent][c in 1..nMed] = coc1[a,c + nMed*(b-1)];
//despachos coc2[1..nOrig][1..nCent] = [o: [c : <coc1[o][1+(c-1)*3],coc1[o][2+(c-1)*3],coc1[o][3+(c-1)*3]>]
//										 | o in 1..nOrig, c in 1..nCent];
despachos ccc2[1..nCent][1..nCent] = [o: [c : <ccc1[o][1+(c-1)*3],ccc1[o][2+(c-1)*3],ccc1[o][3+(c-1)*3]>]
										 | o in 1..nCent, c in 1..nCent];
despachos ccd2[1..nCent][1..nDest] = [o: [c : <ccd1[o][1+(c-1)*3],ccd1[o][2+(c-1)*3],ccd1[o][3+(c-1)*3]>]
   										 | o in 1..nCent, c in 1..nDest];



//despachos CostoOrigenCentro[TablaOrigenCentro] = [ i: coc2[a,b] | i in TablaOrigenCentro, a in 1..nOrig, b in 1..nCent];
despachos CostoCentroCentro[TablaCentroCentro] = [ i: ccc2[a,b] | i in TablaCentroCentro, a in 1..nCent, b in 1..nCent];
despachos CostoCentroDestino[TablaCentroDestino] = [ i: ccd2[a,b] | i in TablaCentroDestino, a in 1..nCent, b in 1..nDest];



// cantidad de ayuda de origen i a centro j
dvar float+ xot[TablaOrigenCentro][1..3];

//cantidad de ayuda de centro i a centro j
dvar float+ xtt[TablaCentroCentro][1..3];

//cantidad de ayuda de centro i a destino j
dvar float+ xtd[TablaCentroDestino][1..3];

dvar float+ s[1..3]; //suma de los costo o->c, c->c, c->d

/*
minimize sum(i in 1..3) s[i];

subject to {
//  sum(o in origenes, c in centros) xot[<o,c>][1] * CostoOrigenCentro[<o,c>].aire + xot[<o,c>][2] * CostoOrigenCentro[<o,c>].tierra + xot[<o,c>][3]*CostoOrigenCentro[<o,c>].mar;	
sum(tramo in TablaOrigenCentro) xot[tramo][1] * CostoOrigenCentro[tramo].aire + xot[tramo][2] * CostoOrigenCentro[tramo].tierra + xot[tramo][3]*CostoOrigenCentro[tramo].mar;	
  s[2] == sum(c1,c2 in centros) {
  			xtt[<c1,c2>][1] * CostoOrigenCentro[<o,c>].aire 
  			+ xtt[<c1,c2>][2] * CostoOrigenCentro[<o,c>].tierra 
  			+ xtt[<c1,c2>][3]*CostoOrigenCentro[<o,c>].mar
  			};
	
  s[3] == sum(c in centros, d in destinos) {
  			xtd[<c,d>][1] * CostoOrigenCentro.aire 
  			+ xtd[<c,d>][2] * CostoOrigenCentro.tierra 
  			+ xtd[<c,d>][3]*CostoOrigenCentro.mar
   };  			
}
*/

  


