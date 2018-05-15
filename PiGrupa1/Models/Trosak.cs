using System;
using Newtonsoft.Json;

namespace PiGrupa1.Models
{
    public class Trosak
    {
        
        public int Id { get; set; }
        public string Naziv { get; set; }
        public DateTime Datum { get; set; }
        public int VrijednostTroska { get; set; }
        public int IdParcele { get; set; }
        
    }
}