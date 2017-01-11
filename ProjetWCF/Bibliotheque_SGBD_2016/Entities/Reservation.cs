using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class Reservation
    {
        public int Id { get; set; }
        public DateTime DateReservation { get; set; }
        public bool Supprime { get; set; }
        public int LecId { get; set; }
        public int LivId { get; set; }
    }
}
