Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k88GqLkZ010430
	for <linux-lvm@redhat.com>; Fri, 8 Sep 2006 12:52:21 -0400
Received: from fencepost.gnu.org (fencepost.gnu.org [199.232.76.164])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k88GqD4o026241
	for <linux-lvm@redhat.com>; Fri, 8 Sep 2006 12:52:13 -0400
Received: from tschwinge by fencepost.gnu.org with local (Exim 4.34)
	id 1GLjaK-0000yB-JA
	for linux-lvm@redhat.com; Fri, 08 Sep 2006 12:52:08 -0400
Date: Fri, 8 Sep 2006 18:52:08 +0200
From: Thomas Schwinge <tschwinge@gnu.org>
Subject: Re: [linux-lvm] lvm on CentOS with raid1 and grub
Message-ID: <20060908165208.GC27049@fencepost>
References: <45012C0E.9080509@ambra.ro>
	<200609080935.23315.peregrine@openbrainstem.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="V88s5gaDVPzZ0KCq"
Content-Disposition: inline
In-Reply-To: <200609080935.23315.peregrine@openbrainstem.net>
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


--V88s5gaDVPzZ0KCq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello!

On Fri, Sep 08, 2006 at 09:34:46AM -0600, Lamont R. Peterson wrote:
> I read somewhere that the plan was to support LVM with GRUB2 when it=20
> releases

Correct.  Jeroen Dekkers was (successfully) working on RAID and LVM
support for GRUB as a Google Summer of Code 2006 project.

> I can't seem to find the reference at the moment.

I can help:
<http://lists.gnu.org/archive/html/grub-devel/2006-08/msg00024.html> and
<http://grub.enbug.org/LVMandRAID>.

It's not installed in the main trunk so far, but will be.


Regards,
 Thomas

--V88s5gaDVPzZ0KCq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFFAZ+4gfzh735dTTURAj1sAKC52jClhYD7dLCDmuHnJNCpv3YK1gCfa5IJ
w5xwUdZMQtkQctr7BQ5OTIE=
=wyST
-----END PGP SIGNATURE-----

--V88s5gaDVPzZ0KCq--
