Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id iAGFwdiX007219
	for <linux-lvm@redhat.com>; Tue, 16 Nov 2004 15:58:39 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1CU5j5-0003g5-3F
	for linux-lvm@redhat.com; Tue, 16 Nov 2004 15:58:39 +0000
Date: Tue, 16 Nov 2004 15:58:39 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Expanding a PV on a hardware RAID
Message-ID: <20041116155839.GJ24229@agk.surrey.redhat.com>
References: <OF921189DB.5199A5A6-ON86256F4D.0063CB48-86256F4D.00673909@austinlogistics.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OF921189DB.5199A5A6-ON86256F4D.0063CB48-86256F4D.00673909@austinlogistics.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Nov 15, 2004 at 12:47:28PM -0600, Jetkins@austinlogistics.com wrote:
> any way to expand a PV, and therein lies my problem.  It seems that without
> a pvexpand or pvresize command, I have no way of utilizing the additional
> space.
 
LVM1 or LVM2?

> 1)  Am I missing something, or is there currently no way to expand a PV?,

Using LVM2 tools you can pvexpand (offline) by backing up the metadata, 
editing the PV size in it (pe_count), then restoring it.
  new pe_count = 
    floor((new_disk_size_in_512_byte_sectors - pe_start) / extent_size)

> 2)  Would I have been better off creating a partition table and
> pvcreate'ing on /dev/sdb1instead of pvcreate'ing the entire /dev/sdb disk
> initially, given that I could now have created a new partition on the extra
> space and pvreate'd a new PV alongside the old?

That's the supported way.
 
Alasdair
-- 
agk@redhat.com
