Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k2VEMNNV024842
	for <linux-lvm@redhat.com>; Fri, 31 Mar 2006 09:22:23 -0500
Received: from mailgateway.unetix.nl (a213-84-10-61.adsl.xs4all.nl
	[213.84.10.61])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k2VEMLI2024539
	for <linux-lvm@redhat.com>; Fri, 31 Mar 2006 09:22:22 -0500
Received: from mailgateway.unetix.nl (localhost [127.0.0.1])
	by mailgateway.unetix.nl (Postfix) with SMTP id 46AC01EF168
	for <linux-lvm@redhat.com>; Fri, 31 Mar 2006 16:22:16 +0200 (CEST)
Received: from knoflook.unetix.nl (unknown [192.168.253.129])
	by mailgateway.unetix.nl (Postfix) with ESMTP id 360F51EF168
	for <linux-lvm@redhat.com>; Fri, 31 Mar 2006 16:22:16 +0200 (CEST)
From: Wim Bakker <wim@unetix.nl>
Subject: Re: [linux-lvm] snapshot error with xfs and disk I/O
Date: Fri, 31 Mar 2006 15:21:22 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200603311621.23093.wim@unetix.nl>
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
To: linux-lvm@redhat.com


>On Thu, Mar 30, 2006 at 09:09:22AM +0100, Wim Bakker wrote:
>> There seem to be serious problems with snapshots , lvm2 and xfs.
> >As soon as there is a slight amount of disk I/O during snapshotting
> >a logical volume with xfs , the following kind of kernel panic occurs:

>You don't say what kernel.
>
>Make sure it contains the dm snapshot patches from -mm (and probably
>in Linus's git tree by now - I haven't checked).
>
>Alasdair

On the original server 2.6.15 was used, on the test server I installed
2.6.16 with pending patches :
--------------
dm-snapshot-fix-kcopyd-destructor.patch
dm-flush-queue-eintr.patch
device-mapper-snapshot-fix-origin_write-pending_exception-submission.patch
device-mapper-snapshot-replace-sibling-list.patch
device-mapper-snapshot-fix-invalidation.patch
drivers-md-dm-raid1c-fix-inconsistent-mirroring-after-interrupted.patch
dm-remove-sector_format.patch
sem2mutex-misc-static-one-file-mutexes.patch
sem2mutex-drivers-md.patch
dm-make-sure-queue_flag_cluster-is-set-properly.patch
#Thisonestillneedspropertesting
#md-dm-reduce-stack-usage-with-stacked-block-devices.patch
#Submittedto-mmbymerecently
dm-snapshot-fix-pending-pe-ref.patch
dm-store-md-name.patch
dm-tidy-mdptr.patch
dm-table-store-md.patch
dm-store-geometry.patch
dm-stripe-fix-bounds.patch
#Submittedto-mmbyothersrecently
dm-md-dependency-tree-in-sysfs-kobject_add_dir.patch
dm-md-dependency-tree-in-sysfs-add_subdirs.patch
dm-md-dependency-tree-in-sysfs-bd_claim_by_kobj.patch
dm-md-dependency-tree-in-sysfs-md_deptree.patch
dm-md-dependency-tree-in-sysfs-dm_deptree.patch
#Newbugfixtopushto-mmnexttime
dm-bio-split-bvec.patch
-------------------------------
as found in 
ftp.kernel.org/pub/linux/kernel/people/agk/patches/2.6/2.6.16-rc1/2.6.16-rc1-dm1/
and conform a recommendation I read in the mail archives regarding the 
problems with snapshots (and xfs?).
Version of lvm is : LVM2.2.02.02 
Version of dm is : device-mapper.1.02.03


The snapshot is mounted under backup , the original LV is mounted under data
and the files that give I/O errors under backup are perfectly accessable on 
the original LV. There is a script in the background running that randomly 
creates files test-* and testfile-* on the data partition.
Meanwhile I have going on with some testing , to that end I installed kernel 
2.4.32 with the dm and lock patches , reinstalled the latest lvm2 stable and 
dm stable. And ran under 2.4.32 the same tests as under 2.6.16 with the
extra pending patches.
I restarted the system with 2.4.32 and ran the same tests as with 2.6.16
and no problems occurred at all.
Then I restarted the system again with kernel 2.6.16 , and lvremove locked up 
again with the resulting kernel panic when forcefully removing the snapshot
volume , like before. I than restarted again with kernel 2.4.32 and all tests
and snapshots run smoothly, so it seems definitely related to kernel 2.6.x.
For the production machine we need definitely 2.6 though because of the areca 
controller.

sincerely
Wim Bakker
