//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Datos
{
    using System;
    using System.Collections.Generic;
    
    public partial class Coordinador
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Coordinador()
        {
            this.Cita = new HashSet<Cita>();
        }
    
        public int CoordinadorID { get; set; }
        public string Contraseña { get; set; }
        public string Nombre { get; set; }
        public string Apellidos { get; set; }
        public Nullable<int> CarreraID { get; set; }
        public Nullable<bool> Activo { get; set; }
    
        public virtual Carrera Carrera { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Cita> Cita { get; set; }
    }
}
