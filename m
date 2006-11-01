Received: from [10.15.80.229] (dhcp80-229.msp.redhat.com [10.15.80.229])
	by pobox.corp.redhat.com (8.13.1/8.12.8) with ESMTP id kA1Hd2Mi003293
	for <linux-lvm@redhat.com>; Wed, 1 Nov 2006 12:39:02 -0500
Mime-Version: 1.0 (Apple Message framework v624)
In-Reply-To: <20061026221006.3a169598@nim.leo>
References: <20061026211738.008da405@nim.leo>
	<20061026202702.GF1319@agk.surrey.redhat.com>
	<20061026221006.3a169598@nim.leo>
Message-Id: <7d610bf0c820f966dbf8ce6267bebe03@redhat.com>
Content-Transfer-Encoding: 7bit
From: Jonathan E Brassow <jbrassow@redhat.com>
Subject: Re: [linux-lvm] Mirror resync direction
Date: Wed, 1 Nov 2006 11:43:08 -0600
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


On Oct 26, 2006, at 4:10 PM, Paul LeoNerd Evans wrote:

>
>> And I should add, dmeventd will do these steps automatically on 
>> failure
>> if you configure it into the lvm2 and device-mapper packages and apply
>> the right kernel patches (they're nearly ready for upstream 
>> submission).
>
> Will that be a separate userland program? Presumably it'll appear in a
> debian package of the same name at some point.
>

dmeventd will be a separate userland binary, but will be part of the 
device-mapper package.

  brassow
