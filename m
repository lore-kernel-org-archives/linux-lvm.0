Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8PM5Tr05585
	for <linux-lvm@redhat.com>; Sat, 25 Sep 2004 18:05:29 -0400
Received: from mail.myself.gen.nz (203-79-83-162.cable.paradise.net.nz
	[203.79.83.162])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i8PM5QYL019489
	for <linux-lvm@redhat.com>; Sat, 25 Sep 2004 18:05:27 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.myself.gen.nz (Postfix) with ESMTP id 9D97D180098
	for <linux-lvm@redhat.com>; Sun, 26 Sep 2004 10:09:04 +1200 (NZST)
Received: from mail.myself.gen.nz ([127.0.0.1])
	by localhost (guardian.cyber.god [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id 14630-03 for <linux-lvm@redhat.com>;
	Sun, 26 Sep 2004 10:09:03 +1200 (NZST)
Received: from [127.0.0.1] (fosi.cyber.god [192.168.1.2])
	by mail.myself.gen.nz (Postfix) with ESMTP id E8AF6180095
	for <linux-lvm@redhat.com>; Sun, 26 Sep 2004 10:09:03 +1200 (NZST)
Message-ID: <4155EBA2.7020609@myself.gen.nz>
Date: Sun, 26 Sep 2004 10:05:22 +1200
From: Steve Wray <steve@myself.gen.nz>
MIME-Version: 1.0
Subject: Re: [linux-lvm] which files, which physical volumes?
References: <CB8795BC-0F0E-11D9-AF91-000A95730E92@spamaps.org>
In-Reply-To: <CB8795BC-0F0E-11D9-AF91-000A95730E92@spamaps.org>
Content-Transfer-Encoding: 7bit
Reply-To: steve@myself.gen.nz,
	LVM general discussion and development <linux-lvm@redhat.com>
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

Clint Byrum wrote:
> 
> On Thursday, September 23, 2004, at 11:31 PM, Steve Wray wrote:
> 
>> Luca Berra wrote:
>>
>>> On Fri, Sep 24, 2004 at 02:29:37PM +1200, Steve Wray wrote:
>>>
[snip]
>> Actually, this just got more interesting because after the last
>> pvmove --abort I now get this error out of pvmove -tv;
>>
>> Insufficient contiguous allocatable extents (780) for logical volume 
>> pvmove0: 1292 required
>> Allocation for temporary pvmove LV failed
>>
>> which is new.
>>
>> I am guessing here, but if I moved some of the larger files out of 
>> that logical volume, might pvmove be able to work around this?
>>
[snip]
> Yours seems to be telling you that you can't move 1292 physical extents 
> into 780. You'll have to add physical volumes (NFS mounted loopback? 
> External USB harddrive?), or remove other logical volumes.

Well then its bogus; the physical volume I am trying to pvmove has a 
capacity of around 9G whereas the volume group of which it is a part has 
a nice 42G free.

So how does that work out to not enough extents?
