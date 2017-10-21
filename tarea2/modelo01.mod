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
var x{i in acciones_lid} >= 0;
var q{w in adversarios, j in acciones_adv} integer >= 0, <= 1;
var d{w in adversarios};
var a{w in adversarios};

subject to Restriccion01{w in adversarios, j in acciones_adv}: sum{i in acciones_lid} (R[w,i,j]*x[i]) >= d[w]-M*(1-q[w,j]) ;
subject to Restriccion02{w in adversarios, j in acciones_adv}: sum{i in acciones_lid} (C[w,i,j]*x[i]) <= a[w] ;
subject to Restriccion03{w in adversarios, j in acciones_adv}: sum{i in acciones_lid} (C[w,i,j]*x[i]) >= a[w]-M*(1-q[w,j]) ;
subject to Restriccion04: sum{i in acciones_lid} (x[i]) = 1;
subject to Restriccion05{w in adversarios}: sum{j in acciones_adv} (q[w,j])  = 1 ;

#FUNCION OBJETIVO
maximize funcion : sum{w in adversarios} (p[w]*d[w]) ;