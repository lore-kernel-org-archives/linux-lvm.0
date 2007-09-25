Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l8PLrfb1008328
	for <linux-lvm@redhat.com>; Tue, 25 Sep 2007 17:53:41 -0400
Received: from mail.memcpy.com (whistler.memcpy.com [69.36.243.53])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l8PLrel0029950
	for <linux-lvm@redhat.com>; Tue, 25 Sep 2007 17:53:40 -0400
Subject: Re: [linux-lvm] LVM2 striping or md raid0
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Tue, 25 Sep 2007 14:40:28 -0700
From: Kelly Byrd <kbyrd-lvm@memcpy.com>
In-Reply-To: <4b9a0d7ea026e7ca31fcfc9063443f08@memcpy.com>
References: <4b9a0d7ea026e7ca31fcfc9063443f08@memcpy.com>
Message-ID: <83eabe914754651e07860c6d3f3d7eb6@memcpy.com>
Reply-To: kbyrd-lvm@memcpy.com,
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>




On Tue, 25 Sep 2007 14:21:44 -0700, Kelly Byrd <kbyrd@memcpy.com> wrote:
> 
> 
> On Tue, 25 Sep 2007 16:26:30 -0500, Chris Cox <chris_cox@stercomm.com>
> wrote:
>> Kelly Byrd wrote:
>>>
>>>
>>> On Sat, 22 Sep 2007 18:36:41 -0700, Kelly Byrd <kbyrd-lvm@memcpy.com>
>>> wrote:
>>>> Two questions really:
>>>>
>>>> I'm going to use lvm to partition up 4 equal size partitions.
>>>> I can either use the md driver to RAID0 them the make /dev/md0
>>>> my PV, or just use the 4 partitions as PVs and stripe across
>>>> them.
>>>>
>>>> How does lvm2 striping compare with md's RAID0 as far as speed?
>>>> I don't quite get how it stripes on chunk sizes smaller than
>>>> a PE, but a 4MB stripe size seems crazy.
>>>>
>>>> Finally, what's the tuning advice for LVM2 striping? I usually
>>>> create my RAID0 or RAID5 with 128k chunk sizes, is it similar
>>>> for LVM2 striping?
>>>>
>>>>
>>>
>>> anyone?
>>
>> This is merely my own opinion, but md was designed to be
>> THE software raid mechanism.  So, my preference would be
>> to establish a RAID md device and make that into a PV.
>>
>> Of course, I don't believe in non-RAID (i.e. RAID0) anyhow.
>> Maybe someone else will chime in on this one.
>>
>>
> 

I had the same thought, but there's also this instinct that
'one less layer between my files and this physical disk is
better'. I'm really hoping someone will say something like:
'LVM2 striping uses the same code as md raid0' or some other
silly thing.
