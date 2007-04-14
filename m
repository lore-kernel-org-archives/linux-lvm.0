Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l3EFDH7Z026243
	for <linux-lvm@redhat.com>; Sat, 14 Apr 2007 11:13:17 -0400
Received: from server.klug.on.ca (server.klug.on.ca [205.189.48.131])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l3EFDFmT029929
	for <linux-lvm@redhat.com>; Sat, 14 Apr 2007 11:13:16 -0400
Received: from linux.interlinx.bc.ca (linux.interlinx.bc.ca [66.11.173.224])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by server.klug.on.ca (Postfix) with ESMTP id DF4D32803
	for <linux-lvm@redhat.com>; Sat, 14 Apr 2007 11:13:14 -0400 (EDT)
Received: from [10.75.22.1] (pc.ilinx [10.75.22.1])
	(using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by linux.interlinx.bc.ca (Postfix) with ESMTP id 12133101680
	for <linux-lvm@redhat.com>; Sat, 14 Apr 2007 11:13:08 -0400 (EDT)
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-L8vy/wGPyqKrZOqCMvIb"
Date: Sat, 14 Apr 2007 11:13:07 -0400
Message-Id: <1176563587.17452.16.camel@pc.ilinx>
Mime-Version: 1.0
Subject: [linux-lvm] removing an origin from under snapshots
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


--=-L8vy/wGPyqKrZOqCMvIb
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I am fairly sure LVM does not currently allow this, but what I would
like to do is create one or more snapshots of an origin, work within the
snapshot(s) and then remove the origin.

Understanding a bit about how LVM works, I can understand some of the
problems with this.

      * All snapshot volumes would need to be (expanded to the) same
        size as the origin.
      * In the case of multiple snapshots, snapshots n+1 would need to
        have the blocks it shares with the origin copied to it.

Why would I want to do this you might ask?

Let's say I have a Fedora Core 5 system in /dev/vg00/{root,usr,var}.  I
want to upgrade with the safety of having somewhere to very quickly and
easily fall back to if it goes horribly wrong.  So I make snapshots of
those root, usr, and var volumes, mount them (or reboot from them even)
and try the upgrade.  If and when I'm happy with them I have no use for
the original root, usr and var and would like to collapse them, turning
my snaphots of those volumes into bona fide logical volumes, which I can
then take snapshots of at some time in the future.

Thots?

b.

--=20
My other computer is your Microsoft Windows server.

Brian J. Murrell

--=-L8vy/wGPyqKrZOqCMvIb
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBGIO+Dl3EQlGLyuXARAkEGAJ44SCRFcQGPuE/KeqmFwjtieL/Z1gCgre44
8U9UhqGT9aOs5O1CLoNt4Z8=
=GZqV
-----END PGP SIGNATURE-----

--=-L8vy/wGPyqKrZOqCMvIb--
