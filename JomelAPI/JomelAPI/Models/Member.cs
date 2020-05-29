using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace JomelAPI.Models
{
    public class Member
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string NickName { get; set; }
        public string Picture { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public bool isAdmin { get; set; }
        public ICollection<PointMembers> PointsTops { get; set; }
    }
}
