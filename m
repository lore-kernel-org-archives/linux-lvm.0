Return-Path: <jdomingo@crosswinds.net>
Date: Wed, 25 Jul 2001 16:46:36 +0000
From: =?iso-8859-1?Q?Jos=E9_Luis_Domingo_L=F3pez?= <jdomingo@internautas.org>
Subject: Re: [linux-lvm] LVM vs. md: Benefits in RAID0?
Message-ID: <20010725164636.A598@dardhal.mired.net>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <996017561.930.29.camel@andromeda>
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

On Tuesday, 24 July 2001, at 19:32:35 -0400,
Jason Tackaberry wrote:

> Hi Jos�, thanks for your reply.  I have a few questions:
> 
> On 24 Jul 2001 22:46:56 +0000, Jos� Luis Domingo L�pez wrote:
> > The quick and dirty hack to get resizable RAIDed storage devices is:
> > 
> > a) Layer LVM on top of (hard/soft) RAID
> 
> The problem I see with this is that if you extend the volume group by
> adding a new partition, the new partition must be linearly concatenated
> and so it won't be part of the stripe set.  So while you can technically
> extend this configuration, you're not truly resizing the RAID device.
> Suppose you start off with an md stripe set with sda1 and sdb1, and then
> later on you want to add sdc1, you get something like this:
> 
What I was thinking about was an underlying RAID0 device with a size
greater than the largest LV size you will ever need. I searched through
linux-raid archives and I found no reference about whether "extending"
stripped RAIDs (0 and 5) is something possible or feasable to do.

My idea was: take 3 40 GB disks, get a 80 GB RAID 0 and create LV and
filesystems on demand. Maybe you don't need to store 80 GB worth of data
by now, so you have some GB left just in case. Should your dataset ever
grows too much, lvextend to a maximun on 80 GB (minus space for the rest
of the LV created).

If extending stripped RAIDs is not possible, adding a single drive to the
existing VG can impose a bottleneck on R/W speed, so maybe is a matter of
generating another stripped RAID similar to the old one, and add it to the
VG with a simple vgextend. In this situation you have to be very careful
about placing disks and making backups if you want to retain high R/W
performance and/or protection on disk failures (for certain RAID levels).

That is, borrowing your "lame ASCII art" ;-), you'll get:

+--------------------------------+
|         logical_vol01          |
+--------------------------------+----+
|         volume_group01              |
+-------------------+-----------------+
|     md0 RAID0     |   md1 RAID 0    |
+-------------------+--------+--------+
|   sda1   |  sdb1  |  sdc1  |  sdd1  |
+----------+--------+--------+--------+


> > b) Layer sotfware RAID on top of software LVM
> 
> I'm just not sure how this would work?  You can't extend md devices, as
> far as I know.  So you can extend the underlying logical volume, but
> then from the RAID layer on top, it just sees one device, so it's not
> really RAID at all.  Can you clarify on this one?
> 
Think about a RAID device made of LVs: you configure /etc/raidtab, write
RAID superblocks with mkraid and create a filesystem over md0. Should you
need a larger md0 device, put RAID offline, enlarge the corresponding LV
and rewrite RAID superblocks on these LV with mkraid -f.

As far as I know, mkraid just generates RAID superblocks, without touching
real data (except when you change RAID type :). After mkraid -f, cat
/proc/mdstat shows the new size of the RAID device, and you are only a
filesystem resize from a larger RAID over LVM.

All of these tried on a test machine, just for the fun of it. I don't have
neither the hardware nor the time to test this, with "real" hardware and
"real" data. I hope to have both time and hardware to play with on August,
when people is on vacation and business is quite low.

Greetings.

-- 
Jos� Luis Domingo L�pez
Linux Registered User #189436     Debian GNU/Linux Potato (P166 64 MB RAM)
 
jdomingo EN internautas PUNTO org  => � Spam ? Atente a las consecuencias
jdomingo AT internautas DOT   org  => Spam at your own risk
