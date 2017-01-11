using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class ReservationEnCours
    {
        public int RES_Id { get; set; }
        public string LIV_Titre { get; set; }
        public System.DateTime RES_DateReservation { get; set; }
        public string LEC_Nom { get; set; }
        public string LEC_Prenom { get; set; }
    }
}
