From: "Chad C. Walstrom" <chewie@wookimus.net>
Subject: Re: [linux-lvm] Mandrake 8.1 and LVM
Message-ID: <20011130020118.C17482@wookimus.net>
References: <Pine.LNX.4.21.0111291649440.435-100000@sol.rune.org> <Pine.LNX.4.33.0111291608480.4437-100000@lx1.daboard.com> <20011129190920.B23998@kluge.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f0KYrhQ4vYSV2aJu"
Content-Disposition: inline
In-Reply-To: <20011129190920.B23998@kluge.net>
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
Date: Fri Nov 30 01:59:01 2001
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--f0KYrhQ4vYSV2aJu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 29, 2001 at 07:09:20PM -0500, Theo Van Dinter wrote:
> My rule of thumb for disk layout on a server is:
> 	/boot	- Small, usually 32-128MB, don't run out of space here.

Good.

> 	/	- I put /usr in here since there's no reason not to any
> 		  longer.  So this will be any size you think is
> 		  appropriate.	I will usually put anywhere from 4-8GB
> 		  here, depending on disk size.  These files should be
> 		  static-ish, no major changed here.  Don't let it hit 100%.

Reason #1:  Mount /usr as read-only.  There is only one reason why you
should mount /usr read/write: to install software.  Upon completion of
this one task, remount the drive as read-only.  Lock it down with kernel
capabilities tools, and be done with it.  [apt-get has a nice way to
auto-remount the drive in apt.conf(5) when installing/upgrading
software.]

That being said, I suppose there's not a whole lot holding you back from
mounting "/" as read-only, either.  Perhaps /etc/mtab would be an
annoyance, but if you symbolically link it to /proc/mounts, you could
fake it.

Reason #2:  With LVM, you don't have to worry about exceeding the
standard "allowed" harddrive partitions.  So, create logical volumes to
your heart's (*ahem*) extent.  With filesystem and logical volume
resizing, the flexibility and convenience outweight the small
"overhead."

Reason #3: It's just plain strange to have / share space with /usr.

Reason #4: For someone new to Linux, LVM provides you with the
opportunity to correct a mistake without having to reinstall your system
because you'd prefer a different harddrive partition layout.

OK, so that got into some more generic reasons to use LVM rather than to
give guideance on how/what/when/where/why to patition a certain way.
Experiment, have fun.  With LVM, you can afford to play in order to find
that "perfect" balance of partitioning and practicality.

--=20
Chad Walstrom <chewie@wookimus.net>                 | a.k.a. ^chewie
http://www.wookimus.net/                            | s.k.a. gunnarr
Key fingerprint =3D B4AB D627 9CBD 687E 7A31  1950 0CC7 0B18 206C 5AFD


--f0KYrhQ4vYSV2aJu
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE8BzzODMcLGCBsWv0RAsCoAJ9EFnYMe3Yo9J7tkFDNqltpRA+OdgCfR0fs
ZIY0FwrMqXsKu6Lo6GfFwcI=
=t0xj
-----END PGP SIGNATURE-----

--f0KYrhQ4vYSV2aJu--
