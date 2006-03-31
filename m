Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k2V2pTiu030807
	for <linux-lvm@redhat.com>; Thu, 30 Mar 2006 21:51:29 -0500
Received: from linux.interlinx.bc.ca (linux.interlinx.bc.ca [66.11.173.224])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k2V2pSIa004333
	for <linux-lvm@redhat.com>; Thu, 30 Mar 2006 21:51:28 -0500
Received: from pc.ilinx (pc.ilinx [10.75.22.1])
	(using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by linux.interlinx.bc.ca (Postfix) with ESMTP id 1E5A9D7478
	for <linux-lvm@redhat.com>; Thu, 30 Mar 2006 21:51:27 -0500 (EST)
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-E4Iw+LFQoZzRKdFm+DWK"
Date: Thu, 30 Mar 2006 21:09:50 -0500
Message-Id: <1143770990.23716.4.camel@pc>
Mime-Version: 1.0
Subject: [linux-lvm] device-mapper: Could not create kcopyd client
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


--=-E4Iw+LFQoZzRKdFm+DWK
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I'm trying to add a number of simultaneous snapshots of a single origin
and getting the following from the kernel log:

device-mapper: Could not create kcopyd client
device-mapper: error adding target to table
device-mapper: Could not create kcopyd client
device-mapper: error adding target to table

I was able to create 4 then I got:

  device-mapper ioctl cmd 9 failed: Cannot allocate memory
  Couldn't load device 'vg0-centos4.2--x86_64--boulder--client10'.
  Problem reactivating origin centos4.2-x86_64-boulder-pristine

and then another attempt produced:

  device-mapper ioctl cmd 6 failed: Invalid argument
  Couldn't resume device 'vg0-centos4.2--x86_64--boulder--client10'
  Aborting. Failed to activate snapshot exception store. Remove new LV and =
retry.

This one seems to have created a target though.  Not sure if it's
functional or not though.

I am trying to do all of this on Fedora Core 4 with kernel
2.6.15-1.1833_FC4smp.

Any ideas?

b.

--=20
My other computer is your Microsoft Windows server.

Brian J. Murrell

--=-E4Iw+LFQoZzRKdFm+DWK
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQBELI9tl3EQlGLyuXARAnBCAJ49iN3u5flFP5M7B6Mv9AdjtPJiYQCdHWZG
Wz/fyQJNeaRbaZDUoysAimI=
=gKoZ
-----END PGP SIGNATURE-----

--=-E4Iw+LFQoZzRKdFm+DWK--
