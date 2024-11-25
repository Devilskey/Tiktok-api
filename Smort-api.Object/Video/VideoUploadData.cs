﻿using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Smort_api.Object.Videos
{
    public class VideoUploadData
    {
        public string GUIDObjSender { get; set; }
        public string? FileName { get; set; }

        public byte[]? MediaData { get; set; }
        public string? Title { get; set; }
        public string? Description { get; set; }

        public byte[]? Thumbnail { get; set; }

        //Chunk Data
        public int? ChunkNumber { get; set; } 
        public int? TotalChunks { get; set; }
    }
}
