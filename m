Date: Tue, 21 Sep 1999 15:32:25 +0100 (BST)
From: James Pattinson <jamesp@aethos.co.uk>
Subject: Re: [linux-lvm] Kernel OOPS (LVM 0.7)
In-Reply-To: <199909211421.AA26202@mailgate1b.telekom.de>
Message-ID: <Pine.LNX.4.10.9909211529500.1202-100000@fuse.aethos.co.uk>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Thanks so much for your quick response!

I fixed the problem just now by a method similiar to the one you
suggested. Actually I booted into a shell from linuxrc and totally delete
vgdb since it wasn't being used, and then deleted and copied the lvm
config to the real root device.

Thanks again

James

On Tue, 21 Sep 1999, Heinz Mauelshagen wrote:

> 
> Hi,
> 
> first of all i have to say, that initrd support _has_ to be enhanced ;*)
> 
> But anyway, it looks to me that the linuxrc driven vgscan created an actual
> lvmtab in your ramdisk, which differs from that on your harddisk based root LV.
> 
> Did you think of copying it from the ram disk or giving vgscan another try
> in your harddisk startup rc (for eg. in /sbin/init.d/boot)?
> 
> If not, please do so and retry.
> 
> Cheers,
> Heinz
> 
> > 
> > Hi
> > 
> > First of all, cheer for LVM, I think it's great and I've been using it for
> > a while. However, last night I rebuilt my machine and now all my
> > partitions reside on a vg called vg00:
> > 
> > [root@greebo][/root]# df
> > Filesystem           1k-blocks      Used Available Use% Mounted on
> > /dev/vg00/lvol1         507583     33506    468835   7% /
> > /dev/vg00/lvol2        1387224   1207850    165038  88% /usr
> > /dev/vg00/lvol3          63455     43048     19752  69% /var
> > /dev/vg00/lvol4         126911       210    125391   0% /tmp
> > /dev/vg00/lvol5         507583    368299    134042  73% /opt
> > /dev/vg00/lvol6        2479898   2130797    323461  87% /root
> > /dev/vg00/lvol7        1014911    977436     26990  97% /home
> > /dev/vg00/lvol8        3041663   2107704    902502  70% /fuse_backup
> > /dev/hda1                15522      9656      5065  66% /boot
> > 
> > I'm using an initrd that does a vgscan and a vgchange -a y then init
> > mounts /dev/vg00/lvol1 as root. This all seemed to be working fine however
> > I can't seem to create new LV's now:
> > 
> > [root@greebo][/root]# lvcreate -i 2 -I 8 -L16 -nchunk1 vgdb
> > Segmentation fault
> > [root@greebo][/root]#
> > 
> > I get the same result regardless of which volume group I use (vgdb or
> > vg00) or whether I ask it to stripe or not.
> > 
> > Here's the kernel message related to the command:
> > 
> > [root@greebo][/root]# dmesg -c
> > Unable to handle kernel NULL pointer dereference at virtual address
> > 00000000
> > current->tss.cr3 = 09e8e000, %cr3 = 09e8e000
> > *pde = 00000000
> > Oops: 0000
> > CPU:    0
> > EIP:    0010:[<c0192281>]
> > EFLAGS: 00010282
> > eax: 00000000   ebx: c02598a0   ecx: 00000000   edx: 00000030
> > esi: 00000020   edi: 00000000   ebp: c9ecbe40   esp: c9ecbcdc
> > ds: 0018   es: 0018   ss: 0018
> > Process lvcreate (pid: 4136, process nr: 46, stackpage=c9ecb000)
> > Stack: 00000000 c02598a0 bffff14c cb00ddc0 c9ecbe40 c9eca000 00000020
> > ffffffff
> >        00000000 40039948 d0808000 40039080 000008c8 00000000 ca860018
> > c018e907
> >        00000000 c02598a0 c9ecbe40 cb00ddc0 c9f9d680 ffffffe7 bffff14c
> > 4004fe20
> > Call Trace: [<c018e907>] [<c01e79f4>] [<c012eafa>] [<c011e8bb>]
> > [<c01322c1>] [<c0128ae6>] [<c010a034>]
> > Code: 8a 11 84 d2 74 17 90 8a 03 84 c0 74 0c 38 c2 75 16 41 43 8a
> > 
> > I'm using stock kernel 2.2.12, with the LVM patch applied. Below is the
> > output of some VG commands that might help.
> > 
> > I hope someone can help me out, as I can't create LV's!
> > 
> > Cheers
> > 
> > James
> > 
> > ------
> > 
> > --- Volume group ---
> > VG Name               vgdb
> > VG Access             read/write
> > VG Status             available/resizable
> > VG #                  1
> > MAX LV                256
> > Cur LV                1
> > Open LV               0
> > MAX LV Size           255.99 GB
> > Max PV                256
> > Cur PV                2
> > Act PV                2
> > VG Size               1264 MB
> > PE Size               4 MB
> > Total PE              316
> > Alloc PE / Size       4 / 16 MB
> > Free  PE / Size       312 / 1248 MB
> > 
> > --- Volume group ---
> > VG Name               vg00
> > VG Access             read/write
> > VG Status             available/resizable
> > VG #                  0
> > MAX LV                256
> > Cur LV                8
> > Open LV               8
> > MAX LV Size           255.99 GB
> > Max PV                256
> > Cur PV                2
> > Act PV                2
> > VG Size               15.7 GB
> > PE Size               4 MB
> > Total PE              4020
> > Alloc PE / Size       2304 / 9 GB
> > Free  PE / Size       1716 / 6.7 GB
> > 
> > 
> > 
> 
> 
> --
> 
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> 
> Systemmanagement CS-TS                           T-Nova
>                                                  Entwicklungszentrum Darmstadt
> Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
> Senior Systems Engineer                          Postfach 10 05 41
>                                                  64205 Darmstadt
> mge@ez-darmstadt.telekom.de                      Germany
>                                                  +49 6151 886-425
>                                                           FAX-386
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> 
