Date: Wed, 11 Oct 2000 10:57:16 -0700
From: Charles Duffy <cduffy@mvista.com>
Subject: Re: [linux-lvm] lvdisplay disagrees with df for resized LV
Message-ID: <20001011105716.A1483@mvista.com>
References: <m2u2ajmunl.fsf@puma.redeye> <20001011084555.A6983@omnifarious.mn.org> <m23di3l4ux.fsf@puma.redeye>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="WIyZ46R2i8wDzkSu"
Content-Disposition: inline
In-Reply-To: <m23di3l4ux.fsf@puma.redeye>; from andy@redeye.com on Wed, Oct 11, 2000 at 05:28:22PM +0100
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@msede.com


--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 11, 2000 at 05:28:22PM +0100, Andy Cowling wrote:
> Thanks to all for your help. I'm using reiserfs and on SuSE 7.0, the
> resize utility was hidden away in /sbin/resize_reiserfs.
>=20
> I have resized the file system to 90G successfully but, there always a
> but isn't there :-), df now reports a total of 88Gb.
>=20
> Out of interest is this due to rounding or reisfer/LVM housekeeping ?

FYI, reiserfs can also be resized online (at least, the current
2.4-beta versions) w/ a command like the following:

mount -o remount,resize=3D[NEWSIZE] filesystem

I can't speak authoritatively about the missing 2G, but you can
compare the LVM's allocated size (use vgdisplay to see how many PEs
are allocated and what their size is) to the size of the filesystem
reported by debugreiserfs.

Also note that some earlier versions of reiserfs had some issues which
resulted in inaccurate results from du; however, I don't know of any
issues offhand which affected df's results.

--WIyZ46R2i8wDzkSu
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.3 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE55Kn8r/O29KUQmJURApVHAKCQ7NS6xiY772FxtWwevf0ixGTVQgCgjV7r
Kqshx3egKXUdyVC6B+k3F4k=
=voNK
-----END PGP SIGNATURE-----

--WIyZ46R2i8wDzkSu--
