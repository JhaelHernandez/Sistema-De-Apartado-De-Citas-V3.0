using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Entity;
using Datos;


namespace Negocios.Servicios
{
    public class MaestroServicio
    {
        CoordinacionEntities db = new CoordinacionEntities();
        public bool CrearMaestro(Maestro maestro)
        {
            try
            {
                db.Maestro.Attach(maestro);
                db.Entry(maestro).State = EntityState.Added;
                db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        /// <summary>
        /// Obtiene todos los maestros
        /// </summary>
        /// <returns>Lista de maestro</returns>
        public List<Maestro> ObtenerUsuarios()
        {
            var maestro = (from u in db.Maestro where u.Activo.Equals(true) select u).ToList();
            return maestro;
        }
        /// <summary>
        /// Obtiene maestro por el nombre y apellido
        /// </summary>
        /// <param name="nombre, apellidos"></param>
        /// <returns>Objeto tipo Maestro encontrado</returns>
        public Maestro ObtenerMaestroEspecificol(string nombre, string apellidos)
        {
            var maestro = (from u in db.Maestro where u.Nombre.Equals(nombre) || u.Apellidos.Equals(apellidos) select u).FirstOrDefault();

            return maestro;
        }
        /// <summary>
        /// Da de baja a un maestro
        /// </summary>
        /// <param name="usuario"></param>
        /// <returns>Boleano donde true significa que todo esta bien y false que no</returns>
        public bool BajaMaestro(Maestro maestro)
        {
            try
            {
                if (db != null)
                    db.Dispose();

                maestro.Activo = false;
                db.Maestro.Attach(maestro);
                db.Entry(maestro).State = EntityState.Modified;
                db.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        /// <summary>
        /// Actualiza los datos del usuario
        /// </summary>
        /// <param name="usuario"></param>
        /// <returns>Boleano true para que todo este bien</returns>
        public bool ActualizaMaestro(Maestro maestro)
        {
            try
            {
                if (db != null)
                    db.Dispose();

                db.Maestro.Attach(maestro);
                db.Entry(maestro).State = EntityState.Modified;
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
