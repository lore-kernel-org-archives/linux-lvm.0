Date: Wed, 15 Nov 2000 08:07:42 +0100
From: Jos Visser <josv@osp.nl>
Subject: Re: [linux-lvm] Error -154 can't get data from VG
Message-ID: <20001115080742.H370@jadzia.josv.com>
References: <F125PGNkY5TetpIuPHD000030b1@hotmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <F125PGNkY5TetpIuPHD000030b1@hotmail.com>; from brunokc@hotmail.com on Tue, Nov 14, 2000 at 09:09:17AM -0800
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bruno Kraychete da Costa <brunokc@hotmail.com>
Cc: linux-lvm@msede.com

Hi think that what /proc/lvm shows is the setting of the "contiguous"
setting for the logical volume. When an LV is "contiguous", the LVM
tools make sure that it remains so when you move or extend it. Even
volumes that have not been created "contiguous", *might* (and usually
will) be contiguous on the disk, but once you extend them the contiguity
(is this correct English :-) will almost certainly be broken.

It might be a nice idea if we would have some tools to create a human
readable copy of the LVM metadata. I'm not sure if this tool currently
exists or not, but it could seriously help us in situations like this.

++Jos

And thus it came to pass that Bruno Kraychete da Costa wrote:
(on Tue, Nov 14, 2000 at 09:09:17AM -0800 to be exact)

> 
> 
> >I guess that even when your / is in an LV, it still has to be (or most
> >probably will be) contiguous on the disk? This would mean that you
> >could handforge a partition table entry that maps exactly the root file
> >system. The size does not even matter (make it the rest of the disk),
> >as long as the start sector is allright. Such a partition table entry
> >would allow you to mount the /, even though it is in an LV.
> 
> I remember that, doing a cat /proc/lvm would show me that the only 
> contiguous LV was swap (I explicitly set it do be contiguous). But this 
> could be a good idea. Could any one confirm if this is possible?
> 
> >If you want a good set of recovery tools, download an ISO image of the
> >LinuxCare bootable business card (http://www.linuxcare.com/bootable_cd)
> >and burn it on a CD. You then have at least a serious amount of tools to
> >help you in the repair.
> 
> Humm. Thanks for the tip. I'll try this one.
> 
> Bruno.
> 
> _________________________________________________________________________
> Get Your Private, Free E-mail from MSN Hotmail at http://www.hotmail.com.
> 
> Share information about yourself, create your own public profile at 
> http://profiles.msn.com.

-- 
Success and happiness can not be pursued; it must ensue as the 
unintended side-effect of one's personal dedication to a course greater 
than oneself.
