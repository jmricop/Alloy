/* PRACTICA 2 Alloy */

// Chemi


// Pablo
    //enum tipoTrabajador {Buzo, Medico, GuiaTuristico, Presidente, Obrero, Cientifico, Funcionario}

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