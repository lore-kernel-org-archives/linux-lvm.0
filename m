Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m09GDjWT004847
	for <linux-lvm@redhat.com>; Wed, 9 Jan 2008 11:13:45 -0500
Message-ID: <4784F2B9.6070603@redhat.com>
Date: Wed, 09 Jan 2008 16:13:45 +0000
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] fdisk and lvs size differences
References: <4784CDCC.6000809@wpkg.org> <4784CF70.3000307@redhat.com>
	<4784DF56.6090903@wpkg.org>
In-Reply-To: <4784DF56.6090903@wpkg.org>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Tomasz Chmielewski wrote:
> What lvm manual exactly? I didn't find anything about upper/lower case
> units supported in "man lvcreate" or "man lvm". In fact, it didn't make
> a difference here whether I used "g" or "G".

You're right - I was mistaken about using upper/lower to switch between
units in LVM2.

It doesn't change the fact that this is why you're seeing a difference
between the output of fdisk & the lvm tools though. LVM2 reports the
size using binary prefixes (powers-of-two) and fdisk uses the SI units.

Regards,
Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFHhPK56YSQoMYUY94RAhcrAKDhlJvN3KGvUvH8xB+uN980g54CAQCgkwOu
Y7f7LhY08tES5SaxKkHq2Ec=
=Qy+P
-----END PGP SIGNATURE-----
