//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Entities
{
    using System;
    using System.Collections.Generic;
    
    public partial class Emprunt
    {
        public int EMP_Id { get; set; }
        public System.DateTime EMP_DateEmprunt { get; set; }
        public System.DateTime EMP_DateRetour { get; set; }
        public Nullable<decimal> EMP_MontantPaye { get; set; }
        public int EXE_Id { get; set; }
        public int LEC_Id { get; set; }
    
        public virtual Exemplaire Exemplaire { get; set; }
        public virtual Lecteur Lecteur { get; set; }
    }
}