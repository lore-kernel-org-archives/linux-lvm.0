From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Message-ID: <20030611213456.GC29685@lug-owl.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5G06lTa6Jq83wMTw"
Content-Disposition: inline
Subject: [linux-lvm] Problem with 2.5.x DM + LVM1 metadata
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
Date: Thu Jun 12 07:56:01 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--5G06lTa6Jq83wMTw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

I'm running a machine since quite some time with DM-patches 2.4.x and
LVM1 metadata PVs/VGs/LVs. It's a Debian box with lvm2-1.95.15 intalled.

Today, I tried to boot this machine with 2.5.70-bk16. Everything went
well (most of my machines run 2.5.x since some time, so I'm used to the
gotchas like modutils<-> module-init-tools etc.), but the 2.5.x DM seems
so cause problems. During "vgchange -a y" (called by init scripts), one
of my LVs cannot be activated. Here's the transcript of "/etc/init.d/lvm2
start" (which basically only consists of the vgchange call):
---------------------------------------------------------------------
Initializing LVM:   /dev/hdc2: open failed: No such device or address
  /dev/hdc3: open failed: No such device or address
  /dev/hda4: open failed: No such device or address
  /dev/hdc4: open failed: No such device or address
  /dev/hda5: open failed: No such device or address
  /dev/hda6: open failed: No such device or address
  /dev/hda7: open failed: No such device or address
  /dev/hda8: open failed: No such device or address
  /dev/hda9: open failed: No such device or address
  /dev/hda10: open failed: No such device or address
  /dev/hda11: open failed: No such device or address
  /dev/hda12: open failed: No such device or address
  /dev/hda13: open failed: No such device or address
  /dev/hda14: open failed: No such device or address
  /dev/hda15: open failed: No such device or address
  /dev/hda16: open failed: No such device or address
  /dev/hda17: open failed: No such device or address
  /dev/hda18: open failed: No such device or address
  /dev/hdc18: open failed: No such device or address
  /dev/hda19: open failed: No such device or address
  /dev/hdc19: open failed: No such device or address
  /dev/hda20: open failed: No such device or address
  /dev/hdc20: open failed: No such device or address
  /dev/hdd2: open failed: No such device or address
  /dev/hdd3: open failed: No such device or address
  /dev/hdd4: open failed: No such device or address
  /dev/hdd15: open failed: No such device or address
  /dev/hdd16: open failed: No such device or address
  /dev/hdd17: open failed: No such device or address
  /dev/hdd18: open failed: No such device or address
  /dev/hdd19: open failed: No such device or address
  /dev/hdd20: open failed: No such device or address
  /dev/hdc2: open failed: No such device or address
  /dev/hdc3: open failed: No such device or address
  /dev/hda4: open failed: No such device or address
  /dev/hdc4: open failed: No such device or address
  /dev/hda5: open failed: No such device or address
  /dev/hda6: open failed: No such device or address
  /dev/hda7: open failed: No such device or address
  /dev/hda8: open failed: No such device or address
  /dev/hda9: open failed: No such device or address
  /dev/hda10: open failed: No such device or address
  /dev/hda11: open failed: No such device or address
  /dev/hda12: open failed: No such device or address
  /dev/hda13: open failed: No such device or address
  /dev/hda14: open failed: No such device or address
  /dev/hda15: open failed: No such device or address
  /dev/hda16: open failed: No such device or address
  /dev/hda17: open failed: No such device or address
  /dev/hda18: open failed: No such device or address
  /dev/hdc18: open failed: No such device or address
  /dev/hda19: open failed: No such device or address
  /dev/hdc19: open failed: No such device or address
  /dev/hda20: open failed: No such device or address
  /dev/hdc20: open failed: No such device or address
  /dev/hdd2: open failed: No such device or address
  /dev/hdd3: open failed: No such device or address
  /dev/hdd4: open failed: No such device or address
  /dev/hdd15: open failed: No such device or address
  /dev/hdd16: open failed: No such device or address
  /dev/hdd17: open failed: No such device or address
  /dev/hdd18: open failed: No such device or address
  /dev/hdd19: open failed: No such device or address
  /dev/hdd20: open failed: No such device or address
  /dev/hdc2: open failed: No such device or address
  /dev/hdc3: open failed: No such device or address
  /dev/hda4: open failed: No such device or address
  /dev/hdc4: open failed: No such device or address
  /dev/hda5: open failed: No such device or address
  /dev/hda6: open failed: No such device or address
  /dev/hda7: open failed: No such device or address
  /dev/hda8: open failed: No such device or address
  /dev/hda9: open failed: No such device or address
  /dev/hda10: open failed: No such device or address
  /dev/hda11: open failed: No such device or address
  /dev/hda12: open failed: No such device or address
  /dev/hda13: open failed: No such device or address
  /dev/hda14: open failed: No such device or address
  /dev/hda15: open failed: No such device or address
  /dev/hda16: open failed: No such device or address
  /dev/hda17: open failed: No such device or address
  /dev/hda18: open failed: No such device or address
  /dev/hdc18: open failed: No such device or address
  /dev/hda19: open failed: No such device or address
  /dev/hdc19: open failed: No such device or address
  /dev/hda20: open failed: No such device or address
  /dev/hdc20: open failed: No such device or address
  /dev/hdd2: open failed: No such device or address
  /dev/hdd3: open failed: No such device or address
  /dev/hdd4: open failed: No such device or address
  /dev/hdd15: open failed: No such device or address
  /dev/hdd16: open failed: No such device or address
  /dev/hdd17: open failed: No such device or address
  /dev/hdd18: open failed: No such device or address
  /dev/hdd19: open failed: No such device or address
  /dev/hdd20: open failed: No such device or address
  /dev/hdc2: open failed: No such device or address
  /dev/hdc3: open failed: No such device or address
  /dev/hda4: open failed: No such device or address
  /dev/hdc4: open failed: No such device or address
  /dev/hda5: open failed: No such device or address
  /dev/hda6: open failed: No such device or address
  /dev/hda7: open failed: No such device or address
  /dev/hda8: open failed: No such device or address
  /dev/hda9: open failed: No such device or address
  /dev/hda10: open failed: No such device or address
  /dev/hda11: open failed: No such device or address
  /dev/hda12: open failed: No such device or address
  /dev/hda13: open failed: No such device or address
  /dev/hda14: open failed: No such device or address
  /dev/hda15: open failed: No such device or address
  /dev/hda16: open failed: No such device or address
  /dev/hda17: open failed: No such device or address
  /dev/hda18: open failed: No such device or address
  /dev/hdc18: open failed: No such device or address
  /dev/hda19: open failed: No such device or address
  /dev/hdc19: open failed: No such device or address
  /dev/hda20: open failed: No such device or address
  /dev/hdc20: open failed: No such device or address
  /dev/hdd2: open failed: No such device or address
  /dev/hdd3: open failed: No such device or address
  /dev/hdd4: open failed: No such device or address
  /dev/hdd15: open failed: No such device or address
  /dev/hdd16: open failed: No such device or address
  /dev/hdd17: open failed: No such device or address
  /dev/hdd18: open failed: No such device or address
  /dev/hdd19: open failed: No such device or address
  /dev/hdd20: open failed: No such device or address
  device-mapper ioctl cmd 2 failed: No such device or address
  Couldn't load device 'storage_vg-public_storage_lv'.
  /dev/hdc2: open failed: No such device or address
  /dev/hdc3: open failed: No such device or address
  /dev/hda4: open failed: No such device or address
  /dev/hdc4: open failed: No such device or address
  /dev/hda5: open failed: No such device or address
  /dev/hda6: open failed: No such device or address
  /dev/hda7: open failed: No such device or address
  /dev/hda8: open failed: No such device or address
  /dev/hda9: open failed: No such device or address
  /dev/hda10: open failed: No such device or address
  /dev/hda11: open failed: No such device or address
  /dev/hda12: open failed: No such device or address
  /dev/hda13: open failed: No such device or address
  /dev/hda14: open failed: No such device or address
  /dev/hda15: open failed: No such device or address
  /dev/hda16: open failed: No such device or address
  /dev/hda17: open failed: No such device or address
  /dev/hda18: open failed: No such device or address
  /dev/hdc18: open failed: No such device or address
  /dev/hda19: open failed: No such device or address
  /dev/hdc19: open failed: No such device or address
  /dev/hda20: open failed: No such device or address
  /dev/hdc20: open failed: No such device or address
  /dev/hdd2: open failed: No such device or address
  /dev/hdd3: open failed: No such device or address
  /dev/hdd4: open failed: No such device or address
  /dev/hdd15: open failed: No such device or address
  /dev/hdd16: open failed: No such device or address
  /dev/hdd17: open failed: No such device or address
  /dev/hdd18: open failed: No such device or address
  /dev/hdd19: open failed: No such device or address
  /dev/hdd20: open failed: No such device or address
  0 logical volume(s) in volume group "nfsroot_vg" now active
  1 logical volume(s) in volume group "storage_vg" now active
lvm2.
---------------------------------------------------------------------

storage_vg should contain 2 LVs, nfsroot_vg currently doesn't hold any
LVs. Any hints on this? Or more infos?

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--5G06lTa6Jq83wMTw
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE+56CAHb1edYOZ4bsRAjdMAJ9bGOgGAr3SCrpXRWhjJHVuQ5zyWgCePTnG
rWG4fhVkbdx31II05pq8zAU=
=Sr4g
-----END PGP SIGNATURE-----

--5G06lTa6Jq83wMTw--
