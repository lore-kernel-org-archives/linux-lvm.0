Received: from [10.15.80.229] (dhcp80-229.msp.redhat.com [10.15.80.229])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id k36Ei7fk031782
	for <linux-lvm@redhat.com>; Thu, 6 Apr 2006 10:44:07 -0400
Mime-Version: 1.0 (Apple Message framework v623)
In-Reply-To: <1144295496.8145.2.camel@pc7.dolda2000.com>
References: <44340F46.5040000@volved.com>
	<1144295496.8145.2.camel@pc7.dolda2000.com>
Message-Id: <62507cd748c6e6c8706c345a145cf914@redhat.com>
Content-Transfer-Encoding: 7bit
From: Jonathan E Brassow <jbrassow@redhat.com>
Subject: Re: [linux-lvm] Bad disk removal
Date: Thu, 6 Apr 2006 09:45:16 -0500
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
To: LVM general discussion and development <linux-lvm@redhat.com>


On Apr 5, 2006, at 10:51 PM, Fredrik Tolf wrote:

> On Wed, 2006-04-05 at 14:41 -0400, Barnaby Claydon wrote:
>> Hey all,
>>
>> So after lots of scans and log review, turns out 1 of the 8 IDE disks 
>> in
>> my LVM is bad. (I know, IDE, yeahyeah...)
>
> When this happened to me, I got a replacement drive as large as that
> drive, and used dd to copy the PV data bit-by-bit to the new disk, and
> then zeroed the sectors corresponding to the old bad sectors. It worked
> fairly well, but the bad sectors were probably only file data blocks 
> for
> me.
>
> As far as I managed to find out, pvmove will not handle bad sectors at
> all, and abort when it finds any. It would be great if anyone could
> correct me on that, though...
>

pvmove will ignore errors and copy as much as it can.  It will not 
retry failed sectors though.  pvmove basically mirrors the drives, so 
you can use the volume while the device is being copied.  When the copy 
is complete, pvmove breaks the mirror and leaves you with the LV 
remapped to the new device.

  brassow
