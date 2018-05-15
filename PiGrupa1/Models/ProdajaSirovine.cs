using System;

namespace PiGrupa1.Models
{
    public class ProdajaSirovine
    {
        public int Id { get; set; }
        public int IdSirovine { get; set; }
        public int Kolicina { get; set; } 
        public DateTime Datum { get; set; }
        public int Profit { get; set; }
    }
}