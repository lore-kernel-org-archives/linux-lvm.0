Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CD281001B18
	for <linux-lvm@redhat.com>; Tue,  2 Jul 2019 15:54:05 +0000 (UTC)
Received: from mail.ctc.grnoc.iu.edu (eth-0-1.mail.ictc.indiana.gigapop.net
	[149.165.134.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C2DB5309264D
	for <linux-lvm@redhat.com>; Tue,  2 Jul 2019 15:53:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested) (Authenticated sender: jdratlif)
	by mail.ctc.grnoc.iu.edu (Postfix) with ESMTPSA id 45dTKs4XBwzB3Htj
	for <linux-lvm@redhat.com>; Tue,  2 Jul 2019 15:53:21 +0000 (UTC)
Date: Tue, 02 Jul 2019 11:53:21 -0400
From: John Ratliff <jdratlif@globalnoc.iu.edu>
Message-ID: <D1D4AF7B-074F-4F13-9A23-23694F162675@globalnoc.iu.edu>
Mime-version: 1.0
Content-type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha256; boundary="B_3644913201_1012273556"
Subject: [linux-lvm] Lvm RAID0 vs lvm striping
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
To: linux-lvm@redhat.com

> This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

--B_3644913201_1012273556
Content-type: multipart/alternative;
	boundary="B_3644913201_1624945521"


--B_3644913201_1624945521
Content-type: text/plain;
	charset="UTF-8"
Content-transfer-encoding: 7bit

What is the difference between these two?

 

Thanks.

 

John Ratliff


--B_3644913201_1624945521
Content-type: text/html;
	charset="UTF-8"
Content-transfer-encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:schema=
s-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/office/20=
04/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta http-equiv=3DC=
ontent-Type content=3D"text/html; charset=3Dutf-8"><meta name=3DGenerator content=3D=
"Microsoft Word 15 (filtered medium)"><style><!--
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
	font-size:12.0pt;
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
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style></head><body lang=3DEN-US link=3D"#0563C1" vlink=3D"#954F72"><div clas=
s=3DWordSection1><p class=3DMsoNormal><span style=3D'font-size:11.0pt'>What is the=
 difference between these two?<o:p></o:p></span></p><p class=3DMsoNormal><span=
 style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><sp=
an style=3D'font-size:11.0pt'>Thanks.<o:p></o:p></span></p><p class=3DMsoNormal>=
<span style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNorma=
l><span style=3D'font-size:11.0pt'>John Ratliff</span><o:p></o:p></p></div></b=
ody></html>

--B_3644913201_1624945521--

--B_3644913201_1012273556
Content-type: application/pkcs7-signature; name="smime.p7s"
Content-transfer-encoding: base64
Content-disposition: attachment;
	filename="smime.p7s"

MIIUYgYJKoZIhvcNAQcCoIIUUzCCFE8CAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0B
BwGgghHwMIIGAzCCBOugAwIBAgIRAOa/cYC23Qu7mFZj0yAw3BYwDQYJKoZIhvcNAQELBQAw
gYkxCzAJBgNVBAYTAlVTMQswCQYDVQQIEwJNSTESMBAGA1UEBxMJQW5uIEFyYm9yMRIwEAYD
VQQKEwlJbnRlcm5ldDIxETAPBgNVBAsTCEluQ29tbW9uMTIwMAYDVQQDEylJbkNvbW1vbiBS
U0EgU3RhbmRhcmQgQXNzdXJhbmNlIENsaWVudCBDQTAeFw0xOTA1MjEwMDAwMDBaFw0yMjA1
MjAyMzU5NTlaMIHJMQ4wDAYDVQQREwU0NzQwNTEbMBkGA1UEChMSSW5kaWFuYSBVbml2ZXJz
aXR5MR4wHAYDVQQJExUxMDcgU291dGggSW5kaWFuYSBBdmUxEDAOBgNVBAgTB0luZGlhbmEx
FDASBgNVBAcTC0Jsb29taW5ndG9uMQswCQYDVQQGEwJVUzEbMBkGA1UEAxMSSm9obiBEYXZp
ZCBSYXRsaWZmMSgwJgYJKoZIhvcNAQkBFhlqZHJhdGxpZkBnbG9iYWxub2MuaXUuZWR1MIIB
IjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAkdM+9av56/boi9nnjPETNx5hvqzi/h44
Xbv+ewIgoUzCDxkes75ntmp/xLi9YwDzeDJ3MmiovE/T557tiLCgSeyOVR1VLsrJ0gmm7IP0
aoR2xge2du5T/GylYl5IyozzgNPOhUh8o5NB4gxGllYLiEwIPl9JVQStzqcOvLGlxr9NV2YH
gHCzSafs+jC/ovu245p76+9XrssYtMJIHi5EiyUh4ExBBfI+wlAVDmBWi1GN7a4UW7ibZDXb
AuaVL3vX8Vi0eANF+qy0M7h/3qVLsStDaw8YSLU7PKwDMnO52cmKk5VJNRYfeZo8E5t46beW
LkNy0k45AGQP0tSc3AtPWQIDAQABo4ICIjCCAh4wHwYDVR0jBBgwFoAUfe5x0B/rqWFtj2aE
rQ8rB+Ix27wwHQYDVR0OBBYEFIg50kUR02dTjndLU5cjbiR00bk8MA4GA1UdDwEB/wQEAwIF
oDAMBgNVHRMBAf8EAjAAMB0GA1UdJQQWMBQGCCsGAQUFBwMEBggrBgEFBQcDAjBqBgNVHSAE
YzBhMF8GDSsGAQQBriMBBAMDAAEwTjBMBggrBgEFBQcCARZAaHR0cHM6Ly93d3cuaW5jb21t
b24ub3JnL2NlcnQvcmVwb3NpdG9yeS9jcHNfc3RhbmRhcmRfY2xpZW50LnBkZjBVBgNVHR8E
TjBMMEqgSKBGhkRodHRwOi8vY3JsLmluY29tbW9uLXJzYS5vcmcvSW5Db21tb25SU0FTdGFu
ZGFyZEFzc3VyYW5jZUNsaWVudENBLmNybDCBigYIKwYBBQUHAQEEfjB8MFAGCCsGAQUFBzAC
hkRodHRwOi8vY3J0LmluY29tbW9uLXJzYS5vcmcvSW5Db21tb25SU0FTdGFuZGFyZEFzc3Vy
YW5jZUNsaWVudENBLmNydDAoBggrBgEFBQcwAYYcaHR0cDovL29jc3AuaW5jb21tb24tcnNh
Lm9yZzBPBgNVHREESDBGoCkGCisGAQQBgjcUAgOgGwwZamRyYXRsaWZAZ2xvYmFsbm9jLml1
LmVkdYEZamRyYXRsaWZAZ2xvYmFsbm9jLml1LmVkdTANBgkqhkiG9w0BAQsFAAOCAQEAEGDA
KU4CMyXckGJWtf3o/xQOYhg/Um6E8yT/sGHsw/pYjIs67LU2xZKx8XAEtQNXSq2mPsKxyawm
MPcfZaGIsXHRJMzgorPovlsO1ebvOMVUaVaBVIaKZ96MjLuHm5UGhNIG6w1Szjv2oYNv2ylb
rISYtKeiEl8NdUHc6mCa80T/fD07pXFKH27htvfg7OrqCVcYgRa0g2WGEioMBVEw02TbCgzP
voI628qqKYXcvNJchAdYltFVkxqXyWAjkQHCoGiJg1JVQ/yeui9LbtQJVAAEkNMB1otjggNk
Ya9d92Y/TVknFZl2rcy0u6sxEUASPeyXFSoacwPj8psCdDBy5zCCBgMwggProAMCAQICED+9
NPK6UvwO0wpXo4HhvmQwDQYJKoZIhvcNAQENBQAwgYgxCzAJBgNVBAYTAlVTMRMwEQYDVQQI
EwpOZXcgSmVyc2V5MRQwEgYDVQQHEwtKZXJzZXkgQ2l0eTEeMBwGA1UEChMVVGhlIFVTRVJU
UlVTVCBOZXR3b3JrMS4wLAYDVQQDEyVVU0VSVHJ1c3QgUlNBIENlcnRpZmljYXRpb24gQXV0
aG9yaXR5MB4XDTE0MDkxOTAwMDAwMFoXDTI0MDkxODIzNTk1OVowgYkxCzAJBgNVBAYTAlVT
MQswCQYDVQQIEwJNSTESMBAGA1UEBxMJQW5uIEFyYm9yMRIwEAYDVQQKEwlJbnRlcm5ldDIx
ETAPBgNVBAsTCEluQ29tbW9uMTIwMAYDVQQDEylJbkNvbW1vbiBSU0EgU3RhbmRhcmQgQXNz
dXJhbmNlIENsaWVudCBDQTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAID+ylt3
d8Yf7IL751mKVa3A6p6xB+gmKzYJovEvTDpZQJyrnPJAKUAlknIpeI+bBmoQfLdkB/8Y/FDb
qBggxucRGcYBaEc/2ZLs3TSSuGSfG/XSJtlz1Eym4CMJbj6d/PqC1eT+pKVGeQBl5T1u6LZO
fovh6/RmqnXR24du4RWqHYvyTJyGXvoT5Qxp7IXWYPiobYhzA5WnwnvS8ZKO+3pjqZGoZrq1
/bMt0n/8y4Obi4k0vVddCnWXZoCVvJfRuhoYwWy4fetGjHVo/bCa+L6z7Vk/MrdxBkBVd3Kl
LzdJAYArq4ve7NlNir1eX64PMwWVvzQl0WKsNfGWg4vD26cCAwEAAaOCAWQwggFgMB8GA1Ud
IwQYMBaAFFN5v1qqK0rPVIDh2JvAnfKyA2bLMB0GA1UdDgQWBBR97nHQH+upYW2PZoStDysH
4jHbvDAOBgNVHQ8BAf8EBAMCAYYwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHSUEFjAUBggr
BgEFBQcDAgYIKwYBBQUHAwQwEQYDVR0gBAowCDAGBgRVHSAAMFAGA1UdHwRJMEcwRaBDoEGG
P2h0dHA6Ly9jcmwudXNlcnRydXN0LmNvbS9VU0VSVHJ1c3RSU0FDZXJ0aWZpY2F0aW9uQXV0
aG9yaXR5LmNybDB2BggrBgEFBQcBAQRqMGgwPwYIKwYBBQUHMAKGM2h0dHA6Ly9jcnQudXNl
cnRydXN0LmNvbS9VU0VSVHJ1c3RSU0FBZGRUcnVzdENBLmNydDAlBggrBgEFBQcwAYYZaHR0
cDovL29jc3AudXNlcnRydXN0LmNvbTANBgkqhkiG9w0BAQ0FAAOCAgEAdtOnxJK15L21ll2t
mbfVStSZ/45E30VSTkN7in1pPNM8jKYh6X3RhWS2sgW45/05mYSrgmvFe9yUrVTwZqPphjLP
cRmxqULBFi1tJj5Kyo5SYwX1C31yfIMirJ10eQnwg0JYijIMWN4xPRxsl1TTcgloyu6NbEAL
VDAFb281ZD7xy2l8Antz5VSa7j2v6bt77LSCUEJK4C7Ym6eiSulXAg3zk2N/k4h2F5E4ry3L
C3f0FPOTbWHy3YQtSPAYDJ9EfGTJZoneaKpo6UAWKkTLMZyIqmpP2NKcq280GIjGKt/e1KYQ
aleX4U6RpAkOTWGxxiB30NSRXnIDmLchCVFDZCBVUfPJH98J+UwwX9yzIw3nOCmjV6Wb+FSC
mBVnQG7gwLXj6GuA7hsnzMtqLP3Ww8Z7dyyqF3EuUqj6Q7utW5utfcotyZphypT+5P+phFCg
EMW1rhjhRLjKAxks56sWGVcw5Vhu9diWT+IGM+oi1FQQskyNmBujqF8cUMOAS8ZjKaOzAozI
h91yS9TuhOVacSaJSt64uDWlQe7h+GCmjXze/fW8heXJo0tpv/BKdmajibmDiWld2bGfotmC
IPmR69mzLseVcPafkuxIkLusGRMuCjJFzWCqjWbsIxbkl1HFPrN03dS4N4hh2Y7XW6CWLXlO
eQR9Zln0p5DeCuOSHnMwggXeMIIDxqADAgECAhAB/W0w/KPKUagbvGQONQMtMA0GCSqGSIb3
DQEBDAUAMIGIMQswCQYDVQQGEwJVUzETMBEGA1UECBMKTmV3IEplcnNleTEUMBIGA1UEBxML
SmVyc2V5IENpdHkxHjAcBgNVBAoTFVRoZSBVU0VSVFJVU1QgTmV0d29yazEuMCwGA1UEAxMl
VVNFUlRydXN0IFJTQSBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0eTAeFw0xMDAyMDEwMDAwMDBa
Fw0zODAxMTgyMzU5NTlaMIGIMQswCQYDVQQGEwJVUzETMBEGA1UECBMKTmV3IEplcnNleTEU
MBIGA1UEBxMLSmVyc2V5IENpdHkxHjAcBgNVBAoTFVRoZSBVU0VSVFJVU1QgTmV0d29yazEu
MCwGA1UEAxMlVVNFUlRydXN0IFJTQSBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0eTCCAiIwDQYJ
KoZIhvcNAQEBBQADggIPADCCAgoCggIBAIASZRc2DsPbCLPQrFcNdu3NJ9NMrVCDYeKqIE0J
LWQJ3M6Jn8w9qez2z8Hc8dOx1ns3KBErR9o5xrw6GbRfpr19naNjQrZ28qk7K5H44m/Q7BYg
kAk+4uh0yRi0kdRiZNt/owbxiBhqkCI8vP4T8IcUe/bkH47U5FHGEWdGCFHLhhRUP7wz/n5s
nP8WnRi9UY41pqdmyHJn2yFmsdSbeAPAUDrozPDcvJ5M/q8FljUfV1q3/875PbcstvZU3cjn
EjpNrkyKt1yatLcgPcp/IjSufjtoZgFE5wFORlObM2D3lL5TN5BzQ/Myw1Pv26r+dE5px2uM
YJPexMcM3+EyrsyTO1F4lWeL7j1W/gzQaQ8bD/MlJmszbfduR/pzQ+V+DqVmsSl8MoRjVYnE
DcGTVDAZE6zTfTen6106bDVc20HXEtqpSQvf2ICKCZNijrVmzyWIzYS4sT+kOQ/ZAp7rEkyV
fPNrBaleFoPMuGfi6BOdzFuC00yz7Vv/3uVzrCM7LQC/NVV0CUnYSVgaf5I25lGSDvMmfRxN
F7zJ7EMm0L9BX0CpRET0medXh55QH1dUqD79dGMvsVBlCeZYQi5DGky08CVHWfoEHpPUJkZK
UIGy3r54t/xnFeHJV4QeD2PW6WK61l9VLupcxigIBCU5uA4rqfJMlxwHPw1S9e3vL4IPAgMB
AAGjQjBAMB0GA1UdDgQWBBRTeb9aqitKz1SA4dibwJ3ysgNmyzAOBgNVHQ8BAf8EBAMCAQYw
DwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0BAQwFAAOCAgEAXNR8Dc/3AX1BmWUMc8VSn8v4
z5kGfxvaQxWfngJVV5YU8VI8J4eUKO0fOgE3onb8U1DAhJvGa066jCFPoo5VYpHzaRXYvIjj
xKoL/e+o6UtVKgYgbVV4KRnuXzBcSyQRVf8kmm5eKivuC02ff/cBOJQUlUMHCftgqe4cqxKM
oJpep5hqWW2LPwj7yNFFrxgVZJASD3MoLsXiJE78WOzw9EX+IrPrL47S2UVhBcGXb6h2co+L
jDavvw0FznGN5qZvH2ymcWLF2NCDcgzxZxGJDJwTTHI037zVcd+qcd3huWyMPBJdZdq9VxK2
Q2v/5d5NZhFRz5mu7Be26HGRjN5J/t01caIVJ5Qcz2HjJrtvo2clIV3m3R0LLmgbO4Kv7INn
hdSYUXSxuZmAif9/eBlceUpgLpJArkw3KizJx2LIDl33NlvK4CUlAbTdGgecdwA/0NzV7D3U
+rs/zIXWb3+pLd+5Avf1l5q1NdrDZ7CHSqkoniOO/1wna+GwT/MH7gAu1FmHy1JBler0R9fu
ZEFVfI1ZApXdYp3Cue5aKHSEpZu3kMcMB9/1iTZ0MtYowbCwC+CcTMMc1vzjabVHRoEvooKr
02NEcMSN/y0zuq2Pe7VwiK4+Gc9AKNj8yJC7XZki9VLmWMUfiDFD7ogd18aOPENqHacY3n09
FvFi+cqQqP0xggI2MIICMgIBATCBnzCBiTELMAkGA1UEBhMCVVMxCzAJBgNVBAgTAk1JMRIw
EAYDVQQHEwlBbm4gQXJib3IxEjAQBgNVBAoTCUludGVybmV0MjERMA8GA1UECxMISW5Db21t
b24xMjAwBgNVBAMTKUluQ29tbW9uIFJTQSBTdGFuZGFyZCBBc3N1cmFuY2UgQ2xpZW50IENB
AhEA5r9xgLbdC7uYVmPTIDDcFjANBglghkgBZQMEAgEFAKBpMC8GCSqGSIb3DQEJBDEiBCC9
e7EqF1DTZNVO1IJlylvNFFKcvxve7370ZmRhheR27jAYBgkqhkiG9w0BCQMxCwYJKoZIhvcN
AQcBMBwGCSqGSIb3DQEJBTEPFw0xOTA3MDIxNTUzMjFaMA0GCSqGSIb3DQEBAQUABIIBAIGo
p44X6JE/kw7Xjr6FgJXfOfeIbi8Z2um6ZvwsSz5O0dCsSsXRKYzl7PbcKTufFsHp0aIrEe7c
LN0vSbtHQzmaxayYD5tHC6c24UAsi2d8YpIArK7AKuPaHGb5xpbg4wRm3NrSu29c52hDrKm/
VegVNu/cH4Ds4Ma5o/AcsJoTygzG/Ndw1t8iaFhO3FvqNlHCe5JBwp87HvikscB0796ShFgN
mnrmCmX0vbvln3D3mJFDnsHMl+XbpSE9dYgNlRjJinABKbbCKknaGdkfPae6cnH0SW/n0ljH
YS19FlkYCLSLFGpDu3rNGDtUDhm1jSu3HgJoEDuC9PhiSdynY/A=

--B_3644913201_1012273556--
