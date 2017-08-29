param num_elem;
param num_atrib;
param costo_err;
set elementos := 1..num_elem; 			 #conjunto de elementos (indices)
set atributos := 1..num_atrib;			 #conjunto de atributos (indices)
param DATA{1..num_elem,1..num_atrib+2};
param y{i in elementos}; 		#clasificacion para cada elementos
param x{i in elementos, n in atributos}; 	#vector de n atributos para cada elemento

#VARIABLES Y RESRICCIONES DE NO NEGATIVIDAD
var W{n in atributos}; 					#vector del hiperplano
var W_ABS{n in atributos} >=0; 			#variable auxiliar para linealizar la norma del vector
var B; 									#constante del hiperplano
var CHI{i in elementos} >=0; 			#variable auxiliar para medir los errores de clasificacion 

#RESTRICCIONES DEL MODELO
subject to Clasificacion{i in elementos}: y[i]*((sum{n in atributos} (W[n]*x[i, n])) - B) + CHI[i] >= 1; #restriccion principal
subject to NormaW1{n in atributos}: W_ABS[n] >= -W[n]; #restriccion para definir la norma 1
subject to NormaW2{n in atributos}: W_ABS[n] >= W[n]; #restriccion para definir la norma 1
#FUNCION OBJETIVO
minimize z : sum{n in atributos}(W_ABS[n]) + costo_err*(sum{i in elementos}(CHI[i])); #funcion objetivo