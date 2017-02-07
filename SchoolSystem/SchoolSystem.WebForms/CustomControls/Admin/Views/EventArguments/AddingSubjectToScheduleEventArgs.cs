﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SchoolSystem.WebForms.CustomControls.Admin.Views.EventArguments
{
    public class AddingSubjectToScheduleEventArgs : EventArgs
    {
        public int SubjectId { get; set; }
        public int DaysOfWeekId { get; set; }
        public int ClassId { get; set; }
        public DateTime StartHour { get; set; }
        public DateTime EndHour { get; set; }
    }
}