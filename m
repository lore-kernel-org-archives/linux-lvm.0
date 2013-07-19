Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r6JN1Lii018710
	for <linux-lvm@redhat.com>; Fri, 19 Jul 2013 19:01:21 -0400
Received: from mailgw01.dd24.net (mailgw01.dd24.net [193.46.215.41])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r6JN1JK8009503
	for <linux-lvm@redhat.com>; Fri, 19 Jul 2013 19:01:19 -0400
Received: from localhost (amavis01.dd24.net [192.168.1.111])
	by mailgw01.dd24.net (Postfix) with ESMTP id 5A7F67CC15C
	for <linux-lvm@redhat.com>; Fri, 19 Jul 2013 23:01:18 +0000 (GMT)
Received: from mailgw01.dd24.net ([192.168.1.191])
	by localhost (amavis01.dd24.net [192.168.1.105]) (amavisd-new,
	port 10191) with ESMTP id AyHkj5lktGca for <linux-lvm@redhat.com>;
	Fri, 19 Jul 2013 23:01:13 +0000 (GMT)
Received: from [192.168.0.101] (ppp-188-174-39-199.dynamic.mnet-online.de
	[188.174.39.199])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by mailgw01.dd24.net (Postfix) with ESMTPSA id 46A7F7CC11C
	for <linux-lvm@redhat.com>; Fri, 19 Jul 2013 23:01:13 +0000 (GMT)
From: Christoph Anton Mitterer <calestyo@scientia.net>
In-Reply-To: <51E99905.9000508@redhat.com>
References: <1374172980.23440.10.camel@heisenberg.scientia.net>
	<51E916A8.1000101@redhat.com>
	<1374258168.5231.48.camel@fermat.scientia.net>
	<51E99905.9000508@redhat.com>
Content-Type: multipart/signed; micalg="sha1";
	protocol="application/x-pkcs7-signature";
	boundary="=-IVsvBjvo4Rr0E+iAqq8Q"
Date: Sat, 20 Jul 2013 01:01:12 +0200
Message-ID: <1374274872.5229.21.camel@fermat.scientia.net>
Mime-Version: 1.0
Subject: Re: [linux-lvm] some questions
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
To: linux-lvm@redhat.com


--=-IVsvBjvo4Rr0E+iAqq8Q
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi.


On Fri, 2013-07-19 at 21:52 +0200, Zdenek Kabelac wrote:
> > E.g. in cryptsetup you have a general option which controls whether TRI=
M
> > is passed through dm-crypt to lower block layers... I though --discards
> > of being like that...
>=20
> By default every normal (i.e. linear) LV should pass-through discards - t=
here=20
> is AFAICS no code to block them and you can't disable them.
>=20
> For thin volume - it's going through the pool first - and you have the ch=
oice
> either to ignore them completely, process them at pool level or pass-thro=
ugh=20
> the pool to pool data device.
Can you add that to the description of --discard in the manpage?

I think right now one might easily think that it's a general control, on
whether LVM passes these through or not.


Thanks,
Chris.

--=-IVsvBjvo4Rr0E+iAqq8Q
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIQ/jCCBXUw
ggNdoAMCAQICAwEBgjANBgkqhkiG9w0BAQUFADBUMRQwEgYDVQQKEwtDQWNlcnQgSW5jLjEeMBwG
A1UECxMVaHR0cDovL3d3dy5DQWNlcnQub3JnMRwwGgYDVQQDExNDQWNlcnQgQ2xhc3MgMyBSb290
MB4XDTEyMDcyMzE0NTY0NVoXDTE0MDcyMzE0NTY0NVowfDEhMB8GA1UEAxMYQ2hyaXN0b3BoIEFu
dG9uIE1pdHRlcmVyMSQwIgYJKoZIhvcNAQkBFhVjYWxlc3R5b0BzY2llbnRpYS5uZXQxMTAvBgkq
hkiG9w0BCQEWIm1haWxAY2hyaXN0b3BoLmFudG9uLm1pdHRlcmVyLm5hbWUwggEiMA0GCSqGSIb3
DQEBAQUAA4IBDwAwggEKAoIBAQCq/4X3Urm/IHCIYUyqPrBN6FZ2pmd8V5epPyDlveqtdYvLBLNy
gP3G3KhGoCA4Jf49KYGmbqk+F7fVWcG1zcdwEx7itKJyj39nYf2HWXogxUSfKFptbOgpsTcEWuxg
ka2EkJuErTvYbwCEKT7mn4v6ScuFBc3Q+Hswlt1jbqjczi+OxcU1skvxM5jGjzRwYPUsiHZJRkWp
ogbbhNWZNbwXiMPln380TAlryRAr5UE0dSe1dg1qHhF6HSNKwaer0+Dcd/goL4XQhHxCAGZKfCK0
wVRf1SeEsS9FDGMMjW2b6HpHF+OVXuagjrxSWHttx0+Ez/PZDXpeZpjXatzzmlJFAgMBAAGjggEm
MIIBIjAMBgNVHRMBAf8EAjAAMFYGCWCGSAGG+EIBDQRJFkdUbyBnZXQgeW91ciBvd24gY2VydGlm
aWNhdGUgZm9yIEZSRUUgaGVhZCBvdmVyIHRvIGh0dHA6Ly93d3cuQ0FjZXJ0Lm9yZzBABgNVHSUE
OTA3BggrBgEFBQcDBAYIKwYBBQUHAwIGCisGAQQBgjcKAwQGCisGAQQBgjcKAwMGCWCGSAGG+EIE
ATAyBggrBgEFBQcBAQQmMCQwIgYIKwYBBQUHMAGGFmh0dHA6Ly9vY3NwLmNhY2VydC5vcmcwRAYD
VR0RBD0wO4EVY2FsZXN0eW9Ac2NpZW50aWEubmV0gSJtYWlsQGNocmlzdG9waC5hbnRvbi5taXR0
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


--=-IVsvBjvo4Rr0E+iAqq8Q--
