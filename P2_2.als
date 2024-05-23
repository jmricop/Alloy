sig GobiernoyAdm{
    controlInf: one Infraestructuras,
    recursos: one Recursos,
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

run show{}