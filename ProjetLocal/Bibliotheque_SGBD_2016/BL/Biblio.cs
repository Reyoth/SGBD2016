using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    public class Biblio
    {
        public static void ChargerBiblioLib(ref List<string> ListeBiblio )
        {
            List<string> biblios = DALADO.Biblio.ChargerBiblioLib();
            ListeBiblio = biblios;
        }
    }
}
