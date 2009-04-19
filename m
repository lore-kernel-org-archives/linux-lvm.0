Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n3JFGuVo027023
	for <linux-lvm@redhat.com>; Sun, 19 Apr 2009 11:16:56 -0400
Received: from mailout.rz.uni-frankfurt.de (mailout.rz.uni-frankfurt.de
	[141.2.22.233])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n3JFGaok007509
	for <linux-lvm@redhat.com>; Sun, 19 Apr 2009 11:16:39 -0400
Received: from smtpauth.cluster.uni-frankfurt.de ([10.2.22.4]
	helo=smtpauth2.rz.uni-frankfurt.de)
	by mailout.rz.uni-frankfurt.de with esmtp (Exim 4.69)
	(envelope-from <sven@whgl.uni-frankfurt.de>) id 1LvYl1-0001Dr-PT
	for linux-lvm@redhat.com; Sun, 19 Apr 2009 17:16:35 +0200
Received: from ada-03.ghl40.whgl.uni-frankfurt.de ([141.2.119.133])
	by smtpauth2.rz.uni-frankfurt.de with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <sven@whgl.uni-frankfurt.de>)
	id 1LvYkt-0008BB-0d
	for linux-lvm@redhat.com; Sun, 19 Apr 2009 17:16:27 +0200
Message-ID: <49EB4045.7020407@whgl.uni-frankfurt.de>
Date: Sun, 19 Apr 2009 17:16:21 +0200
From: Sven Eschenberg <sven@whgl.uni-frankfurt.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Wierd lvm2 performance problems
References: <49EA534C.7090003@whgl.uni-frankfurt.de>
	<49EACA64.8070006@redhat.com>
In-Reply-To: <49EACA64.8070006@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi Milan,

Milan Broz schrieb:
> Sven Eschenberg wrote:
>> I tried to create a PE+VG+LV ontop of a mdraid. For no obvious reason 
>> the lvm volume show extremely poor performance - The transferrates are 
>> as little as 30% of the rates on the md device itself.
>> In contrast creating a partition table ontop of the array gives nearly 
>> no performance impact.
>>
>> Does anybody have the slightest idea, wht might be going wrong here?
> 
>> P.S.: I tried aligning the first PE in the VG with the mdraid chunk 
>> size, no difference whatsoever.
> 
> How did you check that it is properly aligned?
> The problem is mostly that data area start is misaligned with underlying
> MD chunk size

Unfortunately I don't have the box at hand for 2 days, but I asked md to 
use a chunksize of 2048K and the /proc/mdstat reported 2048K, last time 
I checked.
The LVM hat a phy-extsize of 2M and with the --dataalignment option set 
to 2M, pvs reported a pe_start value of 2M aswell.
> 
> Please can you paste output of
> pvs -o +pe_start --unit b
> and
> cat /sys/block/<your_md_dev>/md/chunk_size
> 
> Please use at least lvm2 version 2.02.40 (see lvm version) for creating
> VG - this version has automatic alignmnent option if running over MD
> (see md_chunk_alignment in /etc/lvm.conf)
I need to check on lvm versions when I am back at the place it is 
located and will check the option then.
> 
> Also increasing readahead value can help (but only for simple linear
> read operation). You can increase readahead persistenlty for LV
> using (see man for lvchange -r ).

That I did already somewhen during the night and it improved everything 
dramatically. I set the readahead to 32768, the value md had chosen for 
the underlying md device.
> 
> Milan
> --
> mbroz@redhat.com
> 

Regards

-Sven

> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
