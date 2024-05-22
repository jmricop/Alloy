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
    controlInf: one ControlInfraestructuras,
    recursos: one Recursos,
}
sig ControlInfraestructuras{
    esControlado: one GobiernoyAdm,
    estaciones: some EstacionDeEnergia,
    abastecimientos: some AbastecimientoDeAgua,
    campos: some CamposDeCultivo,
    residuos: some AguasResiduales
}
sig Recursos{
    esAdministrado: one GobiernoyAdm, 
    agua: Int,
    energia: Int,
    comida: Int,
    oxigeno: Int
}
sig EstacionDeEnergia, AbastecimientoDeAgua, CamposDeCultivo, AguasResiduales{
    esSupervisado: one ControlInfraestructuras
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
pred ActividadesConCincoParticipantes {
    all a: Actividad | #a.participantes >= 5
}

// Un turista no puede ser trabajador
fact TuristaNoTrabajador {
    no t: Turista | t in Trabajador
}
// El número de leyes en el gobierno debe coincidir con el tamaño del conjunto de leyes
fact NumeroDeLeyes {
    all g: GobiernoyAdm | #g.leyes = #Ley
}
fact Recursos{
    all r: Recursos | r.agua >= 0 && r.energia >= 0 && r.comida >= 0 && r.oxigeno >= 0
}
run show{
    //#EstacionDeEnergia<=2 && #AbastecimientoDeAgua<=2 && #CamposDeCultivo<=2 && #AguasResiduales<=2
}