//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DALEF
{
    using System;
    using System.Collections.Generic;
    
    public partial class Bibliotheque
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Bibliotheque()
        {
            this.Exemplaires = new HashSet<Exemplaire>();
            this.Lecteurs = new HashSet<Lecteur>();
            this.Tarifs = new HashSet<Tarif>();
        }
    
        public int BIB_ID { get; set; }
        public string BIB_Code { get; set; }
        public string BIB_Libelle { get; set; }
        public string BIB_Adresse { get; set; }
        public string BIB_Ville { get; set; }
        public int BIB_CodePostal { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Exemplaire> Exemplaires { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Lecteur> Lecteurs { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Tarif> Tarifs { get; set; }
    }
}
