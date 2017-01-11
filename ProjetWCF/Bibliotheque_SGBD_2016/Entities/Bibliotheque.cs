using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class Bibliotheque
    {
        public int Id { get; set; }
        public string Code { get; set; }
        public string Libelle { get; set; }
        public string Adresse { get; set; }
        public string Ville { get; set; }
        public int CodePostal { get; set; }
    }
}
