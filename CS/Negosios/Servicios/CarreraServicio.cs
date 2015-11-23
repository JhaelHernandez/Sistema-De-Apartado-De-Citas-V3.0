using System;
using System.Collections.Generic;
using System.ComponentModel.Design;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using Datos;
namespace Negocios.Servicios
{
    public class CarreraServicio
    {
        CoordinacionEntities db = new CoordinacionEntities();
        /// <summary>
        /// obtiene la lista de todas las carreras
        /// </summary>
        /// <returns>lista de carreras</returns>
        public List<Carrera> ObtenerCarrera()
        {
            var query = (from c in db.Carrera select c).ToList();
            return query;
        }

        /// <summary>
        /// obtiene un objeto carrera por medio del nombre de la carrera
        /// </summary>
        /// <param name="nombre"></param>
        /// <returns>objeto tipo carrera</returns>
        public Carrera ObtenerCarreraPorNombre(string nombre)
        {
            var query = (from c in db.Carrera where c.Nombre.Contains(nombre) select c).FirstOrDefault();
            return query;
        }

        /// <summary>
        /// crea un nuevo registro en carrera
        /// </summary>
        /// <param name="carrera"></param>
        /// <returns>verdader si se hizo la tarea y falso si no</returns>
        public bool Crear(Carrera carrera)
        {
            try
            {
                db.Carrera.Attach(carrera);
                db.Entry(carrera).State = EntityState.Added;
                db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        /// <summary>
        /// modifica un registro en la tabla carrera
        /// </summary>
        /// <param name="carrera"></param>
        /// <returns>verdadero si se hizo la tarea falso si no</returns>
        public bool Modificar(Carrera carrera)
        {
            try
            {
                if (db != null)
                    db.Dispose();
                db = new CoordinacionEntities();
                db.Carrera.Attach(carrera);
                db.Entry(carrera).State = EntityState.Modified;
                db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        /// <summary>
        /// modifica el atributo activo a false en un registro de la tabla carrera
        /// </summary>
        /// <param name="carrera"></param>
        /// <returns>true si se hizo la tarea false si no</returns>
        public bool Baja(Carrera carrera)
        {
            try
            {
                if (db != null)
                    db.Dispose();
                db = new CoordinacionEntities();
                db.Carrera.Attach(carrera);
                db.Entry(carrera).State = EntityState.Modified;
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
