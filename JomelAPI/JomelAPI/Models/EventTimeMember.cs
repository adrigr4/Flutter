using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace JomelAPI.Models
{
    public class EventTimeMember
    {
        public int Id { get; set; }
        public int MemberId { get; set; }
        public Member Member { get; set; }
        public int EventId { get; set; }
        public Event Event { get; set; }
        public DateTime ArrivedData { get; set; }
    }
}
