﻿using System;

using WebFormsMvp;
using SchoolSystem.MVP.Admin.Views.EventArguments;
using SchoolSystem.MVP.Admin.Models;

namespace SchoolSystem.MVP.Admin.Views
{
    public interface IManagingScheduleView : IView<ManagingScheduleControlModel>
    {
        event EventHandler<EventArgs> EventBindAllClasses;

        event EventHandler<EventArgs> EventBindDaysOfWeek;

        event EventHandler<ManagingScheduleEventArgs> EventBindScheduleData;

        event EventHandler<AddingSubjectToScheduleEventArgs> EventAddSubjectToSchedule;

        event EventHandler<BindSubjectsForClassEventArgs> EventBitSubjectForCurrentClass;

        event EventHandler<RemovingSubjectFromScheduleEventArgs> EventRemoveSubjectFromSchedule;
    }
}