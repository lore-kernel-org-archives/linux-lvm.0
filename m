Message-ID: <006301c13d14$4773dba0$6601a8c0@foobarhouse.com>
From: "Neil Macvicar" <neilm@foobarhouse.com>
References: <NBBBJHKIOKPKOGOEPEDPMEENDNAA.stuart@bh90210.net>
Subject: Re: [linux-lvm] How to boot with LVM?
Date: Fri, 14 Sep 2001 12:56:24 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Cc: stuart@bh90210.net

How to mount a ramdisk:

1. modprobe loop (assuming the loopback device is bilt as a module)
2. gunzip initrd.gz
3. mkdir tmp_mount
3. losetup /dev/loop/0 initrd
4. mount /dev/loop/0 tmp_mount

NOTE: Your loop device may not be /dev/loop/0 (you need to be using devfs
for this naming convention). Under normal /dev it will be /dev/loop0 I
believe.

Regards,
--Neil.

----- Original Message -----
From: "IT3 Stuart B. Tener, USNR-R" <stuart@bh90210.net>
To: <linux-lvm@sistina.com>
Sent: Thursday, September 13, 2001 10:08 PM
Subject: RE: [linux-lvm] How to boot with LVM?


> Mr. Macvicar:
>
> Can you provide instructions on how I might do that?
>
>
> Very Respectfully,
>
> Stuart Blake Tener, IT3, USNR-R, N3GWG
> Beverly Hills, California
> VTU 1904G (Volunteer Training Unit)
> stuart@bh90210.net
> west coast: (310)-358-0202 P.O. Box 16043, Beverly Hills, CA 90209-2043
> east coast: (215)-338-6005 P.O. Box 45859, Philadelphia, PA 19149-5859
>
> Telecopier: (419)-715-6073 fax to email gateway via www.efax.com (it's
free!)
>
> JOIN THE US NAVY RESERVE, SERVE YOUR COUNTRY, AND BENEFIT FROM IT ALL.
>
> Thursday, September 13, 2001 2:08 PM
>
> -----Original Message-----
> From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]O=
n
Behalf Of Neil Macvicar
> Sent: Thursday, September 13, 2001 2:13 PM
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] How to boot with LVM?
>
> A few notes I missed: This ramdisk I made myself. You can mount it on
> loopback after untarring it to examine it's contents. It's size sould b=
e
set
> to 8192.
>
> Regards,
> --Neil.
>
> ----- Original Message -----
> From: "Neil Macvicar" <neilm@foobarhouse.com>
> To: <linux-lvm@sistina.com>
> Sent: Thursday, September 13, 2001 1:15 PM
> Subject: Re: [linux-lvm] How to boot with LVM?
>
>
> > If it's any help, I have put my initrd on public ftp at
> > fruits.foobarhouse.com in the LVM directory. It's served me well for =
as
> long
> > as I've been using LVM'ed root.
> >
> > I'm currently using LVM 0.9.1beta8.
> >
> > Regards,
> > --Neil.
> >
> > ----- Original Message -----
> > From: "A.R. (Tom) Peters" <tpeters@xs4all.nl>
> > To: <linux-lvm@sistina.com>
> > Sent: Thursday, September 13, 2001 8:18 AM
> > Subject: [linux-lvm] How to boot with LVM?
> >
> >
> > > I bought a 30 GB HD, and decided to put it under the LVM and put
> > > ReiserFS on it.  I managed to initialize it fine, and it now has a
base
> > > Debian install on it, but I cannot manage to boot from it.
> > >
> > > You cannot boot from a LV; therefore I made a small (16 MB) ext2
> > > partition with a kernel and an initrd.  My intended root FS is on a
LV,
> > > and you need to jump through some hoops to get the kernel mount it =
on
/
> > > : that is documented in the LVM-HOWTO and FAQ that comes with the L=
VM
> > > tools.  Use of initrd is documented in
> > > /usr/src/linux/Documents/initrd.txt .  Finally, the Bootdisk-HOWTO
> > > helps.
> > >
> > > I use LVM tools 1.0.1-rc2, and a 2.4.10-pre7 kernel, patched with t=
he
> > > patches of the LVM tools; no .rej there.  I compiled the LVM binari=
es
> > > with liblvm-10 statically linked, because otherwise the executables=
 in
> > > the initrd had problems with finding the .so (I think I know what w=
as
> > > going on, but won't go into that now).  Therefore I have to make a
> > > Ramdisk of 5MB instead of the default 4 MB.
> > >
> > > My new HD is /dev/hdd, and is the 3rd HD in the system: this allows=
 me
> > > to still use my computer to read docs and send you this message.  S=
o
for
> > > now I do not want to put a bootloader on the disk because the hardw=
are
> > > config is going to change: instead I use a boot floppy with GRUB.
> > >
> > > LVM has a utility script lvmcreate_initrd to make an initrd suitabl=
e
to
> > > prepare for mounting a LV on / .
> > >
> > > The system boots with the floppy; the correct kernel is loaded from
the
> > > ext2 partition, as well as the initrd; the LVM tools on the initrd =
are
> > > executed and seem to work properly.
> > >
> > > PROBLEM: subsequently the kernel panics because it still cannot mou=
nt
a
> > > root.
> > >
> > > I got a GRUB bootdisk that works.  /grub/menu.lst :
> > > title  Linux24
> > > root (hd2,4)
> > > kernel /vmlinuz-2.4.10-pre7 root=3D/dev/SYSDISK/Root ramdisk_size=3D=
5120
> > > # If I specify root=3D/dev/ram0 then I get a shell on the rudimenta=
ry
> > > initrd system.
> > > initrd /initrd-lvm-2.4.10-pre7.gz
> > >
> > > On initrd:
> > >
> > > etc/fstab:
> > > /dev/ram        /               ext2    defaults        0   0
> > > proc            /proc           proc    defaults        0   0
> > >
> > > linuxrc:
> > > #!/bin/sh
> > > /bin/mount /proc
> > > /sbin/vgscan
> > > /sbin/vgchange -a y
> > > /bin/umount /proc
> > >
> > > devices:
> > > # ls -l dev/SYSDISK/
> > > total 0
> > > brw-rw----    1 root     disk      58,   2 Sep 11 19:23 Opt
> > > brw-rw----    1 root     disk      58,   0 Sep 11 19:23 Root
> > > brw-rw----    1 root     disk      58,   4 Sep 11 19:23 Scratch
> > > brw-rw----    1 root     disk      58,   1 Sep 11 19:23 Usr
> > > brw-rw----    1 root     disk      58,   3 Sep 11 19:23 Var
> > > crw-r-----    1 root     disk     109,   0 Sep 11 19:23 group
> > >
> > > Kernel:
> > > # rdev vmlinuz-2.4.10-pre7
> > > Root device /dev/ram0   # Root device /dev/SYSDISK/Root
> > >   (-> 0x3a00) does not make a difference
> > > # rdev -R vmlinuz-2.4.10-pre7
> > > Root flags 0    # i.e. mount ro
> > > # rdev -r vmlinuz-2.4.10-pre7
> > > Ramsize 49152   # i.e. offset=3D0; bit14=3D1: load ramdisk; bit15=3D=
1:
> > >                 #   prompt before loading rootfs - this never happe=
ns!
> > >
> > > What am I supposed to change?  The kernel initrd.txt has a long and
> > > complicated story on using pivot_root to switch rootfs, but apparen=
tly
> > > the LVM linuxrc relies on the deprecated method that does this
> > > automatically.
> > >
> > > Any advice welcome.
> > >
> > > --
> > >
> >
>
#>!$!%(@^%#%*(&(#@#*$^@^$##*#@&(%)@**$!(&!^(#((#&%!)%*@)(&$($$%(@#)&*!^$)=
^@*
> > ^@)
> > >
> > > Tom "thriving on chaos" Peters
> > > NL-1062 KD nr 149 tel.    +31-204080204
> > >   Amsterdam e-mail  tpeters@xs4all.nl
> > >
> > >
> > > _______________________________________________
> > > linux-lvm mailing list
> > > linux-lvm@sistina.com
> > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> >
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=
=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=E5S{=B1=FE[=E6T=A8=A5Sx%S=CBeS{=B1=FE[=E6=FE=
=C8=AC=B6)=DA=FD=CA&?=DBi=FF=FF=E5S=CBl=FE
=C8=AC=B6)=DA=FD=CA&=FEf=A2-f=A7=FEX=AC=B6)=DF=A3=F9bz=EC=FF-=F9=ABy=A7m.=
=E2=D50s-=FD3s=B6=1Bm=A7=FF=FF=C3 =FF=B2+-Sv=FFr?=BF-=F9=BF=3D=A8=1E=B3=F8=
h=C2=DA=FF?=D9=A5
