From: M.Ritzert@CENIT.DE
Message-ID: <F1138FCB1C61D211AA690004AC6289EA015A8EEC@ntss15.stgt.cenit.de>
Subject: AW: [linux-lvm] LVM in stock kernel!?
Date: Fri, 27 Aug 1999 00:04:24 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@msede.com



> -----Urspr=FCngliche Nachricht-----
> Von:	S. Ryan Quick [SMTP:ryan@phaedo.com]
> Gesendet am:	Thursday, 26. August 1999 21:29
> An:	Mats linux-lvm@msede.comWichmann
> Cc:=09
> Betreff:	Re: [linux-lvm] LVM in stock kernel!?
>=20
> -----BEGIN PGP SIGNED MESSAGE-----
>=20
> On Thu, 26 Aug 1999, Mats Wichmann wrote:
>=20
> [deletia]
>=20
> While I think the GUI thing is nice, and as a proponent of the =
VERITAS
> Volume Manager despite a great affinity for IBM's
> LVM, I have to say that the GUI inevitably leaves some small, but
> super-crucial piece out.  As a long time AIX and Veritas
> consultant, I have to say I long ago gave up both smit and vxva in =
favor
> of the good old CLI.  I think that giving Linux LVM
> a gui might eventually prove useful, but right now, I think it better =
to
> develop as many CLI tools as possible and stabilize
>=20
Well, please not too many. BTW, which tools do You consder missing =
except
mabe those to resize file systems?
As far as i remember, the equivalents to the AIX cli commands to amage
physical and logical volumes are all there, and file systems are, =
strictly
spoken, a different issue. One could easily consider running LVM on UFS =
or
the (hopefully) forthcoming
journaled file system SGI has just contributed to linux instead of good =
old
ext2.



> the code.  I want to see Oracle start recommending LVM (on Debian -- =
I'm
> tired of all this redhat stuff, hehehe) as a
> definite boost.
>=20
My impression is that the major companies are a bit unaware of debian =
and
recognize only Redhat and partly Suse (which i'm tired of), at least =
Oracle,
IBM, SGI and HP. But isn't this a bit off topic here?

> Some other Pros to add:
>=20
> Integration with IBM's ADSM backup allows Linux machines to be backed =
up
> "snapshot" style by simply syncing volumes and
> grabbing volume data.
>=20
How do You integrate with ADSM (except over NFS)? As far as i know, =
only the
ADSM client is supported on Linux.

> The ability to add a sort of volume log allows almost instant volume
> resyncing while maintaining an active data volume.
>=20
> The (unique) ability to use either physical disks or partitions (and =
even
> flat files via the loopback device) allows for a
> very flexible Volume Group makeup (e.g. I don't get stuck having to
> allocate all of that 18GB drive to a volume when I only
> need 4GB of it, etc.).  NOTE:  This does add some cons when it comes =
to
> deporting (exporting) volumes and migrating disks,
> but it should be easy enough to overcome.
>=20
Finally: i have the impression that the major arguments of the =
necessity of
LVM support in the stock linux kernel=20
have been brought up for several times now. What about summing them up =
and
collecting the Names of the contributors to this thread into the note =
to be
sent to Linus?

Michael

> Ryan
>=20
> >=20
> >=20
>=20
> %                                                       %%%%%%%%%%
> %%           S. Ryan Quick                               %%%%%%%%%
> %%%           UNIX Systems Engineer                       %%%%%%%%
> %%%%           Phaedo Consulting, Inc. -- Exec VP          %%%%%%%
> %%%%%                                                       %%%%%%
> %%%%%%         www.phaedo.com/ryan/  ryan@phaedo.com         %%%%%
> %%%%%%%       ------------ PGP FingerPrint -------------      %%%%
> %%%%%%%%  CF 19 6B BA 31 8E B8 8E  20 DF 4F 2B 2E 69 81 F5     %%%
> %%%%%%%%%     ------------------------------------------        %%
> %%%%%%%%%%                                                       %
>=20
> -----BEGIN PGP SIGNATURE-----
> Version: 2.6.3a
> Charset: noconv
>=20
> iQCVAwUBN8WVZPUYDAQiV+tNAQGCUAP+OOrbJdssjX+D3FUCtM4+BmrZy4nPYCh+
> lcPS2QNCfU96YI9XAuVcs/e33JkQB/ZTJw41q+dnSLKUi1RvIKy8xx2OfJ7HFKFB
> 7wmmM+WunHlcAj0xn72qvL2RhsDUE2VHM8LsaByOPtvxyMbXYctEg22fRNV7sEAL
> 9nJiqqdiw+U=3D
> =3DFjWD
> -----END PGP SIGNATURE-----
