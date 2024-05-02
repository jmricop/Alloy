/* PRACTICA 2 Alloy */

// Chemi


// Pablo
sig OficinaTurismo{

    excursion : set Actividad,
    servicio : some Hotel

}

sig Actividad{

 administrador: some OficinaTurismo

}

sig Hotel{

 administrador: one OficinaTurismo

}

// Jose


// David
abstract sig Persona{}

abstract sig DNI{}

sig Trabajador extends Persona{
    //trabajo : tipoTrabajador,
}

sig Turista extends Persona{}

sig GobiernoyAdm{
    leyes : disj some Ley
}

abstract sig Ley{}

fact SoloUnGobierno {
    one g: GobiernoyAdm | g.leyes = Ley
}


run show{}