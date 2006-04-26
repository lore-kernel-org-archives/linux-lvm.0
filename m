Received: from [10.15.80.229] (dhcp80-229.msp.redhat.com [10.15.80.229])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id k3QG6PBt021138
	for <linux-lvm@redhat.com>; Wed, 26 Apr 2006 12:06:25 -0400
Mime-Version: 1.0 (Apple Message framework v623)
In-Reply-To: <1146005699.26842.166.camel@localhost.localdomain>
References: <444E73C3.7040305@nrel.colostate.edu>
	<1145995049.26842.103.camel@localhost.localdomain>
	<f9361e496ca792ff924de60979c1bbb9@redhat.com>
	<1145997578.26842.119.camel@localhost.localdomain>
	<444E9F0E.1010303@nrel.colostate.edu>
	<1146005699.26842.166.camel@localhost.localdomain>
Message-Id: <8bfc154a0fd2cf17f26b10f32c9194e0@redhat.com>
Content-Transfer-Encoding: 7bit
From: Jonathan E Brassow <jbrassow@redhat.com>
Subject: Re: [linux-lvm] lvm2 *TEMPORARY* PV failure - what happens?
Date: Wed, 26 Apr 2006 11:08:18 -0500
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


On Apr 25, 2006, at 5:54 PM, Ming Zhang wrote:
>> I'm still wondering if the disk comes back if the LV will be available
>> again, or if LVM will mark it as failed, and assume that all blocks on
>
> it will not automatically available i think, but with that "echo ...", 
> u
> might be able to see it again.
>

Actually, I think it is available once the dev comes back.

  brassow
