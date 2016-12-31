using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CustomErrors
{
    public class Error
    {
        private int _ID;
        private string _Message;

        public int ID
        {
            get { return _ID; }

        }
        public override string Message
        {
            get { return _Message; }
        }

        // 1 -> Mauvais User
        // 2 -> Password Error
        // 3 -> Matricule < 5 caractères
        // 4 -> Matricule pour recherche minimum 3 caractères
        // 5 -> Etudiant non trouvé dans la DB...
        public Error(int pID)
        {
            string MyMessage;

            switch (pID)
            {
                case 1:
                    MyMessage = "Le user n'est pas reconnu...";
                    break;
                default:
                    MyMessage = "Erreur non connue...";
                    _ID = 999;
                    break;
            }

            _Message = MyMessage;
        }

    }
}
