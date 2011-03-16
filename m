Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p2GNC325005544
	for <linux-lvm@redhat.com>; Wed, 16 Mar 2011 19:12:03 -0400
Received: from mailmx.futuresource.com (mailmx.futuresource.com [208.10.26.74])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p2GNBsTg022335
	for <linux-lvm@redhat.com>; Wed, 16 Mar 2011 19:11:54 -0400
Received: from ns4.futuresource.com ([208.10.26.50])
	by mailmx.futuresource.com (8.13.8/8.13.8) with ESMTP id p2GNAuL7027186
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 16 Mar 2011 18:10:56 -0500
Received: from [172.22.181.98] ([172.22.181.98])
	by ns4.futuresource.com (8.13.8/8.13.8) with ESMTP id p2GNBo3d013081
	for <linux-lvm@redhat.com>; Wed, 16 Mar 2011 18:11:51 -0500
Message-ID: <4D8143B5.4000800@gmail.com>
Date: Wed, 16 Mar 2011 18:11:49 -0500
From: Les Mikesell <lesmikesell@gmail.com>
MIME-Version: 1.0
References: <4D7E4689.9060300@cox.net>
	<20110314171726.GA18249@redhat.com>	<4D812183.6000901@cfl.rr.com>
	<20110316225539.GA3662@redhat.com>
In-Reply-To: <20110316225539.GA3662@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Advanced Format disks mixed with regular disks?
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
To: linux-lvm@redhat.com

On 3/16/2011 5:55 PM, Mike Snitzer wrote:
>
>> On 3/14/2011 1:17 PM, Mike Snitzer wrote:
>>> Both LVM2 and Device Mapper have been updated to accommodate stacking
>>> such a mix of drives.
>>>
>>> See this for a bit more detail:
>>> http://people.redhat.com/msnitzer/docs/io-limits.txt
>>>
>>> Particularly, the "Stacking I/O Limits" section.
>>>
>>> The concern raised for partial (4k) writes to the 512b drive was
>>> discussed a bit more here: http://lkml.org/lkml/2010/2/22/295
>>
>> Unfortunately this does not help with the WD EARS model drives ( are
>> there any other 4kb sector drives on the market now? ), since they lie
>> and report that they have 512 byte sectors.
>
> I'm not following what you're saying.  The kernel's blk_stack_limits()
> infrastructure accounts for "desktop" class 4K devices too (4K physical,
> 512b logical) -- as does DM and lvm2.
>
> If given:
>
> "desktop" class drive:
> physical_block_size=4096
> logical_block_size=512
> minimum_io_size=4096
> optimal_io_size=0

How does the kernel know about the physical_block_size when the device 
reports itself as 512?  And they handle 512 byte writes, just very slowly.

-- 
   Les Mikesell
    lesmikesell@gmail.com
