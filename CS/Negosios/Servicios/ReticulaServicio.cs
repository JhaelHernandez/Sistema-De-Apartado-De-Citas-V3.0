using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Entity;
using Datos;


namespace Negocios.Servicios
{
    public class ReticulaServicio
    {
        CoordinacionEntities db = new CoordinacionEntities();
        public bool CrearReticula(Reticula reticula)
        {
            try
            {
                if (db != null)
                    db.Dispose();

                db.Reticula.Attach(reticula);
                db.Entry(reticula).State = EntityState.Added;
                db.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public List<Reticula> ObtenerReticulas()
        {
            var reticula = (from u in db.Reticula where u.Activo.Equals(true) select u).ToList();
            return reticula;
        }

        public Materia ObtenerUsuarioPorNoControl(string nombre)
        {
            var materia = (from u in db.Materia where u.Nombre.Equals(nombre) select u).FirstOrDefault();
            return materia;
        }

        public bool BajaReticula(Reticula reticula)
        {
            try
            {
                if (db != null)
                    db.Dispose();

                reticula.Activo = false;
                db.Reticula.Attach(reticula);
                db.Entry(reticula).State = EntityState.Modified;
                db.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        public bool ActualizaMateria(Reticula reticula)
        {
            try
            {
                if (db != null)
                    db.Dispose();

                db.Reticula.Attach(reticula);
                db.Entry(reticula).State = EntityState.Modified;
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
