using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Entity;
using Datos;

namespace Negocios.Servicios
{
    public class MateriaServicio
    {
        CoordinacionEntities db = new CoordinacionEntities();
        public bool CrearMateria(Materia materia)
        {
            try
            {
                if (db != null)
                    db.Dispose();

                db.Materia.Attach(materia);
                db.Entry(materia).State = EntityState.Added;
                db.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public List<Materia> ObtenerUsuarios()
        {
            var materias = (from u in db.Materia where u.Activo.Equals(true) select u).ToList();
            return materias;
        }

        public Materia ObtenerUsuarioPorNoControl(string nombre)
        {
            var materia = (from u in db.Materia where u.Nombre.Equals(nombre) select u).FirstOrDefault();
            return materia;
        }

        public bool BajaMateria(Materia materia)
        {
            try
            {
                if (db != null)
                    db.Dispose();

                materia.Activo = false;
                db.Materia.Attach(materia);
                db.Entry(materia).State = EntityState.Modified;
                db.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        public bool ActualizaMateria(Materia materia)
        {
            try
            {
                if (db != null)
                    db.Dispose();

                db.Materia.Attach(materia);
                db.Entry(materia).State = EntityState.Modified;
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
