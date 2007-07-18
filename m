Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id l6IAVrUs011771
	for <linux-lvm@redhat.com>; Wed, 18 Jul 2007 06:31:53 -0400
Message-ID: <469DEBB4.5080602@redhat.com>
Date: Wed, 18 Jul 2007 11:30:12 +0100
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] disk recovery - mounting external USB lvm2 volume
References: <ca3f4a240707151830q4cd06100hbaea5969e4589258@mail.gmail.com>	<20070716014007.GA31102@bdmcc-us.com>	<ca3f4a240707161928y94deabr15839a6b6eb554ef@mail.gmail.com>	<20070717031215.GB24644@bdmcc-us.com>
	<ca3f4a240707171841w626b2a41o7cc07d14111ebea9@mail.gmail.com>
In-Reply-To: <ca3f4a240707171841w626b2a41o7cc07d14111ebea9@mail.gmail.com>
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

Allan Wolfe wrote:
> Yes.  The grub.conf does refer to the logical volume.  I also see
> /etc/blkid/blkid.tab which looks like it is built at boot time (kudzu?).
> 

The /etc/blkid/blkid.tab file is the libblkid persistent device cache.
It's used by the blkid command and other users of the library (e.g.
e2fsprogs). It's always validated prior to use and is indexed by UUID,
label etc, so there's no need to worry about updating it when device
nodes change.

Kind regards,
Bryn.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFGneu06YSQoMYUY94RAg2oAKCABfby/SZtrOyLZ8zTZcr1FdKzjwCgj9Tn
Z9Axek7SWivOMiBbSYxOjCs=
=ySEM
-----END PGP SIGNATURE-----
