namespace PiGrupa1.Models
{
    public class Parcela
    {
        public int id { get; set; }
        public int id_korisnika { get; set; }
        public string koordinate { get; set; }
        public int dimenzije { get; set; }
        public int id_grada { get; set; }
        public string lokacija { get; set; }
    }
}