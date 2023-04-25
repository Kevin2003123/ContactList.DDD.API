using ContactList.DDD.Domain.Entities;


namespace ContactList.DDD.Domain.Repositories
{
    public interface IContactRepository
    {
        Task<List<Contact>> GetAllContacts();
        Task<Contact> GetContactById(int id);
        Task<Boolean> InsertContact(Contact contact);
        Task<Boolean> DeleteContact(int id);
        Task<Boolean> UpdateContact(Contact contact);
        Task<List<Contact>> GetContactsPerPage(int PageNumber, string Order, string OrderBy);
        Task<List<Contact>> SearchContactsPerPage(int PageNumber, string SearchTerm, string Order, string OrderBy);

    }
}
