using System;
using System.Collections.Generic;
using System.Linq;
using Datos;
using System.Data.Entity;

namespace Negocios.Servicios
{
    class MateriasSemestreServicio
    {
        CoordinacionEntities db = new CoordinacionEntities();
        public bool AgregarMateriaParaSemestre(MateriasSemestre materia)
        {
            try
            {
                db.MateriasSemestre.Attach(materia);
                db.Entry(materia).State = EntityState.Added;
                db.SaveChanges();

                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }
        public bool EliminarMateriaParaSemestre(MateriasSemestre materia)
        {
            try
            {
                db.MateriasSemestre.Attach(materia);
                db.Entry(materia).State = EntityState.Deleted;
                db.SaveChanges();

                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }

    }
}
