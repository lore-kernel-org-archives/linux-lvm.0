From: "Stephen Perkins" <perkins@netmass.com>
Subject: RE: [linux-lvm] Core questions from a LVM neophyte...
MIME-Version: 1.0
Message-ID: <002001c2e891$9325b8a0$2802a8c0@netmass.com>
Content-Type: multipart/signed;
	micalg=SHA1;
	protocol="application/x-pkcs7-signature";
	boundary="----=_NextPart_000_001B_01C2E85F.47D3DF80"
In-Reply-To: <08628CA53C6CBA4ABAFB9E808A5214CB0142B355@mercury.infiniconsys.com>
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
Date: Wed Mar 12 15:02:07 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_001B_01C2E85F.47D3DF80
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit


I'm interested in a block level export.  The exported space will be used
as the disk part of an Hierarchical Storage Manager that is backed up by
qualstar tape libraries.  We have several such systems and I would like
to try to consolidate the disk portions of each into a "SAN" like
environment.  At the same time, we are also looking at more customer
disk based storage.  I have several storage servers (hopefully running
Linux soon but running W2K now) that need access to large areas of
storage.  I would like to carve and export virtualized chunks for this
as well.  

The main reason for the block level export is that the software we use
does not support "NAS" type network disks.  They only support "locally
attached" drives.  iSCSI would at least appear as a local SCSI disk.

For management purposes, I would like to have a single way to export
everything.  This may or may not be feasible at present.

- Steve

> Stephen,
> 	What do you want it for - backups? Why not samba over GigE?
> 
> --
> Christopher Barry
> Manager of Information Systems
> InfiniCon Systems
> http://www.infiniconsys.com
> 
> -----Original Message-----
> From: Stephen Perkins [mailto:perkins@netmass.com]
> Sent: Monday, March 10, 2003 4:14 PM
> To: linux-lvm@sistina.com
> Subject: RE: [linux-lvm] Core questions from a LVM neophyte...
> 
> 
> Hi all,
>  
> > 	I have built a very cool NAS box, and want to use LVM2 
> > on it. My machine is as follows:
> > 
> > Tyan Thunder i7500 w/ 2-2.4GHz XEON processors.
> > 2GB RAM
> > 3ware Escalade 7500-12 IDE RAID controller
> > 12-160GB Maxtor IDE HDs
> > System on a separate 20GB Maxtor HD
> > Floppy, slimline CDROM, and a DVDRW drive.
> > All in a 12-bay chassis from 
> > http://www.rackmountpro.com/productpage.cfm?> prodid=1460
> > 
> > This 
> > config gives me 1.8TB of RAID 5 for under 
> > $8K - not too shabby.
> 
> This is a superb value and I'm very interested in your 
> proposed "how-to"
> site.
> 
> I am wanting to deploy some larger virtualized storage in a mixed
> Linux/W2K environment.    Is anybody out there exporting virtualized
> volumes to Win2K boxes?  If so, how?  I checked HyperSCSI and they do
> not appear to have a Win2K client (although a beta is supposed to be
> coming soon).  I have not yet found target information for Linux along
> with a known interoperable Win2K initiator.  Anybody doing it?
> 
> Disk performance is not so much an issue for me since the disk arrays
> will be replacing large tape libraries.  Even with pathetic 
> performance,
> they should behave much faster than large AIT libraries.  
> 
> Question 1:  Is it possible today to:
> 
> Have a large IDE RAID5 array that is virtualized through LVM and then
> exported to a Dynamic Disk on Win2K over a LAN (not necessarily WAN)?
> 
> I believe iSCSI and HyperSCSI would both work... However I have not
> found the approporiate interoperable software drivers.
> 
> Question 2: The system that is described above is a linux system with
> direct attached storage.  It is a SPOF.  Any inexpensive 
> solutions that
> would allow the Linux portion to be clustered for active/pasive
> failover?  Is FC the only alternative here?
> 
> TIA,
> 
> - Steve
> 
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 

------=_NextPart_000_001B_01C2E85F.47D3DF80
Content-Type: application/x-pkcs7-signature;
	name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="smime.p7s"

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIKTjCCAjww
ggGlAhAyUDPPUNFW81yBrWVcT8glMA0GCSqGSIb3DQEBAgUAMF8xCzAJBgNVBAYTAlVTMRcwFQYD
VQQKEw5WZXJpU2lnbiwgSW5jLjE3MDUGA1UECxMuQ2xhc3MgMSBQdWJsaWMgUHJpbWFyeSBDZXJ0
aWZpY2F0aW9uIEF1dGhvcml0eTAeFw05NjAxMjkwMDAwMDBaFw0yMDAxMDcyMzU5NTlaMF8xCzAJ
BgNVBAYTAlVTMRcwFQYDVQQKEw5WZXJpU2lnbiwgSW5jLjE3MDUGA1UECxMuQ2xhc3MgMSBQdWJs
aWMgUHJpbWFyeSBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0eTCBnzANBgkqhkiG9w0BAQEFAAOBjQAw
gYkCgYEA5Rm/baNWYS2ZSHH2Z965jeu3noaACpEO+jglr0aIguVzqKCbJF0NH8xlbgyw0FaEGIea
BpsQoXPftFg5a27B9hXVqKg/qhIGjTGsf7A01480Z4gJzRQR4k5FVmkfeAKA2txHkSm7NsljXMXg
1y2He6G3MrB7MLoqLzGq7qNn2tsCAwEAATANBgkqhkiG9w0BAQIFAAOBgQBLRGZgaGTkmBvzsHLm
lYl83XuzlcAdLtjYGdAtND3GUJoQhoyqPzuoBPw3UpXD2cnbzfKGBsSxG/CCiDBCjhdQHGR6uD6Z
SXSX/KwCQ/uWDFYEJQx8fIedJKfY8DIptaTfXaJMxRYyqEL2Raa2Nrngv2U2k8LS12vc3lnWojX4
RTCCA2IwggLLoAMCAQICEAvaCxfBP4mOqwl0erTOLjMwDQYJKoZIhvcNAQECBQAwXzELMAkGA1UE
BhMCVVMxFzAVBgNVBAoTDlZlcmlTaWduLCBJbmMuMTcwNQYDVQQLEy5DbGFzcyAxIFB1YmxpYyBQ
cmltYXJ5IENlcnRpZmljYXRpb24gQXV0aG9yaXR5MB4XDTk4MDUxMjAwMDAwMFoXDTA4MDUxMjIz
NTk1OVowgcwxFzAVBgNVBAoTDlZlcmlTaWduLCBJbmMuMR8wHQYDVQQLExZWZXJpU2lnbiBUcnVz
dCBOZXR3b3JrMUYwRAYDVQQLEz13d3cudmVyaXNpZ24uY29tL3JlcG9zaXRvcnkvUlBBIEluY29y
cC4gQnkgUmVmLixMSUFCLkxURChjKTk4MUgwRgYDVQQDEz9WZXJpU2lnbiBDbGFzcyAxIENBIElu
ZGl2aWR1YWwgU3Vic2NyaWJlci1QZXJzb25hIE5vdCBWYWxpZGF0ZWQwgZ8wDQYJKoZIhvcNAQEB
BQADgY0AMIGJAoGBALtaRIoEFrtV/QN6ii2UTxV4NrgNSrJvnFS/vOh3Kp258Gi7ldkxQXB6gUu5
SBNWLccI4YRCq8CikqtEXKpC8IIOAukv+8I7u77JJwpdtrA2QjO1blSIT4dKvxna+RXoD4e2HOPM
xpqOf2okkuP84GW6p7F+78nbN2rISsgJBuSZAgMBAAGjgbAwga0wDwYDVR0TBAgwBgEB/wIBADBH
BgNVHSAEQDA+MDwGC2CGSAGG+EUBBwEBMC0wKwYIKwYBBQUHAgEWH3d3dy52ZXJpc2lnbi5jb20v
cmVwb3NpdG9yeS9SUEEwMQYDVR0fBCowKDAmoCSgIoYgaHR0cDovL2NybC52ZXJpc2lnbi5jb20v
cGNhMS5jcmwwCwYDVR0PBAQDAgEGMBEGCWCGSAGG+EIBAQQEAwIBBjANBgkqhkiG9w0BAQIFAAOB
gQACfZ5vRUs4oLje6VNkIbzkTCuPHv6SQKzYCjlqoTIhLAebq1n+0mIafVU4sDdz3PQHZmNiveFT
cFKH56jYUulbLarh3s+sMVTUixnI2COo7wQrMn0sGBzIfImoLnfyRNFlCk10te7TG5JzdC6JOzUT
cudAMZrTssSr51a+i+P7FTCCBKQwggQNoAMCAQICEHSfmF0PHz1SEAgnNwhU4PIwDQYJKoZIhvcN
AQEEBQAwgcwxFzAVBgNVBAoTDlZlcmlTaWduLCBJbmMuMR8wHQYDVQQLExZWZXJpU2lnbiBUcnVz
dCBOZXR3b3JrMUYwRAYDVQQLEz13d3cudmVyaXNpZ24uY29tL3JlcG9zaXRvcnkvUlBBIEluY29y
cC4gQnkgUmVmLixMSUFCLkxURChjKTk4MUgwRgYDVQQDEz9WZXJpU2lnbiBDbGFzcyAxIENBIElu
ZGl2aWR1YWwgU3Vic2NyaWJlci1QZXJzb25hIE5vdCBWYWxpZGF0ZWQwHhcNMDMwMjE5MDAwMDAw
WhcNMDQwMjE5MjM1OTU5WjCCARYxFzAVBgNVBAoTDlZlcmlTaWduLCBJbmMuMR8wHQYDVQQLExZW
ZXJpU2lnbiBUcnVzdCBOZXR3b3JrMUYwRAYDVQQLEz13d3cudmVyaXNpZ24uY29tL3JlcG9zaXRv
cnkvUlBBIEluY29ycC4gYnkgUmVmLixMSUFCLkxURChjKTk4MR4wHAYDVQQLExVQZXJzb25hIE5v
dCBWYWxpZGF0ZWQxNDAyBgNVBAsTK0RpZ2l0YWwgSUQgQ2xhc3MgMSAtIE1pY3Jvc29mdCBGdWxs
IFNlcnZpY2UxGDAWBgNVBAMUD1N0ZXBoZW4gUGVya2luczEiMCAGCSqGSIb3DQEJARYTcGVya2lu
c0BuZXRtYXNzLmNvbTCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEA1c5IlP66ABj5/VifelgI
AHKDIBJFbWfRRFZ0k6Z90v+nZisP7hIjnm8zPk0mLNsjyQjUMbTdxHhyEXQq0PIUjXTD/bEHSSpJ
W+mxkI3Uz2eFgrEgJZKkuzgMZ6ciLRaTybURhS1nD5lttcrgDRQ4AVfrIZeu0PP2A8/7XBwlCc0C
AwEAAaOCATgwggE0MAkGA1UdEwQCMAAwgawGA1UdIASBpDCBoTCBngYLYIZIAYb4RQEHAQEwgY4w
KAYIKwYBBQUHAgEWHGh0dHBzOi8vd3d3LnZlcmlzaWduLmNvbS9DUFMwYgYIKwYBBQUHAgIwVjAV
Fg5WZXJpU2lnbiwgSW5jLjADAgEBGj1WZXJpU2lnbidzIENQUyBpbmNvcnAuIGJ5IHJlZmVyZW5j
ZSBsaWFiLiBsdGQuIChjKTk3IFZlcmlTaWduMBEGCWCGSAGG+EIBAQQEAwIHgDAwBgpghkgBhvhF
AQYHBCIWIDU3Y2Q1MTg3MmFkY2M1MDUxNmY3MjM4Y2RlZmEwYzAyMDMGA1UdHwQsMCowKKAmoCSG
Imh0dHA6Ly9jcmwudmVyaXNpZ24uY29tL2NsYXNzMS5jcmwwDQYJKoZIhvcNAQEEBQADgYEAS4b8
8QXEPyJvqosoupSzjIWgU7UR4xNSyGgFnx7Ot36BtllEv9CogvNIL8e3HQrPB8Nee8+9hf+Cza43
VxG6I61ucvUhfomeYd1Fa3FpmLGhSSHsW6kKU0CjB1sc0VyRKfDwoGtOIYETQ3xJA2CUFi2AShVd
oYXeJE3AAVErQGExggQ+MIIEOgIBATCB4TCBzDEXMBUGA1UEChMOVmVyaVNpZ24sIEluYy4xHzAd
BgNVBAsTFlZlcmlTaWduIFRydXN0IE5ldHdvcmsxRjBEBgNVBAsTPXd3dy52ZXJpc2lnbi5jb20v
cmVwb3NpdG9yeS9SUEEgSW5jb3JwLiBCeSBSZWYuLExJQUIuTFREKGMpOTgxSDBGBgNVBAMTP1Zl
cmlTaWduIENsYXNzIDEgQ0EgSW5kaXZpZHVhbCBTdWJzY3JpYmVyLVBlcnNvbmEgTm90IFZhbGlk
YXRlZAIQdJ+YXQ8fPVIQCCc3CFTg8jAJBgUrDgMCGgUAoIICsjAYBgkqhkiG9w0BCQMxCwYJKoZI
hvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0wMzAzMTIxMjE5MDRaMCMGCSqGSIb3DQEJBDEWBBTDa8+2
Hwdtd+UZ9S530D977uhZtDBnBgkqhkiG9w0BCQ8xWjBYMAoGCCqGSIb3DQMHMAcGBSsOAwIaMA4G
CCqGSIb3DQMCAgIAgDANBggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDAKBggq
hkiG9w0CBTCB8gYJKwYBBAGCNxAEMYHkMIHhMIHMMRcwFQYDVQQKEw5WZXJpU2lnbiwgSW5jLjEf
MB0GA1UECxMWVmVyaVNpZ24gVHJ1c3QgTmV0d29yazFGMEQGA1UECxM9d3d3LnZlcmlzaWduLmNv
bS9yZXBvc2l0b3J5L1JQQSBJbmNvcnAuIEJ5IFJlZi4sTElBQi5MVEQoYyk5ODFIMEYGA1UEAxM/
VmVyaVNpZ24gQ2xhc3MgMSBDQSBJbmRpdmlkdWFsIFN1YnNjcmliZXItUGVyc29uYSBOb3QgVmFs
aWRhdGVkAhB0n5hdDx89UhAIJzcIVODyMIH0BgsqhkiG9w0BCRACCzGB5KCB4TCBzDEXMBUGA1UE
ChMOVmVyaVNpZ24sIEluYy4xHzAdBgNVBAsTFlZlcmlTaWduIFRydXN0IE5ldHdvcmsxRjBEBgNV
BAsTPXd3dy52ZXJpc2lnbi5jb20vcmVwb3NpdG9yeS9SUEEgSW5jb3JwLiBCeSBSZWYuLExJQUIu
TFREKGMpOTgxSDBGBgNVBAMTP1ZlcmlTaWduIENsYXNzIDEgQ0EgSW5kaXZpZHVhbCBTdWJzY3Jp
YmVyLVBlcnNvbmEgTm90IFZhbGlkYXRlZAIQdJ+YXQ8fPVIQCCc3CFTg8jANBgkqhkiG9w0BAQEF
AASBgMhZ0ZpZf0GosPip2H+k274nTV3pFe+p/+jLeEhB7moWQCy46cccCpVIK5F7/KgqTs/pXmlp
hRCPrVvYpfvv76jL/hrYIVVFUzWMa9YxYBk3RvGIP33ogBjBr+HogGNH3pKse01W0KEpeC7U66kU
+7q83kkfloW50UAWnTQeaz8SAAAAAAAA

------=_NextPart_000_001B_01C2E85F.47D3DF80--
