sig OficinaTurismo{

    excursion : set Actividad,
    servicio : some Hotel

}

sig Actividad{

 administrador: some OficinaTurismo

}

sig Hotel{

 administrador: one OficinaTurismo

}
