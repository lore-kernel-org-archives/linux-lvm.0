Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k95KF8nn023372
	for <linux-lvm@redhat.com>; Thu, 5 Oct 2006 21:15:08 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1GVZca-0006X0-2z
	for linux-lvm@redhat.com; Thu, 05 Oct 2006 21:15:08 +0100
Date: Thu, 5 Oct 2006 21:15:08 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] LVM2, RAID5 and ext3 stride
Message-ID: <20061005201508.GP17654@agk.surrey.redhat.com>
References: <da2267130610041422pa597b5dq619ca685a5e2de02@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <da2267130610041422pa597b5dq619ca685a5e2de02@mail.gmail.com>
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

On Wed, Oct 04, 2006 at 03:22:58PM -0600, Jason Gunthorpe wrote:
> 384 sectors from the start of the partition, so the filesystem is not

> Is there some way to run pvcreate to get 4M extents that are always 4M
> aligned, and still be able to do interesting things like grow the pv?

Try out the --metadatasize option of pvcreate.
 
Alasdair
-- 
agk@redhat.com
