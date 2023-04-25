using ContactList.DDD.Domain.Entities;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ContactList.DDD.Domain.Validation
{
    public class ContactValidator : AbstractValidator<Contact>
    {
        public ContactValidator()
        {
            RuleFor(x => x.Name)
    .NotEmpty().WithMessage("Name must not be empty.")
    .NotNull().WithMessage("Name must not be null.")
    .Matches("^[^0-9]+$").WithMessage("Name must not contain any numbers.");

            RuleFor(x => x.LastName)
   .NotEmpty().WithMessage("LastName must not be empty.")
   .NotNull().WithMessage("LastName must not be null.")
   .Matches("^[^0-9]+$").WithMessage("LastName must not contain any numbers.");

            RuleFor(x => x.Email)
      .NotEmpty().WithMessage("Email address must not be empty.")
      .NotNull().WithMessage("Email address must not be null.")
      .EmailAddress().WithMessage("Invalid email address format.");

            RuleFor(x => x.Cellphone)
     .NotEmpty().WithMessage("Cell phone number must not be empty.")
     .NotNull().WithMessage("Cell phone number must not be null.")
     .Matches(@"^[\+\(]?[0-9\-\(\)\s]{9,}[0-9]$").WithMessage("Invalid cell phone number format.");
        }
    }
}
