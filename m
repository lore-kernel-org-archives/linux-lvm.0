Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iA2FF6r20733
	for <linux-lvm@redhat.com>; Tue, 2 Nov 2004 10:15:06 -0500
Received: from cardinal.mail.pas.earthlink.net
	(cardinal.mail.pas.earthlink.net [207.217.121.226])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iA2FF3HT009703
	for <linux-lvm@redhat.com>; Tue, 2 Nov 2004 10:15:03 -0500
Received: from user-0c8h9va.cable.mindspring.com ([24.136.167.234]
	helo=earthlink.net)
	by cardinal.mail.pas.earthlink.net with esmtp (Exim 3.33 #1)
	id 1CP0NC-0003xq-01
	for linux-lvm@redhat.com; Tue, 02 Nov 2004 07:15:02 -0800
Date: Tue, 2 Nov 2004 10:14:01 -0500
From: Brian McCullough <bdmc@bdmcc-us.com>
Subject: Re: [linux-lvm] Linux RAID Resync and LVM
Message-ID: <20041102151401.GA22829@bdmcc-us.com>
References: <20041102122603.GA12325@bdmcc-us.com>
	<20041102140210.GD10845@percy.comedia.it>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="PNTmBPCT7hxwcZjr"
Content-Disposition: inline
In-Reply-To: <20041102140210.GD10845@percy.comedia.it>
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
To: LVM general discussion and development <linux-lvm@redhat.com>


--PNTmBPCT7hxwcZjr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 02, 2004 at 03:02:11PM +0100, Luca Berra wrote:
> slow it, reduce the numbers in:
> /proc/sys/dev/raid/speed_limit_max
> /proc/sys/dev/raid/speed_limit_min


Luca,

You are a life saver!  I did as you suggested and the machine is usable
again.


( It will take a bit longer to resync but I will turn the numbers back
up when we get past the deadline. )


Brian


--PNTmBPCT7hxwcZjr
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
hkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0wNDExMDIxNTE0MDFaMCMG
CSqGSIb3DQEJBDEWBBR7BH+OaGbQu9L5tGNiwVjBn/bCYjBSBgkqhkiG9w0BCQ8xRTBDMAoG
CCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIAgDANBggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggq
hkiG9w0DAgIBKDANBgkqhkiG9w0BAQEFAASCAQB1vv9mrpMvKLbMiMGkkh2FLiuh8lc9acUj
sz5RPATQ6d0HSFhV/M3AEa1YBk6Suy7G3Vl2KN9lNw1YgFBBg9kt9LsNFpxCZeuIExnOKrym
9BNJiHJGtimhebpPIBskhdbafHiiilRpsiH7AoD1/C9q/1wNzW3L8TRws5gVGGFlwgC++76w
w/CAeoAmLH79r6ze4xQwGIu8aXZxm2AGY2xk+K5GXGzszl4QV0SCU7Gsnqh7bmNQ4rNY81wF
1ZuU1VJakoxNEaY5RfMqTF2vfftXyFXVBmJ9sJqlMKeJytt5DIL0i1OWbGYrR9b180f5mANq
Sx60s6CXp93dUP+ZFdLe

--PNTmBPCT7hxwcZjr--
