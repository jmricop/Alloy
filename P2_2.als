sig GobiernoyAdm{
    controlInf: one Infraestructuras,
    recursos: one Recursos,
}

one sig CentroInvestigacion {
    esControlado: one GobiernoyAdm,
    supervisa: some Investigacion,
}

sig Investigacion {
    tieneCientificos: some Cientifico
}

sig Cientifico {}

fact minimoCientificosPorInvestigacion {
    all i: Investigacion | #i.tieneCientificos >= 1
}

fact cientificoUnicoPorInvestigacion {
    all c: Cientifico | one i: Investigacion | c in i.tieneCientificos
}

fact investigacionSupervisada {
    all i: Investigacion | one c: CentroInvestigacion | i in c.supervisa
}

fact Solo1 {
    #GobiernoyAdm = 1 && #Recursos = 1 && #Infraestructuras = 1
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

run show{
    #Investigacion = 2
}