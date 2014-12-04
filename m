Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sB4N7ed7014423
	for <linux-lvm@redhat.com>; Thu, 4 Dec 2014 18:07:40 -0500
Received: from cdptpa-oedge-vip.email.rr.com
	(cdptpa-outbound-snat.email.rr.com [107.14.166.232])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sB4N7cfT005877
	for <linux-lvm@redhat.com>; Thu, 4 Dec 2014 18:07:39 -0500
Message-ID: <5480E939.3070702@ubuntu.com>
Date: Thu, 04 Dec 2014 18:07:37 -0500
From: Phillip Susi <psusi@ubuntu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Raid1 -> linear conversion = destroyed data
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

I used lvconvert -m 1 --type raid1 to clone my root volume onto a new
drive, and then used --splitmirrors to split off the original volume
as a backup while I worked off the new drive for a few days.  I then
decided the new drive was working well and used lvconvert -m 0 to
convert the volume back to linear.  Instead of dropping the split off
original leg, lvm dropped the NEW copy and redirected all IO to the
OLD data, causing massive filesystem corruption.

This is on Ubuntu 14.10 using lvm 2.02.98 and linux 3.16.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBCgAGBQJUgOk5AAoJENRVrw2cjl5RWxIIAIFnwZCd/TSFmJ7x79OFV857
1Uv87aGTHV4kE58qPs0Q7jlhdEev0pw1H9rnBQo7VuGFOZPMNXG/ZbefEaK/I/UZ
1Kga+nIv+gWDmRjLCaWg6sAy+0LzYgOLs0YvNsloPOhPWBEHYZCTczLgvl3cGqGI
IlEJgqbokbwp8Y0it3Cz7xtTDDMwio00FrXBsSi5L5+/Pu5T5beBIssKC/nhQT3Q
pAzRfxPbQr2pw8fOcotXp0qYG+aR1qCEdQnCqSmRphWzY+0XMhP68LMb7W/cPExP
k8oDbhvam+N6jQegNAgzHuqKG1wPzEfuef4o+C1pRigIu3p5NqldXuY5upVwhWw=
=P8No
-----END PGP SIGNATURE-----
