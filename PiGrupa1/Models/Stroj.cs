using System;

namespace PiGrupa1.Models
{
    public class Stroj
    {
        public int Id { get; set; }
        public string Naziv { get; set; }
        public DateTime DatumKupovine { get; set; } 
        public int Trosak { get; set; }
        public int Vrijednost{ get; set; }
        public int IdParcele{ get; set; }
    }
}