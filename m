Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102102318.f1ANIMw08543@webber.adilger.net>
Subject: Re: [linux-lvm] Weird corruption of volume group configuration with
 LVM
In-Reply-To: <Pine.LNX.4.20.0102102121410.5354-101000@menswerk.cyclone.se> from
 Hans Engren at "Feb 10, 2001 09:35:31 pm"
Date: Sat, 10 Feb 2001 16:18:22 -0700 (MST)
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

You write:
> I've attached a gzip'ed output from "vgscan -d -v" to this mail. Checking
> out the end of the output, it doesn't seem that good - atleast to me..

You must not have been running my version of vgscan?  One of the obvious
problems is that the "lvm_dir_cache" is not a cache at all, and re-reads
the devices each time it is called, making your output 25667 lines -
nearly useless from a debugging standpoint (not to mention it is doing a
LOT of duplicate work).  That will be my first patch...

> Suggestions ?

Looking at the end of your output shows the following:

<22> pv_read_all_pv()  -- avoiding multiple entries in case of MD; np: 25

so it found 25 PVs in your system.  This is correct I believe, from your
previous email.  24 of these PVs are in VG mw1, and 1 is unused?

Later, when pv_read_all_pv_of_vg() calls pv_read_all_pv() again, it
shows np=0 (I'm not sure if this is a real bug, or just the way the
original code works).  Also strange is that pv_read_all_pv_of_vg()
is checking the UUIDs, it shows one UUID twice (again, this may not be
a bug, because the old code is confusing).  What IS a problem is that
there are only 22 UUIDs listed at this point, but you have 24 PVs in
your VG.

At this point your vgscan output ends?  It is an error, but there
_should_ be some more output saying it was an error, unless that is
where you have your segfault.

Try commenting the code in pv_read_all_pv_of_vg() where the UUIDs are
being checked (i.e. starting with "if (uuids != 0)" or whatever).  You
could also try to compile my LVM tools tree below, and send the vgscan
output from that instead, because it will be a lot less than 25k lines...

http://bazaar.turbolinux.co.jp/~adilger/lvm-0.9-patches-WIP.tgz

The only reason I was warning users about this is that I don't want
people to start using this source code for general use.  It is not a
"release", just for debugging this problem.  Sorry, I also had the
URL wrong in my last email.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
