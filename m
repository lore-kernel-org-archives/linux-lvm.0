Return-Path: <bagfors@bagfors.nu>
Message-Id: <200102220906.KAA25228@detrius.engohol.se>
Subject: Re: [linux-lvm] lvm on a brand-new server
From: Erik =?ISO-8859-1?Q?B=E5gfors?= <erik@bagfors.nu>
In-Reply-To: <Pine.GSO.4.21.0102211227040.17882-100000@isis.visi.com>
Content-Transfer-Encoding: quoted-printable
Date: 22 Feb 2001 10:06:43 +0100
Mime-Version: 1.0
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On 21 Feb 2001 12:34:19 -0600, Timothy Wilson wrote:
> Hi everyone,
>=20
> I'm just starting out learning about lvm and I have a couple questions.
>=20
> First, a description of the machine:
>=20
> Compaq DL380 933 MHz PIII (rack-mount) w/ 640 MB RAM and (2) 18 GB SCSI
> disks. The machine has Compaq's built-in hardware RAID controller. My pla=
n
> is to mirror the two disks using RAID.
>=20
> I'd like to use LVM (and likely ReiserFS) on this box, but I'm not sure h=
ow
> to get it installed on a bare system. I'll likely be using Debian on this
> system.
>=20
> Can anyone suggest a basic outline of the process? I'm certain there's a =
lot
> more reading to do, but I'm not sure where to start. (I have looked over =
the
> LVM How-to and the FAQ.)


This is what I did.

* Compile a 2.4.x-kernel with lvm and reiserfs (make-kpkg is your
friend)
* Create tar-balls or debian-packages of the lvm-tools and
reiserfs-tools (at least mkreiserfs)=20
* Start the debian-install
* Create a 100-200 MB partition that's ext2
* Create a Swap-partition
* Keep installing untill you get to the point where you should start to
choose packages.
* Go to another terminal and install the kernel-package and the lvm- and
reiserfs-tools.
* Reboot.
* Run fdisk, pvcreate and vgcreate
* Create lv's for /usr, /var, /tmp and whatever else you want.
* For each of them mount them under /mnt and do a cp -a from each of
/usr, /tmp and so on
* mv usr usr.old; mount /dev/disk_vg/usr_lv /usr.  Or whatever you named
your vg and lv.
  do the same for /var, /tmp and so on
* Make sure /tmp has the right permissions :)
* edit /etc/fstab
* run cd /; umount -a and check that everything is unmounted, then run
mount -a to make sure   you edited /etc/fstab correct

Now you have  a system with a 100-200 MB / that's ext2 and a /usr, /var
/tmp and so on that's on lvm.  Make sure lvm is initialized correctly on
bootup.

If you like to go reiserfs all the way simply create a lv for the swap,
reformat the swap-partition to reiserfs and copy everything in the /
partition to it.  Edit your /etc/lilo and /etc/fstab to use the correct
partition.  Make sure you have the latest and greatest lilo.  Run lilo
and reboot.

Now you can reuse the old ext2 / partition as a swappartition or
whatever you want.

Doing it like this means that you are not running / on lvm but I don't
see that as a problem since it's a real small filesystem anyway.

I think I saw somewhere someone made a reiserfs-enable
debian-installdisk but I haven't tried it myself.

Online resize works great with reiserfs which is REALLY nice.=20

/Erik

--=20
Erik B=E5gfors               | http://erik.bagfors.nu/   =20
erik@bagfors.nu            | Erik.Bagfors@engohol.se
Supporter of free software | GSM +46 733 279 273
fingerprint: 6666 A85B 95D3 D26B 296B 6C60 4F32 2C0B 693D 6E32
