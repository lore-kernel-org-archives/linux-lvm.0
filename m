Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j1BNIEO10055
	for <linux-lvm@redhat.com>; Fri, 11 Feb 2005 18:18:14 -0500
Received: from bluebottle-fe6.bluebottle.com ([67.107.78.211])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j1BNIDgU023719
	for <linux-lvm@redhat.com>; Fri, 11 Feb 2005 18:18:13 -0500
Date: Fri, 11 Feb 2005 19:40:59 +0000
From: Robin Green <greenrd@greenrd.org>
Subject: Re: [linux-lvm] waah waah - disaster recovery
Message-ID: <20050211194059.GA5609@pob>
References: <1108148723.4699.32.camel@aragorn.intranet>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LQksG6bCIzRHxTLp"
Content-Disposition: inline
In-Reply-To: <1108148723.4699.32.camel@aragorn.intranet>
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


--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 11, 2005 at 02:05:23PM -0500, Paul Pianta wrote:
> Rebooting the machine, I was able to fsck my way through the /boot and /
> partition errors but the boot process gets stuck when trying to read the
> journal for /data/repositories. The /data/backup and /data/isos volumes
> mounted ok after they recovered their respective journals, but I don't
> ever get past the 'recovering journal' message for /data/repositories.

Yeah, the ext3 journal recovery code in the kernel seems to be buggy.
(I use reiserfs on lvm2 and I have never had any problems with that, by the
way.)

Try this:

1. Boot with a live CD and comment out the line in /etc/fstab on your root
partition that refers to /data/repositories, by putting a # at the start of
the line. Note down which device corresponds to /data/repositories.

2. Reboot from your hard drive

3. Run fsck /dev/[device noted in step 1]

That should sort it. (I'm assuming that one of your live CDs can at least
mount your / partition.)
--=20
Robin

--LQksG6bCIzRHxTLp
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQFCDQpLtPCt67UksSYRAoqfAJ4l9IL6ZsnxPribWtpFyJFSfj53oACcDxi8
D/MZ/MKavL2dasQWXBzqoRE=
=kP6Q
-----END PGP SIGNATURE-----

--LQksG6bCIzRHxTLp--
