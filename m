Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jB9JmgV18400
	for <linux-lvm@redhat.com>; Fri, 9 Dec 2005 14:48:42 -0500
Received: from ramoth.dragonhold.org (ramoth.dragonhold.org [80.229.192.20])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jB9Jm6u6032175
	for <linux-lvm@redhat.com>; Fri, 9 Dec 2005 14:48:07 -0500
Received: from gwood by ramoth.dragonhold.org with local (Exim 4.50)
	id 1EkoDp-0004xk-2O
	for linux-lvm@redhat.com; Fri, 09 Dec 2005 19:48:01 +0000
Date: Fri, 9 Dec 2005 19:48:01 +0000
From: Graham Wood <clvm@spam.dragonhold.org>
Subject: Re: [linux-lvm] Newbie of LVM
Message-ID: <20051209194800.GA7494@dragonhold.org>
References: <20051209033914.33441.qmail@web32605.mail.mud.yahoo.com>
	<4399D72B.80408@mattgillen.net>
	<7119d52b0512091138s5615a650q5bad1a566cbde72b@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7119d52b0512091138s5615a650q5bad1a566cbde72b@mail.gmail.com>
Sender: <gwood@dragonhold.org>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Dec 09, 2005 at 02:38:49PM -0500, Jeff Cousino wrote:
> But couldn't he set up his new drive with LVM copy the data from the
> old drive to it, provided it's large enough and then add the old drive
> to the group?
As long as he can get the downtime to do it, sure.  At that point the
device '/dev/md5' can be added as a PV and the volume grown.

However - to do that he'd need to unmount the existing volume, ideally
for the time it took to do the copy (although there are ways around
that). 

And also, the answer to the initial question is still no, since that's
just a different way to do it.

If the new storage device is big enough (and the solution wanted is not
a RAID that requires the existing disk space to build) then the
following would be a way to do it:

1. Create the PV/VG on the new disk (since it doesn't look as though LVM 
is in use at all on that machine, if it is then do as appropriate)
2. Create the new volume, and mount it under /mnt or something.
3. use rsync to get the two volumes (existing & new) in sync.  The
command I use is:
	rsync --delete-after -av /www /mnt
4. Arrange a downtime of at least 15 minutes, and during that move the
mount points around (after stopping all applications that use /www):
	rsync --delete-after -av /www /mnt # bring the copy up to date
	umount /mnt
	umount /www
	mount <LVM device> /www
5. Restart all the applications

Things to note about this are that not only does it require a lot of
disk space, but it also will be quite slow (especially if there are lots
of little files on /www).  If you start work well before you can arrange
the downtime (last time I did this I had everything in place and had to
wait 2 weeks for the window to do the rotation) then you can keep
running the rsync to keep the two copies closer together and therefore
keep the downtime to a minimum.

A shorter term solution would be to migrate some of the data off /www
and use symlinks.  That would still require a brief downtime to move
around the data - but it doesn't require the big hit.  (e.g. mount the
new partition as /www2 and then move /www/site1 to /www2/site1 and then
create a symlink /www/site1 to /www2/site1 - couple of other things to
be aware of, but that's the principle).
