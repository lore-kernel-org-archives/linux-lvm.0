Message-ID: <0827278F0593D511803600E018C23A3301A599@POSTMAN>
From: Luke Reeves <luke@oceanlake.com>
Subject: RE: [linux-lvm] Limits
MIME-Version: 1.0
MIME-Version: 1.0
Content-Type: multipart/signed;
	protocol="application/x-pkcs7-signature";
	boundary="----=_NextPart_000_0034_01C2663B.27B85290";
	micalg=SHA1
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Fri Sep 27 14:26:48 2002
List-Id: <linux-lvm.redhat.com>
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

This is a multi-part message in MIME format.

------=_NextPart_000_0034_01C2663B.27B85290
Content-Type: multipart/alternative;
	boundary="----=_NextPart_001_0035_01C2663B.27B85290"


------=_NextPart_001_0035_01C2663B.27B85290
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Excellent, that's exactly what I needed.  Thanks Ryan!
=20
    Luke
-----Original Message-----
From: Ryan Leathers [mailto:Ryan.Leathers@globalknowledge.com]
Sent: Friday, September 27, 2002 3:01 PM
To: 'linux-lvm@sistina.com'
Subject: RE: [linux-lvm] Limits


Here is your answer taken from a document that helped me with the same
question=85
http://www-106.ibm.com/developerworks/library/l-lvm2.html
The extent size determines the maximum size that a logical volume can
be. As you can see from the above output, a 4 MB extent size imposes a
logical volume size limitation of 256 Gigabytes, which is an easily
attainable logical volume size if you're adding several high-capacity
drives to your volume group. If your volumes could end up being greater
than 256 GB apiece, I recommend specifying a larger extent size at
vgcreate time. Extents can range anywhere from 8 KB to 512 MB, and must
always be a multiple of two. By increasing the extent size above 4 MB,
the maximum physical volume size will be scaled accordingly, up to a
maximum of 1 Petabyte (although the current real-world size limit is 2
Terabytes on x86 systems). For example, if I wanted to create a volume
group with 32 Megabyte extents, I'd type:=20

=20
# vgcreate -s 32M main /dev/hda5
=20
=20
=20
=20
-----Original Message-----
From: Luke Reeves [mailto:luke@oceanlake.com]
Sent: Friday, September 27, 2002 2:55 PM
To: 'linux-lvm@sistina.com'
Subject: [linux-lvm] Limits
=20
What are the current limits (specifically on LVM 1.0.5) of each
volume/disk?  I read 255GB in one of the docs.  Can anyone fill me in?
Thanks.
        Luke Reeves=20
        luke@oceanlake.com=20

------=_NextPart_001_0035_01C2663B.27B85290
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML xmlns=3D"http://www.w3.org/TR/REC-html40" xmlns:o =3D=20
"urn:schemas-microsoft-com:office:office" xmlns:w =3D=20
"urn:schemas-microsoft-com:office:word"><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<TITLE>Limits</TITLE>

<META content=3DWord.Document name=3DProgId>
<META content=3D"MSHTML 6.00.2800.1106" name=3DGENERATOR>
<META content=3D"Microsoft Word 9" name=3DOriginator><LINK=20
href=3D"cid:filelist.xml@01C26635.4ABDFCA0" rel=3DFile-List><!--[if gte =
mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:DoNotRelyOnCSS/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:Zoom>0</w:Zoom>
  <w:DocumentKind>DocumentEmail</w:DocumentKind>
  <w:EnvelopeVis/>
 </w:WordDocument>
</xml><![endif]-->
<STYLE>
<!--
 /* Font Definitions */
@font-face
	{font-family:Courier;
	panose-1:0 0 0 0 0 0 0 0 0 0;
	mso-font-alt:"Courier New";
	mso-font-charset:0;
	mso-generic-font-family:modern;
	mso-font-format:other;
	mso-font-pitch:fixed;
	mso-font-signature:3 0 0 0 1 0;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;
	mso-font-charset:0;
	mso-generic-font-family:swiss;
	mso-font-pitch:variable;
	mso-font-signature:553679495 -2147483648 8 0 66047 0;}
 /* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{mso-style-parent:"";
	margin:0in;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:12.0pt;
	font-family:"Times New Roman";
	mso-fareast-font-family:"Times New Roman";}
p.MsoAutoSig, li.MsoAutoSig, div.MsoAutoSig
	{margin:0in;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:12.0pt;
	font-family:"Times New Roman";
	mso-fareast-font-family:"Times New Roman";}
p
	{margin-right:0in;
	mso-margin-top-alt:auto;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	mso-pagination:widow-orphan;
	font-size:12.0pt;
	font-family:"Times New Roman";
	mso-fareast-font-family:"Times New Roman";}
code
	{mso-ansi-font-size:11.0pt;
	mso-bidi-font-size:11.0pt;
	mso-ascii-font-family:Courier;
	mso-fareast-font-family:"Courier New";
	mso-hansi-font-family:Courier;
	mso-bidi-font-family:"Courier New";}
pre
	{margin:0in;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	tab-stops:45.8pt 91.6pt 137.4pt 183.2pt 229.0pt 274.8pt 320.6pt 366.4pt =
412.2pt 458.0pt 503.8pt 549.6pt 595.4pt 641.2pt 687.0pt 732.8pt;
	font-size:10.0pt;
	font-family:"Courier New";
	mso-fareast-font-family:"Courier New";}
span.EmailStyle16
	{mso-style-type:personal-reply;
	mso-ansi-font-size:10.0pt;
	mso-ascii-font-family:Arial;
	mso-hansi-font-family:Arial;
	mso-bidi-font-family:Arial;
	color:navy;}
@page Section1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;
	mso-header-margin:.5in;
	mso-footer-margin:.5in;
	mso-paper-source:0;}
div.Section1
	{page:Section1;}
-->
</STYLE>
</HEAD>
<BODY lang=3DEN-US style=3D"tab-interval: .5in">
<DIV><SPAN class=3D961443219-27092002><FONT face=3DVerdana =
color=3D#0000ff=20
size=3D2>Excellent, that's exactly what I needed.&nbsp; Thanks=20
Ryan!</FONT></SPAN></DIV>
<DIV><SPAN class=3D961443219-27092002><FONT face=3DVerdana =
color=3D#0000ff=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D961443219-27092002>&nbsp;&nbsp;&nbsp; <FONT =
face=3DVerdana=20
color=3D#0000ff size=3D2>Luke</FONT></SPAN></DIV>
<BLOCKQUOTE dir=3Dltr style=3D"MARGIN-RIGHT: 0px">
  <DIV class=3DOutlookMessageHeader dir=3Dltr align=3Dleft><FONT =
face=3DTahoma=20
  size=3D2>-----Original Message-----<BR><B>From:</B> Ryan Leathers=20
  [mailto:Ryan.Leathers@globalknowledge.com]<BR><B>Sent:</B> Friday, =
September=20
  27, 2002 3:01 PM<BR><B>To:</B> =
'linux-lvm@sistina.com'<BR><B>Subject:</B> RE:=20
  [linux-lvm] Limits<BR><BR></FONT></DIV>
  <DIV class=3DSection1>
  <P><B><FONT face=3D"Times New Roman" color=3Dnavy size=3D3><SPAN=20
  style=3D"FONT-WEIGHT: bold; FONT-SIZE: 12pt; COLOR: navy; =
mso-bidi-font-size: 9.5pt">Here=20
  is your answer taken from a document that helped me with the same=20
  question...</SPAN></FONT></B><B><FONT color=3Dnavy><SPAN=20
  style=3D"FONT-WEIGHT: bold; COLOR: navy; mso-bidi-font-size: 9.5pt; =
mso-color-alt: windowtext"><o:p></o:p></SPAN></FONT></B></P>
  <P><B><FONT face=3D"Times New Roman" color=3Dnavy size=3D3><SPAN=20
  style=3D"FONT-WEIGHT: bold; FONT-SIZE: 12pt; COLOR: navy; =
mso-bidi-font-size: =
9.5pt">http://www-106.ibm.com/developerworks/library/l-lvm2.html</SPAN></=
FONT></B><FONT=20
  color=3Dnavy><SPAN=20
  style=3D"COLOR: navy; mso-bidi-font-size: 9.5pt; mso-color-alt: =
windowtext"><o:p></o:p></SPAN></FONT></P>
  <P><FONT face=3D"Times New Roman" color=3Dnavy size=3D2><SPAN=20
  style=3D"FONT-SIZE: 9.5pt; COLOR: navy">The extent size determines the =
maximum=20
  size that a logical volume can be. As you can see from the above =
output, a 4=20
  MB extent size imposes a logical volume size limitation of 256 =
Gigabytes,=20
  which is an easily attainable logical volume size if you're adding =
several=20
  high-capacity drives to your volume group. If your volumes could end =
up being=20
  greater than 256 GB apiece, I recommend specifying a larger extent =
size at=20
  vgcreate time. Extents can range anywhere from 8 KB to 512 MB, and =
must always=20
  be a multiple of two. By increasing the extent size above 4 MB, the =
maximum=20
  physical volume size will be scaled accordingly, up to a maximum of 1 =
Petabyte=20
  (although the current real-world size limit is 2 Terabytes on x86 =
systems).=20
  For example, if I wanted to create a volume group with 32 Megabyte =
extents,=20
  I'd type: </SPAN></FONT><FONT color=3Dnavy size=3D2><SPAN=20
  style=3D"FONT-SIZE: 9.5pt; COLOR: navy; mso-color-alt: =
windowtext"><o:p></o:p></SPAN></FONT></P>
  <TABLE=20
  style=3D"BACKGROUND: #cccccc; WIDTH: 100%; mso-cellspacing: 0in; =
mso-padding-alt: 3.75pt 3.75pt 3.75pt 3.75pt"=20
  cellSpacing=3D0 cellPadding=3D0 width=3D"100%" border=3D1>
    <TBODY>
    <TR>
      <TD=20
      style=3D"PADDING-RIGHT: 3.75pt; PADDING-LEFT: 3.75pt; =
PADDING-BOTTOM: 3.75pt; PADDING-TOP: 3.75pt"><PRE><CODE><FONT =
face=3DCourier color=3Dnavy size=3D1><SPAN style=3D"FONT-SIZE: 9pt; =
COLOR: navy; FONT-FAMILY: Courier"><![if =
!supportEmptyParas]>&nbsp;<![endif]></SPAN></FONT></CODE><CODE><FONT =
face=3DCourier color=3Dnavy size=3D1><SPAN style=3D"FONT-SIZE: 9pt; =
COLOR: navy; FONT-FAMILY: Courier; mso-color-alt: =
windowtext"><o:p></o:p></SPAN></FONT></CODE></PRE><PRE><CODE><FONT =
face=3DCourier color=3Dnavy size=3D1><SPAN style=3D"FONT-SIZE: 9pt; =
COLOR: navy; FONT-FAMILY: Courier"># vgcreate -s 32M main =
/dev/hda5</SPAN></FONT></CODE><FONT color=3Dnavy><SPAN style=3D"COLOR: =
navy; mso-color-alt: =
windowtext"><o:p></o:p></SPAN></FONT></PRE></TD></TR></TBODY></TABLE>
  <P class=3DMsoNormal><SPAN class=3DEmailStyle16><FONT face=3DArial =
color=3Dnavy=20
  size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-bidi-font-size: =
12.0pt"><![if =
!supportEmptyParas]><![endif]>&nbsp;<o:p></o:p></SPAN></FONT></SPAN></P>
  <P class=3DMsoNormal><SPAN class=3DEmailStyle16><FONT face=3DArial =
color=3Dnavy=20
  size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-bidi-font-size: =
12.0pt"><![if =
!supportEmptyParas]><![endif]>&nbsp;<o:p></o:p></SPAN></FONT></SPAN></P>
  <P class=3DMsoNormal><SPAN class=3DEmailStyle16><FONT face=3DArial =
color=3Dnavy=20
  size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-bidi-font-size: =
12.0pt"><![if =
!supportEmptyParas]><![endif]>&nbsp;<o:p></o:p></SPAN></FONT></SPAN></P>
  <P class=3DMsoNormal><SPAN class=3DEmailStyle16><FONT face=3DArial =
color=3Dnavy=20
  size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-bidi-font-size: =
12.0pt"><![if =
!supportEmptyParas]><![endif]>&nbsp;<o:p></o:p></SPAN></FONT></SPAN></P>
  <P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DTahoma =
color=3Dblack=20
  size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; COLOR: black; FONT-FAMILY: =
Tahoma">-----Original=20
  Message-----<BR><B><SPAN style=3D"FONT-WEIGHT: bold">From:</SPAN></B> =
Luke=20
  Reeves [mailto:luke@oceanlake.com]<BR><B><SPAN=20
  style=3D"FONT-WEIGHT: bold">Sent:</SPAN></B> Friday, September 27, =
2002 2:55=20
  PM<BR><B><SPAN style=3D"FONT-WEIGHT: bold">To:</SPAN></B>=20
  'linux-lvm@sistina.com'<BR><B><SPAN=20
  style=3D"FONT-WEIGHT: bold">Subject:</SPAN></B> [linux-lvm]=20
  Limits</SPAN></FONT></P>
  <P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3D"Times =
New Roman"=20
  size=3D3><SPAN=20
  style=3D"FONT-SIZE: 12pt"><![if =
!supportEmptyParas]><![endif]>&nbsp;<o:p></o:p></SPAN></FONT></P>
  <P style=3D"MARGIN-LEFT: 0.5in"><FONT face=3D"Times New Roman" =
color=3Dblack=20
  size=3D2><SPAN style=3D"FONT-SIZE: 10pt; COLOR: black">What are the =
current limits=20
  (specifically on LVM 1.0.5) of each volume/disk?&nbsp; I read 255GB in =
one of=20
  the docs.&nbsp; Can anyone fill me in?&nbsp; =
Thanks.</SPAN></FONT><FONT=20
  color=3Dblack><SPAN=20
  style=3D"COLOR: black; mso-color-alt: =
windowtext"><o:p></o:p></SPAN></FONT></P>
  <P style=3D"MARGIN-LEFT: 0.5in"><FONT face=3D"Times New Roman" =
color=3Dblack=20
  size=3D3><SPAN=20
  style=3D"FONT-SIZE: 12pt; COLOR: =
black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  </SPAN></FONT><FONT color=3Dblack size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; COLOR: black">Luke Reeves</SPAN></FONT><FONT =

  color=3Dblack><SPAN style=3D"COLOR: black">=20
  <BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </SPAN></FONT><FONT =
color=3Dblack=20
  size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; COLOR: =
black">luke@oceanlake.com</SPAN></FONT><FONT=20
  color=3Dblack><SPAN style=3D"COLOR: black"> </SPAN></FONT><FONT =
color=3Dblack><SPAN=20
  style=3D"COLOR: black; mso-color-alt: =
windowtext"><o:p></o:p></SPAN></FONT></P></DIV></BLOCKQUOTE></BODY></HTML=
>

------=_NextPart_001_0035_01C2663B.27B85290--

------=_NextPart_000_0034_01C2663B.27B85290
Content-Type: application/x-pkcs7-signature;
	name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="smime.p7s"

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIH1zCCA2Iw
ggLLoAMCAQICEAvaCxfBP4mOqwl0erTOLjMwDQYJKoZIhvcNAQECBQAwXzELMAkGA1UEBhMCVVMx
FzAVBgNVBAoTDlZlcmlTaWduLCBJbmMuMTcwNQYDVQQLEy5DbGFzcyAxIFB1YmxpYyBQcmltYXJ5
IENlcnRpZmljYXRpb24gQXV0aG9yaXR5MB4XDTk4MDUxMjAwMDAwMFoXDTA4MDUxMjIzNTk1OVow
gcwxFzAVBgNVBAoTDlZlcmlTaWduLCBJbmMuMR8wHQYDVQQLExZWZXJpU2lnbiBUcnVzdCBOZXR3
b3JrMUYwRAYDVQQLEz13d3cudmVyaXNpZ24uY29tL3JlcG9zaXRvcnkvUlBBIEluY29ycC4gQnkg
UmVmLixMSUFCLkxURChjKTk4MUgwRgYDVQQDEz9WZXJpU2lnbiBDbGFzcyAxIENBIEluZGl2aWR1
YWwgU3Vic2NyaWJlci1QZXJzb25hIE5vdCBWYWxpZGF0ZWQwgZ8wDQYJKoZIhvcNAQEBBQADgY0A
MIGJAoGBALtaRIoEFrtV/QN6ii2UTxV4NrgNSrJvnFS/vOh3Kp258Gi7ldkxQXB6gUu5SBNWLccI
4YRCq8CikqtEXKpC8IIOAukv+8I7u77JJwpdtrA2QjO1blSIT4dKvxna+RXoD4e2HOPMxpqOf2ok
kuP84GW6p7F+78nbN2rISsgJBuSZAgMBAAGjgbAwga0wDwYDVR0TBAgwBgEB/wIBADBHBgNVHSAE
QDA+MDwGC2CGSAGG+EUBBwEBMC0wKwYIKwYBBQUHAgEWH3d3dy52ZXJpc2lnbi5jb20vcmVwb3Np
dG9yeS9SUEEwMQYDVR0fBCowKDAmoCSgIoYgaHR0cDovL2NybC52ZXJpc2lnbi5jb20vcGNhMS5j
cmwwCwYDVR0PBAQDAgEGMBEGCWCGSAGG+EIBAQQEAwIBBjANBgkqhkiG9w0BAQIFAAOBgQACfZ5v
RUs4oLje6VNkIbzkTCuPHv6SQKzYCjlqoTIhLAebq1n+0mIafVU4sDdz3PQHZmNiveFTcFKH56jY
UulbLarh3s+sMVTUixnI2COo7wQrMn0sGBzIfImoLnfyRNFlCk10te7TG5JzdC6JOzUTcudAMZrT
ssSr51a+i+P7FTCCBG0wggPWoAMCAQICEAuZiIpprTijkC48mkkT/dUwDQYJKoZIhvcNAQEEBQAw
gcwxFzAVBgNVBAoTDlZlcmlTaWduLCBJbmMuMR8wHQYDVQQLExZWZXJpU2lnbiBUcnVzdCBOZXR3
b3JrMUYwRAYDVQQLEz13d3cudmVyaXNpZ24uY29tL3JlcG9zaXRvcnkvUlBBIEluY29ycC4gQnkg
UmVmLixMSUFCLkxURChjKTk4MUgwRgYDVQQDEz9WZXJpU2lnbiBDbGFzcyAxIENBIEluZGl2aWR1
YWwgU3Vic2NyaWJlci1QZXJzb25hIE5vdCBWYWxpZGF0ZWQwHhcNMDIwOTI3MDAwMDAwWhcNMDMw
OTI3MjM1OTU5WjCCARExFzAVBgNVBAoTDlZlcmlTaWduLCBJbmMuMR8wHQYDVQQLExZWZXJpU2ln
biBUcnVzdCBOZXR3b3JrMUYwRAYDVQQLEz13d3cudmVyaXNpZ24uY29tL3JlcG9zaXRvcnkvUlBB
IEluY29ycC4gYnkgUmVmLixMSUFCLkxURChjKTk4MR4wHAYDVQQLExVQZXJzb25hIE5vdCBWYWxp
ZGF0ZWQxNDAyBgNVBAsTK0RpZ2l0YWwgSUQgQ2xhc3MgMSAtIE1pY3Jvc29mdCBGdWxsIFNlcnZp
Y2UxFDASBgNVBAMUC0x1a2UgUmVldmVzMSEwHwYJKoZIhvcNAQkBFhJsdWtlQG9jZWFubGFrZS5j
b20wgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAM/BHEj/HdmAWjA9Uezy7fz0HdsLhykZEQwX
4edntaVot28dSGa5R27Kb5jls8Ao/TVHPDCOPn+sJv6gk3nJfsHLn5nyczMnkoB8jNE4p6wjsoFN
EmsuzeK0YLlNkYsSiRarTrQmgga/x/BeiygQp0htEJtmpVwk/SOKYhBq/j79AgMBAAGjggEGMIIB
AjAJBgNVHRMEAjAAMIGsBgNVHSAEgaQwgaEwgZ4GC2CGSAGG+EUBBwEBMIGOMCgGCCsGAQUFBwIB
FhxodHRwczovL3d3dy52ZXJpc2lnbi5jb20vQ1BTMGIGCCsGAQUFBwICMFYwFRYOVmVyaVNpZ24s
IEluYy4wAwIBARo9VmVyaVNpZ24ncyBDUFMgaW5jb3JwLiBieSByZWZlcmVuY2UgbGlhYi4gbHRk
LiAoYyk5NyBWZXJpU2lnbjARBglghkgBhvhCAQEEBAMCB4AwMwYDVR0fBCwwKjAooCagJIYiaHR0
cDovL2NybC52ZXJpc2lnbi5jb20vY2xhc3MxLmNybDANBgkqhkiG9w0BAQQFAAOBgQBJyJpktFmz
M3SK+5XA83cjSLVes6joEpZliG7q20SEa3FecPZT0UeEJ7YNC90sPFBgu5st4Yc7Xk4dk45DxI8l
Fkch1jHjUN25Eg71xIo/SLxO+K+u0sLSH+1pfUIiXoTO96au5n73g9qUYq56w9sHbA/GgZlrZwhk
92v4YHM9bTGCAzgwggM0AgEBMIHhMIHMMRcwFQYDVQQKEw5WZXJpU2lnbiwgSW5jLjEfMB0GA1UE
CxMWVmVyaVNpZ24gVHJ1c3QgTmV0d29yazFGMEQGA1UECxM9d3d3LnZlcmlzaWduLmNvbS9yZXBv
c2l0b3J5L1JQQSBJbmNvcnAuIEJ5IFJlZi4sTElBQi5MVEQoYyk5ODFIMEYGA1UEAxM/VmVyaVNp
Z24gQ2xhc3MgMSBDQSBJbmRpdmlkdWFsIFN1YnNjcmliZXItUGVyc29uYSBOb3QgVmFsaWRhdGVk
AhALmYiKaa04o5AuPJpJE/3VMAkGBSsOAwIaBQCgggGsMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0B
BwEwHAYJKoZIhvcNAQkFMQ8XDTAyMDkyNzE5MzI1N1owIwYJKoZIhvcNAQkEMRYEFIPu2iURpIm+
lv69VltYGr9G9HEWMFgGCSqGSIb3DQEJDzFLMEkwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCA
MAcGBSsOAwIHMA0GCCqGSIb3DQMCAgEoMAcGBSsOAwIaMAoGCCqGSIb3DQIFMIHyBgkrBgEEAYI3
EAQxgeQwgeEwgcwxFzAVBgNVBAoTDlZlcmlTaWduLCBJbmMuMR8wHQYDVQQLExZWZXJpU2lnbiBU
cnVzdCBOZXR3b3JrMUYwRAYDVQQLEz13d3cudmVyaXNpZ24uY29tL3JlcG9zaXRvcnkvUlBBIElu
Y29ycC4gQnkgUmVmLixMSUFCLkxURChjKTk4MUgwRgYDVQQDEz9WZXJpU2lnbiBDbGFzcyAxIENB
IEluZGl2aWR1YWwgU3Vic2NyaWJlci1QZXJzb25hIE5vdCBWYWxpZGF0ZWQCEAuZiIpprTijkC48
mkkT/dUwDQYJKoZIhvcNAQEBBQAEgYACZkwwUUUN5B/66+CmpMlNrZvEJHE/7fRBl0DtyLSp2yLU
D71ILFMl9fPaEhgB91dbs9T2BposywN5JIdizFIqTUudQDth84CIkcftxRiD8R/0BmObrteuI06J
SuXEa3zP9T8dHUvKZA8BWNofz/zYigbjWjA5GLuhtJqNwWaNDgAAAAAAAA==

------=_NextPart_000_0034_01C2663B.27B85290--
