Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3UHhiv12512
	for <linux-lvm@redhat.com>; Fri, 30 Apr 2004 13:43:44 -0400
Received: from p2.imoveinc.com (p2.imoveinc.com [64.1.196.61])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i3UHhhKG014928
	for <linux-lvm@redhat.com>; Fri, 30 Apr 2004 13:43:43 -0400
Received: from easystreet.com (w002.z064001196.pdx-or.dsl.cnc.net [64.1.196.2])
	by p2.imoveinc.com (Postfix) with ESMTP id 995213CB5
	for <linux-lvm@redhat.com>; Fri, 30 Apr 2004 10:43:42 -0700 (PDT)
Message-ID: <4092904E.1010101@easystreet.com>
Date: Fri, 30 Apr 2004 10:43:42 -0700
From: Don Buchholz <buchholz@easystreet.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM and hardware device re-ordering?
References: <409276F4.7060305@easystreet.com>
	<20040430162957.GA8717@null.msp.redhat.com>
In-Reply-To: <20040430162957.GA8717@null.msp.redhat.com>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
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

Thanks, AJ.

May I propose this question for inclusion in the LVM HOWTO FAQ chapter?

- Don

AJ Lewis wrote:

>On Fri, Apr 30, 2004 at 08:55:32AM -0700, Don Buchholz wrote:
>  
>
>>The one nagging question in my mind is:
>>
>> How resilient is LVM to a sudden renumbering of
>> physical hard disks?
>>
>>Assume no disks have actually failed, just that a new disk
>>gets added and suddenly all the LVM drives get notched up
>>a drive letter. 
>>    
>>
>
>It's fine.  Each disk (PV) is labeled with a UUID, which uniquely identifies
>it to the system.  'vgscan' identifies this after a new disk is added that
>changes your drive numbering.  Most distros run vgscan in the lvm startup
>scripts to cope with this on reboot after a hardware addition.  If you're
>doing a hot-add, you'll have to run this by hand I think.  OTOH, if your vg
>is activated and being used, the renumbering should not affect it at all.
>It's only the activation that needs the identifier, and the worst case
>scenario is that the activation will fail without a vgscan with a complaint
>about a missing PV.
>
>Regards,
>  
>
>------------------------------------------------------------------------
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
