From: Moshe Lazarov <Moshe.Lazarov@axxana.com>
Date: Mon, 16 Oct 2017 22:07:15 +0000
Message-ID: <DB6PR0902MB221318644207A1CB3E40EA74954F0@DB6PR0902MB2213.eurprd09.prod.outlook.com>
References: <DB6PR0902MB2213A3709365A8B5F151390C954B0@DB6PR0902MB2213.eurprd09.prod.outlook.com>
	<20171013144111.GA2570@redhat.com>
	<DB6PR0902MB2213F527A2A5C02317218F72954F0@DB6PR0902MB2213.eurprd09.prod.outlook.com>
	<20171016185429.GA26267@redhat.com>
In-Reply-To: <20171016185429.GA26267@redhat.com>
Content-Language: en-US
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=SHA1; boundary="----=_NextPart_000_02E1_01D34690.6F057560"
MIME-Version: 1.0
Subject: Re: [linux-lvm] add_lockspace done -19
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
To: David Teigland <teigland@redhat.com>
Cc: Moshe Lazarov <Moshe.Lazarov@axxana.com>, LVM general discussion and development <linux-lvm@redhat.com>

------=_NextPart_000_02E1_01D34690.6F057560
Content-Type: multipart/mixed;
	boundary="----=_NextPart_001_02E2_01D34690.6F057560"


------=_NextPart_001_02E2_01D34690.6F057560
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

LVM version - 2.02.173
Sanlock version - 3.5.0

The log files are attached.

Thanks a lot!


-----Original Message-----
From: David Teigland [mailto:teigland@redhat.com] 
Sent: Monday, October 16, 2017 11:54 AM
To: Moshe Lazarov <Moshe.Lazarov@axxana.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Subject: Re: [linux-lvm] add_lockspace done -19

On Mon, Oct 16, 2017 at 06:40:17PM +0000, Moshe Lazarov wrote:
> The command "vgcreate --shared global /dev/sdb2" creates a VG that 
> eventually is REMOVED with an error:

Please send me:

- the versions of lvm and sanlock you are using

- that vgcreate command with -vvvv, e.g.
  vgcreate -vvvv --shared global /dev/sdb2 2>&1 | tee vgs.log

- after the failure, the debug logs from lvmlockd and sanlock:
  lvmlockctl -d > lvmlockd.log
  sanlock log_dump > sanlock.log

Thanks


------=_NextPart_001_02E2_01D34690.6F057560
Content-Type: application/octet-stream;
	name="sanlock.log"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="sanlock.log"

2017-10-17 01:03:12 257069 [8426]: sanlock daemon started 3.5.0 host =
04e4b8c2-8e63-4e37-a2f6-e0cf8c5fa6f6.ubuntu16-1=0A=
2017-10-17 01:03:16 257073 [8431]: cmd_align 2,9=0A=
2017-10-17 01:03:16 257073 [8431]: open error -13 =
/dev/mapper/global-lvmlock=0A=
2017-10-17 01:03:16 257073 [8431]: cmd_align 2,9 done -19=0A=

------=_NextPart_001_02E2_01D34690.6F057560
Content-Type: application/octet-stream;
	name="lvmlockd.log"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="lvmlockd.log"

1508191390 lvmlockd started=0A=
1508191395 new cl 1 pi 2 fd 9=0A=
1508191395 recv client[8435] cl 1 running_lm . "" mode iv flags 0=0A=
1508191395 send client[8435] cl 1 running_lm . rv 3  =0A=
1508191395 set gl_use_sanlock=0A=
1508191395 recv vgcreate[8435] cl 1 lock gl "" mode ex flags 0=0A=
1508191395 lockspace "" not found for sanlock gl, searching...=0A=
1508191395 work search for gl=0A=
1508191395 worker found no gl_is_enabled=0A=
1508191395 lockspace "" not found after search=0A=
1508191395 send vgcreate[8435] cl 1 lock gl rv -210 ENOLS =
NO_LOCKSPACES,NO_GL_LS,=0A=
1508191396 recv vgcreate[8435] cl 1 init vg "global" mode iv flags 0=0A=
1508191396 work init_vg global=0A=
1508191396 S lvm_global init_vg_san path /dev/mapper/global-lvmlock=0A=
1508191396 sanlock daemon version 03050000 proto 00000001=0A=
1508191396 S lvm_global init_vg_san bad disk align size -19 =
/dev/mapper/global-lvmlock=0A=
1508191396 send vgcreate[8435] cl 1 init vg rv -212 vg_args lvmlock =
lv_args none=0A=
1508191397 close vgcreate[8435] cl 1 fd 9=0A=
1508191473 new cl 2 pi 2 fd 9=0A=
1508191473 recv client[8458] cl 2 dump_log . "" mode iv flags 0=0A=

------=_NextPart_001_02E2_01D34690.6F057560--

------=_NextPart_000_02E1_01D34690.6F057560
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
hkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0xNzEwMTYyMjA3MDdaMCMGCSqG
SIb3DQEJBDEWBBQHwbcNRdFLGfP4v4yI5M0G11rIuTCBkwYJKoZIhvcNAQkPMYGFMIGCMAsGCWCG
SAFlAwQBKjALBglghkgBZQMEARYwCgYIKoZIhvcNAwcwCwYJYIZIAWUDBAECMA4GCCqGSIb3DQMC
AgIAgDANBggqhkiG9w0DAgIBQDAHBgUrDgMCGjALBglghkgBZQMEAgMwCwYJYIZIAWUDBAICMAsG
CWCGSAFlAwQCATCBvgYJKwYBBAGCNxAEMYGwMIGtMIGXMQswCQYDVQQGEwJHQjEbMBkGA1UECBMS
R3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRowGAYDVQQKExFDT01PRE8gQ0Eg
TGltaXRlZDE9MDsGA1UEAxM0Q09NT0RPIFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNl
Y3VyZSBFbWFpbCBDQQIRAJbH30zV9sJLaGO79Ek6StgwgcAGCyqGSIb3DQEJEAILMYGwoIGtMIGX
MQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxm
b3JkMRowGAYDVQQKExFDT01PRE8gQ0EgTGltaXRlZDE9MDsGA1UEAxM0Q09NT0RPIFJTQSBDbGll
bnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAJbH30zV9sJLaGO79Ek6Stgw
DQYJKoZIhvcNAQEBBQAEggEAbtGl7qV3ve7pvWy9WlZ3gYc0I5gUcOXHOSgniy6XCEVOHVz8XmFx
/9tjpgOUixybaTU6gxJbUHdxWAuyOXUCboyOVuSz8z/NZvjs671ckosOZG6bFyHnN+AakxJZ3ESF
iuPvV0Uq8cAPCRviOdXFLopvhLsPq6Q1DcurbkpxonMk2yIjo0zse6yqj595BRriHXtDBmGE8TUI
2XbYPxnO/FJhq7mbinkAtNDaa515E5Hz2YmZZH7ZDUFrRwHFO0U13jAJf3mTXzr+CO77Clku76yC
1i995omQpGcGHBsK7Ahvbzs1zDjfoc8L3E+f09owPqPMcwXbQrv9wdyf4BgjpQAAAAAAAA==

------=_NextPart_000_02E1_01D34690.6F057560--
