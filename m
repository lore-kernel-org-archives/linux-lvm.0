Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAJILjr11479
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 13:21:45 -0500
Received: from dcs.nac.uci.edu (root@dcs.nac.uci.edu [128.200.34.32])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iAJILX7s022303
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 13:21:39 -0500
Subject: Re: [linux-lvm] HA Fileserver configuration recommendation sought.
From: Dan Stromberg <strombrg@dcs.nac.uci.edu>
In-Reply-To: <1100857645.13422.99.camel@grma-lap>
References: <1100857645.13422.99.camel@grma-lap>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-tqrWHtwjO1aoSe/KSa1w"
Date: Fri, 19 Nov 2004 10:21:26 -0800
Message-Id: <1100888487.4379.9.camel@tesuji.nac.uci.edu>
Mime-Version: 1.0
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: Gary.Mansell@ricardo.com, LVM general discussion and development <linux-lvm@redhat.com>


--=-tqrWHtwjO1aoSe/KSa1w
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


I have the results I obtained while experimenting with > 2T filesystems
on RHEL 3 and FC 2 at the following URL:

http://dcs.nac.uci.edu/~strombrg/nbd.html

It mostly covers NBD and ENBD, but I believe you'll find some things
relevant to what you're looking for in it as well - EG there is some md
and LVM coverage.

Another alternative is Lustre.  It is a filesystem which purports to be
able to aggregate the disks of multiple storage computers into one or
more gigantic filesystems.  It isn't stable for us, but it may be
someday.  :)  The Lustre vendor claims to be able to break not just the
2T barrier, but also the 16T barrier.  We do have a lustre filesystem of
over 16T set up now, but it remains to be seen what will happen when we
actually put over 16T of -data- in it.

Another option may be the "LBD" patches.  I haven't tried them, nor even
studied about them.

On Fri, 2004-11-19 at 09:47 +0000, Gary Mansell wrote:
> Dear all,
>=20
> I currently run RHAS3.0 on a Dell PE2650 which is directly attached to
> an EMC FC4500 2TB HW RAID 5 unit via two QLA2310F Fibre Channel cards.
> I have EMC's Powerpath software installed to give me multiple paths to
> the disk subsytem in case of controller or cable failure.=20
>=20
> This configuration has served me well but is now about to be End Of
> Life'd by Dell and I need to grow the storage. There is obviously
> quite a price premium to pay for this sort of kit so I was hoping to
> find a cheaper solution for the future.
>=20
> I have seen the Nexsan ATABEAST which is a 16TB ATA array with dual
> fibre channel controllers. It seems to be well liked and is reasonably
> priced but my concern is how to achieve multiple paths to the disk.
> How would you recommend achieving a highly available configuration
> with this sort of disk subsystem?
>=20
> Also, am I correct in thinking that the maximum filesystem size with
> RHEL 3.0 is 2TB? Is it possible to get over this limitation with LVM
> or some other method?
>=20
> Any advice gladly received.
>=20
> Thanks in advance
>=20
> Gary Mansell --=20
>=20
> This e-mail and any files transmitted with it are confidential and
> intended solely for the use of the individual or entity to whom they
> are addressed.
> If you have received this e-mail in error please notify the sender
> immediately and delete this e-mail from your system. Please note that
> any views
> or opinions presented in this e-mail are solely those of the author
> and do not necessarily represent those of Ricardo (save for reports
> and other
> documentation formally approved and signed for release to the intended
> recipient). Only Directors or Duly Authorised Officers are authorised
> to=20
> enter into legally binding obligations on behalf of Ricardo unless the
> obligation is contained within a Ricardo Purchase Order.
>=20
> Ricardo may monitor outgoing and incoming e-mails and other
> telecommunications on its e-mail and telecommunications systems. By
> replying to
> this e-mail you give consent to such monitoring. The recipient should
> check e-mail and any attachments for the presence of viruses. Ricardo=20
> accepts no liability for any damage caused by any virus transmitted by
> this e-mail. "Ricardo" means Ricardo plc and its subsidiary companies.
>=20
> Ricardo plc is a public limited company registered in England with
> registered number 00222915.
> The registered office of Ricardo plc is Bridge Works,Shoreham-by Sea,
> West Sussex, BN43 5FG.
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--=-tqrWHtwjO1aoSe/KSa1w
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQBBnjmmo0feVm00f/8RAnakAJ9FgxLpCjuq2Wp/fmSAXidXgMGT2ACeIY1i
ZJ4Gl1lJp46XUGJiJDnnS3w=
=PShJ
-----END PGP SIGNATURE-----

--=-tqrWHtwjO1aoSe/KSa1w--
