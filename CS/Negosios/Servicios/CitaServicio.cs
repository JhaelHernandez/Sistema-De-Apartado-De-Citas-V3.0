using System;
using System.Collections.Generic;
using System.Linq;
using Datos;
using System.Data.Entity;
namespace Negocios.Servicios
{
    public class CitaServicio
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
            }catch(Exception e)
            {
                return false;
            }
        }
        public List<Cita> ObtenerCitas(string cooridinadorID)
        {
            var cita = (from u in db.Cita select u).ToList();
            return cita;
        }

        public Cita ObtenerCitapor(int citaId, string cooridinadorID)
        {
            var cita = (from u in db.Cita where u.CitaID.Equals(citaId) && u.CoordinadorID.Equals(cooridinadorID) select u).FirstOrDefault();

            return cita;
        }

        public Cita ObtenerCitapor(int citaId, int estado, string cooridinadorID)
        {
            var cita = (from u in db.Cita where u.CitaID.Equals(citaId) && u.Estado.Equals(estado) && u.CoordinadorID.Equals(cooridinadorID) select u).FirstOrDefault();

            return cita;
        }
        public Cita ObtenerCitapor(string alumnoID, string cooridinadorID)
        {
            var cita = (from u in db.Cita where u.AlumnoID.Equals(alumnoID) && u.CoordinadorID.Equals(cooridinadorID) select u).FirstOrDefault();
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
    }
}
