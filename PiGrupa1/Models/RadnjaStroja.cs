using System;

namespace PiGrupa1.Models
{
    public class RadnjaStroja
    {
        public int Id { get; set; }
        public string Naziv { get; set; }
        public DateTime Datum { get; set; } 
        public int Trosak { get; set; }
        public int Profit { get; set; }
        public int IdStroja{ get; set; }
        public int TipRadnjeStroja { get; set; }
    }
}