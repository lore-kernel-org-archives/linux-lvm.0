Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j1RNi9K27740
	for <linux-lvm@redhat.com>; Sun, 27 Feb 2005 18:44:09 -0500
Received: from Datawav.net ([63.228.244.4])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j1RNi7gK020198
	for <linux-lvm@redhat.com>; Sun, 27 Feb 2005 18:44:08 -0500
Message-ID: <4222541B.40206@theserrs.net>
Date: Sun, 27 Feb 2005 16:13:31 -0700
From: Scott Serr <serrs@theserrs.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm over raid5 - sizes
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

I have alot of ideas going through my head.  Here is my situation:

I've had 5 IDEs with 4 partitions each.  Each partition is in a RAID5 
md:stripped.
md0 = hda5, hdb5, hdc5, hdd5, hde5
md1 = hda6, hdb6, hdc6, hdd6, hde6
md2 = hda7, hdb7, hdc7, hdd7
md3 = hda8, hdb8, hdc8, hdd8

md0-3 are in an LVM2 volume group.  This makes it really nice when 
expanding or adding another disk because I just pull say md3 out of the 
volume group... rebuild md3 bigger and then add it back. 

I just upgraded, replacing hde with a bigger disk and while the pvmoves 
are taking FOREVER...  I thought what is the right size for the RAID5 
chunk-size?

I have chunk-size = 128k right now.

The pv extents size is (always?) 4MB.

Am I just shooting myself in the foot by not making my RAID chunk size 
atleast 1MB?  Can someone give me a reason to increase it?

BTW, I'm using reiserfs with default sizes and my needs are mixed.  I 
have many couple gig files, but also some "rsyncs" of client machines as 
backups/archives.

Thanks for any ideas,
Scott
