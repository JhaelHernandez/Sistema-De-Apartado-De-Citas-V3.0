using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Entity;
using Datos;

namespace Negocios.Servicios
{
    class ReticulaMateriaServicio
    {
        CoordinacionEntities db = new CoordinacionEntities();
        public bool CrearReticulaMateria(ReticulaMateria reticulaMateria)
        {
            try
            {
                db.ReticulaMateria.Attach(reticulaMateria);
                db.Entry(reticulaMateria).State = EntityState.Added;
                db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        /// <summary>
        /// Obtiene todas las materias
        /// </summary>
        /// <returns>Lista de Materias</returns>
        public List<Materia> ObtenerReticulaMateria(string carrera)
        {
            var reticula = from u in db.Carrera where u.Nombre.Equals(carrera) select u.ReticulaID;
            var lstMaterias = (from u in db.ReticulaMateria where u.Activo.Equals(true) && 
                                     u.ReticulaID.Equals(reticula) select u.Materia).ToList();
            return lstMaterias;
        }
  
        /// <summary>
        /// Da de baja a un materia de la reticula
        /// </summary>
        /// <param name="usuario"></param>
        /// <returns>Boleano donde true significa que todo esta bien y false que no</returns>
        public bool BajaReticulaMateria(ReticulaMateria reticulaMateria)
        {
            try
            {
                if (db != null)
                    db.Dispose();

                reticulaMateria.Activo = false;
                db.ReticulaMateria.Attach(reticulaMateria);
                db.Entry(reticulaMateria).State = EntityState.Modified;
                db.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        /// <summary>
        /// Actualiza los datos de la Reticula Materia
        /// </summary>
        /// <param name="reticulaMateria"></param>
        /// <returns>Boleano true para que todo este bien</returns>
        public bool ActualizaReticulaMateria(ReticulaMateria reticulaMateria)
        {
            try
            {
                if (db != null)
                    db.Dispose();

                db.ReticulaMateria.Attach(reticulaMateria);
                db.Entry(reticulaMateria).State = EntityState.Modified;
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

