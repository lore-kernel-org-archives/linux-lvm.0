Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o1CJMfVu006782
	for <linux-lvm@redhat.com>; Fri, 12 Feb 2010 14:22:41 -0500
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o1CJMWxX016319
	for <linux-lvm@redhat.com>; Fri, 12 Feb 2010 14:22:32 -0500
Received: from r74-192-24-94.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.24.94] helo=raydesk1.bettercgi.com)
	by ps536.phatservers.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.66) (envelope-from <support@bettercgi.com>)
	id 1Ng15l-0007WB-PU
	for linux-lvm@redhat.com; Fri, 12 Feb 2010 11:22:21 -0800
Date: Fri, 12 Feb 2010 13:22:16 -0600
From: Ray Morris <support@bettercgi.com>
In-Reply-To: <002801caac02$3556e640$a004b2c0$@at> (from Harald_Heigl@gmx.at
	on Fri Feb 12 10:41:21 2010)
Message-Id: <1266002536.24951.1@raydesk1.bettercgi.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] What happens with full snapshots
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="Flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

> But I also think about trying this:
> http://linuxsoftware.co.nz/blog/2008/03/11/lvm-snapshot-with-no-free-diskspa
> ce
> Do you see any problems here (besides that this snapshot will be  
> definitely
> lost)? As said the "real changed data" will be on the disk, just the
> snapshot is lost ...

   That's an interesting idea, to use ramdisk to hold the
snapshot while taking a backup if no disk space is available.
Indeed it seems to me that just the snapshot would be lost.
A little reconfiguring or vgcfgrestore might be needed to
activate the volume group without the missing PV if power
failed during that procedure.  As noted by someone who replied
there, using a loopback file on the filesystem within the LV
as temporary storage will be problematic a reboots because
it's a chickien and egg problem.  I did that one last week.
(I screw up often, and in varied ways, since I try all kinds
of wacky to things to see what's possible.)

> I use lvmdump -amd [file] to "backup" my lvm (with metadata),
> never tried to restore. Not knowing vgcfgrestore before, from
> the manpage I assume using vgcfgbackup is the right tool to
> backup your metadata, right?


yes.

# man lvmdump
        lvmdump - create lvm2 information dumps for diagnostic purposes

# man vgcfgbackup
        vgcfgbackup - backup volume group descriptor area

    It seems that vgcfgbackup is for creating backups and lvmdump
is for diagnostic purposes.  However, lvm automatically creates
backups before and after every change (by default?).  See:

man lvm.conf | grep -A 15 backup
and:

man vgcfgrestore

> You said you deleted some lv? Then a vgcfgrestore will restore
> the vg and all data (which was there before) will be accessible again?

    Yes, assuming those disk blocks haven't been allocated to
something else and overwritten.  I've used vgcfgrestore a number
of times since as I said I push the limits, try things without
exactly knowing what I'm doing, then writes scripts that will
hopefully automatically do the things I have no business doing.

    vgcfgrestore can also revert several changes back.

    Note - I am not an LVM developer or expert.  I've only used it
extensively for about a year, so anything I say could be slightly
off or even plain wrong.  I have, however, done everything I could
to break my LVM.  Let's shrink some LVs while their filesystems
are mounted, shall we?!  ;)  In fact, let's shrink the LV which
is serving as the disk for a running qemu guest, so that the system
using the LV doesn't even know that half of it has dissapeared!
I found it to be pretty idiot proof, provided that moments of doing
stupid, crazy things to break it are followed by intelligent attempts
to recover rather than panic.
--
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php


On 02/12/2010 10:41:21 AM, Harald Heigl wrote:
> >    The summary answer to the list of questions below
> > is "it works well".
> 
> Thanks a lot for this very fast answer!
> 
> 
> > > 2.       What happens if there is a problem with a snap? I've  
> heard
> > on
> > > reboot the snapshots are lost. What if there is a power shortage,  
> so
> > > the
> > > snap is lost, you boot and the original lv just seeks for the  
> snap?
> >
> >     LVM snapshots are NOT lost on reboot.  That information may  
> apply
> > to some other type of snapshot mechanism unrelated to LVM, or some
> > system could potentially be built on top of LVM which holds  
> snapshots
> > in RAM, but in the normal use case snapshots are written to disk
> > just like any other data you might write to disk.
> 
> Ok I just assume I read something wrong it was about lvm, can't find  
> it
> anymore, perhaps someone had a problem on reboot (what could happen  
> when
> working and experimenting with computers :-) )
> But I also think about trying this:
> http://linuxsoftware.co.nz/blog/2008/03/11/lvm-snapshot-with-no-free-diskspa
> ce
> Do you see any problems here (besides that this snapshot will be  
> definitely
> lost)? As said the "real changed data" will be on the disk, just the
> snapshot is lost ...
> 
> >     LVM can be set to maintain a log of backups of the LVM metadata
> > in case you had a power failure or other major "oops" in the middle
> > of creating a snapshot or something like that.  The tool  
> "vgcfgrestore"
> > can restore the LVM configuration to any of your last X valid
> > configurations.  I've used that several times when I've done
> > something stupid like deleting an important LVM, as I'm doing a
> > lot of weird stuff with LVM.
> 
> This point is interesting, fortunately I had no problem with lvm. I  
> use
> lvmdump -amd [file] to "backup" my lvm (with metadata), never tried to
> restore. Not knowing vgcfgrestore before, from the manpage I assume  
> using
> vgcfgbackup is the right tool to backup your metadata, right? I  
> thought of
> using lvmdump on a regularly basis to get some dumps, I don't know If  
> they
> are useful if something happens.
> 
> You said you deleted some lv? Then a vgcfgrestore will restore the vg  
> and
> all data (which was there before) will be accessible again?
> 
> Thanks again,
> Harald
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
