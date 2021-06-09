using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FrontServiceApi.Models
{
    public class Employee
    {
        
            public int EmployeeId { get; set; }
            public string FirstName { get; set; }
            public string LastName { get; set; }
            public string Email { get; set; }
            public DateTime DateOfBrith { get; set; }
            public Gender Gender { get; set; }
            public Department Department { get; set; }
            public string PhotoPath { get; set; }
        
    }

    public enum Gender
    {
        Male,
        Female,
        Other
    }

    public class Department
    {
        public int DepartmentId { get; set; }
        public string DepartmentName { get; set; }
    }
}
