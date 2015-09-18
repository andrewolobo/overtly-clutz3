using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;

namespace Tag4s.Data
{
    [MetadataType(typeof(UserContractRedirectMetaData))]
    public partial class UserContractRedirect
    {

        public bool RuleActive { get; set; }
        [UIHint("Boolean_icon")]
        public bool Actief
        {
            get
            {
                return Enabled.HasValue ? Enabled.Value : true;
            }
            set
            {
                Enabled = value;
            }
        }

        public bool WeekdayActive
        {
            get
            {
                if (!DayOfTheWeekValue.HasValue)
                    return false;
                if (DayOfTheWeekValue.Value < 1 || DayOfTheWeekValue.Value > 9)
                    return false;
                else
                    return true;
            }
        }

        public int DagVanDeWeek
        {
            get
            {
                if (DayOfTheWeekValue.HasValue)
                    return DayOfTheWeekValue.Value;
                else
                    return 0;
            }
            set
            {
                DayOfTheWeekValue = value;
            }
        }
        //public string Weekday
        //{
        //    get
        //    {
        //        if(DayOfTheWeekValue.HasValue)
        //        {
        //            switch (DayOfTheWeekValue)
        //            {
        //                case 1:
        //                    return "Maandag";
        //                case 2:
        //                    return "Dinsdag";
        //                case 3:
        //                    return "Woensdag";
        //                case 4:
        //                    return "Donderdag";
        //                case 5:
        //                    return "Vrijdag";
        //                case 6:
        //                    return "Zaterdag";
        //                case 7:
        //                    return "Zondag";
        //                case 8:
        //                    return "Werkdagen";
        //                case 9:
        //                    return "Weekend";
        //                default:
        //                    return "";
        //            }
        //        }
        //        else
        //            return "";
        //    }
        //}

        public bool BeginTimeActive
        {
            get
            {
                return BeginTime.HasValue;
            }
        }

        public DateTime? BeginTime
        {
            get
            {
                if (TimeOfDayHourStart.HasValue && TimeOfDayMinuteStart.HasValue)
                    return new DateTime().AddHours(TimeOfDayHourStart.Value).AddMinutes(TimeOfDayMinuteStart.Value);
                else
                    return null;
            }
            set
            {
                if (value.HasValue)
                {
                    TimeOfDayHourStart = value.Value.Hour;
                    TimeOfDayMinuteStart = value.Value.Minute;
                }
                else
                {
                    TimeOfDayHourStart = null;
                    TimeOfDayMinuteStart = null;
                }
            }
        }

        public bool EndTimeActive
        {
            get
            {
                return EndTime.HasValue;
            }
        }
        public DateTime? EndTime
        {
            get
            {
                if (TimeOfDayHourEnd.HasValue && TimeOfDayMinuteEnd.HasValue)
                    return new DateTime().AddHours(TimeOfDayHourEnd.Value).AddMinutes(TimeOfDayMinuteEnd.Value);
                else
                    return null;
            }
            set
            {
                if (value.HasValue)
                {
                    TimeOfDayHourEnd = value.Value.Hour;
                    TimeOfDayMinuteEnd = value.Value.Minute;
                }
                else
                {
                    TimeOfDayHourEnd = null;
                    TimeOfDayMinuteEnd = null;
                }
            }
        }

        public string StartTijd
        {
            get
            {
                if (TimeOfDayHourStart.HasValue)
                    return String.Format("{0}:{1}", TimeOfDayHourStart.Value.ToString("00"), TimeOfDayMinuteStart.Value.ToString("00"));
                else
                    return "";

            }
        }

        public string StopTijd
        {
            get
            {
                if (TimeOfDayHourEnd.HasValue)
                    return String.Format("{0}:{1}", TimeOfDayHourEnd.Value.ToString("00"), TimeOfDayMinuteEnd.Value.ToString("00"));
                else
                    return "";

            }
        }

        public bool StartDatumActive
        {
            get
            {
                return DateTimeValueStart.HasValue;
            }
        }

        public string StartDatum
        {
            get
            {
                if (DateTimeValueStart.HasValue)
                {
                    return DateTimeValueStart.Value.ToString("dd-MM-yyyy");
                }
                else
                    return "";
            }
        }

        public bool StopDatumActive
        {
            get
            {
                return DateTimeValueStop.HasValue;
            }
        }

        public string StopDatum
        {
            get
            {
                if (DateTimeValueStop.HasValue)
                {
                    return DateTimeValueStop.Value.ToString("dd-MM-yyyy");
                }
                else
                    return "";

            }
        }

        public bool CounterActive
        {
            get
            {
                if (Counter.HasValue)
                    return (Counter.Value > 0);
                return Counter.HasValue;
            }
        }


        public class UserContractRedirectMetaData
        {
            [DataType(DataType.Date, ErrorMessage = "!")]
            public DateTime? DateTimeValueStart { get; set; }
            [DataType(DataType.Date, ErrorMessage = "!")]
            public DateTime? DateTimeValueStop { get; set; }

            [DataType(DataType.Time, ErrorMessage = "!")]
            public DateTime? BeginTime { get; set; }
            [DataType(DataType.Time, ErrorMessage = "!")]
            public DateTime? EndTime { get; set; }

        }

    }
}
