using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class Emprunt
    {
        public int Id { get; set; }
        public DateTime DateEmprunt { get; set; }
        public DateTime DateRetour { get; set; }
        public decimal MontantPaye { get; set; }
        public int ExeId { get; set; }
        public int LecId { get; set; }
    }
}
