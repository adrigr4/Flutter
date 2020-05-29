using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace JomelAPI.Models
{
    public class Event
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int TypeId { get; set; }
        public EventType Type { get; set; }
        public DateTime CreationDate { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public ICollection<Member> Participants { get; set; }
        public ICollection<EventTimeMember> EventTimeMembers { get; set; }
    }
}
