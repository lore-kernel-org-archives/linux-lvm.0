Message-ID: <002701c2036a$7ba96170$6501a8c0@bomoon>
From: "bo" <bo@sosnetwork.net>
References: <004d01c20110$f2b8ff70$6501a8c0@bomoon> <20020522144651.F9107@sistina.com> <009601c20204$81710e30$6501a8c0@bomoon> <20020523190023.A13788@sistina.com> <017301c202d0$c77c2410$6501a8c0@bomoon> <20020524105744.B15896@sistina.com>
Subject: Re: [linux-lvm] Error on vgscan & lvremove
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Fri May 24 16:34:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Heinz,

I verified these two issues as commented below;

> >
> > > A 'workaround' for non-devfs configurations is
> > >
> > > ls /dev/*/group | sed 's!/group!!' | xargs rm -r ; vgmknodes
> > >
> >
> > ??Something wrong on "sed 's!/group!!' ", it did not work.
>
> Works fine here. Maybe your sed doesn't like the delimiter?
>
> Try '/' rather than '!' with sed like "sed 's/\/group//'".
>

worked w/o delimiters like

        ls /dev/*/group | sed 's/group//' | xargs rm -r ; vgmknodes

> >
> > >
> > > link the single executable statically by running
> > > "./configure --enable-static_link" (which doesn't use the shared
libs).
> > >
> >
> > It did not work. I rebuilt LINUX kernel & LVM after
> > "./configure --enable-static_link".
> > I got the same result.
>
> Did you start with a fresh source tree or run "make distclean"
> before "./configure --enable-static_link"?
>
> >

Yes, worked with "make distclean".

For the backward compatibilty I will try later.

One more question related with activating PV,

Of course I could make them active after removing the volume and recreating
it.
As you can notice on the attached log VG is ok,  How could I make these PVs
active
w/o removing the volume?

Did it corrupt the VGDA? any way to recover it?
(PS: you can notice TWO "volDisk" group in the following "vgdisplay", should
be
        volDisk  & volDisk2 ???)

Thanks again,

Bo
----------------------------------------------------------------------------
-----------------
[root@localhost /root]# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/md0"   of VG "volRaid0" [1.95 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/md1"   of VG "volRaid0" [1.95 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/md2"   of VG "volRaid0" [1.95 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/md3"   of VG "volRaid1" [992 MB / 0 free]
pvscan -- ACTIVE   PV "/dev/md4"   of VG "volRaid1" [992 MB / 484 MB free]
pvscan -- ACTIVE   PV "/dev/md5"   of VG "volRaid5" [1.95 GB / 992 MB free]
pvscan -- ACTIVE   PV "/dev/md6"   of VG "volRaid5" [1.95 GB / 1.95 GB free]
pvscan -- ACTIVE   PV "/dev/hdc9"  of VG "volDisk"  [992 MB / 992 MB free]
pvscan -- inactive PV "/dev/hdc10" of VG "volDisk2" [992 MB / 788 MB free]
pvscan -- ACTIVE   PV "/dev/hdd9"  of VG "volDisk"  [992 MB / 992 MB free]
pvscan -- inactive PV "/dev/hdd10" of VG "volDisk2" [992 MB / 792 MB free]
pvscan -- ACTIVE   PV "/dev/hda15" of VG "volDisk"  [996 MB / 996 MB free]
pvscan -- inactive PV "/dev/hda16" of VG "volDisk2" [996 MB / 0 free]
pvscan -- total: 13 [17.59 GB] / in use: 13 [17.59 GB] / in no VG: 0 [0]

[root@localhost /root]# pvdisplay /dev/hdc10
--- Physical volume ---
PV Name               /dev/hdc10
VG Name               volDisk2
PV Size               1000.09 MB [2048193 secs] / NOT usable 4.19 MB [LVM:
128 KB]
PV#                   2
PV Status             available
Allocatable           yes
Cur LV                2
PE Size (KByte)       4096
Total PE              248
Free PE               197
Allocated PE          51
PV UUID               b5ybET-1zOq-HPnP-QQda-zjgQ-5avz-aGFMav

[root@localhost /root]# vgdisplay
--- Volume group ---
VG Name               volDisk
VG Access             read/write
VG Status             available/resizable
VG #                  1
MAX LV                256
Cur LV                0
Open LV               0
MAX LV Size           255.99 GB
Max PV                256
Cur PV                3
Act PV                3
VG Size               2.91 GB
PE Size               4 MB
Total PE              745
Alloc PE / Size       0 / 0
Free  PE / Size       745 / 2.91 GB
VG UUID               7RhXUS-Pw5B-EBYN-GKIM-PO1d-4uD7-4apSvp

--- Volume group ---
VG Name               volDisk
VG Access             read/write
VG Status             available/resizable
VG #                  1
MAX LV                256
Cur LV                0
Open LV               0
MAX LV Size           255.99 GB
Max PV                256
Cur PV                3
Act PV                3
VG Size               2.91 GB
PE Size               4 MB
Total PE              745
Alloc PE / Size       0 / 0
Free  PE / Size       745 / 2.91 GB
VG UUID               7RhXUS-Pw5B-EBYN-GKIM-PO1d-4uD7-4apSvp
