Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l16Hgr5o009942
	for <linux-lvm@redhat.com>; Tue, 6 Feb 2007 12:42:53 -0500
Received: from mail.myself.gen.nz
	(Debian-exim@203-97-171-123.cable.telstraclear.net [203.97.171.123])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l16Hgold028380
	for <linux-lvm@redhat.com>; Tue, 6 Feb 2007 12:42:52 -0500
Received: from malkuth.lan.myself.gen.nz ([192.168.1.20] helo=[127.0.0.1])
	by mail.myself.gen.nz with esmtp (Exim 4.50) id 1HEUK5-0007ld-DU
	for linux-lvm@redhat.com; Wed, 07 Feb 2007 06:41:55 +1300
Message-ID: <45C8BDE7.5020403@myself.gen.nz>
Date: Wed, 07 Feb 2007 06:41:59 +1300
From: Steve Wray <steve@myself.gen.nz>
MIME-Version: 1.0
References: <45C62BB0.6090004@free.fr>
	<abae97f2062bff4699caa277e2faea30@redhat.com>
In-Reply-To: <abae97f2062bff4699caa277e2faea30@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] replacing a failling disk on a mirrred VG.
Reply-To: steve@myself.gen.nz,
	LVM general discussion and development <linux-lvm@redhat.com>
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

Jonathan E Brassow wrote:
> This one should be pretty easy...
> 
> Effectively, you want to keep the primary mirror devices, so do:
> lvconvert -m0 <vg/lv>
> to down convert them to linear devices.
> 
> Then remove PV1 (vgreduce), add a new disk to your system, add it to 
> your vg (vgextend), and finally, up-convert the linear devices to 
> mirrors again:
> lvconvert -m1 <vg/lv>

So you can't just add a new disk and use pvmove to move extents off of 
the failing disk?


> On Feb 4, 2007, at 12:53 PM, Georges Giralt wrote:
> 
>> Hi !
>> I run A Fedora Core 6 box with
>> lvm> version
>>   LVM version:     2.02.17 (2006-12-14)
>>   Library version: 1.02.13 (2006-11-28)
>>   Driver version:  4.10.0
>> lvm>
>> on a 2.6.19 kernel.
>> My VG comprises 3PV  onto which I've spread 4 mirrored LVs.
>> PV 0 : LV1 mirror copy 0, LV2 mirror copy 0, lv3 mirror copy 0 and lv4 
>> mirror copy 0
>> PV 1 : LV1 mirror copy 1, LV2 mirror log, LV3 mirror log and LV4 
>> mirror copy 1
>> PV2 : LV1 mirror log, LV2 mirror copy 1 , LV3 mirror copy 1 and LV4 
>> mirror log.
>> I plan to replace (Smart signals a future failure) the PV #1.
>> Question : What is the best route to do this ? And is it feasible ?
>> Thanks a lot in advance for your answer !
