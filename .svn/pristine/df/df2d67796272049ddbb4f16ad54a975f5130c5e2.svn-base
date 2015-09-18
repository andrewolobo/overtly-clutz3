using System.Collections;
using System.Drawing;
using Tag4s.Helpers;
using Tag4s.Zxing;
using Tag4s.Zxing.qrcode;
using Tag4s.Zxing.qrcode.decoder;

namespace Tag4s.Controllers
{
    /// <summary>
    /// 
    /// </summary>
    public class QrController : BaseController
    {
        //
        // GET: /QR/

        /// <summary>
        /// 
        /// </summary>
        /// <param name="qrUrl"></param>
        /// <returns></returns>
        public ImageResult Index(string qrUrl)
        {
            using (var bitmap = EncodeUrl(qrUrl))
            {
                const string contentType = "image/jpg";

                byte[] data;
                using (var stream = new System.IO.MemoryStream())
                {
                    bitmap.Save(stream, System.Drawing.Imaging.ImageFormat.Jpeg);
                    stream.Position = 0;
                    data = new byte[stream.Length];
                    stream.Read(data, 0, (int)stream.Length);
                    stream.Close();
                }

                return this.Image(data, contentType);

            }


        }

        private Bitmap EncodeUrl(string qrUrl)
        {
            var writer = new QRCodeWriter();
            var hints = new Hashtable {{EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L}, {"Version", "7"}};

            var byteImgNew = writer.encode(qrUrl, BarcodeFormat.QR_CODE, 350, 350, hints);
            sbyte[][] imgNew = byteImgNew.Array;
            var bmp1 = new Bitmap(byteImgNew.Width, byteImgNew.Height);
            var g1 = Graphics.FromImage(bmp1);
            g1.Clear(Color.White);
            for (var i = 0; i <= imgNew.Length - 1; i++)
            {
                for (int j = 0; j <= imgNew[i].Length - 1; j++)
                {
                    if (imgNew[j][i] == 0)
                    {
                        g1.FillRectangle(Brushes.Black, i, j, 1, 1);
                    }
                    else
                    {
                        g1.FillRectangle(Brushes.White, i, j, 1, 1);
                    }
                }
            }
            return bmp1;
            //bmp1.Save("D:\\QREncode.jpg", System.Drawing.Imaging.ImageFormat.Jpeg);             
        }



    }
}
