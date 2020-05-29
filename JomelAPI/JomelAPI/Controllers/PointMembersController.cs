using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using JomelAPI.Data;
using JomelAPI.Models;

namespace JomelAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PointMembersController : ControllerBase
    {
        private readonly JomelAPIContext _context;

        public PointMembersController(JomelAPIContext context)
        {
            _context = context;
        }

        // GET: api/PointMembers
        [HttpGet]
        public async Task<ActionResult<IEnumerable<PointMembers>>> GetPointsMembers()
        {
            return await _context.PointsMembers.ToListAsync();
        }

        // GET: api/PointMembers/5
        [HttpGet("{id}")]
        public async Task<ActionResult<PointMembers>> GetPointMembers(int id)
        {
            var pointMembers = await _context.PointsMembers.FindAsync(id);

            if (pointMembers == null)
            {
                return NotFound();
            }

            return pointMembers;
        }

        // PUT: api/PointMembers/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutPointMembers(int id, PointMembers pointMembers)
        {
            if (id != pointMembers.Id)
            {
                return BadRequest();
            }

            _context.Entry(pointMembers).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PointMembersExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/PointMembers
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<PointMembers>> PostPointMembers(PointMembers pointMembers)
        {
            _context.PointsMembers.Add(pointMembers);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetPointMembers", new { id = pointMembers.Id }, pointMembers);
        }


        [HttpGet("AddMemberToAllTops/{id}")]
        public async Task<ActionResult<IEnumerable<PointMembers>>> PostMemberInAllTops(int id)
        {
            PointMembers pointMembers = new PointMembers(); 
            foreach(Top top in _context.Tops)
            {
                pointMembers = new PointMembers();
                pointMembers.MemberId = id;
                pointMembers.TopId = top.Id;
                pointMembers.Points = 0;

                if(_context.PointsMembers.Where(x=> x.MemberId == pointMembers.MemberId && x.TopId == pointMembers.TopId).Count() == 0)
                {
                    _context.PointsMembers.Add(pointMembers);
                }                
            }

            await _context.SaveChangesAsync();

            return _context.PointsMembers.Where(x => x.MemberId == id).ToList();
        }

        // DELETE: api/PointMembers/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<PointMembers>> DeletePointMembers(int id)
        {
            var pointMembers = await _context.PointsMembers.FindAsync(id);
            if (pointMembers == null)
            {
                return NotFound();
            }

            _context.PointsMembers.Remove(pointMembers);
            await _context.SaveChangesAsync();

            return pointMembers;
        }

        private bool PointMembersExists(int id)
        {
            return _context.PointsMembers.Any(e => e.Id == id);
        }
    }
}
