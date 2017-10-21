param num_adv integer;
param num_acc_adv integer;
param num_acc_lid integer;

set adversarios:= 1..num_adv;
set acciones_lid:=1..num_acc_lid;
set acciones_adv:=1..num_acc_adv;

param R{w in adversarios,i in acciones_lid, j in acciones_adv};
param C{w in adversarios,i in acciones_lid, j in acciones_adv};
param p{w in adversarios};
param M;

#VARIABLES Y SU NATURALEZA
var z{w in adversarios, i in acciones_lid, j in acciones_adv} >= 0;
var q{w in adversarios, j in acciones_adv} integer >= 0, <= 1;

subject to Restriccion01{w in adversarios}: sum{i in acciones_lid, j in acciones_adv} (z[w,i,j]) = 1 ;
subject to Restriccion02{w in adversarios, j in acciones_adv, k in acciones_adv}: sum{i in acciones_lid} ((C[w,i,j]-C[w,i,k])*z[w,i,j]) >= 0 ;
subject to Restriccion03{w in adversarios, j in acciones_adv}: sum{i in acciones_lid} (z[w,i,j]) = q[w,j];
subject to Restriccion04{w in adversarios, i in acciones_lid}: sum{j in acciones_adv} (z[w,i,j]) = sum{j in acciones_adv} (z[1,i,j]);

#FUNCION OBJETIVO
maximize funcion : sum{w in adversarios, i in acciones_lid, j in acciones_adv} (p[w]*R[w,i,j]*z[w,i,j]) ;