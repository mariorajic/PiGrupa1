namespace PiGrupa1.Models
{
    public class Zivotinja
    {
        public int Id { get; set; }
        public int IdFarme { get; set; }
        public string Vrsta { get; set; } 
        public int BrojTaga { get; set; }
        public int Kolicina { get; set; }
        public int Status { get; set; }
        public string UzrokSmrti { get; set; }
    }
}