Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m0T6voQv022930
	for <linux-lvm@redhat.com>; Tue, 29 Jan 2008 01:57:51 -0500
Received: from emailgate2.cpvie.co.at (mail.cpvie.co.at [195.234.151.28])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m0T6vQnq024534
	for <linux-lvm@redhat.com>; Tue, 29 Jan 2008 01:57:27 -0500
Received: from localhost (emailgate2.cp.com [127.0.0.1])
	by emailgate2.cpvie.co.at (Postfix) with ESMTP id 3DEB340C46
	for <linux-lvm@redhat.com>; Tue, 29 Jan 2008 07:57:21 +0100 (CET)
Received: from [10.10.55.2] (eisenkoe.cp.com [10.10.55.2])
	by emailgate2.cpvie.co.at (Postfix) with ESMTP id C6EC740ACA
	for <linux-lvm@redhat.com>; Tue, 29 Jan 2008 07:57:19 +0100 (CET)
Message-ID: <479ECE89.9040506@cargo-partner.com>
Date: Tue, 29 Jan 2008 07:58:17 +0100
From: =?ISO-8859-1?Q?Michael_Eisenk=F6lbl?=
	<michael.eisenkoelbl@cargo-partner.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM limits?
References: <479DAD35.1080209@cesca.es>
	<479E2BEF.1090703@cesca.es>	<1201541894.30560.24.camel@behemoth.csg.stercomm.com>
	<479E698C.10204@cesca.es>
In-Reply-To: <479E698C.10204@cesca.es>
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

Hi,

do you also use a clustered-LVM in your storage system.
i mean, two storages mirrored in a cluster (cmirror ?).

kind regards
Michael

Jordi Prats schrieb:
> Hi,
> I'm the system administrator of PADICAT (http://www.padi.cat). It
> collects Catalan (http://en.wikipedia.org/wiki/Catalonia) web sites to
> provide permanent access to them (http://www.padi.cat/en/quees.php).
> It's equivalent to Internet Archive (http://www.archive.org) but for a
> particular culture.
>
> Our software developers require us to have one large file system,
> actually a single directory, with all this historically-classified web
> sites on a gziped file.
>
> I'm currently studying lustre and other HPC-related file systems to get
> this large file system, but by now I have ext3 as our file system. Next
> Monday I'm planning to extend it to 3TB o 4TB, so I'm currently
> researching for restrictions because during next month I'll have between
> 3TB to 4TB more to add: so, it will become a 8TB file system.
>
> Last time I fsck my 2'1TB file system I spend about 2 hours. Anyway, I'm
> also curious about the maximums :P
>
> Thanks,
> Jordi
>
>
> Chris Cox wrote:
>   
>> On Mon, 2008-01-28 at 20:24 +0100, Jordi Prats wrote:
>>     
>>> Hi all,
>>> I found on a webpage this two sentences:
>>>
>>> - The combination of 32-bit CPU and Linux kernel version 2.6.x, the
>>> limit of logical volume size is maximized at 16TB.
>>>
>>> - For Linux kernel 2.6.x running on 64-bit CPU, the maximum LV size is
>>> 8EB (extremely terrible big storage for this time being!)
>>>
>>> Are they right?
>>>       
>> Ok.  But it's really impractical to have large multi-terabyte
>> single filesystem today.  What are you wanting to do?  Ever fsck a
>> 2TB filesystem?  Consider yourself warned.
>>
>> Or... were you just curious about the maximums?
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>>
>>     
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>   
