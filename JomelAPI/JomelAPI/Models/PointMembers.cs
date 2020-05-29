using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace JomelAPI.Models
{
    public class PointMembers
    {
        public int Id { get; set; }
        public int MemberId { get; set; }
        public Member Member { get; set; }
        public int TopId { get; set; }
        public Top Top { get; set; }
        public int Points { get; set; }
    }
}
