using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities;

namespace DALEF
{
    public class Lecteur
    {
        public static void LivreByTitle(List<global::Entities.Livre> livres, string title)
        {
            using (SGBD2016_BibliothequeEntities context = new SGBD2016_BibliothequeEntities())
            {
                var listeLivres = context.LIV_LivreByTitle(title);
                foreach (var liv in listeLivres)
                {
                    livres.Add(new Livre {Id = });
                }
            }
        }
    }
}
