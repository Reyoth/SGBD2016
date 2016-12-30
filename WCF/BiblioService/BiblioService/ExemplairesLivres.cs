using System.Runtime.Serialization;
using System.Threading.Tasks;

namespace BiblioService
{
    [DataContract]
    public class ExemplairesLivres
    {
        //objet a exposer au clients (admins ou users)
        //ajouter props
        //a mettre dans business
        public int Id { get; set; }
    }
}