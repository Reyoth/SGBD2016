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
    
    public partial class Lecteur
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Lecteur()
        {
            this.Emprunts = new HashSet<Emprunt>();
            this.Reservations = new HashSet<Reservation>();
        }
    
        public int LEC_Id { get; set; }
        public string LEC_Nom { get; set; }
        public string LEC_Prenom { get; set; }
        public string LEC_Sexe { get; set; }
        public string LEC_DateDeNaissance { get; set; }
        public string LEC_Adresse { get; set; }
        public string LEC_Ville { get; set; }
        public int LEC_CodePostal { get; set; }
        public string LEC_UserName { get; set; }
        public string LEC_Password { get; set; }
        public int BIB_ID { get; set; }
    
        public virtual Bibliotheque Bibliotheque { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Emprunt> Emprunts { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Reservation> Reservations { get; set; }
    }
}