using System;
using System.Collections.Generic;
using System.Linq;
using Datos;
using System.Data.Entity;

namespace Negocios.Servicios
{
    class GrupoServicio
    {
        CoordinacionEntities db = new CoordinacionEntities();
        public bool AgregarGrupo(Grupo grupo)
        {
            try
            {
                db.Grupo.Attach(grupo);
                db.Entry(grupo).State = EntityState.Added;
                db.SaveChanges();

                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }
        public List<Grupo> ObtenerPorSemestre(int semestre)
        {
            var grupos = (from u in db.Semestre where u.Semestre1.Equals(semestre) select u.Grupo).ToList();
           
            return grupos;
        }

        public bool BajarGrupo(Grupo grupo)
        {
            try
            {
                if (db != null)
                    db.Dispose();
                grupo.Activo = false;
                db.Grupo.Attach(grupo);
                db.Entry(grupo).State = EntityState.Modified;
                db.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        public bool ActualizaGrupo(Grupo grupo)
        {
            try
            {
                if (db != null)
                    db.Dispose();

                db.Grupo.Attach(grupo);
                db.Entry(grupo).State = EntityState.Modified;
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
