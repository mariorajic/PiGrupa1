using System;

namespace PiGrupa1.Models
{
    public class Sirovina
    {
        public int Id { get; set; }
        public int IdZivotinje { get; set; }
        public string Naziv { get; set; } 
        public DateTime Datum { get; set; }
        public int Kolicina{ get; set; }
    }

   
}