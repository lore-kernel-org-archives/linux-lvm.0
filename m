From: "Jason H. Smith" <jhs@oes.co.th>
Subject: Re: [linux-lvm] snapshots on RAID5 blow up machine ("switching cache buffer size")
References: <20030702073723.GC30882@questra.com>
In-Reply-To: <20030702073723.GC30882@questra.com>
MIME-Version: 1.0
Content-Type: multipart/signed;
  protocol="application/pgp-signature";
  micalg=pgp-sha1;
  boundary="Boundary-02=_N4oA/lR16haD/iZ";
  charset="tis-620"
Content-Transfer-Encoding: 7bit
Message-Id: <200307021447.25888.jhs@oes.co.th>
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
Date: Fri Jul  4 08:28:01 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--Boundary-02=_N4oA/lR16haD/iZ
Content-Type: text/plain;
  charset="tis-620"
Content-Transfer-Encoding: quoted-printable
Content-Description: signed data
Content-Disposition: inline

On Wednesday 02 July 2003 02:37 pm, Scott Mcdermott wrote:
> I've searched the archives and see that this is related to
> the filesystem using 4k blocks whereas snapshot IO uses 1k
> blocks, so RAID5 code gets confused, but I don't understand
> the internals of the filesystem to be able to say this is
> expected behavior.
>
> My questions are these:
>
>     - Is this a RAID5 problem or an LVM problem, or both?

I ran into this a while ago and I eventually decided that, currently,=20
software RAID 5 and LVM are, to put it nicely, "incompatible" if you want=20
long-term snapshots.  I'm no expert, but IMO, these days, the RAID5=20
subsystem should not assume i/o of equal chunk sizes, so it is md's=20
problem.  IIRC, the 2.6 kernel is supposed to address this; but there's=20
not much you can do at the moment.

Somebody please correct me if I'm wrong.

>     - Is this problem nonexistent on RAID1 backed or
>       RAID10 backed VGs (especially the latter since I am
>       contemplating a switch thereto)?

I believe that's correct, but please don't quote me.  Testing this should=20
be simple enough.

=2D-=20
Jason Smith
Open Enterprise Systems
Bangkok, Thailand
http://www.oes.co.th

--Boundary-02=_N4oA/lR16haD/iZ
Content-Type: application/pgp-signature
Content-Description: signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA/Ao4Nm5qEoSbpT3kRAgG5AKC0BI2v5Uy5cvpggrSdbcaWj4qF+wCbBMhV
h5n5AIlo9O93BBV9066PS3U=
=sKaJ
-----END PGP SIGNATURE-----

--Boundary-02=_N4oA/lR16haD/iZ--
