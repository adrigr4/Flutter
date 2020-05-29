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
    public class TopsController : ControllerBase
    {
        private readonly JomelAPIContext _context;

        public TopsController(JomelAPIContext context)
        {
            _context = context;
        }

        // GET: api/Tops
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Top>>> GetTops()
        {
            return await _context.Tops.ToListAsync();
        }

        // GET: api/Tops/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Top>> GetTop(int id)
        {
            var top = await _context.Tops.FindAsync(id);

            if (top == null)
            {
                return NotFound();
            }

            return top;
        }

        // PUT: api/Tops/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutTop(int id, Top top)
        {
            if (id != top.Id)
            {
                return BadRequest();
            }

            _context.Entry(top).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TopExists(id))
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

        // POST: api/Tops
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<Top>> PostTop(Top top)
        {
            _context.Tops.Add(top);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetTop", new { id = top.Id }, top);
        }

        // DELETE: api/Tops/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Top>> DeleteTop(int id)
        {
            var top = await _context.Tops.FindAsync(id);
            if (top == null)
            {
                return NotFound();
            }

            _context.Tops.Remove(top);
            await _context.SaveChangesAsync();

            return top;
        }

        private bool TopExists(int id)
        {
            return _context.Tops.Any(e => e.Id == id);
        }
    }
}
