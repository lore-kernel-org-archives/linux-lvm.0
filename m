From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200010162107.RAA14242@lynx.turbolabs.com>
Subject: Re: [linux-lvm] lv inactive after reboot
Date: Mon, 16 Oct 2000 17:07:36 -0400 (EDT)
In-Reply-To: <01C036EB.4AA7CFA0.smdenton@bellsouth.net> from "S. Michael Denton" at Oct 15, 2000 09:02:55 PM
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: smdenton@bellsouth.net
Cc: Linux LVM mailing list <linux-lvm@msede.com>

S. Michael Denton, you write:
> The ability to do raid, specifically raid1, with LVM should be
> included if linux LVM is to mimic the LVM used on HPUX; perhaps
> merging linux md tools/drivers with lvm tools/drivers?

It's been discussed before, and it will not go into the Linux LVM itself.
You can currently stack LVM on MD or vice versa.  The proposed IBM ELVM
incorporates RAID into the LVM framework.

> The ability to create > 256 items (lv's, vg's, etc), perhaps by using
> multiple majors?

Not an LVM issue.  Heinz just said today that he will not do it this way.
Maybe through devfs...

> Storing lvm information for each group in entirety on each group's
> pv's headers as such:
> 	vgtest members: /dev/hda /dev/hdb /dev/hdc
> 	vgtest lv's: testlv thislv thatlv
> 	vgtest lv pe boundaries: testlv ...
> 				thislv ...
> 				thatlv ...
> 	ad nauseum so that the kernel and the /etc files are not the only
> authoritative sources of lvm structures (3 sources allows for a
> quorum)

Yes, this is proposed for LVM already.  I think there are ways that this
can be done reasonably easily.

> Storing lvm native host information so that vgs could be
> exported/imported from host to host in MI scsi configs
> Deeper integration into the kernel such that / can be an lv without
> an initrd (this may already exist?)

Yes, there is already work underway to do kernel configuration.

> [Deeper] integration into bootloaders such as lilo, grub, etc so one
> can boot from a secondary (ie mirror) boot device, potentially
> automatically.
> 	(ie primary boot device: /dev/vg00/root which is raid1 consisting of
> /dev/hda and /dev/hdb... if /dev/hda becomes inaccessible, boot from
> /dev/hdb half of /dev/vg00/root automatically)

This would need to be done in LILO/GRUB and not LVM.  Since LVM itself
doesn't do mirroring, it is an MD and LILO problem.  I think it shouldn't
be _too_ hard, but I'm not an expert in this area.

> Again, these things may already be in the TODO list, wish lists,
> whatever... but in case someone hasn't thought of them, these are a
> few ideas my colleagues and I have had regarding linux LVM.

Thanks for the input.  I think a lot of people want a lot of these
features, so they will go in sooner or later.  The more people that
want them, the more likely they are to make it in.

Cheers, Andreas
