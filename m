Date: Wed, 5 Sep 2001 12:41:58 -0500
From: "Eric M. Hopper" <hopper@omnifarious.org>
Subject: Re: [linux-lvm] Parallel IO on striped logic volume?
Message-ID: <20010905124158.A23242@omnifarious.org>
References: <E15eZdD-0008IY-00@hermes.sistina.com> <Pine.SOL.3.95.1010905110932.12169A-100000@pecos.ncsa.uiuc.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Content-Disposition: inline
In-Reply-To: <Pine.SOL.3.95.1010905110932.12169A-100000@pecos.ncsa.uiuc.edu>; from xiliu@ncsa.uiuc.edu on Wed, Sep 05, 2001 at 12:29:50PM -0500
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
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 05, 2001 at 12:29:50PM -0500, Xiaoxiang Liu wrote:
> I have a performance problem about parallel IO on striped logic volume.
>=20
> I build a striped LV on 4 scsi disks. If I do sequential IO on one disk
> with buffer size 4k, the bandwidth is 9MB/s. Then I do sequential IO on
> LV with buffer size 16k. Theoretically I can get almost 4*9=3D36MB/s beca=
use
> LVM stripe 4k IO on every disk but I only get 18MB/s. I don't know where
> I lost so much performance or it is the overhead of LVM? I do believe LVM=
=20
> do parallel IO because if I increase buffer size to 1024k, I can get=20
> 51MB/s which is close to 4*14 MB/s and 14MB/s is the maximum
> bandwidth of a single disk.
>=20
> My question is why I can't see nearly linear scaling of the bandwidth=20
> when the buffer size is small? Does striping LVM do real parallel IO
> similar to software RAID0?

	Here's a random guess...

	You have to schedule the reads on each of the 4 disks, then wait
for the reads to complete on each of the 4 disks.  Due to details of
disk positioning, the latency to actually get to the data you're asking
for is different on each of the 4 disks.  Each time you do this read,
you end up with the maximum latency any of the disks will give you.

	The bigger your buffer size, the greater the ratio of data read
to latency.  That ratio will be magnified by the maximum latency
characteristics of reading from multiple devices simultaneously.

Just a guess,
--=20
"It does me no injury for my neighbor to say there are twenty gods or no Go=
d.
It neither picks my pocket nor breaks my leg."  --- Thomas Jefferson
"Go to Heaven for the climate, Hell for the company."  -- Mark Twain
-- Eric Hopper (hopper@omnifarious.org  http://www.omnifarious.org/~hopper)=
 --

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7lmPmjtsvlOwvazYRAoOpAKCk4cFqy8AjzapHxOviOhb4NlbcrgCfcB2H
kyVs5ImD0Yp9dDvIJSXM5Bc=
=veI+
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--
