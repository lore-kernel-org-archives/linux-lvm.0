Date: Mon, 10 Apr 2000 22:10:40 -0700
From: "Peter C. Norton" <spacey@lenin.nu>
Subject: Re: [linux-lvm] lvm'ing root fs
Message-ID: <20000410221040.A22377@lenin.nu>
References: <20000410212132.C21194@lenin.nu> <Pine.LNX.4.04.10004102249070.22430-100000@disks.tcnet.eu.org>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.04.10004102249070.22430-100000@disks.tcnet.eu.org>; from zop12@mindless.com on Mon, Apr 10, 2000 at 10:51:48PM -0600
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Loftis <zop12@mindless.com>
Cc: "Shaw, Marco" <marco.shaw@nbtel.nb.ca>, linux-lvm@msede.com

Now we don't want /usr, or /proc, or /tmp, or /opt, or /boot, /lost+found,
/home, /var, but you want the directories.

I now vote for:

umask 022
tar -cf - /dev /bin /sbin /root /lib /etc | (cd /mnt/root_vg; tar -xvf -)
cd /mnt/root_vg; mkdir boot home mnt opt tmp usr var

Unless your /tmp is on the / filesystem.  

Anyway, that should do it :)

-Peter

It could also be done as:
find /dev -type f -o -type p -o -type b -o -type c
but it'd be easier to do:

cd /; find . -xdev -print | xargs tar -cf - /dev| (cd /mnt/root_vg; tar -xf -)

On Mon, Apr 10, 2000 at 10:51:48PM -0600, Michael Loftis wrote:
> No because he needs /dev/* entries :)
> 
> -not -path "/usr/*" 
> 
> Prolly need whatever else isn't wanted on the initrd (like /home if it
> lives there) so use with caution (bin, sbin, lib and boot are prolly all
> thats necessary -- but I not sure -- I know the kernel has to be outside
> of the LVM though)
> 
> Anyway...
> 
> On Mon, 10 Apr 2000, Peter C. Norton wrote:
> 
> > Looking at that a second time, you may be better off adding the "-type f"
> > flag to find so you don't include /usr, etc.
> > 
> > On Mon, Apr 10, 2000 at 08:43:58PM -0700, Peter C. Norton wrote:
> > > You may want to do the following:
> > > 
> > > cd /; find . -xdev -print | xargs tar -cf - | (cd /mnt/root_vg; tar -xf -)
> > > 
> > > With gnu tar this should do everything you need.  Files, directories,
> > > devices, etc. 
> > > 
> > > -Peter
> > > 
> > > On Mon, Apr 10, 2000 at 09:59:11PM -0300, Shaw, Marco wrote:
> > > > I've created an init ramdisk (lvmcreate_initrd), and now I'm in the process
> > > > of trying to copy my root fs to my new lvm_root.  To reduce the disk I/O,
> > > > I've gone down to single user mode to try to copy (cp -a *) all my files
> > > > from root to lvm_root.  Twice I get the same results:
> > > > 
> > > > # cd /
> > > > # cp -a * /mnt/root_vg
> > > > cp: /mnt/root_vg/proc/kcore_elf: Invalid argument
> > > > cp: proc/sys/net/ipv4/route/flush: Invalid argument
> > > > 
> > > > This is all I see on my screen, then at some point, the copying stops, and
> > > > my system will not respond to keyboard input, except it will respond to
> > > > Alt-F1/4 to switch virtual terms, but still no keyboard input accepted.
> > > > 
> > > > Should I tar/untar instead, or did I miss some fundamental step?
> > > > 
> > > > Thanks,
> > > > Marco
> > > 
> > > -- 
> > > The 5 year plan:
> > > In five years we'll make up another plan.
> > > Or just re-use this one.
> > 
> > -- 
> > The 5 year plan:
> > In five years we'll make up another plan.
> > Or just re-use this one.
> > 
> 

-- 
The 5 year plan:
In five years we'll make up another plan.
Or just re-use this one.
