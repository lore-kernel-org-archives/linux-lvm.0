Message-ID: <695771C76AEED411A19800902771A5040158B633@NC10S106>
From: Ryan Leathers <Ryan.Leathers@globalknowledge.com>
Subject: RE: [linux-lvm] Limits
MIME-Version: 1.0
MIME-Version: 1.0
Content-Type: multipart/signed;
	protocol="application/x-pkcs7-signature";
	micalg=SHA1;
	boundary="----=_NextPart_000_0005_01C26635.4C748640"
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
Date: Fri Sep 27 13:58:13 2002
List-Id: <linux-lvm.redhat.com>
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

This is a multi-part message in MIME format.

------=_NextPart_000_0005_01C26635.4C748640
Content-Type: multipart/alternative;
	boundary="----=_NextPart_001_0006_01C26635.4C791A20"


------=_NextPart_001_0006_01C26635.4C791A20
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

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

------=_NextPart_001_0006_01C26635.4C791A20
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">


<meta name=3DProgId content=3DWord.Document>
<meta name=3DGenerator content=3D"Microsoft Word 9">
<meta name=3DOriginator content=3D"Microsoft Word 9">
<link rel=3DFile-List href=3D"cid:filelist.xml@01C26635.4ABDFCA0">
<title>Limits</title>
<!--[if gte mso 9]><xml>
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
<style>
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
</style>
</head>

<body lang=3DEN-US style=3D'tab-interval:.5in'>

<div class=3DSection1>

<p><b><font size=3D3 color=3Dnavy face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt;mso-bidi-font-size:9.5pt;color:navy;font-weight:bold'>Here is =
your
answer taken from a document that helped me with the same =
question&#8230;</span></font></b><b><font
color=3Dnavy><span =
style=3D'mso-bidi-font-size:9.5pt;color:navy;mso-color-alt:windowtext;
font-weight:bold'><o:p></o:p></span></font></b></p>

<p><b><font size=3D3 color=3Dnavy face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt;mso-bidi-font-size:9.5pt;color:navy;font-weight:bold'>http://www-1=
06.ibm.com/developerworks/library/l-lvm2.html</span></font></b><font
color=3Dnavy><span =
style=3D'mso-bidi-font-size:9.5pt;color:navy;mso-color-alt:windowtext'><o=
:p></o:p></span></font></p>

<p><font size=3D2 color=3Dnavy face=3D"Times New Roman"><span =
style=3D'font-size:9.5pt;
color:navy'>The extent size determines the maximum size that a logical =
volume
can be. As you can see from the above output, a 4 MB extent size imposes =
a
logical volume size limitation of 256 Gigabytes, which is an easily =
attainable
logical volume size if you're adding several high-capacity drives to =
your
volume group. If your volumes could end up being greater than 256 GB =
apiece, I
recommend specifying a larger extent size at vgcreate time. Extents can =
range
anywhere from 8 KB to 512 MB, and must always be a multiple of two. By
increasing the extent size above 4 MB, the maximum physical volume size =
will be
scaled accordingly, up to a maximum of 1 Petabyte (although the current
real-world size limit is 2 Terabytes on x86 systems). For example, if I =
wanted
to create a volume group with 32 Megabyte extents, I'd type: =
</span></font><font
size=3D2 color=3Dnavy><span =
style=3D'font-size:9.5pt;color:navy;mso-color-alt:windowtext'><o:p></o:p>=
</span></font></p>

<table border=3D1 cellspacing=3D0 cellpadding=3D0 width=3D"100%" =
style=3D'width:100.0%;
 mso-cellspacing:0in;background:#CCCCCC;mso-padding-alt:3.75pt 3.75pt =
3.75pt 3.75pt'>
 <tr>
  <td style=3D'padding:3.75pt 3.75pt 3.75pt 3.75pt'><pre><code><font =
size=3D1
  color=3Dnavy face=3DCourier><span =
style=3D'font-size:9.0pt;font-family:Courier;
  color:navy'><![if =
!supportEmptyParas]>&nbsp;<![endif]></span></font></code><code><font
  size=3D1 color=3Dnavy face=3DCourier><span =
style=3D'font-size:9.0pt;font-family:Courier;
  =
color:navy;mso-color-alt:windowtext'><o:p></o:p></span></font></code></pr=
e><pre><code><font
  size=3D1 color=3Dnavy face=3DCourier><span =
style=3D'font-size:9.0pt;font-family:Courier;
  color:navy'># vgcreate -s 32M main /dev/hda5</span></font></code><font
  color=3Dnavy><span =
style=3D'color:navy;mso-color-alt:windowtext'><o:p></o:p></span></font></=
pre></td>
 </tr>
</table>

<p class=3DMsoNormal><span class=3DEmailStyle16><font size=3D2 =
color=3Dnavy face=3DArial><span
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial'><!=
[if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle16><font size=3D2 =
color=3Dnavy face=3DArial><span
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial'><!=
[if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle16><font size=3D2 =
color=3Dnavy face=3DArial><span
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial'><!=
[if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle16><font size=3D2 =
color=3Dnavy face=3DArial><span
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial'><!=
[if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
color=3Dblack
face=3DTahoma><span =
style=3D'font-size:10.0pt;font-family:Tahoma;color:black'>-----Original
Message-----<br>
<b><span style=3D'font-weight:bold'>From:</span></b> Luke Reeves
[mailto:luke@oceanlake.com]<br>
<b><span style=3D'font-weight:bold'>Sent:</span></b> Friday, September =
27, 2002
2:55 PM<br>
<b><span style=3D'font-weight:bold'>To:</span></b> =
'linux-lvm@sistina.com'<br>
<b><span style=3D'font-weight:bold'>Subject:</span></b> [linux-lvm] =
Limits</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
face=3D"Times New Roman"><span
style=3D'font-size:12.0pt'><![if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></p>

<p style=3D'margin-left:.5in'><font size=3D2 color=3Dblack face=3D"Times =
New Roman"><span
style=3D'font-size:10.0pt;color:black'>What are the current limits =
(specifically
on LVM 1.0.5) of each volume/disk?&nbsp; I read 255GB in one of the =
docs.&nbsp;
Can anyone fill me in?&nbsp; Thanks.</span></font><font =
color=3Dblack><span
style=3D'color:black;mso-color-alt:windowtext'><o:p></o:p></span></font><=
/p>

<p style=3D'margin-left:.5in'><font size=3D3 color=3Dblack face=3D"Times =
New Roman"><span
style=3D'font-size:12.0pt;color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;
</span></font><font size=3D2 color=3Dblack><span =
style=3D'font-size:10.0pt;
color:black'>Luke Reeves</span></font><font color=3Dblack><span =
style=3D'color:
black'> <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></font><font size=3D2
color=3Dblack><span =
style=3D'font-size:10.0pt;color:black'>luke@oceanlake.com</span></font><f=
ont
color=3Dblack><span style=3D'color:black'> </span></font><font =
color=3Dblack><span
style=3D'color:black;mso-color-alt:windowtext'><o:p></o:p></span></font><=
/p>

</div>

</body>

</html>

------=_NextPart_001_0006_01C26635.4C791A20--

------=_NextPart_000_0005_01C26635.4C748640
Content-Type: application/x-pkcs7-signature;
	name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="smime.p7s"

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIJDTCCApww
ggIFoAMCAQICAwfuTjANBgkqhkiG9w0BAQQFADCBkjELMAkGA1UEBhMCWkExFTATBgNVBAgTDFdl
c3Rlcm4gQ2FwZTESMBAGA1UEBxMJQ2FwZSBUb3duMQ8wDQYDVQQKEwZUaGF3dGUxHTAbBgNVBAsT
FENlcnRpZmljYXRlIFNlcnZpY2VzMSgwJgYDVQQDEx9QZXJzb25hbCBGcmVlbWFpbCBSU0EgMjAw
MC44LjMwMB4XDTAyMDcxOTIxMzU1M1oXDTAzMDcxOTIxMzU1M1owUzEfMB0GA1UEAxMWVGhhd3Rl
IEZyZWVtYWlsIE1lbWJlcjEwMC4GCSqGSIb3DQEJARYhcnlhbi5sZWF0aGVyc0BnbG9iYWxrbm93
bGVkZ2UuY29tMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCjivUFLm4wdKroKRmUfwQnNiEA
K3bot974tgJ3N2EbrAqt/k/+Ymkf3GIqvY6M/DkFh7ZAAPP3AALdjKFiqVRLsahMFqXipeX9/Bhg
9D2rdgu1rW72WT42/NE9ZF165fKWZ1WaqchZLwPZKfVlCmv7SOMHhXCdJI8THjC7K8sjxwIDAQAB
oz4wPDAsBgNVHREEJTAjgSFyeWFuLmxlYXRoZXJzQGdsb2JhbGtub3dsZWRnZS5jb20wDAYDVR0T
AQH/BAIwADANBgkqhkiG9w0BAQQFAAOBgQDdSGupb0YNmFUOZqhsGnGoeAIiR+nkFPZxSjY8aLGc
5T1UEcJx6lkJbZY+rW+BZWE0T7AjOWEsfyOBlXktkPEnYoFzFXlIpAXfOKKU8IwsWXjBxy6oYCRV
eca+jeVV+F4TDQoTNc8tNa0xS/yYKu1i8sdjGbrFuoBiEioSauwjeDCCAy0wggKWoAMCAQICAQAw
DQYJKoZIhvcNAQEEBQAwgdExCzAJBgNVBAYTAlpBMRUwEwYDVQQIEwxXZXN0ZXJuIENhcGUxEjAQ
BgNVBAcTCUNhcGUgVG93bjEaMBgGA1UEChMRVGhhd3RlIENvbnN1bHRpbmcxKDAmBgNVBAsTH0Nl
cnRpZmljYXRpb24gU2VydmljZXMgRGl2aXNpb24xJDAiBgNVBAMTG1RoYXd0ZSBQZXJzb25hbCBG
cmVlbWFpbCBDQTErMCkGCSqGSIb3DQEJARYccGVyc29uYWwtZnJlZW1haWxAdGhhd3RlLmNvbTAe
Fw05NjAxMDEwMDAwMDBaFw0yMDEyMzEyMzU5NTlaMIHRMQswCQYDVQQGEwJaQTEVMBMGA1UECBMM
V2VzdGVybiBDYXBlMRIwEAYDVQQHEwlDYXBlIFRvd24xGjAYBgNVBAoTEVRoYXd0ZSBDb25zdWx0
aW5nMSgwJgYDVQQLEx9DZXJ0aWZpY2F0aW9uIFNlcnZpY2VzIERpdmlzaW9uMSQwIgYDVQQDExtU
aGF3dGUgUGVyc29uYWwgRnJlZW1haWwgQ0ExKzApBgkqhkiG9w0BCQEWHHBlcnNvbmFsLWZyZWVt
YWlsQHRoYXd0ZS5jb20wgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBANRp19SwlGRbcelH2AxR
tupykbCEXn0tDY97Et+FJXUodDpCLGMnn5V7S+9+GYcdhuqj3bnOlmQawhRuRKx85o/oTQ9xH0A4
pgCjh3j2+ZSGXq3qwF5269kUo11uenwMpUtVfwYZKX+emibVars4JAhqmMex2qOYkf152+VaxBy5
AgMBAAGjEzARMA8GA1UdEwEB/wQFMAMBAf8wDQYJKoZIhvcNAQEEBQADgYEAx+ySfk749ZalZ2Iq
pPBNEWDQb41gWGGsJrtSNVwIzzD7qEqWih9iQiOMFw/0umScF6xHKd+dmF7SbGBxXKKs3Hnj524A
Rx+1DSjoAp3kmv0T9KbZfLH43F8jJgmRgHPQFBveQ6mDJfLmnC8Vyv6mq4oHdYsM3VGEa+T40c53
ooEwggM4MIICoaADAgECAhBmRXK3zHT1z2N2RYTQLpEBMA0GCSqGSIb3DQEBBAUAMIHRMQswCQYD
VQQGEwJaQTEVMBMGA1UECBMMV2VzdGVybiBDYXBlMRIwEAYDVQQHEwlDYXBlIFRvd24xGjAYBgNV
BAoTEVRoYXd0ZSBDb25zdWx0aW5nMSgwJgYDVQQLEx9DZXJ0aWZpY2F0aW9uIFNlcnZpY2VzIERp
dmlzaW9uMSQwIgYDVQQDExtUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgQ0ExKzApBgkqhkiG9w0B
CQEWHHBlcnNvbmFsLWZyZWVtYWlsQHRoYXd0ZS5jb20wHhcNMDAwODMwMDAwMDAwWhcNMDQwODI3
MjM1OTU5WjCBkjELMAkGA1UEBhMCWkExFTATBgNVBAgTDFdlc3Rlcm4gQ2FwZTESMBAGA1UEBxMJ
Q2FwZSBUb3duMQ8wDQYDVQQKEwZUaGF3dGUxHTAbBgNVBAsTFENlcnRpZmljYXRlIFNlcnZpY2Vz
MSgwJgYDVQQDEx9QZXJzb25hbCBGcmVlbWFpbCBSU0EgMjAwMC44LjMwMIGfMA0GCSqGSIb3DQEB
AQUAA4GNADCBiQKBgQDeMzKmY8cJJUU+0m54J2eBxdqIGYKXDuNEKYpjNSptcDz63K737nRvMLwz
kH/5NHGgo22Y8cNPomXbDfpL8dbdYaX5hc1VmjUanZJ1qCeu2HL5ugL217CR3hzpq+AYA6h8Q0JQ
UYeDPPA5tJtUihOH/7ObnUlmAC0JieyUa+mhaQIDAQABo04wTDApBgNVHREEIjAgpB4wHDEaMBgG
A1UEAxMRUHJpdmF0ZUxhYmVsMS0yOTcwEgYDVR0TAQH/BAgwBgEB/wIBADALBgNVHQ8EBAMCAQYw
DQYJKoZIhvcNAQEEBQADgYEAMbFLR135AXHl9VNsXXnWPZjAJhNigSKnEvgilegbSbcnewQ5uvzm
8iTrkfq97A0qOPdQVahs9w2tTBu8A/S166JHn2yiDFiNMUIJEWywGmnRKxKyQF1q+XnQ6i4l3Yrk
/NsNH50C81rbyjz2ROomaYd/SJ7OpZ/nhNjJYmKtBcYxggKqMIICpgIBATCBmjCBkjELMAkGA1UE
BhMCWkExFTATBgNVBAgTDFdlc3Rlcm4gQ2FwZTESMBAGA1UEBxMJQ2FwZSBUb3duMQ8wDQYDVQQK
EwZUaGF3dGUxHTAbBgNVBAsTFENlcnRpZmljYXRlIFNlcnZpY2VzMSgwJgYDVQQDEx9QZXJzb25h
bCBGcmVlbWFpbCBSU0EgMjAwMC44LjMwAgMH7k4wCQYFKw4DAhoFAKCCAWUwGAYJKoZIhvcNAQkD
MQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMDIwOTI3MTg1MTAyWjAjBgkqhkiG9w0BCQQx
FgQUEB30mFDlfz5iL9y0ASEIfPZf4iowWAYJKoZIhvcNAQkPMUswSTAKBggqhkiG9w0DBzAOBggq
hkiG9w0DAgICAIAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwBwYFKw4DAhowCgYIKoZIhvcNAgUw
gasGCSsGAQQBgjcQBDGBnTCBmjCBkjELMAkGA1UEBhMCWkExFTATBgNVBAgTDFdlc3Rlcm4gQ2Fw
ZTESMBAGA1UEBxMJQ2FwZSBUb3duMQ8wDQYDVQQKEwZUaGF3dGUxHTAbBgNVBAsTFENlcnRpZmlj
YXRlIFNlcnZpY2VzMSgwJgYDVQQDEx9QZXJzb25hbCBGcmVlbWFpbCBSU0EgMjAwMC44LjMwAgMH
7k4wDQYJKoZIhvcNAQEBBQAEgYBKGQiq/WpALjl5UcMqSHUcYEEeGkLkkfYywSOJ+RhbYEwtrkSk
1YLGbTj5xil6QR95kvpX02+6V3W2fiL5/9SBRXJVBbI2N6HzhRcOjCD6Z+zcIlXEAbxQxm6ytkzH
87yqncao63aURpEcQiEEkaJ0+hQQrwm+pPWQ5KVkUUJyMgAAAAAAAA==

------=_NextPart_000_0005_01C26635.4C748640--
