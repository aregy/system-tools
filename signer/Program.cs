// See https://aka.ms/new-console-template for more information

using System.Diagnostics;
using System.Drawing;
using DevExpress.Drawing;
using DevExpress.Pdf;
using DevExpress.Office.DigitalSignatures;

//string fileName0 = "2026-obligations.pdf";//"evget2.pdf";
string fileName0 = "fw9-filled1.pdf";
//string fileName0 = "evget-authorization.pdf";
var pageNumbers = new List<int> { 1 };
const string defaultCertificateName = "my_new_signer_certificate.pfx"; //"pdfSigning.pfx";
const string defaultCertificatePassword = "12#-Dd_C3634";
string signedFile = string.Empty;
const string sigFileName = "sig_cropped.png";// "date_stamp.png";//sig_cropped.png";
var sigBytes = File.ReadAllBytes(sigFileName);
var left = 80;
var top = 117;
var right = left + 100;
var bottom = top - 20;
foreach (var pageNumber in pageNumbers)
{
    using (var processor = new PdfDocumentProcessor())
    {
        //processor.CreateEmptyDocument();
        processor.LoadDocument(fileName0);
        using (PdfGraphics graphics = processor.CreateGraphics())
        {
            using (DXSolidBrush textBrush = new DXSolidBrush(Color.FromArgb(255, Color.Black)))
            {
                // processor.DeletePages(new List<int> { 2, 3, 4, 5, 6}); //TODO AY
                processor.SaveDocument(fileName0);
    //DrawImage(graphics, new PdfRectangle(0, 200, 200, 400), 100, 200);
                DrawField(processor, graphics, textBrush, 0, 0, "HELLO WORLDEE THERE PLEASE SEE ME", pageNumber); //TODO AY
                processor.CloseDocument();

                // fileName0 = $"edited_{pageNumber}.pdf";
                // processor.SaveDocument(fileName0);
                // processor.CloseDocument();
                SignPdf(sigBytes, pageNumber);

                // processor.SaveDocument(fileName0);
                // processor.CloseDocument();
                try
                {
                    //string exePath = "C:\\Users\\aregy.CORP\\AppData\\Local\\Chromium\\Application\\chrome.exe";
                    //string exePath = "/opt/homebrew/bin/firefox";///mnt/c/Users/aregy.CORP/AppData/Local/Chromium/Application/chrome.exe";
                    string exePath = "C:\\Program Files (x86)\\Microsoft\\Edge\\Application\\msedge.exe";
                    var fullPath = Path.Combine(Directory.GetCurrentDirectory().ToString(), signedFile);
                    Process.Start(new ProcessStartInfo(exePath)
		    {
                        Arguments = fullPath, UseShellExecute = true
                    });
                    // https://stackoverflow.com/questions/10174156/open-file-with-associated-application
		    //{
            //            Arguments = $"\\\\wsl.localhost\\ubuntu-\\{fullPath}", UseShellExecute = true
            //        });
                    // https://stackoverflow.com/questions/10174156/open-file-with-associated-application
                }
                catch (System.Exception ex)
                {
                    System.Console.WriteLine(ex.Message);
                }
            }
        }
    }
}

void SignPdf(byte[] signatureImage, int pageNumber)
{
    // using (var imageStream = await _SignatureDrawer.GetImageStream(200, 200)) {
    //     imageStream.Seek(0, SeekOrigin.Begin);
    //     Microsoft.Maui.Graphics.IImage image = PlatformImage.FromStream(imageStream, Microsoft.Maui.Graphics.ImageFormat.Jpeg);
    //     signatureImage = image.AsBytes(Microsoft.Maui.Graphics.ImageFormat.Png);
    // }
    // CloseSignatureView();
    var dateTime = DateTime.Now;
    // string pdfFileName2 = fileName; // Path.Combine(Path.GetFileNameWithoutExtension(fileName) + $"SIGNED_{String.Format("{0}{1}{2}", dateTime.Hour, dateTime.Minute, dateTime.Second)}.pdf");
    using var signer = new PdfDocumentSigner($"./{fileName0}");
    string? signatureFieldName = null;
    var sig = CreateUserSignature(signatureFieldName, defaultCertificatePassword, "USA", "Areg Yeghnazar",
        "Acknowledgement", signatureImage, pageNumber);
    //signer.SaveDocument(Path.Combine(FileSystem.Current.AppDataDirectory, pdfFileName2), sig);
    signedFile = $"_SIGNED{DateTime.Now.Ticks.ToString()}.pdf";
    fileName0 = signedFile;
    signer.SaveDocument(signedFile, sig);
    using (var pdfDP = new PdfDocumentProcessor())
    {
        pdfDP.LoadDocument(signedFile);
        signedFile = $"_{pageNumber}_{signedFile}";
        pdfDP.SaveDocument(signedFile);
    }
    // _fileName = pdfFileName2;
    // await UpdatePreview();
    // try {
    //     UpdateServerAsync();
    // }
    // catch (Exception ex) {

    // }
}

PdfSignatureBuilder CreateUserSignature(string? signatureFieldName, string password, string location, string contactInfo,
    string reason, byte[] signatureImage, int pageNumber)
{
    // var coord = _ImageEdit.GetCropAreaCoordinates();
    // var dpiCorrection = 1.52;
    // var left = coord.Left - coord.Width;
    // var bottom = 1200 - coord.Bottom;
    // var right = coord.Right + coord.Width;
    // var top = 1200 - coord.Top;
    // left /= dpiCorrection;
    // bottom /= dpiCorrection;
    // right /= dpiCorrection;
    // top /= dpiCorrection;
    var left =  110;//405;//110;
    var top = 215;// 211; //215;
    var right = left + 120;
    var bottom = top - 21;
    Pkcs7Signer pkcs7Signature = new Pkcs7Signer(defaultCertificateName, password, HashAlgorithmType.SHA256);
    PdfSignatureBuilder userSignature;
    if (signatureFieldName == null) // origin at bottom corner left of the page
        userSignature = new PdfSignatureBuilder(pkcs7Signature,
            new PdfSignatureFieldInfo(pageNumber) { SignatureBounds = new PdfRectangle(left, bottom, right, top) });
    else
        userSignature = new PdfSignatureBuilder(pkcs7Signature, signatureFieldName);
    userSignature.Location = location;
    userSignature.Location = location;
    userSignature.Name = contactInfo;
    userSignature.Reason = reason;
    if (signatureImage != null) userSignature.SetImageData(signatureImage);
    return userSignature;
}

void DrawField(PdfDocumentProcessor processor, PdfGraphics graphics, DXSolidBrush textBrush, int left, int top,
    string message, int pageNumber)
{
    
    PdfPage page = processor.AddNewPage(PdfPaperSize.A4);
    var bottom = top - 18 * 12;
    // Specify text to draw
    var DrawingDpi = 120;
    //https://github.com/DevExpress-Examples/pdf-document-api-add-graphics-to-landscape-and-portrait-pages/blob/eae71b1373c5d8326609c5e05c5c649b9ed5a772/CS/CreateGraphics/Program.cs#L36
    // SizeF actualPageSize = PrepareGraphics(1, graphics, 120, 120);
    var font = new DXFont("Segoe UI", 36, DXFontStyle.Regular);
    //if (message.Length > 25) font = new DXFont("Segoe UI", 9, DXFontStyle.Regular);
    var textSize = graphics.MeasureString(message, font, PdfStringFormat.GenericDefault, DrawingDpi, DrawingDpi);
    var topLeft = new PointF(400,300);// PointF(left, top);
    var bottomRight = new PointF((right - left) - textSize.Width, (top - bottom) - textSize.Height);
    graphics.DrawString("My message to you is this message over here 99999!!!!!241241241234", font, textBrush, topLeft);
    //Console.WriteLine($"-SEE HERE-{processor.Document.GetType()}");
    //Console.WriteLine(processor.Document.Pages[0].GetType());
    //graphics.AddToPageForeground(processor.Document.Pages[pageNumber - 1], 220, 420);
    Console.WriteLine($"The pageNumber is {pageNumber}");
    graphics.AddToPageForeground(processor.Document.Pages[pageNumber - 1]);//, 120, 120);
}

static void DrawImage(PdfGraphics graphics, PdfRectangle rect, double x, double y) {

    DXImage image = DXImage.FromStream(new FileStream("date_stamp.png", FileMode.Open));

    double aspectRatio = image.Width / image.Height;

    double scaleX = image.Width / rect.Width;
    double scaleY = image.Height / rect.Height;

    double width;
    double height;

    if (scaleX < scaleY) {

        width = rect.Width;
        height = width / aspectRatio;
    }

    else {
        height = rect.Height;
        width = height * aspectRatio;
    }

    // Calculate the rectangle
    // to use in the world coordinate system
    RectangleF imageRect = new RectangleF((float)x, (float)(y - height), (float)width, (float)height);
    graphics.DrawImage(image, imageRect);
}
record FormField(
    string label,
    string value,
    int left,
    int top,
    int pageNum = 2,
    DXFont? dxFont = null,
    DXFontStyle dxFontStyle = DXFontStyle.Regular,
    DXSolidBrush? dxSolidBrush = null);// = new DXSolidBrush(Color.Black));
