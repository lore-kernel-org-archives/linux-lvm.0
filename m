Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iA15kCr27079
	for <linux-lvm@redhat.com>; Mon, 1 Nov 2004 00:46:12 -0500
Received: from geeksite.geeksite.org (ibz.geeksite.org [63.227.242.54])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iA15kA9Z002889
	for <linux-lvm@redhat.com>; Mon, 1 Nov 2004 00:46:11 -0500
Received: from localhost (unknown [127.0.0.1])
	by geeksite.geeksite.org (Postfix) with ESMTP id 515FA2E7173
	for <linux-lvm@redhat.com>; Sun, 31 Oct 2004 22:54:37 -0700 (MST)
Received: from geeksite.geeksite.org ([127.0.0.1])
	by localhost (geeksite [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 24185-10 for <linux-lvm@redhat.com>;
	Sun, 31 Oct 2004 22:54:33 -0700 (MST)
Received: from [192.168.0.7] (xscott.theserrs.net [63.227.243.149])
	by geeksite.geeksite.org (Postfix) with ESMTP id 97EF92F564B
	for <linux-lvm@redhat.com>; Sun, 31 Oct 2004 22:54:33 -0700 (MST)
Message-ID: <4185DBA8.7060605@theserrs.net>
Date: Sun, 31 Oct 2004 23:46:00 -0700
From: Scott Serr <serrs@theserrs.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Software raid on top of lvm logical volume
References: <41801ADE.6030308@monjoin.net>
	<20041028011738.GD13737@kluge.net>	<41814060.4040400@mikebabcock.ca>
	<41851771.4060203@markus.org>
In-Reply-To: <41851771.4060203@markus.org>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

I've done something like Markus explained.  I had this email ready to go 
a couple days ago, but the compose window was hidden for a while... I 
hope it's not too stale for the original poster of this thread:

2.4.26 with latest LVM2 works well.  I did something crazy, alot of 
people probably don't understand why.

I have software RAID5.

md0 = hda5 hdb5 hdc5 hdd5 hde5
md1 = hda6 hdb6 hdc6 hdd6 hde6
md2 = hda7 hdb7 hdc7 hdd7
md3 = hda8 hdb8 hdc8 hdd8

Then I have just one big vgdata and one lvdata.

Why would I want to do this?  I couldn't find any other way to have 
redundancy and be flexible.  If I replace a physical disk with a larger 
one, for instance hde needs to be bigger so I can make md2 and md3 
stretch across that disk too...  then I am able to do pvmove from md2 to 
a scratch disk, recreate md2 across hda7-hde7, then pvmove back.

-Scott

Markus Baertschi wrote:

> Michael T. Babcock wrote:
>
>>
>> I've thought about this numerous times -- there is the distinct 
>> resizing advantage.  Namely, if I create a software RAID partition, I 
>> can't resize it afterward without destroying it.  I have for example, 
>> on occasion, had three disks set up where 1/3 of each was devoted to 
>> a RAID-0 very fast striping set for data transfers that had to be 
>> fast but if they were lost it wasn't critical, and 2/3 was set up as 
>> RAID-5 for reliability of another set of data.
>>
>> I understand this may not be optimal in some situations, but some of 
>> us don't have thousands of dollars for SCSI HW RAID controllers.
>
>
> You can make life easier by creating several raid arrays on the same 
> disks and tie them together with LVM.
> For example split your three 160GB drives into 4 partitions each and 
> create a raid over the three disks.
>
> sda -> sda1+sda2+sda3+sda4, etc.
> md0 = sda1+sdb1+sdc1, md1=sda2+sdb2+sdc2, etc.
>
> Markus
>
