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
    
    public partial class Tarif
    {
        public int TAR_Id { get; set; }
        public int TAR_AnneeApplication { get; set; }
        public decimal TAR_Retard { get; set; }
        public decimal TAR_Emprunt { get; set; }
        public int BIB_ID { get; set; }
    
        public virtual Bibliotheque Bibliotheque { get; set; }
    }
}