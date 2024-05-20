/*fact MaximoUnaActividadPorTurista {
    all t: Turista | lone a: Actividad | t.actividad = a
}

fact GuiaUnicoPorActividad {
    all a: Actividad | one g: GuiaTuristico | a.guia = g
}

fact MaximoTuristasPorActividad {
    all a: Actividad | #a.participantes <= 10
}*/
one sig CentroInvestigacion {
    //esControlado: one GobiernoyAdm,
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

fact minimoCientificosPorInvestigacion {
    all i: Investigacion | #i.tieneCientificos >= 1
}


pred show(){}
//run show for 2 Investigacion, 3 Cientifico
run show{}
