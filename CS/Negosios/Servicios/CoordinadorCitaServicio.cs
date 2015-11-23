using System;
using System.Collections.Generic;
using System.Linq;
using Datos;
using System.Data.Entity;

namespace Negocios.Servicios
{
    class CoordinadorCitaServicio
    {
        CoordinacionEntities db = new CoordinacionEntities();

        public bool CrearCita(Cita cita)
        {
            try
            {
                db.Cita.Attach(cita);
                db.Entry(cita).State = EntityState.Added;
                db.SaveChanges();

                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }

        public List<Cita> ObtenerCitas(string coordinadorID)
        {
            var cita = (from u in db.Cita select u).ToList();
            return cita;
        }

        public Cita ObtenerCitaPor(string coordinadorID, int citaId)
        {
            var cita = (from u in db.Cita where u.CitaID.Equals(citaId) && u.CoordinadorID.Equals(coordinadorID) select u).FirstOrDefault();

            return cita;
        }

        public Cita ObtenerCitaPor(string coordinadorID, int citaId, int estado)
        {
            var cita = (from u in db.Cita where u.CitaID.Equals(citaId) && u.Estado.Equals(estado) && u.CoordinadorID.Equals(coordinadorID) select u).FirstOrDefault();

            return cita;
        }
        public Cita ObtenerCitaPor(string coordinadorID, string alumnoID)
        {
            var cita = (from u in db.Cita where u.AlumnoID.Equals(alumnoID) && u.CoordinadorID.Equals(coordinadorID) select u).FirstOrDefault();
            return cita;
        }

        public List<Cita> ObtenerCitaPor(string coordinadorID, DateTime fecha)
        {
            var cita = (from u in db.Cita where u.Fecha.Equals(fecha) select u).ToList();
            return cita;
        }

        public bool BajaCita(Cita cita)
        {
            try
            {
                if (db != null)
                    db.Dispose();

                cita.Estado = -1;
                db.Cita.Attach(cita);
                db.Entry(cita).State = EntityState.Modified;
                db.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        public bool ActualizaCita(Cita cita)
        {
            try
            {
                if (db != null)
                    db.Dispose();

                db.Cita.Attach(cita);
                db.Entry(cita).State = EntityState.Modified;
                db.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public bool EliminarCita(string cooridinadorID, int idCita)
        {
            try
            {
                if (db != null)
                    db.Dispose();

                var cita = ObtenerCitaPor(cooridinadorID, idCita);

                db.Cita.Attach(cita);
                db.Entry(cita).State = EntityState.Deleted;
                //db.Cita.Remove(cita); ------------------>>>>>>>>>>>>>>>>>
                db.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
    }
}
