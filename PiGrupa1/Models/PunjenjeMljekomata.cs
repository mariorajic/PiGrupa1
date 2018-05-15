using System;

namespace PiGrupa1.Models
{
    public class PunjenjeMljekomata
    {
        public int Id { get; set; }
        public int IdMljekomata { get; set; }
        public DateTime Datum{ get; set; } 
        public int Trosak { get; set; }
        public int Profit { get; set; }
        public int PreostalaKolicina{ get; set; }
    }
}