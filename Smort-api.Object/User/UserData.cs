﻿using Microsoft.AspNetCore.Http;
using System.Reflection.Metadata;
using static System.Net.Mime.MediaTypeNames;

namespace Smort_api.Object
{
    public class CreateAccount
    {
        public string? Email { get; set; }
        public string? Password { get; set; }
        public string? Username { get; set; }
        public byte[]? ProfilePicture { get; set; }
    }
}
