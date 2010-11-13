Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oAD7WDHg016197
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2010 02:32:13 -0500
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAD7VwHL028755
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2010 02:31:58 -0500
Received: from ALA-MAIL03.corp.ad.wrs.com (ala-mail03 [147.11.57.144])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id oAD7VvhX023499
	for <linux-lvm@redhat.com>; Fri, 12 Nov 2010 23:31:57 -0800 (PST)
Message-ID: <4CDE3F87.8060705@windriver.com>
Date: Sat, 13 Nov 2010 15:34:31 +0800
From: xufeng zhang <xufeng.zhang@windriver.com>
MIME-Version: 1.0
References: <4CDD0B18.8060200@windriver.com>
	<20101112100604.GF28062@agk-dp.fab.redhat.com>
In-Reply-To: <20101112100604.GF28062@agk-dp.fab.redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Bug: LVM2 create long name device failed but we	can
 see it by run lvs
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

On 11/12/2010 06:06 PM, Alasdair G Kergon wrote:
> On Fri, Nov 12, 2010 at 05:38:32PM +0800, xufeng zhang wrote:
>    
>> This is the bug description:
>> When we create a logic volume with long names(such as 125), LVM2 will
>> return "Name too long" error
>> and create volume failed. However, you will see it exist in volume group
>> if you run lvs command.
>> The reason is that when LVM2 create a empty device in lv_create_empty()
>> function, it didn't check the
>> length of device names, but the empty device activate failed afterward
>> because of too long name(vgname+lvname>128).
>>      
> Thanks for reporting that.
>
> Presumably 'vgrename' needs a similar restriction.
>    
Maybe I have made a mistake, I can't reproduce this bug in LVM2.2.02.76 now.

Thanks,
Xufeng Zhang
> Alasdair
>
>
>    
