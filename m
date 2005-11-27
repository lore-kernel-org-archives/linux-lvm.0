Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jARFZDV03840
	for <linux-lvm@redhat.com>; Sun, 27 Nov 2005 10:35:13 -0500
Received: from strugglers.net (strugglers.net [212.13.198.70])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jARFZ6kh016061
	for <linux-lvm@redhat.com>; Sun, 27 Nov 2005 10:35:06 -0500
Received: from andy by strugglers.net with local (Exim 4.50)
	id 1EgOYJ-0005s4-KD
	for linux-lvm@redhat.com; Sun, 27 Nov 2005 15:34:56 +0000
Date: Sun, 27 Nov 2005 15:34:55 +0000
From: Andy Smith <andy@strugglers.net>
Message-ID: <20051127153455.GH30385@strugglers.net>
References: <4365F0AC.3090909@oxtel.com>
	<80d985600511252130j37b17586i9dd1649a958622ba@mail.gmail.com>
	<438881B0.4040000@cox.net>
	<80d985600511270409q6fadc509p151530b7e1083482@mail.gmail.com>
	<4389C0F9.8040103@cox.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5fM1MC9alg+yIaL4"
Content-Disposition: inline
In-Reply-To: <4389C0F9.8040103@cox.net>
Subject: Re: [linux-lvm] One of 8 PVs dead - Trying to rescue data
	from	remaining 7
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


--5fM1MC9alg+yIaL4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 27, 2005 at 09:21:45AM -0500, Old Fart wrote:
> Craig Hagerman wrote:
> >Yeah, this would work with 3 discs, but doesn't answer the general
> >question about recovering data from a single LVM drive. In my 2 drive
> >system it wouldn't work. Any other ideas? I would assume that if one
> >drive failed it should be trivial to be able to access the information
> >on the remaining drive. If not, then I would be a lot safer going back
> >to a non-LVM system using the two drives as distinct partitions.

> Take a look at a 2 disk raid 1 array as a pv.  I have seen that array=20
> degrade to 1 drive and the LV was ok.

I think his question is not "how do I avoid data loss with multiple
disks under LVM?" but more like "I lost a disk and had no
redundancy, my LV was spread onto that disk, how do I recover the
parts of it that are on the good disk(s)?"

However I've personally got no idea since I do everything to avoid
ever being in that position and luckily have not been there yet.

Certainly I would never consider putting an LV on a disk with no
redundancy these days but that's not what the OP is asking.

Andy

--5fM1MC9alg+yIaL4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFDidIfIJm2TL8VSQsRAuzBAJ9JNYM7c+If+G3+rvO7TBB1bSYy/QCgu3nL
OSqAM89zqn+XbPqEMqi4Dcg=
=Ru3d
-----END PGP SIGNATURE-----

--5fM1MC9alg+yIaL4--
