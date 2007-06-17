Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l5HBbZa6019222
	for <linux-lvm@redhat.com>; Sun, 17 Jun 2007 07:37:35 -0400
Received: from mail.ukfsn.org (s2.ukfsn.org [217.158.120.143])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l5HBbXwN027248
	for <linux-lvm@redhat.com>; Sun, 17 Jun 2007 07:37:33 -0400
Message-ID: <46751CEC.5090308@dgreaves.com>
Date: Sun, 17 Jun 2007 12:37:16 +0100
From: David Greaves <david@dgreaves.com>
MIME-Version: 1.0
References: <46744065.6060605@dgreaves.com> <200706170047.20559.rjw@sisk.pl>
In-Reply-To: <200706170047.20559.rjw@sisk.pl>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: 2.6.22-rc4 XFS fails after hibernate/resume
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
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: LVM general discussion and development <linux-lvm@redhat.com>, linux-pm <linux-pm@lists.osdl.org>, "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>, xfs@oss.sgi.com

Rafael J. Wysocki wrote:
> On Saturday, 16 June 2007 21:56, David Greaves wrote:
>> This isn't a regression.
>>
>> I was seeing these problems on 2.6.21 (but 22 was in -rc so I waited to try it).
>> I tried 2.6.22-rc4 (with Tejun's patches) to see if it had improved - no.
>>
>> Note this is a different (desktop) machine to that involved my recent bugs.
>>
>> The machine will work for days (continually powered up) without a problem and 
>> then exhibits a filesystem failure within minutes of a resume.
>>
>> I know xfs/raid are OK with hibernate. Is lvm?
>>
>> The root filesystem is xfs on raid1 and that doesn't seem to have any problems.
> 
> What is the partition that's showing problems?  How's it set up, on how many
> drives etc.?
I did put that in the OP :)
Here's a recap...
/dev/mapper/video_vg-video_lv on /scratch type xfs (rw)

md1 : active raid5 sdd1[0] sda1[2] sdc1[1]
       390716672 blocks level 5, 64k chunk, algorithm 2 [3/3] [UUU]

haze:~# pvdisplay
   --- Physical volume ---
   PV Name               /dev/md1
   VG Name               video_vg
   PV Size               372.62 GB / not usable 3.25 MB
   Allocatable           yes (but full)
   PE Size (KByte)       4096
   Total PE              95389
   Free PE               0
   Allocated PE          95389
   PV UUID               IUig5k-460l-sMZc-23Iz-MMFl-Cfh9-XuBMiq

> 
> Also, is the dmesg output below from right after the resume?

It runs OK for a few minutes - just enough to think "hey, maybe it'll work this 
time".  Not more than an hour of normal use.
Then you notice when some app fails because the filesystem went away.
The dmesg comes from that point.

David
