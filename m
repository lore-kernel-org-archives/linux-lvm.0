Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n5MHbECX021339
	for <linux-lvm@redhat.com>; Mon, 22 Jun 2009 13:37:14 -0400
Subject: Re: [linux-lvm] recovering data from inside a partitioned lv
From: "Bryn M. Reeves" <bmr@redhat.com>
In-Reply-To: <104D56B6-A5AA-44BC-A1A6-EDCF2FC098A8@merit.edu>
References: <104D56B6-A5AA-44BC-A1A6-EDCF2FC098A8@merit.edu>
Date: Mon, 22 Jun 2009 18:42:09 +0100
Message-Id: <1245692529.18101.470.camel@breeves.fab.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, 2009-06-22 at 13:23 -0400, Anthony Clark wrote:
> Hi,
> 
> The following stupid mistake was made :(  A pv, vg and lv were  
> created, and then the documentation was misread, and a partition was  
> created inside the lv.  Said partition mounted fine, and allowed fs  
> creation along with large amounts of data to be copied.  Partition was  
> accessible via /dev/vg1/lv1p1.
> 
> Server has been rebooted, and now only /dev/vg1/lv1 is shown.  parted  
> can open the lv and shows 1 partition inside, but doesn't understand  
> ext3 volumes, so can't copy the partition to another disk.  tune2fs  
> can't see /dev/vg1/lv1p1, or I'd use that to change the fs type to ext2.
> 
> Is there a way to undo the stupid mistake and get at the partition  
> inside the logical volume?  That is to say, mount the partition, copy  
> the data out and then create the filesystem correctly.  Is there a way  
> to force /dev/vg1/lv1p1 to show up again?

kpartx -a /dev/vg1/lv1

Will create maps for all the partitions defined inside the LV. See man
kpartx for the remaining options.

Cheers,
Bryn.
