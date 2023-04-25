using ContactList.DDD.Domain.Entities;
using ContactList.DDD.Domain.Repositories;
using ContactList.DDD.Infrastructure;
using Microsoft.AspNetCore.Mvc;

namespace ContactList.DDD.API.Controllers
{
    [Route("contact")]
    [ApiController]
    public class ContactController : ControllerBase
    {
        public ContactRepository contactRepo = new ContactRepository();

        [HttpGet]
        public async Task<List<Contact>> Get()
        {
            
            return await contactRepo.GetAllContacts();
        }

        [HttpGet]
        [Route("page")]
        public async Task<List<Contact>> Get(int PageNumber, string Order, string OrderBy)
        {
            
            return await contactRepo.GetContactsPerPage(PageNumber, Order, OrderBy);
        }


        [HttpGet]
        [Route("search")]
        public async Task<List<Contact>> Get(int PageNumber, string SearchTerm, string Order, string OrderBy)
        {
            return await contactRepo.SearchContactsPerPage(PageNumber, SearchTerm, Order, OrderBy);
        }

        [HttpGet("{id}")]
        public async Task<Contact> Get(int id)
        {
            return await contactRepo.GetContactById(id);
        }

        [HttpPost]
        public async Task<Boolean> Post([FromBody] Contact contact)
        {
            return await contactRepo.InsertContact(contact);
        }

        [HttpPut]
        public async Task<bool> Put([FromBody] Contact contact)
        {
            return await contactRepo.UpdateContact(contact);
        }

        [HttpDelete("{id}")]
        public async Task<bool> Delete(int id)
        {
            return await contactRepo.DeleteContact(id);
        }
    }
}

    

