From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] vgscan fails to find volume groups
Message-Id: <20020417132956.GD6279@antimony.sistina.com>
References: <20020417075302.GB26644@codegate.jafager.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
    protocol="application/pgp-signature";
    boundary="dkEUBIird37B8yKS"
Content-Disposition: inline
In-Reply-To: <20020417075302.GB26644@codegate.jafager.com>
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
Date: Wed Apr 17 08:29:01 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--dkEUBIird37B8yKS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 17, 2002 at 03:53:02AM -0400, Jason A. Fager wrote:
> I have been attempting to get LVM set up on a freshly-installed
> Slackware 8.0 system (custom 2.4.18 monolithic kernel, LVM 1.0.3,
> no kernel patches).  It works fine in multi-user mode, it works
> fine in single-user mode, however I set up the single-user init
> script like this:
>=20
> (/ is mounted read only at this point)
> mount -o remount,rw /
> vgscan
> vgchange -a y
> mount -o remount,ro /
> (stock Slackware fsck and mount bits)
>=20
> The only volume group I have contains one physical volume
> (/dev/sdb, on an Adaptec 7xxx controller).  For some reason,
> vgscan doesn't pick up the volume group.  The exit code is 0,
> and looking at the debug output it hits /dev/sdb and spits out
> the same messages as when it hits all the other devices.

Hrm...you're root is mounted read-write, so the /etc directory should be
able to be updated by the tools.  Do you have /proc mounted at this point?
I'm assuming the SCSI driver is loaded at this point as well...Can't think
of anything else off the top of my head that would be wrong with that...

I'll see if I can reproduce on a system I have.

Regards,
--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-638-0500
1313 5th St SE, Suite 111              E-Mail: lewis@sistina.com
Minneapolis, MN 55414
http://www.sistina.com

Current GPG fingerprint =3D  7792 2F3E 9D86 DA4C 9111 7837 982D 737B 9DBC 4=
EC9
-----Begin Obligatory Humorous Quote----------------------------------------
FATAL ERROR! SYSTEM HALTED! - Press any key to do nothing...
-----End Obligatory Humorous Quote------------------------------------------

--dkEUBIird37B8yKS
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (FreeBSD)
Comment: For info see http://www.gnupg.org

iD8DBQE8vXjTmC1ze528TskRApFrAJ9XQCDaa5ufLPC3OCZTFtE7IxjI6gCglbxo
W8jUhtKxk7dH3ntA82Vk9pQ=
=h5hp
-----END PGP SIGNATURE-----

--dkEUBIird37B8yKS--
