Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1O3Cti11770
	for <linux-lvm@redhat.com>; Mon, 23 Feb 2004 22:12:55 -0500
Received: from ms-smtp-02.nyroc.rr.com (ms-smtp-02.nyroc.rr.com [24.24.2.56])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1O3Ctb13758
	for <linux-lvm@redhat.com>; Mon, 23 Feb 2004 22:12:55 -0500
Received: from dman13.dyndns.org (roc-66-66-61-253.rochester.rr.com [66.66.61.253])
	by ms-smtp-02.nyroc.rr.com (8.12.10/8.12.10) with ESMTP id i1O3CqEj007600
	for <linux-lvm@redhat.com>; Mon, 23 Feb 2004 22:12:52 -0500 (EST)
From: "Derrick 'dman' Hudson" <dman@dman13.dyndns.org>
Message-ID: <20040224031633.GA7431@dman13.dyndns.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="T4sUOijqQbZv57TR"
Content-Disposition: inline
Subject: [linux-lvm] upgrade from kernel 2.4 to 2.6
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Mon Feb 23 22:13:05 2004
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

--T4sUOijqQbZv57TR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The FAQ doesn't mention this hurdle.  I found that upgrading from
kernel 2.4.23+lvm1 to 2.4.23+lvm2 is really quite trivial
(particularly with debian - I didn't have to do anything).  However,
the 2.6 kernel won't boot because lvm can't find any volume groups.
I've tried 2.6.0, 2.6.2 and most recently 2.6.3.  In each case, the
device mapper (dm-mod) is loaded and /dev/mapper/control exists
(I'm using devfsd).  What did I miss?

TIA,
-D

--=20
\begin{humor}
Disclaimer:
If I receive a message from you, you are agreeing that:
   1. I am by definition, "the intended recipient"
   2. All information in the email is mine to do with as I see fit and make
        such financial profit, political mileage, or good joke as it lends
        itself to. In particular, I may quote it on USENET or the WWW.
   3. I may take the contents as representing the views of your company.
   4. This overrides any disclaimer or statement of confidentiality that may
        be included on your message
\end{humor}
=20
www: http://dman13.dyndns.org/~dman/            jabber: dman@dman13.dyndns.=
org

--T4sUOijqQbZv57TR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAOsIRiB6vp1xAVUARAgSFAJ4llxDkh/E7fuPOFLsaKdBAaDPD4wCfZY72
YBUwZvc0H6vCHPrBoIhnwZs=
=NuXp
-----END PGP SIGNATURE-----

--T4sUOijqQbZv57TR--
