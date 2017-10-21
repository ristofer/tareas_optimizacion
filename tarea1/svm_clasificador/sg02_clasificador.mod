param num_elem;
param num_atrib;
param costo_err;
param offset;
set elementos := 1..num_elem; 			 #conjunto de elementos (indices)
set atributos := 1..num_atrib;			 #conjunto de atributos (indices)
param DATA{1..num_elem,1..num_atrib+offset};
param y{i in elementos}; 		#clasificacion para cada elementos
param x{i in elementos, n in atributos}; 	#vector de n atributos para cada elemento
data sg02_test.dat;
param Y_CLASS{i in elementos} ;
param ERROR_LIST{i in elementos};
param W_CLASS{n in atributos} ;
param B_CLASS;
param ERROR_COUNT;
data sg_02_hiperplano.dat;
param TEST{i in elementos} ;
let {i in elementos} TEST[i]:= (sum{n in atributos}(W_CLASS[n]*x[i, n])) - B_CLASS;
let {i in elementos} ERROR_LIST[i] := if TEST[i]*y[i]>=1 then 0 else 1 ;
let ERROR_COUNT:= sum{i in elementos}ERROR_LIST[i];