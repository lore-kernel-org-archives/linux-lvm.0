Date: Mon, 10 Apr 2000 22:51:48 -0600 (MDT)
From: Michael Loftis <zop12@mindless.com>
Subject: Re: [linux-lvm] lvm'ing root fs
In-Reply-To: <20000410212132.C21194@lenin.nu>
Message-ID: <Pine.LNX.4.04.10004102249070.22430-100000@disks.tcnet.eu.org>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Peter C. Norton" <spacey@lenin.nu>
Cc: "Shaw, Marco" <marco.shaw@nbtel.nb.ca>, linux-lvm@msede.com

No because he needs /dev/* entries :)

-not -path "/usr/*" 

Prolly need whatever else isn't wanted on the initrd (like /home if it
lives there) so use with caution (bin, sbin, lib and boot are prolly all
thats necessary -- but I not sure -- I know the kernel has to be outside
of the LVM though)

Anyway...

On Mon, 10 Apr 2000, Peter C. Norton wrote:

> Looking at that a second time, you may be better off adding the "-type f"
> flag to find so you don't include /usr, etc.
> 
> On Mon, Apr 10, 2000 at 08:43:58PM -0700, Peter C. Norton wrote:
> > You may want to do the following:
> > 
> > cd /; find . -xdev -print | xargs tar -cf - | (cd /mnt/root_vg; tar -xf -)
> > 
> > With gnu tar this should do everything you need.  Files, directories,
> > devices, etc. 
> > 
> > -Peter
> > 
> > On Mon, Apr 10, 2000 at 09:59:11PM -0300, Shaw, Marco wrote:
> > > I've created an init ramdisk (lvmcreate_initrd), and now I'm in the process
> > > of trying to copy my root fs to my new lvm_root.  To reduce the disk I/O,
> > > I've gone down to single user mode to try to copy (cp -a *) all my files
> > > from root to lvm_root.  Twice I get the same results:
> > > 
> > > # cd /
> > > # cp -a * /mnt/root_vg
> > > cp: /mnt/root_vg/proc/kcore_elf: Invalid argument
> > > cp: proc/sys/net/ipv4/route/flush: Invalid argument
> > > 
> > > This is all I see on my screen, then at some point, the copying stops, and
> > > my system will not respond to keyboard input, except it will respond to
> > > Alt-F1/4 to switch virtual terms, but still no keyboard input accepted.
> > > 
> > > Should I tar/untar instead, or did I miss some fundamental step?
> > > 
> > > Thanks,
> > > Marco
> > 
> > -- 
> > The 5 year plan:
> > In five years we'll make up another plan.
> > Or just re-use this one.
> 
> -- 
> The 5 year plan:
> In five years we'll make up another plan.
> Or just re-use this one.
> 
