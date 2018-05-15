using System.ComponentModel.DataAnnotations;

namespace PiGrupa1.Models
{
    public class Gospodarstvo
    {
        [Key]
        public int Id { get; set; }
        
        [Required(ErrorMessage = "NE VALJA")]
        public string Ime { get; set; }
        
        [Required(ErrorMessage = "NE VALJA")]
        public string Prezime { get; set; }
        
        [Required(ErrorMessage = "NE VALJA")]
        public string Kontakt { get; set; }
        
        public int Id_zadruge { get; set; }
        
        [Required(ErrorMessage = "NE VALJA")]
        public string Email { get; set; }
        
        [Required(ErrorMessage = "NE VALJA")]
        [DataType(DataType.Password)]
        public string Lozinka { get; set; }
    }
}