
sig OficinaTurismo{

    excursion : set Actividad,
    servicio : some Hotel

}

sig Actividad{

 duracion: Int,
 personasInscritas: Int,
 numPersonasTotal: Int,
 administrador: some OficinaTurismo

}

sig Hotel{

 numHuespedes: Int,
 numCamasSimples: Int,
 numCamasDobles: Int,
 administrador: one OficinaTurismo

}


fact Actividad{

    //inv PersonasMinimasEnExcursion: self.numPersonasInscritas > 6
    //inv PersonasOk: self.numPersonasInscritas <= self.numPersonasTotal
    //inv DuracionMayor30: self.duracionMinutos >= 30
    //inv Duración Menor 40: self.duracionMinutos <= 40
    all a: Actividad {       
        #a.personasInscritas>6
        #a.personasInscritas <= #a.numPersonasTotal
        #a.duracion>=30 and #a.duracion<=40
    } 

    


}

fact Hotel{

    all h: Hotel{

        #h.numHuespedes <= #h.numCamasSimples + #h.numCamasDobles + #h.numCamasDobles

    }


}

pred show(){


}

run show for 3
