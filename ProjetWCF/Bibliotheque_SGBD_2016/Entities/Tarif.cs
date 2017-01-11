using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class Tarif
    {
        public int Id { get; set; }
        public int AnneeApplication { get; set; }
        public decimal TarRetar { get; set; }
        public decimal TarEmprunt { get; set; }
        public int BibId { get; set; }
    }
}
