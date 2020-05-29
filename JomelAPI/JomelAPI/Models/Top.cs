using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace JomelAPI.Models
{
    public class Top
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public ICollection<Member> Members { get; set; }
        public ICollection<PointMembers> PointMembers { get; set; }
    }
}
