using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using JomelAPI.Models;

namespace JomelAPI.Data
{
    public class JomelAPIContext : DbContext
    {
        public JomelAPIContext (DbContextOptions<JomelAPIContext> options)
            : base(options)
        {
        }

        public DbSet<JomelAPI.Models.Member> Members { get; set; }
        public DbSet<JomelAPI.Models.Event> Events { get; set; }
        public DbSet<JomelAPI.Models.EventTimeMember> EventTimeMembers { get; set; }
        public DbSet<JomelAPI.Models.PointMembers> PointsMembers { get; set; }
        public DbSet<JomelAPI.Models.Top> Tops { get; set; }
    }
}
