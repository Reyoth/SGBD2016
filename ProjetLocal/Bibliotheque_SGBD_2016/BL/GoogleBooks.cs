using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using Google.Apis.Books.v1.Data;

namespace BL
{
    public class GoogleBooks
    {
        /// <summary>
        /// Methode qui prend un ref Entities livre et un isbn en parmetre
        /// et renvoit un bool true si ça s'est bien passé
        /// </summary>
        /// <param name="livre"></param>
        /// <param name="isbn"></param>
        /// <returns></returns>
        public static bool requestLivre(ref Entities.Livre livre, string isbn)
        {
            bool status = false;

            var requestUrl = "https://www.googleapis.com/books/v1/volumes?q=isbn:" + isbn;

            var request = WebRequest.Create(requestUrl) as HttpWebRequest;

            if (request != null)
            {
                request.Accept = "application/json";

                using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
                {
                    if (response != null)
                    {
                        if (response.StatusCode != HttpStatusCode.OK)
                            throw new Exception(
                                $"Server error (HTTP {response.StatusCode}: {response.StatusDescription}).");
                        else
                        {
                            using (Stream stream = response.GetResponseStream())
                            {
                                if (stream != null)
                                {
                                    var reader = new StreamReader(stream, Encoding.UTF8);
                                    string responseString = reader.ReadToEnd();

                                    Volume livreVolume = new Volume();
                                    livreVolume = Newtonsoft.Json.JsonConvert.DeserializeObject<Volumes>(responseString).Items[0];

                                    livre.ISBN = isbn;
                                    livre.Titre = livreVolume.VolumeInfo.Title;
                                    livre.Image = livreVolume.VolumeInfo.ImageLinks.Thumbnail;
                                    livre.Authors = livreVolume.VolumeInfo.Authors.ToString();
                                    status = true;
                                }
                            }
                        }
                    }
                }
            }
            return status;
        }
    }
}
