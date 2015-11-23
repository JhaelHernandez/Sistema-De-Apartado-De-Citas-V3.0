using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using Datos;

namespace Negocios.Servicios
{

    public class UsuarioServicio
    {
        CoordinacionEntities db = new CoordinacionEntities();
        public bool CrearUsuario(Usuario usuario)
        {
            try
            {
                db.Usuario.Attach(usuario);
                db.Entry(usuario).State = EntityState.Added;
                db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        /// <summary>
        /// Obtiene todos los usuarios
        /// </summary>
        /// <returns>Lista de usuarios</returns>
        public List<Usuario> ObtenerUsuarios()
        {
            var usuarios = (from u in db.Usuario where u.Activo.Equals(true) select u).ToList();
            return usuarios;
        }
        /// <summary>
        /// Obtiene usuario por el numero de control
        /// </summary>
        /// <param name="noControl"></param>
        /// <returns>Objeto tipo usuario encontrado</returns>
        public Usuario ObtenerUsuarioPorNoControl(string noControl)
        {
            var usuario= (from u in db.Usuario where u.NoControl.Equals(noControl) select u).FirstOrDefault();
            
            return usuario;
        }
        /// <summary>
        /// Da de baja a un usuario por el noControl
        /// </summary>
        /// <param name="usuario"></param>
        /// <returns>Boleano donde true significa que todo esta bien y false que no</returns>
        public bool BajaUsuario(Usuario usuario)
        {
            try
            {
                if (db != null)
                    db.Dispose();

                usuario.Activo = false;
                db.Usuario.Attach(usuario);
                db.Entry(usuario).State = EntityState.Modified;
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
        public bool ActualizaUsuario(Usuario usuario)
        {
            try
            {
                if (db != null)
                    db.Dispose();

                db.Usuario.Attach(usuario);
                db.Entry(usuario).State = EntityState.Modified;
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
