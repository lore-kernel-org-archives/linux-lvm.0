From: dgould@suse.com
Date: Tue, 2 May 2000 11:41:13 -0700
Subject: Re: [linux-lvm] SuSE/LVM boot problem
Message-ID: <20000502114113.C1608@archimedes.suse.com>
References: <20000502052139.AAA12301@quartz.nbnet.nb.ca@Lxxxx.nbtel.nb.ca> <200005020951.LAA07870@e35.marxmeier.com>
Mime-Version: 1.0
In-Reply-To: <200005020951.LAA07870@e35.marxmeier.com>; from mike@msede.com on Tue, May 02, 2000 at 11:51:31AM +0000
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Marxmeier <mike@msede.com>
Cc: marco@nbnet.nb.ca, linux-lvm@e35.marxmeier.com

On Tue, May 02, 2000 at 11:51:31AM +0000, Michael Marxmeier wrote:
> > 
> > I lost my floppy with lilo on it.  Now I have to reconstruct it.  I've
> > tried booting in rescue mode, but even the rescue SuSE CD doesn't appear to
> > have LVM support.
> > 
> > What can I do at this point?
> 
> Use the installation disk - it has LVM support while the Rescue disk has not.
> You can boot from the 2nd CD-ROM into the old Yast, do a "expert install"
> and switch to a shell.
> 

Be careful. I have found that the install disks are very happy to create
systems that cannot be booted because lilo does not know about lvm.

On this topic, what is needed to make lvm work for both / and /boot with
full lilo support? I think it somewhat limits the utility of lvm not to
be able to make a fully lvm system, and might be tempted to do some of
the heavy lifting if it is not too gruesome.

-dg

-- 
David Gould                                   dgould@suse.com
If simplicity worked, the world would be overrun with insects.
