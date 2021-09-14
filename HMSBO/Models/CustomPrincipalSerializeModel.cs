﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HMSBO.Models
{
    public class CustomPrincipalSerializeModel
    {
        public int UserId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string UserName { get; set; }
        public DateTime LogInTime { get; set; }
        public int OrgId { get; set; }
        public string OrgName { get; set; }
        public string MacID { get; set; }
        public string[] roles { get; set; }
        public int? RoleId { get; set; }
        public string RoleName { get; set; }
        public bool IsRoleActive { get; set; }
        // For Images //
        public string OrgLogo { get; set; }
        public string HeaderLogo { get; set; }
        public string[] LogoPaths { get; set; }

        // Org //
        public string Address { get; set; }
        public string Telephone { get; set; }
        public string MobileNo { get; set; }
        public string Fax { get; set; }
    }
}