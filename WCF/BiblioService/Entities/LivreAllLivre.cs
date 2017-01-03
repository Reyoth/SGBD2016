using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
        public class LivreAllLivre
        {
            public int Id { get; set; }
            public string ISBN { get; set; }
            public string  Titre { get; set; }
            public int AUT_Id { get; set; }
            public string AUT_Nom { get; set; }
            public string AUT_Prenom { get; set; }
        }
}
