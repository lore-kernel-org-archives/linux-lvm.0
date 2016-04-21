Received: from [10.34.131.9] (dhcp131-9.brq.redhat.com [10.34.131.9])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3LDMQi8015699
	for <linux-lvm@redhat.com>; Thu, 21 Apr 2016 09:22:26 -0400
References: <CAAYit8QQKv1gwtQ5TQx1+aX2f0y8jmTMDU83cMqp2Obosom=jQ@mail.gmail.com>
	<5718A369.4060103@redhat.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <5718D412.2020303@redhat.com>
Date: Thu, 21 Apr 2016 15:22:26 +0200
MIME-Version: 1.0
In-Reply-To: <5718A369.4060103@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Why LVM metadata locations are not properly aligned
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 21.4.2016 11:54, Zdenek Kabelac wrote:
> On 21.4.2016 06:08, Ming-Hung Tsai wrote:
>> Hi,
>>

>>
>> 1. The metadata locations (raw_locn::offset) are not properly aligned.
>>     Function _aligned_io() requires the IO to be logical-block aligned,
>>     but metadata locations returned by next_rlocn_offset() are 512-byte
>> aligned.
>>     If a device's logical block size is greater than 512b, then LVM need to use
>>     bounce buffer to do the IO.
>>     How about setting raw_locn::offset to logical-block boundary?
>>     (or max(logical_block_size, physical_block_size) for 512-byte logical-/4KB
>>      physical-block drives?)
>
> This looks like a bug - lvm2 should start to write metadata always on physical
> block aligned position.

Hi

I've opened RFE BZ for this one - https://bugzilla.redhat.com/1329234
It's not completely trivial to fix this in a backward compatible way - but I'm 
mostly 100% sure it's not cause your 10s delay unless.

Regards

Zdenek
