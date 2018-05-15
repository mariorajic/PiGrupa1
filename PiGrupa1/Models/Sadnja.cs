using System;

namespace PiGrupa1.Models
{
    public class Sadnje
    {
        public int Id { get; set; }
        public string Biljka { get; set; }
        public int IdOranice { get; set; } 
        public DateTime Datum { get; set; }
        public int Kolicina { get; set; }
        public int Trosak{ get; set; }
        public int Sezona { get; set; }
    }
}