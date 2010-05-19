Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4JGl81r022680
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 12:47:08 -0400
Received: from smtp.iplink.net (smtp.iplink.net [192.139.81.186])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o4JGkxci020697
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 12:46:59 -0400
Received: from [10.255.0.247] (fw.iplink.net [192.139.81.98])
	by smtp.iplink.net (Postfix) with ESMTP id 9D6DDA99450
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 12:46:54 -0400 (EDT)
Message-ID: <4BF415FE.5060806@alteeve.com>
Date: Wed, 19 May 2010 12:46:54 -0400
From: Digimer <linux@alteeve.com>
MIME-Version: 1.0
References: <059801caf769$fc848350$f58d89f0$@com>	<4BF40A8B.2000201@alteeve.com>
	<20100519162601.GA18162@us.ibm.com>
	<05c901caf771$a3161920$e9424b60$@com>
In-Reply-To: <05c901caf771$a3161920$e9424b60$@com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Adding a disk to expand an existing logical volume
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

On 10-05-19 12:37 PM, kevin wrote:
>
>> If I were you, I would not bother with partition(s). I will add the
>> whole disk to LVM.
>
>
> I intend for the entire disk to be used -- so I should just skip the fdisk
> step?
>
>
>
> Thanks,
>
>
> Kevin
> http://blog.stardothosting.com

Unless Malahal knows something I don't (which is always possible), then 
you still need to create a single partition that consumes the whole disk 
and then assign that to you VG.

-- 
Digimer
E-Mail:         linux@alteeve.com
AN!Whitepapers: http://alteeve.com
Node Assassin:  http://nodeassassin.org
