Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7SNfRV02632
	for <linux-lvm@redhat.com>; Sun, 28 Aug 2005 19:41:27 -0400
Received: from natsmtp00.rzone.de (natsmtp00.rzone.de [81.169.145.165])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j7SNfPel029203
	for <linux-lvm@redhat.com>; Sun, 28 Aug 2005 19:41:25 -0400
Received: from micha-mobile (p5086F4E2.dip.t-dialin.net [80.134.244.226])
	by post.webmailer.de (8.13.1/8.13.1) with ESMTP id j7SNf8O2001953
	for <linux-lvm@redhat.com>; Mon, 29 Aug 2005 01:41:16 +0200 (MEST)
From: mailinglist@krausam.de
Subject: Re: [linux-lvm] resizing root filesystem on LVM with live CD?
Date: Mon, 29 Aug 2005 02:41:00 +0200
References: <Pine.LNX.4.62.0508281740530.11178@Chrestomanci>
In-Reply-To: <Pine.LNX.4.62.0508281740530.11178@Chrestomanci>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2637740.fquucZdiEL";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200508290241.07758.mailinglist@krausam.de>
Reply-To: micha@krausam.de,
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

--nextPart2637740.fquucZdiEL
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

You can use a Gentoo Live CD

Am Montag, 29. August 2005 00:16 schrieb Faheem Mitha:
> Dear People,
>
> I have a machine which is running Fedora Core on AMD64. I did not install
> this computer myself. The current setup is that that there are two
> partitions on the disk, one of them /boot and the other is given to a LVM
> volume group. This volume group currently has two logical volumes on it,
> swap and root, both using ext3.
>
> /etc/fstab appears at the bottom of this email. I don't have access to
> this machine at this moment, otherwise I would give output of df.
>
> What I want to do is to shrink the root logical volume, which I assume,
> though I'm not sure at the moment, occupies all the svailable space on in
> the volume group, along with the swap partition.
>
> It is apparently possible to resize logical volumes with root mounted on a
> running system, but this seems a little too adventurous for my taste.
>
> However, it seems possible that a live cd exists which can be used to
> resize logical volumes, and this would of course have no problem with the
> root filesystem of a system that is not running.
>
> Does anyone have any suggestions about this? Note that it will need to run
> a 2.6 kernel, since I need to use lvm2.
>
> I tried Knoppix, but it does not seem to know about LVM. I'm going to try
> the Debian installer, and see if I can get it to do this.
>
> If people have suggestions, I'd be interested to hear about them.
>
> Thanks.                                                         Faheem.
>
> *************************************************************************
> # This file is edited by fstab-sync - see 'man fstab-sync' for details
> /dev/VolGroup00/LogVol00 /                       ext3    defaults        1
> 1
> LABEL=3D/boot             /boot                   ext3    defaults       =
 1
> 2
> /dev/devpts             /dev/pts                devpts  gid=3D5,mode=3D62=
0  0
> 0
> /dev/shm                /dev/shm                tmpfs   defaults        0
> 0
> /dev/proc               /proc                   proc    defaults        0
> 0
> /dev/sys                /sys                    sysfs   defaults        0
> 0
> /dev/VolGroup00/LogVol01 swap                    swap    defaults        0
> 0
> /dev/scd0               /media/cdrecorder       auto
> pamconsole,exec,noauto,managed 0 0
> /dev/hda                /media/cdrecorder1      auto
> pamconsole,exec,noauto,managed 0 0
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

=2D-=20
Micha Krause

Jabber:	SMS-King@jabber.org
Email:	mailinglist@krausam.de

--nextPart2637740.fquucZdiEL
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBDElmjfAR45tA28LgRAhoLAJ0V9B3v0fqVlD3XqQAHMpZJrS9y/QCcDefX
3gvlB2eU6BTxhfnp5dBpCJs=
=N1vZ
-----END PGP SIGNATURE-----

--nextPart2637740.fquucZdiEL--
