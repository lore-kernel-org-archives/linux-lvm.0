Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j2FGs0Y23093
	for <linux-lvm@redhat.com>; Tue, 15 Mar 2005 11:54:00 -0500
Received: from bdmcc-us.com (client230-180.dsl.intrex.net [209.42.230.180])
	by mx3.redhat.com (8.12.11/8.12.11) with SMTP id j2FGrrdV006365
	for <linux-lvm@redhat.com>; Tue, 15 Mar 2005 11:53:53 -0500
Date: Tue, 15 Mar 2005 11:56:44 -0500
From: Brian McCullough <bdmc@bdmcc-us.com>
Subject: Re: [linux-lvm] Can't mount logical volume - super block error
Message-ID: <20050315165644.GB30407@bdmcc-us.com>
References: <e5146c2a050302230579216b77@mail.gmail.com>
	<4226C549.6060803@theserrs.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="jq0ap7NbKX2Kqbes"
Content-Disposition: inline
In-Reply-To: <4226C549.6060803@theserrs.net>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>


--jq0ap7NbKX2Kqbes
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 03, 2005 at 01:05:29AM -0700, Scott Serr wrote:
> Sasha Z wrote:
>=20
> >I had a functioning lvm using four hard discs, but found it necessary
> >to rebuild my operating system. Since then, while the vg and lv come
> >online are read available, I can't actually mount the filesystem or do
> >anything with it. It says it cannot read the superblock at locations 2
> >and 16.
> >
> I'm not sure what you mean by "the vg and lv come online are read=20
> available..."  Have you tried:
> pvscan
> pvdisplay [-v]
> lvdisplay [-v]
>=20
> All looks good?=20


I have a very similar problem, and discovered this message.

As recommended, I have run all three commands above, and everything
looks normal.  I will give output in a subsequent message.

Leading up to this:

Over the past week, I have been completely rebuilding this system,
replacing the main ( root ) disk drive, and installing a fresh distribution.
To this I want to add the old "data" disk drive, which has one PV, one
VG and four LVs on it.=20

The data drive is a SATA drive, one of two mirrored on a single
controller, which were seen as hde and hdg in the old system.  Now,
aside from issues which appear to prevent the second channel of the
Silicon Image 3112 card from being used with "modern" kernels ( tried
2.4.27, 2.6.8 and 2.6.10 ), the drive seems to be recognized as "sda".

OK, so I changed my /etc/raidtab to have the new drive name, and it
appears to start up correctly.  I am also able to run vgscan, vgchange,
pvscan, pvdisplay and lvdisplay, and all results appear "normal."

However, as the previous writer described, mount refuses to work with
these Logical Volumes, as below:

root@tri1:/mnt# mount /dev/VGProjectData/lvol4 misc
/dev/VGProjectData/lvol4: Invalid argument
mount: /dev/VGProjectData/lvol4: can't read superblock

or:

root@tri1:/mnt# mount -t ext3 /dev/VGProjectData/lvol4 misc
mount: wrong fs type, bad option, bad superblock on \
/dev/VGProjectData/lvol4,
	or too many mounted file systems
	( could this be the IDE device where you in fact use
	ide-scsi so that sr0 or sda or so is needed? )



Any suggestions for my next step?


TIA,
Brian


--jq0ap7NbKX2Kqbes
Content-Type: application/x-pkcs7-signature
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIIIsQYJKoZIhvcNAQcCoIIIojCCCJ4CAQExCzAJBgUrDgMCGgUAMAsGCSqGSIb3DQEHAaCC
BjUwggLuMIICV6ADAgECAgMNNaEwDQYJKoZIhvcNAQEEBQAwYjELMAkGA1UEBhMCWkExJTAj
BgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQ
ZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMB4XDTA0MTAxMjAzMDQ0MFoXDTA1MTAxMjAz
MDQ0MFowYjETMBEGA1UEBBMKTWNDdWxsb3VnaDEOMAwGA1UEKhMFQnJpYW4xGTAXBgNVBAMT
EEJyaWFuIE1jQ3VsbG91Z2gxIDAeBgkqhkiG9w0BCQEWEWJkbWNAYmRtY2MtdXMuY29tMIIB
IjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAwUh7NBHH0qjx/XGykx6hJUO+Vf6DItvO
evGuzrYybuTmra8y0P8ewrXqdeLsWr0IrGNLoXKIltCx/F3WvNTPoPcpKTkBc53eT0xBnnXN
ljlToJX2LyRMqTs2nrkOkVLf2IGbsUe9zymJjqUOQq6HlpPyaS7/3/7wc1L9JdVX5EGb9Op5
RseESqg6c+7wXv+uaJ5ZyqhU31gRu1hQCu6rBnDtwetRrBR6+Fg00UQ64EOomOxam9UNMofI
IrQX16oQdVXwqW+s9edjFf7stYS1l93HEiW3VhalKkP/ObrgnQFv8ggsddYBlaZ19Ogsg31r
3DZ76EHyBhWQP6l9E033rQIDAQABoy4wLDAcBgNVHREEFTATgRFiZG1jQGJkbWNjLXVzLmNv
bTAMBgNVHRMBAf8EAjAAMA0GCSqGSIb3DQEBBAUAA4GBAKmI1cDnZfQYBb2B/hRenhu8327X
+7QxIkPYItv57oztR5+4r/WpAuKerZSsBrbK+YJ3lN22Yms9BqM2gTAovvuIB+y/UcQB10RU
OWDLwtAmGR16D5BR7rp/1y6kyuubWe34cHuaIjhZhMl99cCPL7KRzPes9+LodO9Tz4CEcnCK
MIIDPzCCAqigAwIBAgIBDTANBgkqhkiG9w0BAQUFADCB0TELMAkGA1UEBhMCWkExFTATBgNV
BAgTDFdlc3Rlcm4gQ2FwZTESMBAGA1UEBxMJQ2FwZSBUb3duMRowGAYDVQQKExFUaGF3dGUg
Q29uc3VsdGluZzEoMCYGA1UECxMfQ2VydGlmaWNhdGlvbiBTZXJ2aWNlcyBEaXZpc2lvbjEk
MCIGA1UEAxMbVGhhd3RlIFBlcnNvbmFsIEZyZWVtYWlsIENBMSswKQYJKoZIhvcNAQkBFhxw
ZXJzb25hbC1mcmVlbWFpbEB0aGF3dGUuY29tMB4XDTAzMDcxNzAwMDAwMFoXDTEzMDcxNjIz
NTk1OVowYjELMAkGA1UEBhMCWkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkp
IEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMIGf
MA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDEpjxVc1X7TrnKmVoeaMB1BHCd3+n/ox7svc31
W/Iadr1/DDph8r9RzgHU5VAKMNcCY1osiRVwjt3J8CuFWqo/cVbLrzwLB+fxH5E2JCoTzyvV
84J3PQO+K/67GD4Hv0CAAmTXp6a7n2XRxSpUhQ9IBH+nttE8YQRAHmQZcmC3+wIDAQABo4GU
MIGRMBIGA1UdEwEB/wQIMAYBAf8CAQAwQwYDVR0fBDwwOjA4oDagNIYyaHR0cDovL2NybC50
aGF3dGUuY29tL1RoYXd0ZVBlcnNvbmFsRnJlZW1haWxDQS5jcmwwCwYDVR0PBAQDAgEGMCkG
A1UdEQQiMCCkHjAcMRowGAYDVQQDExFQcml2YXRlTGFiZWwyLTEzODANBgkqhkiG9w0BAQUF
AAOBgQBIjNFQg+oLLswNo2asZw9/r6y+whehQ5aUnX9MIbj4Nh+qLZ82L8D0HFAgk3A8/a3h
YWLD2ToZfoSxmRsAxRoLgnSeJVCUYsfbJ3FXJY3dqZw5jowgT2Vfldr394fWxghOrvbqNOUQ
Gls1TXfjViF4gtwhGTXeJLHTHUb/XV9lTzGCAkQwggJAAgEBMGkwYjELMAkGA1UEBhMCWkEx
JTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0
ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBAgMNNaEwCQYFKw4DAhoFAKCBsTAYBgkq
hkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0wNTAzMTUxNjU2NDRaMCMG
CSqGSIb3DQEJBDEWBBSkCwDseWTm2V0NJlDTWMSh2Xwa3jBSBgkqhkiG9w0BCQ8xRTBDMAoG
CCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIAgDANBggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggq
hkiG9w0DAgIBKDANBgkqhkiG9w0BAQEFAASCAQBP0op0UxiM+OihB3gUHPsRP60D87aTkZqa
QOjqbpPDnz5ccaM0nyvgdt04BC0OnignneYjUCobvCvaeLR6LzPTftPOgvnrzbzdgSUvjetM
VwvWTBs48dXcWnVl8OzCnx6I/0VbB2vWdIGu0nZUECteYtTkXq6MX0pjGt+UMh3oeFtUVGkU
DE6k+iYO2ziRTHVXeobpT3PLOcDbcMJ/OPDu7Xsv2v7ALbNlLfTdQX4PbAurWJv7z989D7xH
varlxn3hXvc/NkUTs9Tt/P8IH/ixGNPqVwQDRvpCwaxs/L5F1PLCLZvoC+sHbnqzGWjhlX/z
59wqNc8XoYzdeljtRAFv

--jq0ap7NbKX2Kqbes--
