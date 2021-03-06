﻿using System;
using Bytes2you.Validation;
using SchoolSystem.MVP.Teacher.Views;
using SchoolSystem.MVP.Teacher.Views.EventArguments;
using SchoolSystem.Web.Services.Contracts;
using WebFormsMvp;

namespace SchoolSystem.MVP.Teacher.Presenters
{
    public class ManagingMarksPresenter : Presenter<IManagingMarksView>
    {
        private readonly ISubjectManagementService subjectManagementService;
        private readonly IClassOfStudentsManagementService classOfStudentsManagementService;
        private readonly IMarksManagementService marksManagementService;
        private readonly IStudentManagementService studentManagementService;

        public ManagingMarksPresenter(
            IManagingMarksView managingMarksView,
            ISubjectManagementService subjectManagementService,
            IClassOfStudentsManagementService classOfStudentsManagementService,
            IStudentManagementService studentManagementService,
            IMarksManagementService marksManagementService)
            : base(managingMarksView)
        {
            Guard.WhenArgument(subjectManagementService, "subjectManagementService").IsNull().Throw();
            Guard.WhenArgument(classOfStudentsManagementService, "classOfStudentsManagementService").IsNull().Throw();
            Guard.WhenArgument(studentManagementService, "studentManagementService").IsNull().Throw();
            Guard.WhenArgument(marksManagementService, "marksManagementService").IsNull().Throw();

            this.subjectManagementService = subjectManagementService;
            this.classOfStudentsManagementService = classOfStudentsManagementService;
            this.marksManagementService = marksManagementService;
            this.studentManagementService = studentManagementService;

            this.View.EventBindSubjectsForTheSelectedTeacher += this.View_EventBindSubjects;
            this.View.EventBindClasses += this.View_EventBindClasses;
            this.View.EventBindSchoolReportCard += this.View_EventBindSchoolReportCard;
            this.View.EventInsertMark += this.View_EventInsertMark;
            this.View.EventBindStudents += this.View_EventBindStudents;
            this.View.EventBindMarks += this.View_EventBindMarks;
        }

        private void View_EventBindMarks(object sender, EventArgs e)
        {
            this.View.Model.Marks = this.marksManagementService.GetAllMarks();
        }

        private void View_EventBindStudents(object sender, BindStudentsEventArgs e)
        {
            this.View.Model.Students = this.studentManagementService.GetAllStudentsFromClass(e.ClassId);
        }

        private void View_EventInsertMark(object sender, InserMarkEventArgs e)
        {
            this.marksManagementService.AddMark(e.StudentId, e.SubjectId, e.MarkId);
        }

        private void View_EventBindSchoolReportCard(object sender, BindSchoolReportCardEventArgs e)
        {
            this.View.Model.SchoolReportCard = this.marksManagementService.GetMarks(e.SubjectId, e.ClassOfStudentsId);
        }

        private void View_EventBindClasses(object sender, BindClassesEventArgs e)
        {
            this.View.Model.StudentClasses = this.classOfStudentsManagementService.GetAllClassesWithSpecifiedSubject(e.SubjectId);
        }

        private void View_EventBindSubjects(object sender, BindSubjectsEventArgs e)
        {
            this.View.Model.SubjectsForTheSpecifiedTeacher = this.subjectManagementService.GetSubjectsPerTeacher(e.TecherName);
        }
    }
}