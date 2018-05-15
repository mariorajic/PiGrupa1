namespace PiGrupa1.Models
{
    public class Parcela
    {
        public int Id { get; set; }
        public int IdKorisnika { get; set; }
        public string Koordinate { get; set; }
        public int Dimenzije { get; set; }
        public int IdGrada { get; set; }
        public string Lokacija { get; set; }
    }
}