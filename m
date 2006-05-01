Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k41NlmUn000462
	for <linux-lvm@redhat.com>; Mon, 1 May 2006 19:47:48 -0400
Received: from linux.interlinx.bc.ca (linux.interlinx.bc.ca [66.11.173.224])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k41NlgZO018918
	for <linux-lvm@redhat.com>; Mon, 1 May 2006 19:47:42 -0400
Received: from pc.local (pc.ilinx [10.75.22.1])
	(using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by linux.interlinx.bc.ca (Postfix) with ESMTP id 6D58BDB186
	for <linux-lvm@redhat.com>; Mon,  1 May 2006 19:47:38 -0400 (EDT)
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-R3ChmYXMw+dGozrwvVv/"
Date: Mon, 01 May 2006 19:47:36 -0400
Message-Id: <1146527256.31003.63.camel@pc.local>
Mime-Version: 1.0
Subject: [linux-lvm] recover a pv from a disk with no partition table
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
To: linux-lvm@redhat.com


--=-R3ChmYXMw+dGozrwvVv/
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I need to recover a PV from a disk with no partition table.  I have a
disk which gives EIO errors trying to read from the first few blocks of,
so, no partition table.

Is there any way with LVM2, given that I have
the /etc/lvm/backup/<vgname> file that I can determine the offset into
the disk where the partition starts, so that I could do:

# losetup -o <offset> /dev/loop2 /dev/hde

to get the PV on /dev/loop2 and then be able to activate it with
vgchange and read it's LVs?

gpart tells me:

# losetup -o $((512*8)) /dev/loop2 /dev/hde
# gpart -vg /dev/loop2


dev(/dev/loop2) mss(512)

* Warning: strange partition table magic 0x0000.
...


Begin scan...
Possible partition(Linux ext2), size(19mb), offset(0mb)
   type: 131(0x83)(Linux ext2 filesystem)
   size: 19mb #s(39248) s(55-39302)
   chs:  (1023/255/0)-(1023/255/0)d (0/0/0)-(0/0/0)r
   hex:  00 FF C0 FF 83 FF C0 FF 37 00 00 00 50 99 00 00

Possible partition(Linux LVM physical volume), size(156315mb), offset(19mb)
   type: 142(0x8E)(Linux LVM physical volume)
   size: 156315mb #s(320133744) s(39304-320173047)
   chs:  (1023/255/0)-(1023/255/0)d (0/0/0)-(0/0/0)r
   hex:  00 FF C0 FF 8E FF C0 FF 88 99 00 00 70 DA 14 13

Which looks right, but:

# losetup -o $((512*39304)) /dev/loop3 /dev/hde
# vgscan

Yields no new volume groups.  Neither does the above with 512*39303 or
512*39305 so it doesn't seem to be an off-by-one.  Nor does any of
512*(39303-8), 512*(39304-8), 512*(39305-8) to account for the fact that
loop2 (which the gpart was done on originally) is 8 blocks into /dev/hde
already.

Am I missing something?

Thanx,
b.

--=20
My other computer is your Microsoft Windows server.

Brian J. Murrell

--=-R3ChmYXMw+dGozrwvVv/
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQBEVp4Yl3EQlGLyuXARAhe3AJ9Tc1Oxro9Fb4jBaX0xj3PuqDu4BgCg2V7w
/yr0xzD4G636GkXWps/BsOE=
=/v7E
-----END PGP SIGNATURE-----

--=-R3ChmYXMw+dGozrwvVv/--
