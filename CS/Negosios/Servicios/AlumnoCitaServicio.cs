using System;
using System.Collections.Generic;
using System.Linq;
using Datos;
using System.Data.Entity;

namespace Negocios.Servicios
{
    class AlumnoCitaServicio
    {
        CoordinacionEntities db = new CoordinacionEntities();

        public bool ApartarCita(string coordinadorID, int citaID)
        {
            Cita cita = (new CoordinadorCitaServicio()).ObtenerCitaPor(coordinadorID, citaID);

            try
            {
                if (cita.Estado == 0)
                {
                    cita.Estado = 1;
                    db.Cita.Attach(cita);
                    db.Entry(cita).State = EntityState.Modified;
                    db.SaveChanges();
                }

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
    }
}
