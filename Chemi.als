/*fact MaximoUnaActividadPorTurista {
    all t: Turista | lone a: Actividad | t.actividad = a
}

fact GuiaUnicoPorActividad {
    all a: Actividad | one g: GuiaTuristico | a.guia = g
}

fact MaximoTuristasPorActividad {
    all a: Actividad | #a.participantes <= 10
}*/
sig CentroInvestigacion {
    //esControlado: one GobiernoyAdm,
    investigaciones: some Investigacion,
}

sig Investigacion {
    esSupervisado: one CentroInvestigacion,

}

sig Cientifico {
    esParteDe: some Investigacion
}

fact unCentroInvestigacion {
    #CentroInvestigacion = 1
}
fact unInvestigacion {
    #Investigacion = 2
}

pred show(){}
run show {
    
}
