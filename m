Date: Wed, 5 Sep 2001 13:30:45 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] lvm kernel version
Message-ID: <20010905133045.A3227@sistina.com>
References: <20010905175331.97946.qmail@web13403.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="EVF5PPMfhYS0aIcm"
Content-Disposition: inline
In-Reply-To: <20010905175331.97946.qmail@web13403.mail.yahoo.com>; from plamb_98@yahoo.com on Wed, Sep 05, 2001 at 10:53:31AM -0700
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

--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 05, 2001 at 10:53:31AM -0700, Pierre Lamb wrote:
> Is there an easy way to find out what version of "LVM"
> is currently in a kernel ie "rh" release.=20

If you have the modules loaded (or compiled in the kernel), you can look at
/proc/lvm/global

It should look something like this:
$ cat /proc/lvm/global=20
LVM module LVM version 0.9.1_beta8(24/07/2001)

Total:  3 VGs  16 PVs  8 LVs (7 LVs open 7 times)

Global: 106301 bytes malloced   IOP version: 10   4:30:32 active

VG:  main  [4 PV, 1 LV/0 open]  PE Size: 4096 KB

<...snip...>

VG:  temp  [1 PV, 2 LV/2 open]  PE Size: 4096 KB
  Usage [KB/PE]: 8957952 /2187 total  7593984 /1854 used  1363968 /333 free
  PV:  [AA] sda                    8957952 /2187     7593984 /1854 1363968 =
/333  =20
    LVs: [AWDL  ] usr                        4759552 /1162     1x open
         [AWDL  ] local                      2834432 /692      1x open

--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-638-0500
1313 5th St SE, Suite 111              Fax:    612-638-0500
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
http://www.sistina.com

Current GPG fingerprint =3D 60F3 160D C0D5 2C4B 751B  4FF9 6F67 E9BC 44CD D=
E95

-----Begin Obligatory Humorous Quote----------------------------------------
"We succeed because our competitors are idiots" - anonymous
-----End Obligatory Humorous Quote------------------------------------------

--EVF5PPMfhYS0aIcm
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7lm9Vb2fpvETN3pURAvzaAJ90xUBKDbL4rwGxwsG1sNkGCPKRZACgqmJp
36oGMjib/v+qtcZF2hGdFmE=
=mA+2
-----END PGP SIGNATURE-----

--EVF5PPMfhYS0aIcm--
