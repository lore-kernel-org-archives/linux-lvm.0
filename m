From: "Stephen Perkins" <perkins@netmass.com>
Subject: RE: [linux-lvm] Core questions from a LVM neophyte...
Message-ID: <004401c2e749$eb6d8f90$0c03a8c0@netmass.com>
MIME-Version: 1.0
In-Reply-To: <08628CA53C6CBA4ABAFB9E808A5214CB01258A6C@mercury.infiniconsys.com>
Content-Type: multipart/signed;
	micalg=SHA1;
	protocol="application/x-pkcs7-signature";
	boundary="----=_NextPart_000_003F_01C2E717.A06EDF80"
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
Date: Tue Mar 11 08:27:01 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_003F_01C2E717.A06EDF80
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi all,
 
> 	I have built a very cool NAS box, and want to use LVM2 
> on it. My machine is as follows:
> 
> Tyan Thunder i7500 w/ 2-2.4GHz XEON processors.
> 2GB RAM
> 3ware Escalade 7500-12 IDE RAID controller
> 12-160GB Maxtor IDE HDs
> System on a separate 20GB Maxtor HD
> Floppy, slimline CDROM, and a DVDRW drive.
> All in a 12-bay chassis from 
> http://www.rackmountpro.com/productpage.cfm?> prodid=1460
> 
> This 
> config gives me 1.8TB of RAID 5 for under 
> $8K - not too shabby.

This is a superb value and I'm very interested in your proposed "how-to"
site.

I am wanting to deploy some larger virtualized storage in a mixed
Linux/W2K environment.    Is anybody out there exporting virtualized
volumes to Win2K boxes?  If so, how?  I checked HyperSCSI and they do
not appear to have a Win2K client (although a beta is supposed to be
coming soon).  I have not yet found target information for Linux along
with a known interoperable Win2K initiator.  Anybody doing it?

Disk performance is not so much an issue for me since the disk arrays
will be replacing large tape libraries.  Even with pathetic performance,
they should behave much faster than large AIT libraries.  

Question 1:  Is it possible today to:

Have a large IDE RAID5 array that is virtualized through LVM and then
exported to a Dynamic Disk on Win2K over a LAN (not necessarily WAN)?

I believe iSCSI and HyperSCSI would both work... However I have not
found the approporiate interoperable software drivers.

Question 2: The system that is described above is a linux system with
direct attached storage.  It is a SPOF.  Any inexpensive solutions that
would allow the Linux portion to be clustered for active/pasive
failover?  Is FC the only alternative here?

TIA,

- Steve




------=_NextPart_000_003F_01C2E717.A06EDF80
Content-Type: application/x-pkcs7-signature;
	name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="smime.p7s"

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIKTzCCAj0w
ggGmAhEAzbp/VvDf5LxU/iKss3KqVTANBgkqhkiG9w0BAQIFADBfMQswCQYDVQQGEwJVUzEXMBUG
A1UEChMOVmVyaVNpZ24sIEluYy4xNzA1BgNVBAsTLkNsYXNzIDEgUHVibGljIFByaW1hcnkgQ2Vy
dGlmaWNhdGlvbiBBdXRob3JpdHkwHhcNOTYwMTI5MDAwMDAwWhcNMjgwODAxMjM1OTU5WjBfMQsw
CQYDVQQGEwJVUzEXMBUGA1UEChMOVmVyaVNpZ24sIEluYy4xNzA1BgNVBAsTLkNsYXNzIDEgUHVi
bGljIFByaW1hcnkgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkwgZ8wDQYJKoZIhvcNAQEBBQADgY0A
MIGJAoGBAOUZv22jVmEtmUhx9mfeuY3rt56GgAqRDvo4Ja9GiILlc6igmyRdDR/MZW4MsNBWhBiH
mgabEKFz37RYOWtuwfYV1aioP6oSBo0xrH+wNNePNGeICc0UEeJORVZpH3gCgNrcR5EpuzbJY1zF
4Ncth3uhtzKwezC6Ki8xqu6jZ9rbAgMBAAEwDQYJKoZIhvcNAQECBQADgYEATD+4i8Zo3+5DMw5d
6abLB4RNejP/khv0Nq3YlSI2aBFsfELM85wuxAc/FLAPT/+Qknb54rxK6Y/NoIAK98Up8YIiXbix
3YEjo3slFUYweRb46gVLlH8dwhzI47f0EEA8E8NfH1PoSOSGtHuhNbB7Jbq4046rPzidADQAmPPR
cZQwggNiMIICy6ADAgECAhAL2gsXwT+JjqsJdHq0zi4zMA0GCSqGSIb3DQEBAgUAMF8xCzAJBgNV
BAYTAlVTMRcwFQYDVQQKEw5WZXJpU2lnbiwgSW5jLjE3MDUGA1UECxMuQ2xhc3MgMSBQdWJsaWMg
UHJpbWFyeSBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0eTAeFw05ODA1MTIwMDAwMDBaFw0wODA1MTIy
MzU5NTlaMIHMMRcwFQYDVQQKEw5WZXJpU2lnbiwgSW5jLjEfMB0GA1UECxMWVmVyaVNpZ24gVHJ1
c3QgTmV0d29yazFGMEQGA1UECxM9d3d3LnZlcmlzaWduLmNvbS9yZXBvc2l0b3J5L1JQQSBJbmNv
cnAuIEJ5IFJlZi4sTElBQi5MVEQoYyk5ODFIMEYGA1UEAxM/VmVyaVNpZ24gQ2xhc3MgMSBDQSBJ
bmRpdmlkdWFsIFN1YnNjcmliZXItUGVyc29uYSBOb3QgVmFsaWRhdGVkMIGfMA0GCSqGSIb3DQEB
AQUAA4GNADCBiQKBgQC7WkSKBBa7Vf0DeootlE8VeDa4DUqyb5xUv7zodyqdufBou5XZMUFweoFL
uUgTVi3HCOGEQqvAopKrRFyqQvCCDgLpL/vCO7u+yScKXbawNkIztW5UiE+HSr8Z2vkV6A+Hthzj
zMaajn9qJJLj/OBluqexfu/J2zdqyErICQbkmQIDAQABo4GwMIGtMA8GA1UdEwQIMAYBAf8CAQAw
RwYDVR0gBEAwPjA8BgtghkgBhvhFAQcBATAtMCsGCCsGAQUFBwIBFh93d3cudmVyaXNpZ24uY29t
L3JlcG9zaXRvcnkvUlBBMDEGA1UdHwQqMCgwJqAkoCKGIGh0dHA6Ly9jcmwudmVyaXNpZ24uY29t
L3BjYTEuY3JsMAsGA1UdDwQEAwIBBjARBglghkgBhvhCAQEEBAMCAQYwDQYJKoZIhvcNAQECBQAD
gYEAAn2eb0VLOKC43ulTZCG85Ewrjx7+kkCs2Ao5aqEyISwHm6tZ/tJiGn1VOLA3c9z0B2ZjYr3h
U3BSh+eo2FLpWy2q4d7PrDFU1IsZyNgjqO8EKzJ9LBgcyHyJqC538kTRZQpNdLXu0xuSc3QuiTs1
E3LnQDGa07LEq+dWvovj+xUwggSkMIIEDaADAgECAhB0n5hdDx89UhAIJzcIVODyMA0GCSqGSIb3
DQEBBAUAMIHMMRcwFQYDVQQKEw5WZXJpU2lnbiwgSW5jLjEfMB0GA1UECxMWVmVyaVNpZ24gVHJ1
c3QgTmV0d29yazFGMEQGA1UECxM9d3d3LnZlcmlzaWduLmNvbS9yZXBvc2l0b3J5L1JQQSBJbmNv
cnAuIEJ5IFJlZi4sTElBQi5MVEQoYyk5ODFIMEYGA1UEAxM/VmVyaVNpZ24gQ2xhc3MgMSBDQSBJ
bmRpdmlkdWFsIFN1YnNjcmliZXItUGVyc29uYSBOb3QgVmFsaWRhdGVkMB4XDTAzMDIxOTAwMDAw
MFoXDTA0MDIxOTIzNTk1OVowggEWMRcwFQYDVQQKEw5WZXJpU2lnbiwgSW5jLjEfMB0GA1UECxMW
VmVyaVNpZ24gVHJ1c3QgTmV0d29yazFGMEQGA1UECxM9d3d3LnZlcmlzaWduLmNvbS9yZXBvc2l0
b3J5L1JQQSBJbmNvcnAuIGJ5IFJlZi4sTElBQi5MVEQoYyk5ODEeMBwGA1UECxMVUGVyc29uYSBO
b3QgVmFsaWRhdGVkMTQwMgYDVQQLEytEaWdpdGFsIElEIENsYXNzIDEgLSBNaWNyb3NvZnQgRnVs
bCBTZXJ2aWNlMRgwFgYDVQQDFA9TdGVwaGVuIFBlcmtpbnMxIjAgBgkqhkiG9w0BCQEWE3Blcmtp
bnNAbmV0bWFzcy5jb20wgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBANXOSJT+ugAY+f1Yn3pY
CABygyASRW1n0URWdJOmfdL/p2YrD+4SI55vMz5NJizbI8kI1DG03cR4chF0KtDyFI10w/2xB0kq
SVvpsZCN1M9nhYKxICWSpLs4DGenIi0Wk8m1EYUtZw+ZbbXK4A0UOAFX6yGXrtDz9gPP+1wcJQnN
AgMBAAGjggE4MIIBNDAJBgNVHRMEAjAAMIGsBgNVHSAEgaQwgaEwgZ4GC2CGSAGG+EUBBwEBMIGO
MCgGCCsGAQUFBwIBFhxodHRwczovL3d3dy52ZXJpc2lnbi5jb20vQ1BTMGIGCCsGAQUFBwICMFYw
FRYOVmVyaVNpZ24sIEluYy4wAwIBARo9VmVyaVNpZ24ncyBDUFMgaW5jb3JwLiBieSByZWZlcmVu
Y2UgbGlhYi4gbHRkLiAoYyk5NyBWZXJpU2lnbjARBglghkgBhvhCAQEEBAMCB4AwMAYKYIZIAYb4
RQEGBwQiFiA1N2NkNTE4NzJhZGNjNTA1MTZmNzIzOGNkZWZhMGMwMjAzBgNVHR8ELDAqMCigJqAk
hiJodHRwOi8vY3JsLnZlcmlzaWduLmNvbS9jbGFzczEuY3JsMA0GCSqGSIb3DQEBBAUAA4GBAEuG
/PEFxD8ib6qLKLqUs4yFoFO1EeMTUshoBZ8ezrd+gbZZRL/QqILzSC/Htx0KzwfDXnvPvYX/gs2u
N1cRuiOtbnL1IX6JnmHdRWtxaZixoUkh7FupClNAowdbHNFckSnw8KBrTiGBE0N8SQNglBYtgEoV
XaGF3iRNwAFRK0BhMYIEPjCCBDoCAQEwgeEwgcwxFzAVBgNVBAoTDlZlcmlTaWduLCBJbmMuMR8w
HQYDVQQLExZWZXJpU2lnbiBUcnVzdCBOZXR3b3JrMUYwRAYDVQQLEz13d3cudmVyaXNpZ24uY29t
L3JlcG9zaXRvcnkvUlBBIEluY29ycC4gQnkgUmVmLixMSUFCLkxURChjKTk4MUgwRgYDVQQDEz9W
ZXJpU2lnbiBDbGFzcyAxIENBIEluZGl2aWR1YWwgU3Vic2NyaWJlci1QZXJzb25hIE5vdCBWYWxp
ZGF0ZWQCEHSfmF0PHz1SEAgnNwhU4PIwCQYFKw4DAhoFAKCCArIwGAYJKoZIhvcNAQkDMQsGCSqG
SIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMDMwMzEwMjExMzM4WjAjBgkqhkiG9w0BCQQxFgQU8LgJ
pIJGZzUiluMhWZeIONtzsS8wZwYJKoZIhvcNAQkPMVowWDAKBggqhkiG9w0DBzAHBgUrDgMCGjAO
BggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwCgYI
KoZIhvcNAgUwgfIGCSsGAQQBgjcQBDGB5DCB4TCBzDEXMBUGA1UEChMOVmVyaVNpZ24sIEluYy4x
HzAdBgNVBAsTFlZlcmlTaWduIFRydXN0IE5ldHdvcmsxRjBEBgNVBAsTPXd3dy52ZXJpc2lnbi5j
b20vcmVwb3NpdG9yeS9SUEEgSW5jb3JwLiBCeSBSZWYuLExJQUIuTFREKGMpOTgxSDBGBgNVBAMT
P1ZlcmlTaWduIENsYXNzIDEgQ0EgSW5kaXZpZHVhbCBTdWJzY3JpYmVyLVBlcnNvbmEgTm90IFZh
bGlkYXRlZAIQdJ+YXQ8fPVIQCCc3CFTg8jCB9AYLKoZIhvcNAQkQAgsxgeSggeEwgcwxFzAVBgNV
BAoTDlZlcmlTaWduLCBJbmMuMR8wHQYDVQQLExZWZXJpU2lnbiBUcnVzdCBOZXR3b3JrMUYwRAYD
VQQLEz13d3cudmVyaXNpZ24uY29tL3JlcG9zaXRvcnkvUlBBIEluY29ycC4gQnkgUmVmLixMSUFC
LkxURChjKTk4MUgwRgYDVQQDEz9WZXJpU2lnbiBDbGFzcyAxIENBIEluZGl2aWR1YWwgU3Vic2Ny
aWJlci1QZXJzb25hIE5vdCBWYWxpZGF0ZWQCEHSfmF0PHz1SEAgnNwhU4PIwDQYJKoZIhvcNAQEB
BQAEgYBa2tw2weHEptZvY7BnowUsl4+imwJPjnVAlcvlaYUVL93Zt/sMav2m4zTZ3WwC57sSk6gQ
cGltA0mQSIumn3KFD/Vz3b0Os5mR5yWRZCauOsZHwJ+Xdfm2ixd+vw9N6hmvcKWqQZyGW17YV2Gu
D38wUVEGJ/rtyOAjg9cDOXxfKgAAAAAAAA==

------=_NextPart_000_003F_01C2E717.A06EDF80--
