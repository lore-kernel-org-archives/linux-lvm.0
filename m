From: Ben Lutgens <blutgens@sistina.com>
Subject: Re: [linux-lvm] EXT2 to EXT3 LVM volume on Redhat
Message-ID: <20020604203127.GE3857@rtfm.sistina.com>
References: <006001c20c05$0a41cf10$0300000a@STATION>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qtZFehHsKgwS5rPz"
Content-Disposition: inline
In-Reply-To: <006001c20c05$0a41cf10$0300000a@STATION>
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
Date: Tue Jun  4 15:30:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--qtZFehHsKgwS5rPz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2002 at 10:18:49PM +0200, Aslak Sommerfelt Skretting wrote:
>As far as i can understand a simple:
>
>tune2fs -j /dev/storage/space

Yup. I've done this many times with no problems.=20

>
>would create a new journal file, and convert the filesystem to ext3. and a:
>
>tune2fs -i 0 /dev/storage/space
>
>would disable the fsck's that occur now and then (and takes an insane amou=
nt
>of time on a 650gb filesystem), and are no longer necessary since the
>filesystem is EXT3.

Don't presume that because it's EXT3 that fscks are no longer necessary.
Only thing the journal guarantees is that your metadata won't become
corrupt (i think journal=3Ddata mount option fixes this but will affect
performance and not neccessarily badly). If your filesystem has been
shutdown cleanly many many times you could still has some loss. A fsck
should take care of that.

>and then everything would be ok? or is there more that need to be done?

take backups.
take backups.
take backups.
take backups.

:-)

>
>Is this a complicated process that i might just as well avoid in order not
>to damage my data? Or is this pretty straightforward?

It's pretty straight forward. Did I mention to make sure you have backups?
Oh and the other concern is that you want to make sure you backup before
you get carried away ;-)

Can you tell my tape drive has saved my life and my job once or twice ;-)

--=20
Ben Lutgens				 | http://people.sistina.com/~blutgens/=09
System Administrator	 | http://www.sistina.com/
Sistina Software Inc. |=20

"I got a wife and kids too but you don't see me out here stealing Imperial
Droids now do ya?"

--qtZFehHsKgwS5rPz
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iQEVAwUBPP0jn2mpewRYVtAFAQLuJgf/eUNPnT/YAil8IU+4eNjA1nIeDD5agJH4
UBpGvDsxw073v2n4lN2JuZZjPc7uK+xPxfwRv9TYZQ30jc8waZcGR2wMAki8IR21
Bpb+5hp9AXM0XOfoXzxMKITBEE2s8XgLfLKXU3YKoqqRbIiyCGkUEOV57163eVEB
ccdY193sPNaCKSeuGBcFjfth/v4xMFcrdh33tmbr9lHYuCO0LTKfswspYSWUJ/Ew
+biOuzOBL6eyjoE/+Cn396sfl6MlYQ5p/jqRPOGVegfBWyXwUW4Hhm7K9cgdiLsE
An84M3qrGMj3OkX+5CnLTyc9tWOgSYL/i55ixfm1OBRtNcsSgT6q1Q==
=uRUI
-----END PGP SIGNATURE-----

--qtZFehHsKgwS5rPz--
