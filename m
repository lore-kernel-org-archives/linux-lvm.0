Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7B6wKV26709
	for <linux-lvm@redhat.com>; Thu, 11 Aug 2005 02:58:20 -0400
Received: from linux.interlinx.bc.ca (linux.interlinx.bc.ca [66.11.173.224])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j7B6wJYu002006
	for <linux-lvm@redhat.com>; Thu, 11 Aug 2005 02:58:19 -0400
Received: from pc.ilinx (pc.ilinx [10.75.22.1])
	(using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by linux.interlinx.bc.ca (Postfix) with ESMTP id 87A267E3B3
	for <linux-lvm@redhat.com>; Thu, 11 Aug 2005 02:58:14 -0400 (EDT)
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-uJ8fnNhZ3MQirmeG4tW0"
Date: Thu, 11 Aug 2005 02:57:41 -0400
Message-Id: <1123743470.31680.174.camel@pc.ilinx>
Mime-Version: 1.0
Subject: [linux-lvm] how to "ignore" a volume group created elsehwere on a
	shared device
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


--=-uJ8fnNhZ3MQirmeG4tW0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I have two machines connected to a shared storage device that I am
trying to use LVM2 with.

On one machine, /dev/sda1 is the same device (i.e. LUN on the shared
storage device) as /dev/sda2 on the other machine and vice versa.  To be
pedantically clear, machine one writes into /dev/sda1 and machine two
can see what was written by machine one in it's /dev/sda2.

The problem is that on machine one, if I add /dev/sda1 as a PV and then
create a VG on it, "automagically" machine two sees this same VG and a
PV in /dev/sda2.

Now while this has some very interesting "failover" benefits going for
it, it's lousing me up right now.

I want to be able to add /dev/sda1 as a PV on machine two and create VG
there of the same name as I used on machine one.  Of course LVM2 gets
upset that the VG exists already.

I have tried adding the device name I don't want to see the PV (and the
VG on it) on to the /etc/lvm/lvm.conf filter and while that prevents a
vgscan from scanning it, it still does not prevent pvdisplay from
listing it and the volume group on it from being visible.

Is there any way to do what I want?

b.


--=-uJ8fnNhZ3MQirmeG4tW0
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQBC+vbkl3EQlGLyuXARArSSAKCc8yQ7rKfkZmXNz8+a6OF/OHweCgCggRTf
XqycmOvOWau8JxnsA1x/fvM=
=oOi+
-----END PGP SIGNATURE-----

--=-uJ8fnNhZ3MQirmeG4tW0--
