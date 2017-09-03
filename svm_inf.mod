param num_elem;
param num_atrib;
param costo_err;
param offset;
set elementos := 1..num_elem; 			 #conjunto de elementos (indices)
set atributos := 1..num_atrib;			 #conjunto de atributos (indices)
param DATA{1..num_elem,1..num_atrib+offset};
param y{i in elementos}; 		#clasificacion para cada elementos
param x{i in elementos, n in atributos}; 	#vector de n atributos para cada elemento

#VARIABLES Y RESRICCIONES DE NO NEGATIVIDAD
var W{n in atributos}; 					#vector del hiperplano
var W_INF >=0;							#variable auxiliar para definir la norma infinito
var B; 									#constante del hiperplano
var CHI{i in elementos} >=0; 			#variable auxiliar para medir los errores de clasificacion 

#RESTRICCIONES DEL MODELO
subject to Clasificacion{i in elementos}: y[i]*((sum{n in atributos} (W[n]*x[i, n])) - B) + CHI[i] >= 1; #restriccion principal
subject to NormaInfinito1{n in atributos}: W_INF >= -W[n] ; #restriccion de norma infinito
subject to NormaInfinito2{n in atributos}: W_INF >= W[n] ; #restriccion de norma infinito
#FUNCION OBJETIVO
minimize z : W_INF + costo_err*(sum{i in elementos}(CHI[i])); #funcion objetivo