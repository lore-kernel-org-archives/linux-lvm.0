From: Tracy R Reed <treed@ultraviolet.org>
Subject: Re: [linux-lvm] pvcreate problem on new IDE disk
Message-ID: <20030420212233.B18402@ultraviolet.org>
References: <20030419192108.A18402@ultraviolet.org> <20030421000714.A30038@uk.sistina.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="IrhDeMKUP4DT/M7F"
Content-Disposition: inline
In-Reply-To: <20030421000714.A30038@uk.sistina.com>; from agk@uk.sistina.com on Mon, Apr 21, 2003 at 12:07:15AM +0100
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
Date: Tue Apr 22 07:12:01 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--IrhDeMKUP4DT/M7F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2003 at 12:07:15AM +0100, Alasdair G Kergon spake thusly:
> Two things to check first:
>   Make sure that /dev/hdd2 exists and that other programs can
> write/read it;

brw-rw----    1 root     disk      22,  66 Mar 14  2002 /dev/hdd2

>   Run 'vgscan' and then try the pvcreate again.
> [vgscan needs running after new devices are added]=20

home:/# vgscan
  Reading all physical volumes.  This may take a while...
  Found volume group "system" using metadata type lvm1
home:/# pvcreate /dev/hdd2
  Failed to read existing physical volume '/dev/hdd2'
  Physical volume "/dev/hdd2" successfully created

It still says "failed to read" etc. but then says successfully created.
Hmm...

home:/# vgextend system /dev/hdd2
  Volume group "system" successfully extended

Ok, looks like it is working ok. Now another problem...

home:/# pvmove
  Command not implemented yet.

Ugh...looks like LVM1 had it but LVM2 does not yet. Has this changed since
my version?

  LVM version:     1.95.10 (2002-05-31)

Even if pvmove is still nonexistant I guess I can put the new disk in anoth=
er
VG, create LV's over there, and manually copy the data over.

Thanks for the help!=20

--=20
Tracy Reed      http://www.ultraviolet.org

--IrhDeMKUP4DT/M7F
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.1 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj6jcgkACgkQ9PIYKZYVAq2IhgCfVkIH5z52HJtOXJeIAs+zcwY/
2P4AnA2rvRGsAgwALvZ/u0WQH9ZxWZzc
=S8Xb
-----END PGP SIGNATURE-----

--IrhDeMKUP4DT/M7F--
