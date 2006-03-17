Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k2HKJt122913
	for <linux-lvm@redhat.com>; Fri, 17 Mar 2006 15:19:55 -0500
Received: from mitchell.tmdg.co.uk (drizzle.tmdg.co.uk [82.69.226.33])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k2HKJfwL020444
	for <linux-lvm@redhat.com>; Fri, 17 Mar 2006 15:19:47 -0500
Received: from hurricane.tmdg.co.uk (hurricane.tmdg.co.uk [192.168.48.59])
	by mitchell.tmdg.co.uk (8.12.11/8.12.11) with ESMTP id k2HKJZ2S023321
	for <linux-lvm@redhat.com>; Fri, 17 Mar 2006 20:19:35 GMT
From: Tom Dawes-Gamble <tmdg@weardale.cl>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-NM3nIjGGbKI9i3fTXEvl"
Date: Fri, 17 Mar 2006 20:19:35 +0000
Message-Id: <1142626775.9377.85.camel@hurricane.tmdg.co.uk>
Mime-Version: 1.0
Subject: [linux-lvm] Renaming Volume Groups.
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


--=-NM3nIjGGbKI9i3fTXEvl
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi,

I come from an HPUX lvm background.  In my time I've had to recover all
sorts of LVM foul ups.  =20

I'm a bit surprised at the way LVM on linux appears to work.=20

I read the post from Axel Braun with the =20
Subject: [linux-lvm] LVM2 on a USB-disk/ same VG name=20
on Thu, 9 Mar 2006 09:59:22 +0100 (MET)

If I read things correctly. To rescue data from dead system in his case
a laptop.  He encountered the problem that both his current disk Volume
Group is called VolGroup00 and the Lap Top disk is also called
VolGroup00. =20

The solution appears to be rename VolGroup00 the working system
VolGroup00 then you can import the laptop VolGroup00.

With my HPUX lvm hat on this seems really bad.  I just had a quick go at
doing something similar on a Fedora Core 4 system.  i.e. rename
VolGroup00.  I changed /etc/fstab and /etc/grub.conf replacing
VolGroup00 with vg00 (that makes an HPUX person very happy :-)
Booted the rescue disk but alas it doesn't appear to know about LVM. =20
So I can't vgrename. <sigh>

Now my disk it hosed.  It won't boot.

Using the rescue disk I edited /boot/grub/grub.conf then when I booted I
was thown a rescue shell that allowed me to remount the / filesystem
read/write I fixed /etc/fstab and now the system is bootable again.

However, I still can't activate the other VolGroup00 disk.

Are there any plans for a tool that can do a vgrename given a list of
devices?

When I connect my Laptop drive via USB as Axel did is is /dev/sdf and
and VolGroup00 is /dev/sdf2.  So what I'd like to be able to do is :-

#  vgfixname /dev/sdf2 VolGroup01
#  vgscan
#  vgchange -a y=20

Regards,
Tom.


--=20
There are 10 types of people in the world.
Those that understand Binary and those that don't.

--=-NM3nIjGGbKI9i3fTXEvl
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.1 (GNU/Linux)

iD8DBQBEGxnXYIWjhkOmiWoRAgcUAJ0aQqiIEN20ZauqFwJXeXKIPdjepwCfcs5o
Rhj4e/3eGXRcBXMgrlWzjhk=
=3N1R
-----END PGP SIGNATURE-----

--=-NM3nIjGGbKI9i3fTXEvl--
