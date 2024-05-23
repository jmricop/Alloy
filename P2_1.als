abstract sig Persona{}

abstract sig GuiaTuristico extends Persona{}

sig Turista extends Persona{
    hotel : one Hotel,
    actividad: lone Actividad
}

sig GobiernoyAdm{
    leyes : disj some Ley,
    oficina: one OficinaTurismo,
    centroOp: one CentroRescate,
}

abstract sig Ley{}

fact SoloUnGobierno {
    one g: GobiernoyAdm | g.leyes = Ley
}

sig OficinaTurismo{
    gobierno: one GobiernoyAdm,
    excursion : set Actividad,
    servicio : some Hotel,
}

fact Solo1OficinaTurismo{
    one of: OficinaTurismo | of.excursion = Actividad and of.servicio = Hotel
}

fact AsociacionGobiernoOficinaTurismo{
    one of: OficinaTurismo | one g: GobiernoyAdm | of.gobierno = g implies g.oficina = of
}

abstract sig Actividad{
    guia: one GuiaTuristico,
    administrador: one OficinaTurismo,
    participantes: set Turista,
}

fact ActividadesEnOficinaTurismo{
    all a: Actividad | a.administrador = OficinaTurismo
}

fact TuristasenActividades{
    all t: Turista | all a: Actividad | t in a.participantes implies t.actividad = a
}

abstract sig Hotel{
    administrador: one OficinaTurismo,
    huespedes: disj some Turista,
}

fact HotelesEnOficinaTurismo {
    all h: Hotel | h.administrador = OficinaTurismo
}

fact TuristasenHoteles{
    all t: Turista | all h: Hotel | t.hotel = h implies t in h.huespedes
}


//Nuevo Codigo

abstract sig CentroRescate{
    esAdministrado: one GobiernoyAdm,
    operaciones: some Operacion,
}

fact solo1CentroRescate{
    #CentroRescate = 1
}

abstract sig Operacion{
    centro: one CentroRescate,
    medicos: disj set Medico,
    buzo: one Buzo,
}

fact OperacionesEnCentroRescate{
    all o: Operacion | one c: CentroRescate | o.centro = c implies o in c.operaciones
}

fact RestriccionesOperacion{
    all o: Operacion | #o.medicos = 2 && #o.buzo = 1
}

abstract sig Medico, Buzo extends Persona{
    operacion: one Operacion,
}

run show{}