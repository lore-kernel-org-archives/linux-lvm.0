Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iA2CU4r09487
	for <linux-lvm@redhat.com>; Tue, 2 Nov 2004 07:30:04 -0500
Received: from pop-a065d23.pas.sa.earthlink.net
	(pop-a065d23.pas.sa.earthlink.net [207.217.121.254])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iA2CU4FM030086
	for <linux-lvm@redhat.com>; Tue, 2 Nov 2004 07:30:04 -0500
Received: from user-0c8h9va.cable.mindspring.com ([24.136.167.234]
	helo=earthlink.net)
	by pop-a065d23.pas.sa.earthlink.net with esmtp (Exim 3.33 #1)
	id 1COxnX-0003PD-00
	for linux-lvm@redhat.com; Tue, 02 Nov 2004 04:30:03 -0800
Date: Tue, 2 Nov 2004 07:26:03 -0500
From: Brian McCullough <bdmc@bdmcc-us.com>
Message-ID: <20041102122603.GA12325@bdmcc-us.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="r5Pyd7+fXNt84Ff3"
Content-Disposition: inline
Subject: [linux-lvm] Linux RAID Resync and LVM
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com


--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


I hope that somebody can offer some suggestions to counteract an issue
that I am having.

I have a server ( a little low on memory, I think ) that is trying to do
a resync on a Raid 1 disk pair that is under my LVM.  Unfortunately,
this is killing performance on the server, and the people that I serve
are working to a hard deadline.

Is there any way ( what is the procedure ) to "pause" the resync ( yes I
know that this is a BAD idea, but it is currently forecast to take
another 12 - 18 hours ) so that I can either restart or resume it in a
day or two when the deadline has passed?


Configuration:

/dev/md4 = /dev/hde1 ( disk 0 ), /dev/hdg1 ( disk 1 )

/dev/mapper/VGProjectData-lvol1 ( 1-4 ) built on /dev/md4.

I can mount and unmount the LVM partitions, but raidstop just comes back
with the "help" message.



Help!


Thank you,
Brian


--r5Pyd7+fXNt84Ff3
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
hkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0wNDExMDIxMjI2MDJaMCMG
CSqGSIb3DQEJBDEWBBSMYT/0VpeYVxESx5Nqc0Hv58djjTBSBgkqhkiG9w0BCQ8xRTBDMAoG
CCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIAgDANBggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggq
hkiG9w0DAgIBKDANBgkqhkiG9w0BAQEFAASCAQC+nWaMO8ubx2AAx4XTBG08QPzpZjUiB2xg
iZhXHqdYXTD/dJbtUgtzzypbRXGy5QZzJu5I3XqdjIN6HiK0i4nAS3GFyWJ0iU/n+WptKqzV
oQIFvh1YdJ1OOk/M8sp8yXqbFBWeJWcGXXNCRGUcC5DZK3VOWrLeQN/kmBAtP7F7gUFrjjfk
aek2TeeEyxlOS2B58h/Ej6OED3ic+/9ntovNIIVipSL63gv/jEdIG7zEuMmg2dPxCnbDlST2
b3dSUv86AqbAmWGX+FsLVTdmFL3iXRV1SJ492kPv++2YE7yhR00Un+3b8g1SoVnVkw84Sjsi
G7roR13Z2q2jMscjBF59

--r5Pyd7+fXNt84Ff3--
