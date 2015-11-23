using System;
using System.Collections.Generic;
using System.Linq;
using Datos;
using System.Data.Entity;

namespace Negocios.Servicios
{
    class DiaMateriaServicio
    {
        CoordinacionEntities db = new CoordinacionEntities();
        public bool AgregarDiaAlaMateria(DiaMateria dia)
        {
            try
            {
                db.DiaMateria.Attach(dia);
                db.Entry(dia).State = EntityState.Added;
                db.SaveChanges();

                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }
        public List<MateriaDelGrupo> ObtenerMaterias(int materia)
        {
            var materias = (from u in db.DiaMateria where u.MateriaGrupoID.Equals(materia) select u.MateriaDelGrupo).ToList();

            return materias;
        }

        public bool BajarDia(DiaMateria dia)
        {
            try
            {
                if (db != null)
                    db.Dispose();
                dia.Activo = false;
                db.DiaMateria.Attach(dia);
                db.Entry(dia).State = EntityState.Modified;
                db.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        public bool ActualizaDiaMateria(DiaMateria dia)
        {
            try
            {
                if (db != null)
                    db.Dispose();

                db.DiaMateria.Attach(dia);
                db.Entry(dia).State = EntityState.Modified;
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

