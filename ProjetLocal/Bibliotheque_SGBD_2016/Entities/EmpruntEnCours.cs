using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class EmpruntEnCours
    {
        public int EMP_Id { get; set; }
        public string EXE_Code { get; set; }
        public string LIV_Titre { get; set; }
        public string BIB_Libelle { get; set; }
        public string LEC_Nom { get; set; }
        public string LEC_Prenom { get; set; }
        public System.DateTime EMP_DateEmprunt { get; set; }
        public Nullable<decimal> EMP_MontantPaye { get; set; }
    }
}
