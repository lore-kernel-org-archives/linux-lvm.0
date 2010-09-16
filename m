Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o8GDLXM8012985
	for <linux-lvm@redhat.com>; Thu, 16 Sep 2010 09:21:33 -0400
Received: from smtp.cbnco.com (smtp.cbnco.com [207.164.182.72])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o8GDLMeS019323
	for <linux-lvm@redhat.com>; Thu, 16 Sep 2010 09:21:22 -0400
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 3E1DE89E371
	for <linux-lvm@redhat.com>; Thu, 16 Sep 2010 09:21:21 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 23160-06 for <linux-lvm@redhat.com>;
	Thu, 16 Sep 2010 09:21:21 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 116EF89E113
	for <linux-lvm@redhat.com>; Thu, 16 Sep 2010 09:21:21 -0400 (EDT)
Message-ID: <4C9219D0.1070607@cbnco.com>
Date: Thu, 16 Sep 2010 09:21:20 -0400
From: Michael Smith <msmith@cbnco.com>
MIME-Version: 1.0
References: <4C77FE94.5090905@cbnco.com>
	<AANLkTikZPjtR+gTQ67tprCK=GdbJBrLYk5jr2d8xcO0u@mail.gmail.com>
In-Reply-To: <AANLkTikZPjtR+gTQ67tprCK=GdbJBrLYk5jr2d8xcO0u@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] CLVM and LV activation
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

aneesh vs wrote:
 > On Fri, Aug 27, 2010 at 11:36 PM, Michael Smith <msmith@cbnco.com
>> When a CLVM cluster comes up, the LVs in the clustered volume
>> groups are "not available". I can use the heartbeat LVM resource to
>> trigger a "vgchange -aly", but I'm wondering if there's a way to
>> configure it to happen automatically. It'd make my cluster config
>> simpler.

> If you are using clvm, you shouldn't wory about volume_list because clvm 
> allows nodes to activate LVs in all nodes.
> Please check what is "locking_type" in lvm.conf . It should be 3 in 
> RHEL5 so that when clvm starts it can enable all clustered VGs.

I'm using SLES11 SP1, but yes, locking_type is 3. There is no problem 
with clvm as far as I can tell - it just doesn't automatically mark the 
LVs as available. I have to run vgchange -ay to make them available. 
After that, they work.

> Please note that cluster should be quorate for clvm to start fine.

Some of my clusters are two-node so quorum isn't possible. clvm is 
running with "-q 0", so I don't think it cares. (That's the default used 
by the clvm RA.)

Thanks,
Mike
