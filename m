Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id k9QLGY7k029608
	for <linux-lvm@redhat.com>; Thu, 26 Oct 2006 17:16:34 -0400
Received: from cel.leo (cel.leonerd.org.uk [62.49.94.186])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k9QLGWu5018740
	for <linux-lvm@redhat.com>; Thu, 26 Oct 2006 17:16:32 -0400
Received: from nim.leo (nim.leo [192.168.42.3])
	by cel.leo (Postfix) with ESMTP id F2D0022681
	for <linux-lvm@redhat.com>; Thu, 26 Oct 2006 22:16:26 +0100 (BST)
Date: Thu, 26 Oct 2006 22:16:23 +0100
From: Paul LeoNerd Evans <leonerd-lvm@leonerd.org.uk>
Subject: Re: [linux-lvm] Mirror resync direction
Message-ID: <20061026221623.5d0e2e17@nim.leo>
In-Reply-To: <67e61b34aeae92681a278b5d3bde28e0@redhat.com>
References: <20061026211738.008da405@nim.leo>
	<67e61b34aeae92681a278b5d3bde28e0@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_2Ky=lztsNf/p8tGtWeLWv.Z";
	protocol="application/pgp-signature"; micalg=PGP-SHA1
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

--Sig_2Ky=lztsNf/p8tGtWeLWv.Z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 26 Oct 2006 16:14:34 -0500
Jonathan E Brassow <jbrassow@redhat.com> wrote:

> This doesn't really reflect what would happen if you replaced a disk, I=20
> don't think.  With this, you are simply going around mirror's back to=20
> write data to a device which it controls.

Well, I did it with the VG turned off; namely

  vgchange -a n

> In real life, I think you would have a disk failure (which would force=20
> you to run 'vgreduce --removemissing vg'), then you would insert a new=20
> block device, pvcreate/vgextend/lvconvert.

Yes, I wasn't aware of that procedure before, but Alasdair Kergon's mail
has pointed that out to me - I've tried with that and it seems to work
fine.

> LVM2 mirroring is still a work in progress (trying to get the right=20
> pieces upstream).  Depending on the version of LVM2 and the kernel=20
> patches you have, it may not work.

Seems happy once I follow the correct procedure - see above :)

> The use of --corelog simply means that the mirror device will be=20
> resynchronized every time the device is activated.  The persistent log=20
> (disk log) tracks what resynchronization has been done and can avoid=20
> all complete resyncs.

Yes, I'm aware of that bit, but I couldn't see any other way to achieve
it with only two PVs. The "--alloc anywhere" as suggested in the error
message doesn't have any effect for me.

--=20
Paul "LeoNerd" Evans

leonerd@leonerd.org.uk
ICQ# 4135350       |  Registered Linux# 179460
http://www.leonerd.org.uk/

--Sig_2Ky=lztsNf/p8tGtWeLWv.Z
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQFFQSWqqRXzCRLr5iQRAm2jAJ4wa6vBXIiKgLrAdAvC1Kxqw/z1bACfSzzw
XsmodIWdT4m1CP+YFCubT9U=
=rdm+
-----END PGP SIGNATURE-----

--Sig_2Ky=lztsNf/p8tGtWeLWv.Z--
