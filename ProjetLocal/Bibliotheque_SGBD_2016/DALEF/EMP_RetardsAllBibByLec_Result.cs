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
    
    public partial class EMP_RetardsAllBibByLec_Result
    {
        public int ID_Lecteur { get; set; }
        public string Nom { get; set; }
        public string Prénom { get; set; }
        public Nullable<int> Jours_de_retard { get; set; }
        public Nullable<decimal> Montant_total_du__ { get; set; }
        public int ID_Emprunt { get; set; }
        public System.DateTime Date_d_emprunt { get; set; }
        public int ID_Exemplaire { get; set; }
        public string Exemplaire { get; set; }
        public string Titre { get; set; }
        public string ISBN { get; set; }
        public string Code_Bibliotheque { get; set; }
        public string Bibliotheque { get; set; }
    }
}
