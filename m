From: "Stephen Perkins" <perkins@netmass.com>
MIME-Version: 1.0
Message-ID: <002701c2dd00$ffeebe10$2802a8c0@netmass.com>
Content-Type: multipart/signed;
	micalg=SHA1;
	boundary="----=_NextPart_000_0022_01C2DCCE.B4B88340";
	protocol="application/x-pkcs7-signature"
In-Reply-To: <200302210930.36038.jkeating@pogolinux.com>
Subject: [linux-lvm] High level architecture (Long)
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
Date: Wed Feb 26 08:00:01 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_0022_01C2DCCE.B4B88340
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi all,

This needs to be cross-posted between several mailing lists.... But alas
there seems to be no way to coordinate that.  

Companies that have huge pockets and huge needs, for example Visa, have
exceedingly strong disaster recovery and failover operation in place and
working. Their operations can quickly fail over to multiple
geographically separated locations with small impact on their service.
The precise details of how it is done are beyond me. However, we should
be able to draw a complete picture of what _can_ be done with Linux
using all the pieces that _are_ available (and at least show what is
lacking).

I am hoping to start a discussion on the architecture of an all Linux
distributed, replicated, highly available, virtualized platform.  It
seems that many of the pieces are in place (muliple pieces in many
instances).  However, I'm looking to spark discussion on the best
architecture of such a beast.

Specifically, what I want is to get as close to possible at providing:

1) A highly available, peer replicated (i.e. active-active),
geographically separated (n locations where n=2 and n>2), virtualized,
and Backed-up SAN solution.  That's a tall order.  Companies such as
FalconStor provide some of this, but at an exceptionally high price.

2) SCSI over IP or something similar is desirable so that application
servers can use the exported virtualized storage (either locally on the
same LAN or remotely over a WAN).  Security here is a big ?.

3) A highly available virtualized application server pool that supports
automatic failover to a remote location.  A combination of Clusters,
LVS, user-mode-linux and replicated SANs can provide a potential
solution.

4) An eye towards to the cost of servers, infrastructure, colocation,
and bandwidth.  I.e. few servers at expensive locations and more servers
at less expensive and less well equipped places.  User-mode linux for
server consolidation through virtualization, etc.

5) An eye towards managmenet of the solution?  Are all these pieces
manageable without a large staff?  Are there recommended commercial
Linux solutions for management?

-----  AS AN END RESULT ---------
I would like, as an end result, to publish some type of HOW-TO on
combining all the version of sofware and hardware that are available on
1 specific architecture that will provide for this.  Since we plan on
deploying at 2 and possibly 3 separate sites, the work should easily
scale back to 1 local site (although the reverse is obviously not true).
---------------------------------

This list would be the place to ask regarding #1 and possibly #2.  Here
is what I have envisioned. But I'm not sure it is the best way to handle
things:

1) At this time, I am using RedHat 8.0 and kernel 2.4.19 (full version
... Not RedHat version).

2) I opted to use LVM 1.0.6 versus LVM2 since I'm looking at a
production environment.

3) I have 2 identical Compaq TaskSmart n2400 boxes.  These boxes have
hardware RAID-5 and currently support internal disks that are configured
as a single RAID-5 volume.  During the RH install, I partitioned the
single RAID-5 volume to leave a large chunk available as a LVM
partition.  I created a single VG on this, added the large partition as
the PVs, and can now create LVs as needed.  This seems to work fine.
Under ideal conditions, this provides a scalable and virtualized storage
pool.

4) On each system, I created identical logical volumes.  I installed
DRBD version 0.6.1 on top of LVM to export a logical volume as a network
block device.  I was able to do a network mirror between the two LVs  to
provide for a replicated logical volume.  

5) I have not addressed the security of the replicated information.
(Opted to use DRBD versus NBD or ENBD).  Just recently heard about
HyperSCSI but don't know much about it. There seem to be other packages
as well.    It is blasphemy to mention EVMS on this list?

I never completed work on fail-over scripts to automatically bring up
and export the replicated information.  Part of this is due to my
questions on the best way to "export" the data (see below).

Here are the problems:

1) Each Tasksmart is a SPOF.  It would be better to have some type of
SAN solution where I can plug in multiple LVM manager machines that are
clustered into a 2-node active-active or active-passive mechanism.
These nodes could then "export" the logical volumes to the people who
need them. I have installed heartbeat on a couple of machines and have
it working, so a small 2 node cluster is possible here.  However, then
we have the issue of how to "access" the remote storage (either fibre
channel or dual access scsi).  What are the other alternatives?  ISCSI
initiators that sit between a Cisco storage router?  How would one
virtualize the storage pool if ISCSI were involved?

2) What is the best way to "export" the replication information?  I'm
guessing it is best to do this at the block level (although I believe
products such as double-take/rsync do it at the file system level).  Is
DRBD the best solution for wide area replication?   

3) What is the best way to "export" the blocks or file system for
servers that need to access the logical volume?  NFS at the file systme
level?  iSCSI (if I can figure out how to make the logical volume a
target) at the block level?  I envision that the application servers
will actually be user-mode-linux servers that are consolidated on an
active-active Linux cluster pair.  

4) BTW, I envision that each application server will have its own
logical volume so that we can minimize the potential of concurrent
access to a logical volume.  If the app servers are clustered, then
fencing the resources is a cluster problem and not a SAN problem. What
are the concurrent access problems for access and replication.

3) What is the best way to secure the information?  What about
encryption of the replication tunnel?  Hardware VPN or a software
solution?  How important and stable etc would an encrypted file system
be?

4) What is the best way to back up the SAN solution?  We have qualstar
tape libraries available.... Commercial bakup apps?  Amanda?  Done at
the file system level or block level?  I probably need both the security
of replication (for direct failover) and tape backup (for generational
capability).

Here are the questions:

1) Is the architecture already done somewhere else (complete with fixed
versions of OS and apps that are "known to work")?  I don't want to
re-invent the wheel.

2) What would be the best way to coordinate people's feedback between
multiple mailing lists (LVM, LVS, iSCSI, etc)?

3) What would be the best way to show the architecture and apply peoples
comments and feedback?

With so many Linux projects working, it is very difficult to get a grasp
on all the pieces that would be needed to provide what I want.  However,
it does appear that all or most of the pieces are available.  I have
looked at combining:

A) Heartbeat + Keepalived + LVS  to provide a highly available LVS
director.  This small cluster can be put into a very expensive and very
highly available colocation with lots of redundant bandwidth.  It
"exports" the highly available IP addresses that are used to provide
services.  If this cluster, or the network to which it is attached goes
down, all services go down (there are no automatic solutions to solve
this type of problem with any immediacy that I can find... Things like
RR DNS etc... All suffer problems).  Through LVS TUN mode, LVS
real-servers can exist at geographically remote sites that are not as
cost-prohibitive.

B) Heartbeat to provide a high-availabilty Linux cluster that then runs
mulitple instances of "User mode linux".  This provides highly available
virtualized servers that can act as the "LVS Real-servers"

C) LVM, DRBD to provide replicated virtualized storage.  However,  I
have not figured out the best way to export this storage to the
user-mode-linux virtual servers listed in step B.

I do not have ISCSI (seem to be missing target support), secure
replication, Good clustering failover of user-mode-linux virtual servers
to geographically separate locations (in case of network failure),
backup, scalable storage short of physically adding internal or direct
attached disks to the Compaq Tasksmart machines. 

Thoughts to the rather long posting?

TIA,

- Steve

------=_NextPart_000_0022_01C2DCCE.B4B88340
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
hvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0wMzAyMjUxOTA2MjdaMCMGCSqGSIb3DQEJBDEWBBSagz9E
DVTwZVDyXymNnvyjlxFfQzBnBgkqhkiG9w0BCQ8xWjBYMAoGCCqGSIb3DQMHMAcGBSsOAwIaMA4G
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
AASBgD8qbNnSyEBBhxPk9OndnsJl2OxDANTIxIV1oRV0Jz+i0vNsS6aVfFEAC8Fpp0vFwQWhUnuF
UOx7dooXP9UaxTyB5v9rWTO9uxqOLqs9v1RfR7YRECRkS/KjPA4xwIlV6IMSQkK+2uAnTTm1eWjy
Hcvh019okoeRiF9hVvlLdFL4AAAAAAAA

------=_NextPart_000_0022_01C2DCCE.B4B88340--
