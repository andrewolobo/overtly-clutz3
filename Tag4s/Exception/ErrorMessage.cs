namespace Tag4s
{
    public class ErrorMessage
    {
        public const string Name = "ErrorMessage";
        public string Value { get; set; }
        public int Code { get; set; }

        public ErrorMessage(string msg)
        {
            Value = msg;
        }

        public ErrorMessage(string msg, int code)
        {
            Value = msg;
            Code = code;
        }


    }
}