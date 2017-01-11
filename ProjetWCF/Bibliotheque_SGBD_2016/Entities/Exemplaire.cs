using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class Exemplaire
    {
        public int Id { get; set; }
        public string code { get; set; }
        public DateTime DateAchat { get; set; }
        public bool Indisponible { get; set; }
        public int BibId { get; set; }
        public int LivId { get; set; }
    }
}
