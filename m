Return-Path: <eli@zendo.net>
Date: Thu, 26 Jul 2001 12:02:50 -0500
From: Eli Criffield <eli@zendo.net>
Message-ID: <20010726120250.A11839@zendo.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline
Subject: [linux-lvm] 100% LVM 100% reiserfs success story
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
Cc: Mi Un Kim <Mi_Un_Kim/CDC/UNO/UNEBR@unomail.unomaha.edu>, Josh <skulcap@mammoth.org>, Jay Hannah <jay@jays.net>, "W. Mark Hagler" <hagler@th.in.gs>

--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


I have successfully migrated my entire system to LVM and reiserfs.

I have one ide disk, (/dev/hda) and on that disk i have 1 partition
(/dev/hda1). That partition is type 8e (Linux LVM). I have no non lvm=20
/boot partition for the kernel or initird image.=20

# fdisk -l
Disk /dev/hda: 240 heads, 63 sectors, 2586 cylinders
Units =3D cylinders of 15120 * 512 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/hda1             1      2586  19550128+  8e  Linux LVM

# df     =20
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/rootvg/root_lv     307184    111008    196176  37% /
/dev/rootvg/boot_lv      53240     39820     13420  75% /boot
/dev/rootvg/usr_lv     2097084   1562720    534364  75% /usr
/dev/rootvg/var_lv      716772    339836    376936  48% /var
/dev/rootvg/home_lv    4194172   2834836   1359336  68% /home


How did you do that you ask?

Well it's a big pain in the ass. But hears the short story.

I used rpms when i could. First thing i installed was
reiserfs-utils-3.x.0f-1.i386.rpm for the reiserfs stuff and installed all
of the lvm 0.9.1_beta7 rpms.=20

I then downloaded linux-2.4.6 and patched it with the patch program from
the lvm patchgen rpm.
I configured the kernel to have LVM, reiserfs, minix, iso9660 and my
ethernet driver all as non modules. (important later)

After doing it the hard way and trashing a couple file systems and not
being able to boot a couple of times  i found that there are two more
patches that need to be applied before you are done with the kernel
One is
ftp://ftp.sistina.com/pub/LVM/0.9.1_beta/lvm_0.9.1_beta7-get_hardblocksize.=
patch
This fixed the 'undefined reference to `get_hardblocksize'' error when
compiling.

I did not apply this patch, i instead edited it all manually but I'm sure
the patch would be easer.

You also need to add a patch to make LVM work with lilo (which you also
have to patch)

I used the patch at

http://lists.sistina.com/pipermail/linux-lvm/2001-June/007538.html

and applied it directly to /usr/src/linux-2.4.6/drivers/md/lvm.c

I haven't tried this with LVM 0.9.1_beta8 yet, and probably won't for a
while, I just got it working so i don't think I'll mess with it. You
probably don't need the two extra patches after installing the LVM
patchgen created patch.


The other thing you need is lilo 21.7.5, this has support to boot off a
reiserfs partition, but not of an LVM partition so you'll need to patch
it.

http://lists.sistina.com/pipermail/linux-lvm/2001-June/007682.html

has a patch for lilo-21.7.5 to add support for booting off an lvm.

After i figured out what patches i need for the kernel and lilo the hard
way, I got both installed with everything needed.

Now i installed redhat 7.1 right from the beginning with the intention of
converting it to all LVM and reiserfs. I had 3 partitions a big /dev/hda1
(about 4 gig)
that was / and had the entire redhat distribution installed in  a /dev/hda2
just for swap (500meg) and the rest in /dev/hda3 (14 gig or so).

I created a volumegroup on /dev/hda3 and made all my lvs, formated them=20
all with reiserfs and cpioed all the files over there, then set the kernel
to boot with root as /dev/rootvg/root_lv.

Note at this point the kernel is still on /dev/hda1 the normal ext2
partition, but i just wanted to check everything. I got working after a
few tries. It was easy to recover from a failed attempt at this point
since it was still on the non lvm partition i just had a different line in
my lilo.conf to boot back to the old way.=20

Now that i had all that working i make sure that /boot
(/dev/rootvg/boot_lv now that i was booted using the rootvg) has the new
lilo and the new kernel with all the patches I've determined i needed and
set it to boot off the kernel in rootvg/boot_lv  and with root as
rootvg/root_lv.

Once that all worked fine the easy thing to do would be to delete
/dev/hda1 and /dev/hda2 and make one bigger /dev/hda1, pvcreate on it and
just add it to the volumegroup and go have a beer.=20

But i thought it would be cool to only have one physical volume.=20
To do this i would need to backup everything to some other device, boot
from a rescue cd and recreate the volumegroup and logical volumes. Then
restore all files from this other device, chroot to the voluegroup and run
the lilo i had patched.

This is pretty much what i did, I used a tape drive on another box as the
backup device witch complicated things because you have to get your
rescue operating system up on the network enough to run=20
rsh otherhost dd if=3D/dev/rmt0 obs=3D20b |cpio -iv --block-size=3D20

To do this i used a program called BYLD. it can be found at
http://byld.sourceforge.net/ I found it to be pretty buggy and could never
get it to include all the programs i needed, but i did get it to work. I
didn't delete my old partition until i had copied all the programs and
library's off of it i need to little ram disks i had created. That way once
i remove the partition i would still have my lvm tools, reiserfs
tools, cpio, rsh and all the tools i need to be get on the network, at
least until i rebooted. I misplaced reset would have really ruined my day.

By the way its much easer if you're kernel doesn't need modules, at least
for the lvm, the minix fs (which it uses for its ramdisk), reiserfs,
ext2 and ISO9660.

I also made the mistake of using a rescue cd i had created before that
had a kernel using beta2 of LVM. Bad idea, when i went to run lilo it
wouldn't work because it needs the beta7 patched kernel i made earlier.
So i took used another linux box i have here and recreated the kernel with
all the patches on it and made another rescue cd iso, and bought my friend
with the cd burner another lunch.=20

With the correct kernel and already having created /dev/hda1 containing
the hole disk, it being the only pv in the rootvg, And having created all
my LVs formated with reiserfs, restored all my files from the remote host
all i had to do was chroot to the new root partition and run lilo and all
was well.

And yes that really is the short story of how i did it.

eli

P.S. yes i know there is no real point to this exercise but being the
first geek on the block with 100% lvm 100% reiserfs linux os, and
have it be nearly imposible to recover from when something goes wrong.

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7YE06m2VvYlVjW2oRAr+3AJkBB91mCwhVVioqNBsAiqcklkPuHACg3txW
4qkDgqnkYbndpv4Td8SFK/M=
=zUqK
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
