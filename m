From: Austin Gonyou <austin@coremetrics.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
    protocol="application/pgp-signature";
    boundary="=-Qb3U2pQ+913g5uq6JEDs"
Message-Id: <1010433555.30682.4.camel@UberGeek>
MIME-Version: 1.0
Subject: [linux-lvm] [Fwd: Re: GRUB + LVM + XFS?]
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Mon Jan  7 13:57:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--=-Qb3U2pQ+913g5uq6JEDs
Content-Type: multipart/mixed; boundary="=-jNo2Q3ZYQjuSlytry9Zy"


--=-jNo2Q3ZYQjuSlytry9Zy
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Here is a forwarded message about How you would do the GRUB + LVM. Hope
this helps.=20
--=20
Austin Gonyou
Systems Architect, CCNA
Coremetrics, Inc.
Phone: 512-698-7250
email: austin@coremetrics.com

"It is the part of a good shepherd to shear his flock, not to skin it."
Latin Proverb

--=-jNo2Q3ZYQjuSlytry9Zy
Content-Disposition: inline
Content-Description: Forwarded message - Re: GRUB + LVM + XFS?
Content-Type: message/rfc822

Received: from oss.sgi.com ([216.32.174.27]) by ausmail.coremetrics.com
	with SMTP (Microsoft Exchange Internet Mail Service Version 5.5.2653.13) id
	CDZCT4C0; Mon, 7 Jan 2002 13:54:21 -0600
Received: from localhost (mail@localhost) by oss.sgi.com (8.11.2/8.11.3)
	with SMTP id g07KsKO24417; Mon, 7 Jan 2002 12:54:20 -0800
Received: by oss.sgi.com (bulk_mailer v1.13); Mon, 7 Jan 2002 12:54:11 -0800
Received: (from majordomo@localhost) by oss.sgi.com (8.11.2/8.11.3) id
	g07KsAx24362 for linux-xfs-outgoing; Mon, 7 Jan 2002 12:54:10 -0800
Received: from shakti.rupa.com (foobar@cx838204-a.alsv1.occa.home.com
	[24.16.83.66]) by oss.sgi.com (8.11.2/8.11.3) with SMTP id g07Ks4g24340 for
	<linux-xfs@oss.sgi.com>; Mon, 7 Jan 2002 12:54:05 -0800
Received: from shakti.rupa.com (localhost [127.0.0.1]) by
	localhost.rupa.com (Postfix) with ESMTP id 4D9FC48FC8; Mon,  7 Jan 2002
	11:54:02 -0800 (PST)
Received: by shakti.rupa.com (Postfix, from userid 9) id D8A3E48D59; Mon, 
	7 Jan 2002 11:54:01 -0800 (PST)
Received: from 192.168.1.20 by 192.168.1.20 with nntp;  7 Jan 2002 11:54:01
	PST
Message-ID: <m3666ej5t2.fsf@shakti.rupa.com>
From: Rupa Schomaker <rupa-list@rupa.com>
To: linux-xfs@oss.sgi.com
Subject: Re: GRUB + LVM + XFS?
Date: Mon, 7 Jan 2002 13:54:01 -0600 
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

You need a ext2 /boot (or if you've applied the xfs patches to grub
you can use that).  /boot cannot be in the LVM.

You'll need an initrd that initializes the LVM.  Your lvm package
should come with the command "lvmcreate_initrd" -- this will create a
minimal initrd that *only* starts lvm.  If you need other things in
your initrd then you'll have to "hack" the generated one.  I'd
recommend compiling in all the other components you need in the kernel
rather than using modules.  (for example, compile in your scsi
drivers)

I'm having toubles with the current CVS version of the XFS kernel.  I
haven't had time to look at it completely, but... it could be:

1) mismatch between userspace and kernel (what LVM is in the XFS
   kernel?  I'm using the debian lvm10 userspace).

2) bad config

3) ???

A quick "bt" at boot in kdb shows that devfs is in the call path.  No,
I haven't had time to write everything down. :(  Man, I wish there was
an easy to dump the kdb info or an OOPs to disk...

Austin Gonyou <austin@coremetrics.com> writes:

> Is it possible to boot a LVM XFS root with GRUB?
> --=20
> Austin Gonyou
> Systems Architect, CCNA
> Coremetrics, Inc.
> Phone: 512-698-7250
> email: austin@coremetrics.com
>
> "It is the part of a good shepherd to shear his flock, not to skin
it."
> Latin Proverb

--=20
-rupa

--=-jNo2Q3ZYQjuSlytry9Zy--

--=-Qb3U2pQ+913g5uq6JEDs
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA8Of4T94g6ZVmFMoIRAlP1AJ9+ZMCG+etL85gY/eGm3mhmaackBwCfUA2P
0C8HWr3nAboE5pIvgNCFubA=
=XakF
-----END PGP SIGNATURE-----

--=-Qb3U2pQ+913g5uq6JEDs--
