Return-Path: <bg@blacknet.de>
Date: Wed, 6 Jun 2001 23:26:20 +0200
From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] Switching one of my disks to hdc from hdb
Message-ID: <20010606232620.B6704@dragon.blacknet.de>
References: <01060621061602.01075@notch>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="kORqDWCi7qDJ0mEj"
Content-Disposition: inline
In-Reply-To: <01060621061602.01075@notch>; from pwk.linuxfan@gmx.de on Wed, Jun 06, 2001 at 09:06:16PM +0200
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

--kORqDWCi7qDJ0mEj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


On Wed, Jun 06 '01 at 21:06, Peter Kirk wrote:
> since some of you told me my Setup with two stripped disks on hda and hdb=
 was=20
> broken, I would like to put my second disk (/dev/hdb) on the second Contr=
oler=20
> (/dev/hdc) instead of my DVD Drive. Now my question is: What do I have to=
=20
> change, in order not to distroy my linux installation in the process ??
Well, as I don't know your current configuration to well, it's just
pocking in the dark ...

If your drives are PVs in one VG, that's not the root system, all you
need to do is:
- do a clean shutdown
- change drives
- boot again
- run vgscan (should find your PVs and pack them into one VG)  (*)
- run vgchange -a y (should activate your VG)                  (*)
- mount all LVs in the VG

For me the two steps marked with (*) are done in a initrd and the system=20
would even support changing the root's LV, as long as the /boot stays
untouched.

My setup is like this:

/dev/hda1: 64MB /boot
/dev/hda2: rest MD0 disk1 (raid 1)

/dev/hdc1: 64MB unused
/dev/hdc2: rest MD0 disk2 (raid 1)

/dev/hde1: PV1
/dev/hdg1: PV2

/dev/hdi1: PV3
/dev/hdk1: PV4

/dev/md0: PV0

VG0: PV0
VG1: PV1 PV2
VG2: PV3 PV4

hda and hdc are 40GB IBM drives, hd[e-h] were 60GB Maxtor drives.

I'm running a full system out of different LV in VG0 (even root is a LV,
only /boot is extra, with inird)

Lately I get a 3ware Escalade controller and moved hd[e-h] there. All I
had to do was:
- change initrd to load the 3ware driver (run lilo to install new
  initrd)
- shutdown, install card, move drives, (remove additional IDE
  controllers), reboot
- initrd detected all PVs and constructed all my VGs, system still ran
  fine (you might to have to copy the newly detected configuration from
  /initrd/etc/lvm to /etc/lvm after boot)

(Actually I did it a little different: shutdown, install 6 new 80GB
drives, make a RAID5 with this drives, shutdown, add two drives out of=20
VG1, boot (VGs detected on sd[gh]), make PV5 out of RAID5 array, make=20
VG3 with just this PV5, copy all the data from VG1's LV to LVs on VG3,
shutdown, remove drives, add drives from VG2, do the same as with VG1,
shutdown, remove drives, boot, migration done, system works, all fine.)

    Goetz.

--kORqDWCi7qDJ0mEj
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7Hp/7f5srOMkjkQoRAu9wAJ9aFFyKlRfj8ebh+Va7n3jh9JNg5QCgyw74
McPPRCTyqGJIz6YwSpcbJh8=
=Z4Uz
-----END PGP SIGNATURE-----

--kORqDWCi7qDJ0mEj--
