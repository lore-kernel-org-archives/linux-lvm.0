Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3TINwrc021810
	for <linux-lvm@redhat.com>; Thu, 29 Apr 2010 14:23:58 -0400
Received: from EXHUB016-3.exch016.msoutlookonline.net
	(exhub016-3.exch016.msoutlookonline.net [207.5.72.226])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o3TINjhe016714
	for <linux-lvm@redhat.com>; Thu, 29 Apr 2010 14:23:45 -0400
Message-ID: <4BD9CEAF.3060906@cfl.rr.com>
Date: Thu, 29 Apr 2010 14:23:43 -0400
From: Phillip Susi <psusi@cfl.rr.com>
MIME-Version: 1.0
References: <loom.20100429T185325-182@post.gmane.org>
In-Reply-To: <loom.20100429T185325-182@post.gmane.org>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] will pvmove'ing (an LV at a time) defragment?
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: "Brian J. Murrell" <brian@interlinx.bc.ca>

On 4/29/2010 12:59 PM, Brian J. Murrell wrote:
> If I currently have a volume group consisting of two drives and I add a third 
> drive and them pvmove from the two existing drives to the new drive, will that 
> defragment my LVs?  i.e.:
> 
> # pvmove /dev/sda2 /dev/sdb /dev/sdc
> 
> where /dev/sdc is the new empty drive.

That will move all extents OFF of sda2 and onto sdb and sdc.  I believe
that the default allocation policy will try to locate extents on the
same pv as other extents that lv is using.  Whether or not that results
in more or less fragmentation depends on the current layout.

> Or will it just move the PEs from each source disk (in turn) in the order they 
> appear on the source disk, effectively just concatenating the two sources disks 
> to the new target disk?

In the above command there is one source disk and two destination disks,
not the other way around.  Only the first argument to pvmove is the
source, any additional arguments lists valid destination(s), otherwise
any pv other than the first argument is used.

If you want to defrag your lvs then you need to look at the current
layout with lvdisplay -m and then you can tell pvmove exactly what
extents you want moved to where with something like pvmove /dev/sda:x-y
/dev/sda:q-r --alloc anywhere.  The --alloc anywhere is needed if the
source and destination drives are the same, since otherwise pvmove tries
to move the extents to any volume OTHER than the source, and if you
restrict the possible destinations with the second argument to only the
source drive, the allocation will fail.
