/*  1

abstract sig Persona{}

abstract sig GuiaTuristico extends Persona{

    act: one Actividad

}

fact soloUnaActividadConGuia{

    all g: GuiaTuristico | all a: Actividad | #g.act = 1 implies g in a.guia and #a.guia = 1 implies a in g.act
    
    
}

sig Turista extends Persona{
    hotel : one Hotel,
    actividad: lone Actividad
}

sig GobiernoyAdm{
    leyes : disj some Ley,
    oficina: one OficinaTurismo,
    controlInf: one Infraestructuras,
    recursos: one Recursos,
}

fact SoloUnGobierno {
    one g: GobiernoyAdm | g.leyes = Ley
}

abstract sig Ley{}

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

//1     */


//* 2

sig GobiernoyAdm{
    controlInf: one Infraestructuras,
    recursos: one Recursos,
}

fact Solo1 {
    #Recursos = 1 && #Infraestructuras = 1
}

sig Recursos{
    esAdministrado: one GobiernoyAdm, 
    agua: Int,
    energia: Int,
    comida: Int,
    oxigeno: Int
}

fact RecursosEnGyA{
    one r: Recursos | one g: GobiernoyAdm | r.esAdministrado = g implies g.recursos = r
}

fact RecursosNoNegativos{
    all r: Recursos | r.agua >= 0 && r.energia >= 0 && r.comida >= 0 && r.oxigeno >= 0
}

sig Infraestructuras{
    esControlado: one GobiernoyAdm,
    estaciones: some EstacionDeEnergia,
    abastecimientos: some AbastecimientoDeAgua,
    campos: some CamposDeCultivo,
    residuos: some AguasResiduales
}

fact Inf_GyA{
    one ci: Infraestructuras | one g: GobiernoyAdm | ci.esControlado = g implies g.controlInf = ci
}

sig EstacionDeEnergia, AbastecimientoDeAgua, CamposDeCultivo, AguasResiduales{
    esSupervisado: one Infraestructuras
}
//2     */

run show{}