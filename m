Return-Path: <bg@blacknet.de>
Date: Thu, 28 Jun 2001 22:28:56 +0200
From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] HowTo: EIDE/ATA-100 + RAID 1 + LVM
Message-ID: <20010628222856.E16466@dragon.blacknet.de>
References: <03b201c0fff4$aa4007c0$01e6a8c0@oulx>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="AsxXAMtlQ5JHofzM"
Content-Disposition: inline
In-Reply-To: <03b201c0fff4$aa4007c0$01e6a8c0@oulx>; from emmanuel.blot@ireland.sun.com on Thu, Jun 28, 2001 at 06:06:25PM +0100
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

--AsxXAMtlQ5JHofzM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


On Thu, Jun 28 '01 at 18:06, Emmanuel Blot wrote:
> I have to set up a server, and I'd like to know if it's possible=20
yes
> - and reliable- to setup a server with RAID 1 (mirrored disk) with a=20
perhapes
> pure software solution (not RAID controller) and LVM
>=20
> [ ... ]
> * motherboard: Asus with AMD760 + DDR (Athlon Thunderbird)
I don't know about the reliability of the AMD760 ATA100 port, the VIA
one is pritty screwed. If you can you should perhapes get a prommise
ATA100 controller.
> [ ... ]

> - Any other suggestion
Just a few hints and MHO:
- use just one drive per channel (e.g. /dev/hda and /dev/hdc not hdb)
- the 2.4.x series of linux kernels is called stable but probably not
  realy ready for primetime yet. (mainly VM problems)
- with 2.2.x the softraid drivers are a lot older (e.g. not so reliable)
  and you'd have to create your own patches. and the stock 2.2.x kernel
  does not come with the new IDE drivers. But 2.2.x is more stable.
- always get the latest LVM patches, if you can wait for 1.0
- never try RAID on top of LVM. This is nice for testing, but I can't
  see why you might want to do this.=20
- If you can partition your disk like this:
  128MB   /dev/hd[ac]1  /boot   for savety put boot /onto its own partition
  (2x)RAM /dev/hd[ac]2  swap    putting swap onto raid does not make
                                sence to me. The 2.4.x kernel NEEDS
                                twice the ammound of RAM as swap. The
                                kernel can do raid0 with swap partitions
                                (on its own)
  rest    /dev/hd[ac]3  md0     put the rest into a RAID1 device

  make /dev/md0 the only PV, with your VG in it.
- put some recovery tools into /boot (this will not realy help you if
  your server stands to far away, but perhapes you can attach a serial
  console connected to a different box ...)
- while the newest LILO beta can boot from a raid1 device, I would not
  stress it and just put one individual version /boot on each harddrive
  (with it's own bootloader) and handsync them (e.g. rsync). You should
  not have to much changes to the /boot partition, so I think this is
  ok.
- after the installation, make a full backup and than realy beat the
  system (focus on the ATA controller, cabeling, disks) to check it.
  Silent data corruption realy sucks, if it results from bad cabeling
  not even RAID will help you.
(- don't use SUSE if you can. Ok, well ignore this, this is just MVHO)

--=20
Goetz Bock                                              IT Consultant
Dipl.-Inf. Univ.

--AsxXAMtlQ5JHofzM
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7O5OIf5srOMkjkQoRAt4bAJ4lvW8LOWwW6nonjhx0cq7AC7BSvwCeMsxz
7GLffFcP5jJwzrU23XjdDUA=
=ZR+D
-----END PGP SIGNATURE-----

--AsxXAMtlQ5JHofzM--
