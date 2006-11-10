Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kAAJsPia024022
	for <linux-lvm@redhat.com>; Fri, 10 Nov 2006 14:54:25 -0500
Received: from dark-templar.advansoft.us ([166.70.63.214])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kAAJsO3M013503
	for <linux-lvm@redhat.com>; Fri, 10 Nov 2006 14:54:24 -0500
Received: from [10.100.0.195] (class1-nat.gurulabs.com [67.137.148.4])
	by dark-templar.advansoft.us (Postfix) with ESMTP id 93257687BE
	for <linux-lvm@redhat.com>; Fri, 10 Nov 2006 12:23:03 -0700 (MST)
From: "Lamont R. Peterson" <peregrine@openbrainstem.net>
Subject: Re: [linux-lvm] LVM groups not visible
Date: Fri, 10 Nov 2006 12:22:25 -0700
References: <1163152099.2961.68.camel@laguna.nwhq.nl>
	<02ac015d0526931d1024f1549d98a49c@redhat.com>
	<1163174415.2961.95.camel@laguna.nwhq.nl>
In-Reply-To: <1163174415.2961.95.camel@laguna.nwhq.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1262975.0cZtUGzdtb";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200611101222.30052.peregrine@openbrainstem.net>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM <linux-lvm@redhat.com>

--nextPart1262975.0cZtUGzdtb
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Friday 10 November 2006 09:00am, J.L. Blom wrote:
> On Fri, 2006-11-10 at 09:27 -0600, Jonathan E Brassow wrote:
> > I can't imagine putting LVM on a USB drive...  Are you sure LVM is even
> > involved here?
> >
> > You can type 'mount' or 'df' at the command prompt.  That will tell you
> > how the usbdisk is mounted.  If it is mounted from /dev/sda1 - then
> > there is no LVM in the mix.
> >
> >   brassow
>
> Jonathan,
> Thanks for your reply.
> I didn't know that an USB disk couldn't be used for logical volumes as
> pvcreate and lvcreate did not complain.
> However, when I now do a lvscan it gives me:
> _______________________________________
> [root@laguna ~]# lvscan
>   Couldn't find device with uuid
> 'G6vIxd-bp54-0zd0-PKzf-WI31-xPmr-qoeFAT'.
>   Couldn't find all physical volumes for volume group VolGroup00.
>   Couldn't find device with uuid
> 'G6vIxd-bp54-0zd0-PKzf-WI31-xPmr-qoeFAT'.
>   Couldn't find all physical volumes for volume group VolGroup00.
>   Volume group "VolGroup00" not found
>   ACTIVE            '/dev/VolGroup01/LogVol00' [9.75 GB] inherit
>   ACTIVE            '/dev/VolGroup01/LogVol02' [9.75 GB] inherit
>   ACTIVE            '/dev/VolGroup01/LogVol03' [4.88 GB] inherit
>   ACTIVE            '/dev/VolGroup01/LogVol04' [9.75 GB] inherit
>   ACTIVE            '/dev/VolGroup01/LogVol05' [9.75 GB] inherit
>   ACTIVE            '/dev/VolGroup01/LogVol01' [9.75 GB] inherit
> _________________________________________________________________
> As VolGroup00 is on the USB disk which I just had connected.

Looks like the USB device wasn't plugged in when the box was booted, perhap=
s?

> df gives:
> _____________________________________
> /dev/mapper/VolGroup01-LogVol00
>                        9903432   1035860   8356392  12% /
> /dev/hda1                99043     25640     68289  28% /boot
> tmpfs                   512492         0    512492   0% /dev/shm
> /dev/mapper/VolGroup01-LogVol02
>                        9903432   1789628   7602624  20% /home
> /dev/mapper/VolGroup01-LogVol03
>                        4951688   4137648    558452  89% /usr
> /dev/mapper/VolGroup01-LogVol04
>                        9903432    342224   9050028   4% /usr/local
> /dev/mapper/VolGroup01-LogVol05
>                        9903432    761312   8630940   9% /var
>
> /dev/sda1            240362656  38037368 190115488  17% /media/disk
> ___________________________________________________
>
> and fdisk says:

Next time, try running "fdisk -l /dev/sda" (or just "fdisk -l" to see all o=
f=20
them).

> _____________________________________________________
> The number of cylinders for this disk is set to 30400.
> There is nothing wrong with that, but this is larger than 1024,
> and could in certain setups cause problems with:
> 1) software that runs at boot time (e.g., old versions of LILO)
> 2) booting and partitioning software from other OSs
>    (e.g., DOS FDISK, OS/2 FDISK)

Standard thing to see.  It's a mostly stupid warning these days, as every=20
desktop & notebook motherboard made in the past 8 years (or so) has LBA=20
support out of the box, so it isn't an issue.  In other words, you can just=
=20
ignore that.

> Warning: invalid flag 0x0000 of partition table 4 will be corrected by
> w(rite)

That sometimes happens when the partition table was initially created by so=
me=20
other tool (like Windows, or Partition Magic), as they don't all do exactly=
=20
the same thing with some parts of it.  Given that the "offending" flag's=20
value was 0x0000, I think it be that it was just never set by the other too=
l.

However, that's not why this is happening in this case (read the next bit t=
o=20
see what's up).

> Command (m for help): p
>
> Disk /dev/sda1: 250.0 GB, 250056705024 bytes
> 255 heads, 63 sectors/track, 30400 cylinders
> Units =3D cylinders of 16065 * 512 =3D 8225280 bytes
>
>      Device Boot      Start         End      Blocks   Id  System
>
> Command (m for help): q

This is blank because you are trying to read a partition table from the 1st=
=20
partition.  You ran "fdisk /dev/sda1" not "fdisk /dev/sda" as it should hav=
e=20
been.  I hate it when I do that :) .

> ______________________________________
> So I'm at a loss how this is possible. The disk can be reached but
> neither lvm nor fdisk can tell me what's on the disk,

Since it's a USB disk, I would guess that it wasn't inserted when you boote=
d=20
your box.  So, when LVM was being set up by /etc/rc.sysinit, it didn't find=
=20
that device.  If you did another "pvscan" after inserting the USB disk, it=
=20
might find it.

I already covered the problem with fdisk.

> Can you perhaps shine some light on it?

OK.  Overall, I wouldn't bother trying to use LVM with a removable drive=20
(USB/Firewire hard drives, keychain drives, etc.).  I can think of one=20
possibly viable way of doing it, but I still probably wouldn't even in that=
=20
case, because it wouldn't really give you any benefits.

So, if you have already included the USB drive into your VG(s), get everyth=
ing=20
plugged in, make sure pvdisplay, vgdisplay, lvscan and friends are all happ=
y,=20
then run "pvmove /dev/sda1".  This will move any data you may have on there=
=20
to other drives (the one built in to your box).

In this thread, everyone has been *assuming* that your USB disk is /dev/sda=
=2E =20
If your main hard drive is SATA or SCSI, it very well could be /dev/sda and=
=20
your USB drive could be /dev/sdb or some other device; i.e., the last lette=
r=20
in the device name could be 'a', 'b', 'c', etc.  Run "fdisk -l" to see a li=
st=20
of all the hard drives your system currently sees without the USB drive=20
plugged in, then plug it in and re-run "fdisk -l" and the extra one the=20
second time is your USB drive.  Make sure you use the correct device name i=
n=20
your pvmove command.

Once the pvmove command is finished, you can safely "redo" your USB device.=
 =20
If it's a hard drive, format it with ext3 or reiserfs or jfs or xfs (as you=
=20
prefer).  If it's a flash device, I would recommend that you look at using=
=20
JFFS2 for the filesystem.  Either way, make sure that the "type" (i.e. Syst=
em=20
ID) of the partition on your USB device is "83" (for regular Linux=20
filesystems) and not "8e" (which is for Linux LVM PVs).

> (sorry for the long mail).

np.  HTH.

[snip]
=2D-=20
Lamont Peterson <peregrine@OpenBrainstem.net>
=46ounder [ http://blog.OpenBrainstem.net/peregrine/ ]
GPG Key fingerprint: 0E35 93C5 4249 49F0 EC7B  4DDD BE46 4732 6460 CCB5
  ___                   ____            _           _
 / _ \ _ __   ___ _ __ | __ ) _ __ __ _(_)_ __  ___| |_ ___ _ __ ___
| | | | '_ \ / _ \ '_ \|  _ \| '__/ _` | | '_ \/ __| __/ _ \ '_ ` _ \
| |_| | |_) |  __/ | | | |_) | | | (_| | | | | \__ \ ||  __/ | | | | |
 \___/| .__/ \___|_| |_|____/|_|  \__,_|_|_| |_|___/\__\___|_| |_| |_|
      |_|               Intelligent Open Source Software Engineering
                              [ http://www.OpenBrainstem.net/ ]

--nextPart1262975.0cZtUGzdtb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQBFVNF2vkZHMmRgzLURAtRuAJ46hRcqnC/kMQfvHZIyusuJ0ZAzMACcCbob
r0Dt7/W6DJFPXzW5427kC2I=
=4Nvp
-----END PGP SIGNATURE-----

--nextPart1262975.0cZtUGzdtb--
