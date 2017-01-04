using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class Livre
    {
        public int Id { get; set; }
        public string ISBN { get; set; }
        public string Titre  { get; set; }
        public string Image { get; set; }
        public string Authors { get; set; }
    }
}
