Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102261729.f1QHTAZ10614@webber.adilger.net>
Subject: Re: [linux-lvm] Slackware init
In-Reply-To: <20010226082718.B1481@sistina.com> from AJ Lewis at "Feb 26, 2001
 08:27:18 am"
Date: Mon, 26 Feb 2001 10:29:09 -0700 (MST)
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
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

AJ Lewis writes:
> On Mon, Feb 26, 2001 at 07:08:55AM -0500, ardy@rdb.linux-help.org wrote:
> > On Sun, 25 Feb 2001, AJ Lewis wrote:
> > 
> > > Are you by chance using a 2.4.x kernel with devfs support compiled in, but
> > > not being mounted?  I am seeing the same thing with that setup.
> > 
> > Yes, 2.4.2, no devfs.
> 
> I think the issue is that /proc is not yet mounted when you call vgscan.
> If you look at the tools/lib/lvm_dir_cache.c file at line 90, you will
> see that it checks for /proc/partitions.  If it finds that, it only scans
> the files in /proc/partitions.  Otherwise, it goes through all the possible
> devices LVM recognizes. 
> 
> So if you can get /proc mounted before you call vgscan, it should not take
> so long, nor should it scan for all those devices you do not have on your
> system.

It is also worth mentioning that until beta5, the lvm_dir_cache() function
did not cache any of the device entries.  This means that any time you wanted
to get a list of PVs (which happens quite often if you have multiple VGs),
it would do the full scan of /dev again.

Even with the proper lvm_dir_cache() operation in beta5, it still takes me
55 seconds on my laptop with a full /dev/ide (COMPAQ_SMART2) and /dev/rd
(DAC960), and only 4.5 seconds without these devices.  If you don't have
these devices, feel free to delete the directories.  For the next version
of the LVM tools, there will likely be a reorganization of this area so that
the whole thing will be speeded up.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
