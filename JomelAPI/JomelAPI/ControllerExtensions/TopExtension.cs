using JomelAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace JomelAPI.ControllerExtensions
{
    public class TopExtension
    {
        public static PointMembers NewMemberInTop(Member member, Top top)
        {
            PointMembers pointMembers = new PointMembers();
            pointMembers.MemberId = member.Id;
            pointMembers.TopId = top.Id;
            pointMembers.Points = 0;

            return pointMembers;
        }
    }
}
