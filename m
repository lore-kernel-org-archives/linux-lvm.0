Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kAT0SAQW022355
	for <linux-lvm@redhat.com>; Tue, 28 Nov 2006 19:28:10 -0500
Received: from smtp.vacsin.com (mx1.vacsin.com [82.94.223.2])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id kAT0S14F007321
	for <linux-lvm@redhat.com>; Tue, 28 Nov 2006 19:28:01 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp.vacsin.com (Postfix) with ESMTP id 1F6F0240036C
	for <linux-lvm@redhat.com>; Wed, 29 Nov 2006 01:27:58 +0100 (CET)
Received: from smtp.vacsin.com ([127.0.0.1])
	by localhost (raid.vacsin.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id jxs8p1t8KZAx for <linux-lvm@redhat.com>;
	Wed, 29 Nov 2006 01:27:52 +0100 (CET)
Message-ID: <456CD406.1080409@haringstad.com>
Date: Wed, 29 Nov 2006 01:27:50 +0100
From: Jacco van Koll <jko@haringstad.com>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms090209030205080002040603"
Subject: [linux-lvm] moving lv from one vg to another vg on different disks
 with kernel 2.6.18
Reply-To: jko@haringstad.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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

This is a cryptographically signed message in MIME format.

--------------ms090209030205080002040603
Content-Type: multipart/mixed; boundary="------------010403000203010800000000"

This is a multi-part message in MIME format.
--------------010403000203010800000000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hello All,

I am using a machine with 2 sets of raid1 disks. One of those sets is=20
completely filled. Now my question, is it possible to move a lv from one =

vg to another, whilst both vg's live on different disk-sets?

Using a debian kernel 2.6.18 for AMD64.

--=20
Regards,
Jacco van Koll

Contrary to popular belief, Unix /is/ user friendly..........
/It just happens to be very selective about who it decides to make=20
friends with./
So..... Wake up and smell the coffee!

*Contact Information:*

*E-Mail:* 	jko@haringstad.com =09
=09
*Telephone* 	GSM: +31-(0)6-19354545 	TEL: +31-(0)228-321508 	FAX:=20
+31-(0)228-321457
*Website:* 	http://www.haringstad.com =09
=09
*pgpkey:* 	http://pgpkeys.haringstad.com 	*key-id:* 1024/FE4AE92F =09


This system is running *Ubuntu* <http://www.ubuntu.com> 'Dapper' (test=20
version) on an AMD Athlon(tm) XP 2000+ processor
All mail send and received by haringstad is scanned for virusses using=20
*V@CSIN <http://www.vacsin.com>*
My IP Address: 01010011.10100000.00100110.00100111
/Want to know more? Visit HARINGSTAD <http://www.haringstad.com>/
Get Firefox! <http://www.spreadfirefox.com/?q=3Daffiliates&id=3D0&t=3D70>=


=A9 2006 J. van Koll


--------------010403000203010800000000
Content-Type: text/x-vcard; charset=utf-8;
 name="jko.vcf"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="jko.vcf"

begin:vcard
fn:Jacco van Koll
n:van Koll;Jacco
email;internet:jko@haringstad.com
tel;home:+31-228-321508
tel;cell:+31-6-193545
x-mozilla-html:TRUE
version:2.1
end:vcard


--------------010403000203010800000000--

--------------ms090209030205080002040603
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIJ6DCC
BPAwggLYoAMCAQICAwHTAzANBgkqhkiG9w0BAQUFADB5MRAwDgYDVQQKEwdSb290IENBMR4w
HAYDVQQLExVodHRwOi8vd3d3LmNhY2VydC5vcmcxIjAgBgNVBAMTGUNBIENlcnQgU2lnbmlu
ZyBBdXRob3JpdHkxITAfBgkqhkiG9w0BCQEWEnN1cHBvcnRAY2FjZXJ0Lm9yZzAeFw0wNjAx
MTcwMDA5MDRaFw0wNzAxMTcwMDA5MDRaMD0xGDAWBgNVBAMTD0NBY2VydCBXb1QgVXNlcjEh
MB8GCSqGSIb3DQEJARYSamtvQGhhcmluZ3N0YWQuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOC
AQ8AMIIBCgKCAQEAn81ZYCdyRBUrmimR4Tx8ASCDmjNOuoLzcGGD2JEq0C8KlA2U2pfGnF70
vpCK4tntnpgj2+RTWyX/wcqBcksapkSWOC/Qwo8K1IvE/EuHYCdpi9MXNxs8XgHHl2GU80sf
wzkwV/HWhm2/XSmHq5covannRi9XIXC1HWwx/0k6AEU+oPaa1ywVVmCEvqhcuz4b75STYeEZ
2pBekuLYoxJBPT/enC9B6cZWRGLFA0LVWFxTyB1XvHuHuR6fb3jp+ozEPCHGbhm9cJ9aPntu
CmtQWUzLyznaiEDMbCHEYz4BVlu7U9iBr3QSwF2uo/PVyaQUaYYUC3NBk8k81fC02kZZbQID
AQABo4G8MIG5MAwGA1UdEwEB/wQCMAAwVgYJYIZIAYb4QgENBEkWR1RvIGdldCB5b3VyIG93
biBjZXJ0aWZpY2F0ZSBmb3IgRlJFRSBoZWFkIG92ZXIgdG8gaHR0cDovL3d3dy5DQWNlcnQu
b3JnMDIGCCsGAQUFBwEBBCYwJDAiBggrBgEFBQcwAYYWaHR0cDovL29jc3AuY2FjZXJ0Lm9y
ZzAdBgNVHREEFjAUgRJqa29AaGFyaW5nc3RhZC5jb20wDQYJKoZIhvcNAQEFBQADggIBAL6d
WsEJZoTkCaXpJ0or/r3qqo2somOJDdVrn4smHOn56L8aze2sEN+S+dLEO7bIABUU4sA76KDP
AftcucPh+XyAdOoWYw3smHjAf1MpbY+89NvZizwJVTaleeQlBskjWYU28iSn874UPzYuCvP4
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
DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTA2MTEyOTAwMjc1MFowIwYJKoZI
hvcNAQkEMRYEFOsEpESFL0BZZzjOJnlOxzfkl/0ZMFIGCSqGSIb3DQEJDzFFMEMwCgYIKoZI
hvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0GCCqGSIb3
DQMCAgEoMIGRBgkrBgEEAYI3EAQxgYMwgYAweTEQMA4GA1UEChMHUm9vdCBDQTEeMBwGA1UE
CxMVaHR0cDovL3d3dy5jYWNlcnQub3JnMSIwIAYDVQQDExlDQSBDZXJ0IFNpZ25pbmcgQXV0
aG9yaXR5MSEwHwYJKoZIhvcNAQkBFhJzdXBwb3J0QGNhY2VydC5vcmcCAwHTAzCBkwYLKoZI
hvcNAQkQAgsxgYOggYAweTEQMA4GA1UEChMHUm9vdCBDQTEeMBwGA1UECxMVaHR0cDovL3d3
dy5jYWNlcnQub3JnMSIwIAYDVQQDExlDQSBDZXJ0IFNpZ25pbmcgQXV0aG9yaXR5MSEwHwYJ
KoZIhvcNAQkBFhJzdXBwb3J0QGNhY2VydC5vcmcCAwHTAzANBgkqhkiG9w0BAQEFAASCAQAi
npwpOMRhTVAj4z3Z0icDFlY49h0MIn4N5G3XaRoE903h1C3YncSqv+FNHr/uSvLYnhgf5KiN
/9y+3vOi/lWuw1q/5tE9Q8+ITRcILG0byDiieQSIXt4gGvRqjHZ4o4kceZnnFieeAwCAqfvf
0KKNX646nWAtR8kLbrHobzMpphfAa6W9WkyrRCxcB/kr8rKQcK+cJ7Np4DM2Y2b+Uv7rOrRe
mROqhpP08Zu8Z7i06KBeAL6wgJWejm6l5PmbUEcU5Vp4RFeZ1/ShB1A4BlAi9/RF8YxgYwGs
rnBapG8UtOZ4BKyPfqS3ZELphpMMaCF5TJCUvMwaEp4qnyG3MiJxAAAAAAAA
--------------ms090209030205080002040603--
