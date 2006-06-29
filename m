Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5TEansK005617
	for <linux-lvm@redhat.com>; Thu, 29 Jun 2006 10:36:49 -0400
Received: from bdmcc-us.com (bdmcc-us.com [209.42.230.180])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with SMTP id
	k5TEaVKL027591
	for <linux-lvm@redhat.com>; Thu, 29 Jun 2006 10:36:39 -0400
Received: from QMQPqq client ([127.10.10.10])
	by localhost (oifis2 [127.10.10.10]) (amavisd-new,
	port 10628) with QMQPqq id 10754-13 for <linux-lvm@redhat.com>;
	Thu, 29 Jun 2006 10:36:19 -0400 (EDT)
Date: Thu, 29 Jun 2006 10:36:19 -0400
From: Brian McCullough <bdmc@bdmcc-us.com>
Subject: Re: [linux-lvm] lvm and fstab
Message-ID: <20060629143619.GA29133@bdmcc-us.com>
References: <44A3DF57.4080003@gmail.com> <20060629142338.GB20554@vwclub.ro>
	<44A3E3FB.901@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="G4iJoqBmSsgzjUCe"
Content-Disposition: inline
In-Reply-To: <44A3E3FB.901@gmail.com>
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


--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 29, 2006 at 04:30:19PM +0200, ThomasC. wrote:
> Cristian Livadaru wrote:
> >On Thu, Jun 29, 2006 at 04:10:31PM +0200, ThomasC. wrote:
> >>Hi,
> >>
> >>I am using RHEL3.
> >>One LV for /opt and another one for /stage.
> >>
> >enter the mount points manualy in fstab or mount the partitions manualy
> >...
> >you could do a mount /dev/Volume00/LogVol00 /opt and then you should
> >have what you want.
> >
> >Best Regards, Cristian Livadaru
> Thats what i thought but the weird thing is that i can already access=20
> /opt so i am not very enthusiastic trying to mount it again....

I agree with your reluctance.

What I would do, being the paranoid person that I am, is create a second
mount point, called /opt-1 or something else that you like, and mount
your LV there, as "mount /dev/Volume00/LogVol00 /opt-1" and compare the
two.  I suspect that you will find that your /opt-1 will be empty, in
which case you can then move all of the files in /opt to /opt-1, unmount
/opt-1, remount it as /opt, fix your /etc/fstab and everything will be
as you expect.

I was about to go on and suggest that you could then add /stage to your
/etc/fstab, but we don't know whether it was actually created.  What
does "lvscan" show?


Brian


--G4iJoqBmSsgzjUCe
Content-Type: application/x-pkcs7-signature
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIIIsQYJKoZIhvcNAQcCoIIIojCCCJ4CAQExCzAJBgUrDgMCGgUAMAsGCSqGSIb3DQEHAaCC
BjUwggLuMIICV6ADAgECAgMP2MowDQYJKoZIhvcNAQEEBQAwYjELMAkGA1UEBhMCWkExJTAj
BgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQ
ZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMB4XDTA1MTExMzA1MTkzNFoXDTA2MTExMzA1
MTkzNFowYjETMBEGA1UEBBMKTWNDdWxsb3VnaDEOMAwGA1UEKhMFQnJpYW4xGTAXBgNVBAMT
EEJyaWFuIE1jQ3VsbG91Z2gxIDAeBgkqhkiG9w0BCQEWEWJkbWNAYmRtY2MtdXMuY29tMIIB
IjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAx+pvYvZwkuLBn9ygRg4vMGSqPmfOVXqc
8Pvaj1DnQZMpsBxN668mXS7fU22Jzo5Qlt/mfIiU1d4tC1G3K1Q7YiL0Jd6rCH2SQfz3Mj7k
zY4o02rneQ/s2BqFW5ad34h8ius3blK+CEbFTYCmSpPxrG0UAcMgIJBBB0VE1I55MDIx4dSw
1awX+4c+ddXtqhomcXVnJNDWOfy4SVZiHJFZCNOhAJRXjmx42LHGqV3zNRRBYv5wELX44sDC
zNrgQ+yvfaq8s8S0rOjHmTriwi/nQo/ualDEkJhN7bLIXfz6N6ly/OTkfFnkEXAEJgmowke0
Za3xMTqqrLyKhy/gvQO14QIDAQABoy4wLDAcBgNVHREEFTATgRFiZG1jQGJkbWNjLXVzLmNv
bTAMBgNVHRMBAf8EAjAAMA0GCSqGSIb3DQEBBAUAA4GBAHS2FayxZvyiyQ6GrZv2Lsr151pc
VPboCfqFBfrxbb3djC7wfmeCiLaYRCCj0c7FVQISuiYfGUhV4Xg2l6CMKy6NKknlQ72M+qvJ
hh6MhfBzhfdliXnHf0qXsUXyHUug/vji4txKsb6l1Lhp3XhFWBTcwrySWv2RwrUcn/28NLet
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
ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBAgMP2MowCQYFKw4DAhoFAKCBsTAYBgkq
hkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0wNjA2MjkxNDM2MTlaMCMG
CSqGSIb3DQEJBDEWBBSc3/KNIjyczy7M86RbWcGUKXjZtTBSBgkqhkiG9w0BCQ8xRTBDMAoG
CCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIAgDANBggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggq
hkiG9w0DAgIBKDANBgkqhkiG9w0BAQEFAASCAQADdgzYeQ583vgS6hO3DXKevA837gWia0tO
ZMABTYHzM3ml5iJGR7ArbhpMLFptDLAKdu/ue0oAINNTtQzq8VfA90TI7xPYd6QcbsJa+lco
g5RgP0/l7OGsDePJVR7MwjikSOZ1uWxtdkz078gvaHUuSivJ6UcQi+ZNiqavrwnJpPGpMtPN
FRhmjXqHocvTjQiUjoL8PTjKz5gJy7On4RhevUFdoPa1ztW0bMYREj/Rssxh2pWdHAV3ysc3
+bE8iuV5aLAJGtM0C8HxE0FpFRdxqCilfhnPry1ZJsSvJd5FpT1b0o+C9eM5bcldkj/JXHmG
hTqdBYEcE2UE1Ty5zRqC

--G4iJoqBmSsgzjUCe--
