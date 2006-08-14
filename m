Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7E4iHYJ029352
	for <linux-lvm@redhat.com>; Mon, 14 Aug 2006 00:44:17 -0400
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k7E4i8Ru011345
	for <linux-lvm@redhat.com>; Mon, 14 Aug 2006 00:44:09 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1GCUIz-0006QO-PD
	for linux-lvm@redhat.com; Mon, 14 Aug 2006 06:44:01 +0200
Received: from ip70-171-110-249.no.no.cox.net ([70.171.110.249])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Mon, 14 Aug 2006 06:44:01 +0200
Received: from randall by ip70-171-110-249.no.no.cox.net with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Mon, 14 Aug 2006 06:44:01 +0200
From: Randall Smith <randall@tnr.cc>
Date: Sun, 13 Aug 2006 23:42:57 -0500
Message-ID: <ebov27$h48$1@sea.gmane.org>
References: <eb8oo1$rj2$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <eb8oo1$rj2$1@sea.gmane.org>
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] Re: lvm partition on lv
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
To: linux-lvm@redhat.com

Randall Smith wrote:
> Warning:  This may be insane.
> 
> I like the flexibility of LVM and try to use it wherever it's feasible. 
>  In this case, I'd like a Xen guest OS to have control over it's LV's. 
>  The method I usually see for using LVM with Xen is to create an LV and 
> a filesystem on it.  I would like to instead create an LV and partition 
> it with an LVM partition and maybe other partition types.  Just to test 
> this I did the following:
> 
> 1. lvcreate -L 100M -name test vg1
> 2. cfdisk /dev/vg1/test
> 3. create LVM partition on entire device
> 4. pvcreate /dev/vg1/test
> 5. vgcreate vg2 /dev/vg1/test
> 6. vgchange -ay /dev/vg2
> 7. lvcreate -L 50M -n testlv vg2
> 8. mkfs.ext3 /dev/vg2/testlv
> 9. mkdir /mnt/test
> 10. mount /dev/vg2/testlv /mnt/test
> 
> And it worked!  Cool!
> 
> Let's say on /dev/vg1/test I had one LVM partition and one ext3 
> partition.  How can I access those separate partitions since it's only 
> one device (/dev/vg1/test)?  Normally, a partitioned block device 
> (/dev/hda) would show up like /dev/hda1, dev/hda2, etc.
> 
> In the example above, I'm partitioning the LV and using the partition on 
> the same system, which is useless.  What I will be doing is giving the 
> disk image /dev/vg1/test to a Xen guest so it can have it's own VG and 
> LVs.  Are there potential problems I should look out for and/or tweaking 
> I should do to make this work optimally?
> 

/dev/vg1/test is used as a disk for the Xen guest OS.  The guest then 
recognizes vg2 on /dev/vg1/test.  By default, the host will also 
recognize and activate vg2.  Is there a problem with this and should I 
somehow configure the host not to activate vg2?  I know this may be 
confusing, but it's very useful.  I actually have it working now with 
several LVs on vg2.  So I've got PV->VG->LV->PV->VG-(LVs).

Randall
