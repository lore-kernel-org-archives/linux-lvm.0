Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3S8vqLZ006773
	for <linux-lvm@redhat.com>; Mon, 28 Apr 2008 04:57:53 -0400
Received: from jeltz.chrissie.net (vpn-6-14.fab.redhat.com [10.33.6.14])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m3S8vqET016548
	for <linux-lvm@redhat.com>; Mon, 28 Apr 2008 04:57:52 -0400
Message-ID: <4815918E.5080806@redhat.com>
Date: Mon, 28 Apr 2008 09:57:50 +0100
From: Christine Caulfield <ccaulfie@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: Patch to clvmd-openais.c again
References: <1cafab770804250311n1c530743h30cbd62e725f345f@mail.gmail.com>
	<1cafab770804250312y7556ceddu3cff6a4c13a06355@mail.gmail.com>
In-Reply-To: <1cafab770804250312y7556ceddu3cff6a4c13a06355@mail.gmail.com>
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

Xinwei Hu wrote:
> Sorry, stupid thing happens ;)
> 
> 2008/4/25, Xinwei Hu <hxinwei@gmail.com>:
>> Hi all,
>>
>>   The attached patch is a try to make clvmd work correctly on openais stack.
>>  It does 2 things.
>>
>>  1. The cpg_deliver_callback make a compare between target_nodeid and our_nodeid.
>>  It turns out openais set target_nodeid to 0 sometimes. for
>>  broadcasting ? I change
>>  the behavior so that lvm will process_remote also on target_nodeid == 0
>>
>>  2. The joined_list passed to cpg_confchg_callback doesn't include the
>>  already exist
>>  nodes in the group, which leads to an incomplete node_hash. I simply
>>  add all other
>>  nodes in member_list to node_hash also.
>>
>>   With this patch applied, clvmd works correctly with basic lvm commands now.
>>
>>   Please kindly review this, and consider it for upstream.
>>

Your patch has now been included in upstream clvmd.

Thank you.

-- 

Chrissie
