Message-ID: <39545721.E8C392C5@inet.net.nz>
Date: Sat, 24 Jun 2000 18:37:21 +1200
From: Dale Kemp <dale@inet.net.nz>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: IBM to release LVM Technology to the Linux
References: <Pine.LNX.4.21.0006240048000.30225-100000@fogarty.jakma.org>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Linux LVM mailing list <linux-lvm@msede.com>

> > Welcome to the discussion!  To answer your question, if the Linux
> > Community is interested in the LVMS outlined in the white paper,
> > then IBM will release code (under the GPL!) to begin moving this
> > technology to Linux.  I suspect that IBM will also dedicate some
> > resources to assist in moving this technology to Linux as that
> > will expedite the process.
>
> would it not perhaps be more efficient and more purposeful if rather
> than releasing IBM specific code which will not 'drop-in' to linux,
> IBM were instead to use their knowledge gained from IBM LVM to assist
> with improving the current Linux LVM?
>

Not only this, but SGI are looking at releasing their volume management
system as well. Now does the user really want three (or more) logical
volume management systems, all with different toolsets and kernel
modules? The best solution is if SGI, IBM and Linux-LVM get together
and produce one very powerful and stable LVM system, this would be
a test in itself to get this group together. Don't forget the all
important
users out there.
SGI and IBM are supporting linux for many reasons:

    - Users want Linux
    - Linux is becoming the de facto standard. For all those years the
commercial
       Unix(tm) vendors were heading off in there own directions, all
different
       filesystems, volume management... Not good for Unix overall and
not good
       for the public. [Don't tell me they are thinking of doing this
again!!]
    - The Unix sector is now smaller, and supporting and extending an OS
is becoming
       more and more costly and complex; better off with one common base
: Linux.
    - Uses want to use existing vendors hardware (like SGI and IBM) and
moving
        from IRIX or AIX to Linux needs to be as painless as possible.

So what should SGI, IBM (and others) aim's be? Simple, allow the users
to carry
on doing the things they could do before, or provide another effective
solution.
Now are we going to see SGI's XFS sitting on top of IBM's LVMS!? Or can
only
JFS sit on IBM-LVMS, and XFS only sit on XVM!?
Wouldn't it be much nicer to see XFS, JFS, EXT3, ReiserFS all sitting on
top
of Linux-LVM; and for that technology to support the advanced features
needed by these filesystems?
SGI and IBM should be getting stuck in now and helping LLVM, its best
for their
users and best for them.

SGI-XVM and IBM-LVMS could even be modules that plug into LLVM base that

provide functionality for their existing users.

eg. Something like...

    # insmod lvm
    # insmod lvm-ibm
    # ibm_addpv -add /dev/sdg5    <-- IBM AIX disc.
    # pvscan
    pvscan -- active PV(IBM-LVMS) "/dev/sdg5" is in no VG [12.6 GB]
    pvscan -- inactive PV "/dev/hda5" is in no VG [5 GB]
    # ibm_addvg ibm_vg /dev/sdg5
    # ibm_addlv ibm_lv ibm_vg
    # mount -t JFS /dev/ibm_vg/ibm_lv /mnt/ibm
    # jfs_tool -fancy_lvms_option /mnt/ibm
    # insmod lvm-sgi
    # sgi_addpv /dev/sdh3 /dev/sdh5 <-- SGI IRIX disc.
    # sgi_addvg sgi_vg /dev/sdh3 /dev/sdh5
    # sgi_addlv sgi_lv sgi_vg
    # pvscan
    pvscan -- active PV(IBM-LVMS) "/dev/sdg5" is in no ibm_vg [12.6 GB]
    pvscan -- inactive PV "/dev/hda5" is in no VG [5 GB]
    pvscan -- active PV(SGI-XFS) "/dev/sdh3" is in sgi_vg [10.1 GB]
    pvscan -- active PV(SGI-XFS) "/dev/sdh5" is in sgi_vg [18 GB]
    # mount -t XFS /dev/sgi_vg/sgi_lv /mnt/sgi
    # xfs_tool -fancy_xvm_option /mnt/sgi
    # resizefs -s+50M /mnt/ibm
    # resizefs -s+50M /mnt/sgi
    # lvscan
    <shows all LVs including `mapped' LVMS and XVM>
    # umount /mnt/sgi
    # vgremove /dev/sgi_vg
    <note there will be realistic restrictions...>
    # vgcreate new_vg /dev/sdg5 /dev/sdh3
    Error: Different PV types can not exist in the same VG.
    They contain different partition formats and/or file systems.

SGI and IBM please consider this, instead of releasing code that doesn't
`drop-in'
to Linux.

-- Dale (dale@sclnz.com)
