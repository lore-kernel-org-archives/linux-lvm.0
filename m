Message-ID: <401EA69A.5040807@stercomm.com>
From: Chris Cox <chris_cox@stercomm.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Best practice for lvm on raid-5
References: <20040202153506.GN5191@deepthought.hausboot.org>
In-Reply-To: <20040202153506.GN5191@deepthought.hausboot.org>
Content-Transfer-Encoding: 7bit
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
Date: Mon Feb  2 14:37:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Jens Hoffrichter wrote:
> Hi everyone,
> 
> I have a LVM vg on top of a softraid 5 consisting of 3 80 GB harddrives.
> 
> Currently I have /dev/md0 as my only physical volume, but this will lead
> to problems if I am going to expand the raid 5 by adding another 80 GB
> harddrive to (as pvresize is not implemented again yet, as I understand).
> 
> What is the best practice in this case? To add a partition table on top
> of /dev/md0 (but how is it represented in the /dev filesystem) and only
> add single partitions as pvs to the vg?
> 
> I'm happy for every suggestion :)

Obviously you cannot extend the existing md0 RAID5.  However you can
add another PV to the VG.  That new PV could be another soft RAID5.
It doesn't have to be though... you can basically build quite
a menagerie with LVM if you really want to.
