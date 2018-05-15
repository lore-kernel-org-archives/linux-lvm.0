Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E904430BE009
	for <linux-lvm@redhat.com>; Tue, 15 May 2018 08:11:46 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EE82DAE45A
	for <linux-lvm@redhat.com>; Tue, 15 May 2018 08:11:44 +0000 (UTC)
Received: from monk.localnet ([46.5.19.123]) by mail.gmx.com (mrgmx101
	[212.227.17.168]) with ESMTPSA (Nemesis) id 0MQ6oB-1fDo5d2qDj-005I7D
	for <linux-lvm@redhat.com>; Tue, 15 May 2018 10:11:42 +0200
From: Dennis Schridde <devurandom@gmx.net>
Date: Tue, 15 May 2018 10:11:36 +0200
Message-ID: <2230803.usHgyXdh9J@monk>
In-Reply-To: <2496144.kxeQXG1iRO@monk>
References: <1973783.dFIIZJkBNM@monk> <2496144.kxeQXG1iRO@monk>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart22784193.PzzLJmF6Ag";
	micalg="pgp-sha256"; protocol="application/pgp-signature"
Subject: Re: [linux-lvm] Check of pool ernie/cache failed (status:1). Manual
	repair required!
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

--nextPart22784193.PzzLJmF6Ag
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hello!

In case the question comes up: Fedora 28 (the live system I am trying to use 
for recovery) is using Linux 4.16.3-301.fc28 and `lvm version`:
LVM version 2.02.177(2)
Library version 1.02.146
Driver version 4.37.0

The system I was originally using to break the cache was using Linux 4.16.7-
gentoo, and `LD_LIBRARY_PATH=$PWD/lib64 ./bin/lvm version` from its initrd 
reports (running on the Fedora 28 live system):
LVM version: 2.02.173(2)
Library version: 1.02.142
Driver version: 4.37.0

Could someone please give me a hint what is actually broken here?  Is it just 
the metadata?  If so, how can that break -- shouldn't that metadata never be 
modified after creating the LV?  And could it not be recovered from /etc/lvm/
archive?  What does "manual repair" mean in detail?  Is there some way to 
recover the cache?  Or is it at least possible to uncache the LV forcibly, to 
hopefully recover the data on the origin LV?  What is your recommendation to 
minimise data loss?

Best regards,
Dennis
--nextPart22784193.PzzLJmF6Ag
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEE0Ngi/nirHnbsz3NFz+h/M161qdwFAlr6ljgACgkQz+h/M161
qdwG9Qv8DqYPzup5Fl1RdV/CRQg30qN9uZIfotBpr1daOvUnTnMzPWPoMKChb9Zq
p55NcOo/Aj74hUi6JBzxonq8EeGTfgMytB7FhtaslBeygSdsuR/R87dksGW3aqrL
yUrVaI3BYcr+K6BUk58rd1WGBDDyB1s8JaB+98A6X69MjjpWbcHjYzu/cMV0NtRd
fi/F4rni/x7Q4tElQ/FkOtDliezW6vJLgXOzYVMveuku37vPQ54DvENQJUiXeUk4
QxbarXb2S9rA2bk3j1yqVHBK1sU6LvkVW0VSeqC2acc5vAh/fgAKmiqQGSwuh9l6
kRRBemEHqS7BM0C03/u+O8XmsBbpTzqWfHJT+d5VgKbWQ2EvaY+AxUinPQzD0qzr
X2EYbIaBDcvIRocPwDHFci8s1xzU8XapBIFkfYLfBVAmVKhFmmts4tbbRSok8wJd
7zfIqinPn256bsfxMCvTK8pCIV7CAs+CRhya1UriqRyp5vQa5YMVApd1S+PKWjwj
ty2xQHlk
=GNLA
-----END PGP SIGNATURE-----

--nextPart22784193.PzzLJmF6Ag--
