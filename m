Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E39935EDF9
	for <linux-lvm@redhat.com>; Thu, 12 Oct 2017 18:30:31 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr50093.outbound.protection.outlook.com [40.107.5.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B7A0180476
	for <linux-lvm@redhat.com>; Thu, 12 Oct 2017 18:30:28 +0000 (UTC)
From: Moshe Lazarov <Moshe.Lazarov@axxana.com>
Date: Thu, 12 Oct 2017 18:30:24 +0000
Message-ID: <DB6PR0902MB2213A3709365A8B5F151390C954B0@DB6PR0902MB2213.eurprd09.prod.outlook.com>
Content-Language: en-US
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=SHA1; boundary="----=_NextPart_000_0051_01D3434D.7A609890"
MIME-Version: 1.0
Subject: [linux-lvm] add_lockspace done -19
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>
Cc: Moshe Lazarov <Moshe.Lazarov@axxana.com>

------=_NextPart_000_0051_01D3434D.7A609890
Content-Type: multipart/alternative;
	boundary="----=_NextPart_001_0052_01D3434D.7A609890"


------=_NextPart_001_0052_01D3434D.7A609890
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

I am using the following script to create shared VGs using SANLOCK. However,
I keep getting an error when trying to add the lock space.

 

#!/bin/bash

 

killall sanlock

/etc/init.d/sanlock stop

killall lvmetad

lvmetad

sleep 2

vgremove -ff --config global/use_lvmlockd=0 vglock

 

echo 'y' | pvremove -ff --config global/use_lvmlockd=0 /dev/sdb1

echo 'y' | pvremove -ff --config global/use_lvmlockd=0 /dev/sdc1

echo 'y' | pvremove -ff --config global/use_lvmlockd=0 /dev/sdb2

 

#http://man7.org/linux/man-pages/man8/lvmlockd.8.html

#The first vgcreate command needs to be given the path to a device that has
not yet been initialized with pvcreate. /dev/sdb2 is used for the lock and
should not be

#initialized with pvcreate.

 

#Lock VG & LV

vgcreate --verbose --config global/use_lvmlockd=0 vglock /dev/sdb2

lvcreate --config global/use_lvmlockd=0 -n locklv -L 10MB vglock

 

sanlock direct init -s lsgl:1:/dev/vglock/locklv:0

 

lvmlockd

sleep 2

systemctl start sanlock

lvmlockd -g sanlock --host-id 1

sleep 2

systemctl status sanlock

 

sanlock client add_lockspace -s lsgl:1:/dev/vglock/locklv:0

 

pvcreate -ff --config global/use_lvmlockd=0 /dev/sdc1

vgcreate --verbose --shared vg1 /dev/sdc1 --lock-type sanlock

lvcreate -n slowlv -L 150G vg1 /dev/sdc1

 

Please advise.

 

Thanks.


------=_NextPart_001_0052_01D3434D.7A609890
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><META =
HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 15 =
(filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	text-align:right;
	direction:rtl;
	unicode-bidi:embed;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US =
link=3D"#0563C1" vlink=3D"#954F72"><div class=3DWordSection1><p =
class=3DMsoNormal =
style=3D'text-align:left;direction:ltr;unicode-bidi:embed'>Hi,<o:p></o:p>=
</p><p class=3DMsoNormal =
style=3D'text-align:left;direction:ltr;unicode-bidi:embed'>I am using =
the following script to create shared VGs using SANLOCK. However, I keep =
getting an error when trying to add the lock space.<o:p></o:p></p><p =
class=3DMsoNormal =
style=3D'text-align:left;direction:ltr;unicode-bidi:embed'><o:p>&nbsp;</o=
:p></p><p class=3DMsoNormal =
style=3D'margin-left:.5in;text-align:left;direction:ltr;unicode-bidi:embe=
d'>#!/bin/bash<o:p></o:p></p><p class=3DMsoNormal =
style=3D'margin-left:.5in;text-align:left;direction:ltr;unicode-bidi:embe=
d'><span lang=3DHE dir=3DRTL =
style=3D'font-family:"Arial",sans-serif'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal =
style=3D'margin-left:.5in;text-align:left;direction:ltr;unicode-bidi:embe=
d'>killall sanlock<o:p></o:p></p><p class=3DMsoNormal =
style=3D'margin-left:.5in;text-align:left;direction:ltr;unicode-bidi:embe=
d'>/etc/init.d/sanlock stop<o:p></o:p></p><p class=3DMsoNormal =
style=3D'margin-left:.5in;text-align:left;direction:ltr;unicode-bidi:embe=
d'>killall lvmetad<o:p></o:p></p><p class=3DMsoNormal =
style=3D'margin-left:.5in;text-align:left;direction:ltr;unicode-bidi:embe=
d'>lvmetad<o:p></o:p></p><p class=3DMsoNormal =
style=3D'margin-left:.5in;text-align:left;direction:ltr;unicode-bidi:embe=
d'>sleep 2<o:p></o:p></p><p class=3DMsoNormal =
style=3D'margin-left:.5in;text-align:left;direction:ltr;unicode-bidi:embe=
d'>vgremove -ff --config global/use_lvmlockd=3D0 vglock<o:p></o:p></p><p =
class=3DMsoNormal =
style=3D'margin-left:.5in;text-align:left;direction:ltr;unicode-bidi:embe=
d'><span lang=3DHE dir=3DRTL =
style=3D'font-family:"Arial",sans-serif'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal =
style=3D'margin-left:.5in;text-align:left;direction:ltr;unicode-bidi:embe=
d'>echo 'y' | pvremove -ff --config global/use_lvmlockd=3D0 =
/dev/sdb1<o:p></o:p></p><p class=3DMsoNormal =
style=3D'margin-left:.5in;text-align:left;direction:ltr;unicode-bidi:embe=
d'>echo 'y' | pvremove -ff --config global/use_lvmlockd=3D0 =
/dev/sdc1<o:p></o:p></p><p class=3DMsoNormal =
style=3D'margin-left:.5in;text-align:left;direction:ltr;unicode-bidi:embe=
d'>echo 'y' | pvremove -ff --config global/use_lvmlockd=3D0 =
/dev/sdb2<o:p></o:p></p><p class=3DMsoNormal =
style=3D'margin-left:.5in;text-align:left;direction:ltr;unicode-bidi:embe=
d'><span lang=3DHE dir=3DRTL =
style=3D'font-family:"Arial",sans-serif'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal =
style=3D'margin-left:.5in;text-align:left;direction:ltr;unicode-bidi:embe=
d'><span dir=3DLTR></span><span =
dir=3DLTR></span>#http://man7.org/linux/man-pages/man8/lvmlockd.8.html<o:=
p></o:p></p><p class=3DMsoNormal =
style=3D'margin-left:.5in;text-align:left;direction:ltr;unicode-bidi:embe=
d'>#The first vgcreate command needs to be given the path to a device =
that has not yet been initialized with pvcreate. /dev/sdb2 is used for =
the lock and should not be<o:p></o:p></p><p class=3DMsoNormal =
style=3D'margin-left:.5in;text-align:left;direction:ltr;unicode-bidi:embe=
d'>#initialized with pvcreate.<o:p></o:p></p><p class=3DMsoNormal =
style=3D'margin-left:.5in;text-align:left;direction:ltr;unicode-bidi:embe=
d'><span lang=3DHE dir=3DRTL =
style=3D'font-family:"Arial",sans-serif'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal =
style=3D'margin-left:.5in;text-align:left;direction:ltr;unicode-bidi:embe=
d'><span dir=3DLTR></span><span dir=3DLTR></span>#Lock VG &amp; =
LV<o:p></o:p></p><p class=3DMsoNormal =
style=3D'margin-left:.5in;text-align:left;direction:ltr;unicode-bidi:embe=
d'>vgcreate --verbose --config global/use_lvmlockd=3D0 vglock =
/dev/sdb2<o:p></o:p></p><p class=3DMsoNormal =
style=3D'margin-left:.5in;text-align:left;direction:ltr;unicode-bidi:embe=
d'>lvcreate --config global/use_lvmlockd=3D0 -n locklv -L 10MB =
vglock<o:p></o:p></p><p class=3DMsoNormal =
style=3D'margin-left:.5in;text-align:left;direction:ltr;unicode-bidi:embe=
d'><span lang=3DHE dir=3DRTL =
style=3D'font-family:"Arial",sans-serif'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal =
style=3D'margin-left:.5in;text-align:left;direction:ltr;unicode-bidi:embe=
d'>sanlock direct init -s lsgl:1:/dev/vglock/locklv:0<o:p></o:p></p><p =
class=3DMsoNormal =
style=3D'margin-left:.5in;text-align:left;direction:ltr;unicode-bidi:embe=
d'><span lang=3DHE dir=3DRTL =
style=3D'font-family:"Arial",sans-serif'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal =
style=3D'margin-left:.5in;text-align:left;direction:ltr;unicode-bidi:embe=
d'>lvmlockd<o:p></o:p></p><p class=3DMsoNormal =
style=3D'margin-left:.5in;text-align:left;direction:ltr;unicode-bidi:embe=
d'>sleep 2<o:p></o:p></p><p class=3DMsoNormal =
style=3D'margin-left:.5in;text-align:left;direction:ltr;unicode-bidi:embe=
d'>systemctl start sanlock<o:p></o:p></p><p class=3DMsoNormal =
style=3D'margin-left:.5in;text-align:left;direction:ltr;unicode-bidi:embe=
d'>lvmlockd -g sanlock --host-id 1<o:p></o:p></p><p class=3DMsoNormal =
style=3D'margin-left:.5in;text-align:left;direction:ltr;unicode-bidi:embe=
d'>sleep 2<o:p></o:p></p><p class=3DMsoNormal =
style=3D'margin-left:.5in;text-align:left;direction:ltr;unicode-bidi:embe=
d'>systemctl status sanlock<o:p></o:p></p><p class=3DMsoNormal =
style=3D'margin-left:.5in;text-align:left;direction:ltr;unicode-bidi:embe=
d'><span lang=3DHE dir=3DRTL =
style=3D'font-family:"Arial",sans-serif'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal =
style=3D'margin-left:.5in;text-align:left;direction:ltr;unicode-bidi:embe=
d'>sanlock client add_lockspace -s =
lsgl:1:/dev/vglock/locklv:0<o:p></o:p></p><p class=3DMsoNormal =
style=3D'margin-left:.5in;text-align:left;direction:ltr;unicode-bidi:embe=
d'><span lang=3DHE dir=3DRTL =
style=3D'font-family:"Arial",sans-serif'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal =
style=3D'margin-left:.5in;text-align:left;direction:ltr;unicode-bidi:embe=
d'>pvcreate -ff --config global/use_lvmlockd=3D0 =
/dev/sdc1<o:p></o:p></p><p class=3DMsoNormal =
style=3D'margin-left:.5in;text-align:left;direction:ltr;unicode-bidi:embe=
d'>vgcreate --verbose --shared vg1 /dev/sdc1 --lock-type =
sanlock<o:p></o:p></p><p class=3DMsoNormal =
style=3D'margin-left:.5in;text-align:left;direction:ltr;unicode-bidi:embe=
d'>lvcreate -n slowlv -L 150G vg1 /dev/sdc1<o:p></o:p></p><p =
class=3DMsoNormal =
style=3D'text-align:left;direction:ltr;unicode-bidi:embed'><o:p>&nbsp;</o=
:p></p><p class=3DMsoNormal =
style=3D'text-align:left;direction:ltr;unicode-bidi:embed'>Please =
advise.<o:p></o:p></p><p class=3DMsoNormal =
style=3D'text-align:left;direction:ltr;unicode-bidi:embed'><o:p>&nbsp;</o=
:p></p><p class=3DMsoNormal =
style=3D'text-align:left;direction:ltr;unicode-bidi:embed'>Thanks.<o:p></=
o:p></p></div></body></html>
------=_NextPart_001_0052_01D3434D.7A609890--

------=_NextPart_000_0051_01D3434D.7A609890
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIRBjCCBTww
ggQkoAMCAQICEQCWx99M1fbCS2hju/RJOkrYMA0GCSqGSIb3DQEBCwUAMIGXMQswCQYDVQQGEwJH
QjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRowGAYDVQQK
ExFDT01PRE8gQ0EgTGltaXRlZDE9MDsGA1UEAxM0Q09NT0RPIFJTQSBDbGllbnQgQXV0aGVudGlj
YXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQTAeFw0xNzA4MzEwMDAwMDBaFw0xODA4MzEyMzU5NTla
MCkxJzAlBgkqhkiG9w0BCQEWGG1vc2hlLmxhemFyb3ZAYXh4YW5hLmNvbTCCASIwDQYJKoZIhvcN
AQEBBQADggEPADCCAQoCggEBAK9kRdpVNfHQW1f338CgaYRYyQb4JyYjRPs6/w79Ptt/W8vxMLFE
Y4r6R5fyZa5p3ViBtFpKg0gu4n5YJx3dnMIQ+pcba+PhjyHISy6IStFTZFfaFeGBDY8iroxTkdxo
K28Mia3KgzOTylC7FaCnqJRhYvFkTeJhqOOnSUDjoBh2y7VO8x5pGCKobtvELU5WPZ92v6p/c4xS
XNaIqb2HJb5up/+AxqiU3z9K8Gr5RHpAwwgOlGigbvksbindIJ1Y5judKuHOy65wUteL1xAHghYg
lFOuTpPU/zaZu3ik0IMJOu58BWm0xEEIOWn6YTstv0ibsgcb/CQkOyTX0J1ujVUCAwEAAaOCAe4w
ggHqMB8GA1UdIwQYMBaAFIKvbIz4xf6WYXzoHz0rcUhexIvAMB0GA1UdDgQWBBRYTL2dBwRD6wKY
yhnr3en5116tnjAOBgNVHQ8BAf8EBAMCBaAwDAYDVR0TAQH/BAIwADAgBgNVHSUEGTAXBggrBgEF
BQcDBAYLKwYBBAGyMQEDBQIwEQYJYIZIAYb4QgEBBAQDAgUgMEYGA1UdIAQ/MD0wOwYMKwYBBAGy
MQECAQEBMCswKQYIKwYBBQUHAgEWHWh0dHBzOi8vc2VjdXJlLmNvbW9kby5uZXQvQ1BTMFoGA1Ud
HwRTMFEwT6BNoEuGSWh0dHA6Ly9jcmwuY29tb2RvY2EuY29tL0NPTU9ET1JTQUNsaWVudEF1dGhl
bnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcmwwgYsGCCsGAQUFBwEBBH8wfTBVBggrBgEFBQcw
AoZJaHR0cDovL2NydC5jb21vZG9jYS5jb20vQ09NT0RPUlNBQ2xpZW50QXV0aGVudGljYXRpb25h
bmRTZWN1cmVFbWFpbENBLmNydDAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuY29tb2RvY2EuY29t
MCMGA1UdEQQcMBqBGG1vc2hlLmxhemFyb3ZAYXh4YW5hLmNvbTANBgkqhkiG9w0BAQsFAAOCAQEA
PTv6tmfaHzpE9j1rttmmGtSzDzqG+u6pHWD5FqijAuF5XD0rAe6pKic3BO2fbSdqV5ePJkpae4uP
/NB6j9cddytjIhELBkUrtFrwKRvJO3h+Q1IUJ2/eO5FzLgEvK3cXXQRnkPvr7xZMtMiHbN47LzU6
IZegkKHi5WvnPaRz2V7BFwNm/uyIFIyjmltrRdhLzQYrLHIXkuwRedD8bGa5QUAB0YAFylvPAlhe
yAe0WTjqnIgNsfeua1Dkzyqp6P5oZqF8FWX0H3agOITlc8huwOC4nAzMrETRgKP6Sksvqg9aXYsq
nEu2pzw2Qm4WGVk6+8FQ8MQu4c1S1qgWgvbTyjCCBdgwggPAoAMCAQICEEyq+crbY2/gH/dO2FsD
hp0wDQYJKoZIhvcNAQEMBQAwgYUxCzAJBgNVBAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNo
ZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAYBgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMSswKQYD
VQQDEyJDT01PRE8gUlNBIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MB4XDTEwMDExOTAwMDAwMFoX
DTM4MDExODIzNTk1OVowgYUxCzAJBgNVBAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0
ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAYBgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMSswKQYDVQQD
EyJDT01PRE8gUlNBIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MIICIjANBgkqhkiG9w0BAQEFAAOC
Ag8AMIICCgKCAgEAkehUktIKVrGsDSTdxc9EZ3SZKzejfSNwAHG8U9/E+ioSj0t/EFa9n3Byt2F/
yUsPF6c947AEYe7/EZfH9IY+Cvo+XPmT5jR62RRr55yzhaCCenavcZDX7P0N+pxs+t+wgvQUfvm+
xKYvT3+Zf7X8Z0NyvQwA1onrayzT7Y+YHBSrfuXjbvzYqOSSJNpDa2K4Vf3qwbxstovzDo2a5Jts
aZn4eEgwRdWt4Q08RWD8MpZRJ7xnw8outmvqRsfHIKCxH2XeSAi6pE6p8oNGN4Tr6MyBSENnTnIq
m1y9TBsoilwie7SrmNnu4FGDwwlGTm0+mfqVF9p8M1dBPI1R7Qu2XK8sYxrfV8g/vOldxJuvRZni
o1oktLqpVj3Pb6r/SVi+8Kj/9Lit6Tf7urj0Czr56ENCHonYhMsT8dm74YlguIwoVqwUHZwK53Hr
zw7dPamWoUi9PPevtQ0iTMARgexWO/bTouJbt7IEIlKVgJNp6I5MZfGRAy1wdALqi2cVKWlSArvX
31BqVUa/oKMoYX9w0MOiqiwhqkfOKJwGRXa/ghgntNWutMtQ5mv0TIZxMOmm3xaG4Nj/QN370EKI
f6MzOi5cHkERgWPOGHFrK+ymircxXDpqR+DDeVnWIBqv8mqYqnK8V0rSS527EPywTEHl7R09Xiid
nMy/s1Hap0flhFMCAwEAAaNCMEAwHQYDVR0OBBYEFLuvfgI9+qbxPISOre44mOzZMjLUMA4GA1Ud
DwEB/wQEAwIBBjAPBgNVHRMBAf8EBTADAQH/MA0GCSqGSIb3DQEBDAUAA4ICAQAK8dVGhLeuUbts
sk1BFACTTJzL5cBUz6AljgL5/bCiDfUgmDwTLaxWorDWfhGS6S66ni6acrG9GURsYTWimrQWEmla
jOHXPqQa6C8D9K5hHRAbKqSLesX+BabhwNbI/p6ujyu6PZn42HMJWEZuppz01yfTldo3g3Ic03Pg
okeZAzhd1Ul5ACkcx+ybIBwHJGlXeLI5/DqEoLWcfI2/LpNiJ7c52hcYrr08CWj/hJs81dYLA+NX
nhT30etPyL2HI7e2SUN5hVy665ILocboaKhMFrEamQroUyySu6EJGHUMZah7yyO3GsIohcMb/9Ar
Yu+kewmRmGeMFAHNaAZqYyF1A4CIim6BxoXyqaQt5/SlJBBHg8rN9I15WLEGm+caKtmdAdeUfe0D
Ssrw2+ipAT71VpnJHo5JPbvlCbngT0mSPRaCQMzMWcbmOu0SLmk8bJWx/aode3+Gvh4OMkb7+xOP
dX9Mi0tGY/4ANEBwwcO5od2mcOIEs0G86YCR6mSceuEiA6mcbm8OZU9sh4de826g+XWlm0DoU7In
nUq5wHchjf+H8t68jO8X37dJC9HybjALGg5Odu0R/PXpVrJ9v8dtCpOMpdDAth2+Ok6UotdubAvC
inz6IPPE5OXNDajLkZKxfIXstRRpZg6C583OyC2mUX8hwTVThQZKXZ+tuxtfdDCCBeYwggPOoAMC
AQICEGqb4Tg7/ytrnwHV2binUlYwDQYJKoZIhvcNAQEMBQAwgYUxCzAJBgNVBAYTAkdCMRswGQYD
VQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAYBgNVBAoTEUNPTU9E
TyBDQSBMaW1pdGVkMSswKQYDVQQDEyJDT01PRE8gUlNBIENlcnRpZmljYXRpb24gQXV0aG9yaXR5
MB4XDTEzMDExMDAwMDAwMFoXDTI4MDEwOTIzNTk1OVowgZcxCzAJBgNVBAYTAkdCMRswGQYDVQQI
ExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAYBgNVBAoTEUNPTU9ETyBD
QSBMaW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQg
U2VjdXJlIEVtYWlsIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvrOeV6wodnVA
Fsc4A5jTxhh2IVDzJXkLTLWg0X06WD6cpzEup/Y0dtmEatrQPTRI5Or1u6zf+bGBSyD9aH95dDSm
eny1nxdlYCeXIoymMv6pQHJGNcIDpFDIMypVpVSRsivlJTRENf+RKwrB6vcfWlP8dSsE3Rfywq09
N0ZfxcBa39V0wsGtkGWC+eQKiz4pBZYKjrc5NOpG9qrxpZxyb4o4yNNwTqzaaPpGRqXB7IMjtf7t
TmU2jqPMLxFNe1VXj9XB1rHvbRikw8lBoNoSWY66nJN/VCJv5ym6Q0mdCbDKCMPybTjoNCQuelc0
IAaO4nLUXk0BOSxSxt8kCvsUtQIDAQABo4IBPDCCATgwHwYDVR0jBBgwFoAUu69+Aj36pvE8hI6t
7jiY7NkyMtQwHQYDVR0OBBYEFIKvbIz4xf6WYXzoHz0rcUhexIvAMA4GA1UdDwEB/wQEAwIBhjAS
BgNVHRMBAf8ECDAGAQH/AgEAMBEGA1UdIAQKMAgwBgYEVR0gADBMBgNVHR8ERTBDMEGgP6A9hjto
dHRwOi8vY3JsLmNvbW9kb2NhLmNvbS9DT01PRE9SU0FDZXJ0aWZpY2F0aW9uQXV0aG9yaXR5LmNy
bDBxBggrBgEFBQcBAQRlMGMwOwYIKwYBBQUHMAKGL2h0dHA6Ly9jcnQuY29tb2RvY2EuY29tL0NP
TU9ET1JTQUFkZFRydXN0Q0EuY3J0MCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5jb21vZG9jYS5j
b20wDQYJKoZIhvcNAQEMBQADggIBAHhcsoEoNE887l9Wzp+XVuyPomsX9vP2SQgG1NgvNc3fQP7T
cePo7EIMERoh42awGGsma65u/ITse2hKZHzT0CBxhuhb6txM1n/y78e/4ZOs0j8CGpfb+SJA3GaB
Q+394k+z3ZByWPQedXLL1OdK8aRINTsjk/H5Ns77zwbjOKkDamxlpZ4TKSDMKVmU/PUWNMKSTvtl
enlxBhh7ETrN543j/Q6qqgCWgWuMAXijnRglp9fyadqGOncjZjaaSOGTTFB+E2pvOUtY+hPebuPt
Tbq7vODqzCM6ryEhNhzf+enm0zlpXK7q332nXttNtjv7VFNYG+I31gnMrwfHM5tdhYF/8v5UY5g2
xANPECTQdu9vWPoqNSGDt87b3gXb1AiGGaI06vzgkejL580ul+9hz9D0S0U4jkhJiA7EuTecP/CF
tR72uYRBcunwwH3fciPjviDDAI9SnC/2aPY8ydehzuZutLbZdRJ5PDEJM/1tyZR2niOYihZ+FCbt
f3D9mB12D4ln9icgc7CwaxpNSCPt8i/GqK2HsOgkL3VYnwtx7cJUmpvVdZ4ognzgXtgtdk3ShrtO
S1iAN2ZBXFiRmjVzmehoMof06r1xub+85hFQzVxZx5/bRaTKTlL8YXLI8nAbR9HWdFqzcOoB/hxf
EyIQpx9/s81rgzdEZOofSlZHynoSMYIEUDCCBEwCAQEwga0wgZcxCzAJBgNVBAYTAkdCMRswGQYD
VQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAYBgNVBAoTEUNPTU9E
TyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBh
bmQgU2VjdXJlIEVtYWlsIENBAhEAlsffTNX2wktoY7v0STpK2DAJBgUrDgMCGgUAoIICdzAYBgkq
hkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0xNzEwMTIxODMwMTZaMCMGCSqG
SIb3DQEJBDEWBBQ7duo5v/MHj4IJhp9p/S0HhAjh8zCBkwYJKoZIhvcNAQkPMYGFMIGCMAsGCWCG
SAFlAwQBKjALBglghkgBZQMEARYwCgYIKoZIhvcNAwcwCwYJYIZIAWUDBAECMA4GCCqGSIb3DQMC
AgIAgDANBggqhkiG9w0DAgIBQDAHBgUrDgMCGjALBglghkgBZQMEAgMwCwYJYIZIAWUDBAICMAsG
CWCGSAFlAwQCATCBvgYJKwYBBAGCNxAEMYGwMIGtMIGXMQswCQYDVQQGEwJHQjEbMBkGA1UECBMS
R3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRowGAYDVQQKExFDT01PRE8gQ0Eg
TGltaXRlZDE9MDsGA1UEAxM0Q09NT0RPIFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNl
Y3VyZSBFbWFpbCBDQQIRAJbH30zV9sJLaGO79Ek6StgwgcAGCyqGSIb3DQEJEAILMYGwoIGtMIGX
MQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxm
b3JkMRowGAYDVQQKExFDT01PRE8gQ0EgTGltaXRlZDE9MDsGA1UEAxM0Q09NT0RPIFJTQSBDbGll
bnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAJbH30zV9sJLaGO79Ek6Stgw
DQYJKoZIhvcNAQEBBQAEggEABKeXetpUB+lO/j+ybenoQVcC/k3wUjBWlQf6StKlVmEJR7JHFqNx
bRAenbI9yB3B6pbXdsAX+Z+bgn1/67WkgQNe1F/IVgBzL5+s9R0R45oZIkRPJcqwvtwG9C2K4yoT
jBuU8nFuwtamrgzDFlerAeD3fo+GjS553/1TnPRi8YJJLlYsHTx6aCjclelYLdma9pNObxYarPB9
65pSgGAJSTxiYn4FveG2/3G40i10L02JGOAZYQTgxRFdB7RG4NjYWxJd8sJb3tTohk4aaeR3LpXN
rgxelJY3jbeD/17ubs29JFM9iTx6vg7bf49DB4i2LupHubPBrxpGp6rRMn52hgAAAAAAAA==

------=_NextPart_000_0051_01D3434D.7A609890--
