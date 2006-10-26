Received: from [10.15.80.229] (dhcp80-229.msp.redhat.com [10.15.80.229])
	by pobox.corp.redhat.com (8.13.1/8.12.8) with ESMTP id k9QLg3h2015923
	for <linux-lvm@redhat.com>; Thu, 26 Oct 2006 17:42:03 -0400
Mime-Version: 1.0 (Apple Message framework v624)
In-Reply-To: <20061026221623.5d0e2e17@nim.leo>
References: <20061026211738.008da405@nim.leo>
	<67e61b34aeae92681a278b5d3bde28e0@redhat.com>
	<20061026221623.5d0e2e17@nim.leo>
Message-Id: <299b119df023e37355e52e74b9658379@redhat.com>
Content-Transfer-Encoding: 7bit
From: Jonathan E Brassow <jbrassow@redhat.com>
Subject: Re: [linux-lvm] Mirror resync direction
Date: Thu, 26 Oct 2006 16:45:26 -0500
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


On Oct 26, 2006, at 4:16 PM, Paul LeoNerd Evans wrote:
>> The use of --corelog simply means that the mirror device will be
>> resynchronized every time the device is activated.  The persistent log
>> (disk log) tracks what resynchronization has been done and can avoid
>> all complete resyncs.
>
> Yes, I'm aware of that bit, but I couldn't see any other way to achieve
> it with only two PVs. The "--alloc anywhere" as suggested in the error
> message doesn't have any effect for me.
>

Jun'ichi Nomura from NEC is working on the allocation issues - it's a 
bit buggy WRT mirrors.

However, you could use a known bug to get around having to use 
--corelog when you only have two devices.

1) lvcreate -m1 --corelog -L <don't use all the space> -n mirror vg
2) lvconvert -m1 vg/mirror

The convert doesn't currently honor the allocation schemes very well 
right now either.  It will simply put the disk log on one of the two 
devices.

  brassow
