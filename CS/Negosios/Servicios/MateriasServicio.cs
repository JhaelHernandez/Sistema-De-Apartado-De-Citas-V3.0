using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;

namespace Negocios.Servicios
{
    public class MateriasServicio
    {
        CoordinacionEntities db = new CoordinacionEntities();

        public List<Materia> ObtenerMaterias()
        {
            var query = (from m in db.Materia select m).ToList();
            return query;
        } 
    }
}
