Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l8PLQc7B029254
	for <linux-lvm@redhat.com>; Tue, 25 Sep 2007 17:26:38 -0400
Received: from shuttlerun.csg.stercomm.com (scidalsmtp02.csg.stercomm.com
	[204.214.3.25])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l8PLQc4K014707
	for <linux-lvm@redhat.com>; Tue, 25 Sep 2007 17:26:38 -0400
Message-ID: <46F97D06.60306@stercomm.com>
Date: Tue, 25 Sep 2007 16:26:30 -0500
From: Chris Cox <chris_cox@stercomm.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM2 striping or md raid0
References: <5cbd03f56b69e61e1407530930bb5939@memcpy.com>
	<f73e16539766341385fcc97b8915a65f@memcpy.com>
In-Reply-To: <f73e16539766341385fcc97b8915a65f@memcpy.com>
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

Kelly Byrd wrote:
> 
> 
> On Sat, 22 Sep 2007 18:36:41 -0700, Kelly Byrd <kbyrd-lvm@memcpy.com>
> wrote:
>> Two questions really:
>>
>> I'm going to use lvm to partition up 4 equal size partitions.
>> I can either use the md driver to RAID0 them the make /dev/md0
>> my PV, or just use the 4 partitions as PVs and stripe across
>> them.
>>
>> How does lvm2 striping compare with md's RAID0 as far as speed?
>> I don't quite get how it stripes on chunk sizes smaller than
>> a PE, but a 4MB stripe size seems crazy.
>>
>> Finally, what's the tuning advice for LVM2 striping? I usually
>> create my RAID0 or RAID5 with 128k chunk sizes, is it similar
>> for LVM2 striping?
>>
>>
> 
> anyone?

This is merely my own opinion, but md was designed to be
THE software raid mechanism.  So, my preference would be
to establish a RAID md device and make that into a PV.

Of course, I don't believe in non-RAID (i.e. RAID0) anyhow.
Maybe someone else will chime in on this one.


-- 
Chris Cox
Sr. Unix Sys Admin
