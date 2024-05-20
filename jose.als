abstract sig Persona{}
abstract sig Ley{}
abstract sig GuiaTuristico extends Persona{}

sig Turista extends Persona{
    hotel : one Hotel,
    actividad: lone Actividad
}
sig Trabajador extends Persona{
    gobierno: one GobiernoyAdm
}
sig OficinaTurismo{
    gobierno: one GobiernoyAdm,
    excursion : set Actividad,
    servicio : some Hotel,
}

sig GobiernoyAdm{
    leyes : disj some Ley,
    oficina: one OficinaTurismo,
}

abstract sig Hotel{
    administrador: one OficinaTurismo,
    huespedes: disj some Turista,
}

abstract sig Actividad{
    guia: one GuiaTuristico,
    administrador: one OficinaTurismo,
    participantes: set Turista,
}

fact MasDeUnTurista {
    all a: Actividad | #a.participantes > 1
}

fact UnTuristaEnUnaActividad {
    no disj a1, a2: Actividad | some t: Turista | t in a1.participantes && t in a2.participantes
}

fact LeyesDistintas {
    all g: GobiernoyAdm | all l1, l2: g.leyes | l1 != l2
}
//fact EntreTodosMenosUno

run show{
    //#EstacionDeEnergia<=2 && #AbastecimientoDeAgua<=2 && #CamposDeCultivo<=2 && #AguasResiduales<=2
}