From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Message-Id: <200002071623.RAA08923@u9etz.ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] LVM release (fwd)
In-Reply-To: <Pine.LNX.4.10.10002050100330.12631-100000@morannon.kdi.com> from "Dominic J. Eidson" at "Feb 5, 2000  1: 1:45 am"
Date: Mon, 7 Feb 2000 17:23:49 +0100 (MET)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: "Dominic J. Eidson" <sauron@the-infinite.org>
Cc: mge@ez-darmstadt.telekom.de, linux-lvm@msede.com

> 
> Maybe you Heinz could answer this better than me...
> 
> Dominic
> 
> ---------- Forwarded message ----------
> Date: Fri, 4 Feb 2000 22:33:24 PST
> From: tbreuel@parc.xerox.com
> To: dominic@the-infinite.org
> Subject: LVM release
> 
> Hi,
> 
> I saw your announcement of LVM for Linux with interest.
> I have some questions about it:
> 
>  -- The main selling point of LVM on IBM systems was that
>     it allowed resizing file systems while they were on-line;
>     with ext2, that doesn't seem to be possible. So, if they
>     have to be unmounted anyway, why not use GNU parted?

No chance to go beyoind physical disk limit which is in general
one goal of volume management and of Linux LVM in particular.

>     Are there plans for on-line resizable file systems
>     in Linux?

There is at least one ext2 online resizing project.
See pointer at <http://linux.msede.com/ext2>.

Today you can use reiserfs which is online extendable and
offline (this is BTW _very_ seldom used in production!) shrinkable.
It is pure fun to see it growing in fractions of e second.

There are plans to make GFS (Global Filesystem) online extendable later
this year as well.

The SGI XFS port to Linux will be online extendable but not shrinkable at all.

Veritas AFAIK will sell their FS to you ;*(

> 
>  -- You state that the LVM doesn't have a lot of overhead.
>     What conditions did you test under?

FS accesses with bonnie and other stuff.

>     Many file systems optimize
>     disk head movement, but once a volume has been resized multiple
>     times, the relationship between logical block addresses and
>     head positions become pretty unpredictable.

Correct.

>     Does the LVM
>     implementation address this?

Yes. But not automatically. See below.

>     Are there hooks that file system
>     implementations can use to discover the mapping?

Yes.

Either by using wrappers arround

lvdisplay -v /dev/VolumeGroup/LogicalVolume
pvdisplay -v /dev/PhysicalVolume

- or -

by calling of lv_status_byname() or lv_status_byindex() directly
to get the mapping information.
Both in userspace.

In kernelspace one can call the corresponding
LV_STATUS_BYNAME/LV_STATUS_BYINDEX directly.

>     And is
>     there some kind of "LVM defragmentation utility" that makes
>     logical volumes sequential and contiguous?

Yes.
It is called pvmove(8).

IOW: use the above mentioned methods to get the mapping information
     which BTW includes read/write statistics per extent, make your
     decision and use pvmove(8) to change the mapping online
     without loosing data.

> 
>  -- Are you planning on making LVM the default disk
>     storage management system in the 2.3 kernels, or is
>     it going in as something only to be used for "enterprise 
>     Linux distributions"?

No, because IMHO the user should still be able to have the choice
between direct partition/LVM/romfs/ect. based systems.

LVM will be included in the upcoming 2.3.x releases as Linus stated recently.

> 
> Thanks,
> Thomas.
> 
> PS: I was using and configuring AIX systems for four years,
> so that's where I have used logical volumes before.
> 

Heinz

-- 

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement CS-TS                           T-Nova
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@EZ-Darmstadt.Telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
