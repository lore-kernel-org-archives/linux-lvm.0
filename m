From: "Stephen Perkins" <perkins@netmass.com>
Subject: RE: re[2]: [linux-lvm] Core questions from a LVM neophyte...
MIME-Version: 1.0
Message-ID: <002d01c2e892$a44a7ed0$2802a8c0@netmass.com>
Content-Type: multipart/signed;
	micalg=SHA1;
	protocol="application/x-pkcs7-signature";
	boundary="----=_NextPart_000_0028_01C2E860.59717F30"
In-Reply-To: <20030311165457.CLW7741.imf25bis.bellsouth.net@tiger2>
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
Date: Wed Mar 12 15:02:10 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_0028_01C2E860.59717F30
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

>>  Question 1:  Is it possible today to:
>>  Have a large IDE RAID5 array that is virtualized through 
>>  LVM and then exported to a Dynamic Disk on Win2K over a
>>  LAN (not necessarily WAN)?
>> 
>>  I believe iSCSI and HyperSCSI would both work... However 
>>  I have not found the approporiate interoperable software
>> drivers.
> 
> I tried them also.  No luck yet.  Let us know if you get it working.

What was your setup and how did it fail?  No connection?  Such bad
performance that it didn't work?

>>  Question 2: The system that is described above is a 
>> linux system with direct attached storage.  It is a SPOF.
>> Any inexpensive solutions that would allow the Linux
>> portion to be clustered for active/pasive failover?  Is
>> FC the only alternative here?
> 
> Several choices.  Ask on Linux-HA (heartbeat).  (Or search 
> their archives.)

I went that route awhile ago and did manage to get some HA clusters
going.  However, the problem is that most solutions require some type of
hardware based shared SCSI device or some type of FC fabric to actually
provide the connectivity.  With the newer (read cheaper) ATA RAID
systems, I am not sure how to "share" the physical storage between
multiple systems in a cluster.  This is not necessarily a clustering
issue.

> This still does not get you a "local" Win2k drive.  Exchange 
> and ms-SQL only install onto local drives.

Yep... As well as other software we use. :(

I'd appreciate hearing about your test setup for the iSCSI/HyperSCSI.

Thanks in advance,

- Steve
 

------=_NextPart_000_0028_01C2E860.59717F30
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
hvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0wMzAzMTIxMjI2NDNaMCMGCSqGSIb3DQEJBDEWBBTITrWI
V/z4GcEVGKiBUcllV1GX2TBnBgkqhkiG9w0BCQ8xWjBYMAoGCCqGSIb3DQMHMAcGBSsOAwIaMA4G
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
AASBgNBOr3OCMhKswrIt+4aSkXJswyZt5SkqZG5lRRQRLG6JfKUv+Hw2oa8JaNOKUn52G+4dggwF
3Bavf6ORaDR0Y4/ZLFhLUGdGZzCmDJcQHOzFcXZ9VIVy0acx4Bv6tCGIzhazrCiOYkP2HJ3TDCRY
Y+TouoL9pVkzWaA4pZIZ2IWyAAAAAAAA

------=_NextPart_000_0028_01C2E860.59717F30--
