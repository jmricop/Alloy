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

fact centroGobierno{
    one c: CentroRescate | one g: GobiernoyAdm | c.esAdministrado = g implies g.centroOp = c
}

fact solo1CentroRescate{
    #CentroRescate = 1
}

abstract sig Operacion{
    centro: one CentroRescate,
    medicos: disj some Medico,
    buzo: one Buzo,
}

fact OperacionesEnCentroRescate{
    all o: Operacion | one c: CentroRescate | o.centro = c implies o in c.operaciones
}

//Quiero un hecho que diga que en las operaciones tiene que haber 2 medicos y 1 buzo
fact OperacionMedicoBuzo{
    all o: Operacion | #o.medicos = 2 and #o.buzo = 1
}

abstract sig Medico, Buzo{
    operacion: one Operacion,
}

fact RelacionMedicoOperacion{
    all m: Medico | all o: Operacion | m.operacion = o implies m in o.medicos
}

fact RelacionBuzoOperacion{
    all b: Buzo | all o: Operacion | b.operacion = o implies b = o.buzo
}


run show{}