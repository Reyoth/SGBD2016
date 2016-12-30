using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using Entities;

namespace BiblioService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in both code and config file together.
    public class Service1 : IService1
    {
        public string GetData(int value)
        {
            return $"You entered: {value}";
        }
        
        public IList<EXE_AllExemplaireBIB_Id_Result> EXE_AllExemplaireBIB_Id(int BibId)
        {
            // a modifier car il utiliser les entities directement (pas bien)
            using (var context = new SGBD2016_BibliothequeEntities())
            {
                var exemplaires = context.EXE_AllExemplaireBIB_Id(BibId);
                var output = exemplaires.ToList();

                return output;
            }
        }

        public CompositeType GetDataUsingDataContract(CompositeType composite)
        {
            if (composite == null)
            {
                throw new ArgumentNullException(nameof(composite));
            }
            if (composite.BoolValue)
            {
                composite.StringValue += "Suffix";
            }
            return composite;
        }
    }
}
