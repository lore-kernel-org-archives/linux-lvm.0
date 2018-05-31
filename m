Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 005B69BA03
	for <linux-lvm@redhat.com>; Thu, 31 May 2018 02:18:02 +0000 (UTC)
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 053B130CF55B
	for <linux-lvm@redhat.com>; Thu, 31 May 2018 02:17:51 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id c128-v6so8923870oig.11
	for <linux-lvm@redhat.com>; Wed, 30 May 2018 19:17:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <c853a9c2-14e1-d4eb-d6a9-7bc90fb9bcfc@redhat.com>
References: <CAGbvivL=9LQJJ=D9j_uJgrZ_Sv=h=C2Th1-=bQARoxwvyC_afQ@mail.gmail.com>
	<c853a9c2-14e1-d4eb-d6a9-7bc90fb9bcfc@redhat.com>
From: Damon Wang <damon.devops@gmail.com>
Date: Thu, 31 May 2018 10:17:49 +0800
Message-ID: <CABZYMH5q5ciYi6fEc7OW_XVwtBWXEy3K+ibMTnyTnaWbW9-qzw@mail.gmail.com>
Subject: Re: [linux-lvm] Device XXX excluded by a filter - why??
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Wyllys Ingersoll <wyllys.ingersoll@keepertech.com>

Some additional tips, you can use `partprobe -s /dev/sdi` or `wipefs
/dev/sdi` to find out whether some magic string(filesystem, gpt, etc)
on it.

And use lvmdiskscan to find all available disk on server.

Damon

2018-05-30 18:49 GMT+08:00 Marian Csontos <mcsontos@redhat.com>:
> On 05/23/2018 05:53 PM, Wyllys Ingersoll wrote:
>>
>> Using the following lvm2 version on Ubuntu 16.04.3 running kernel 4.16.03
>>    LVM version:     2.02.176(2) (2017-11-03)
>>    Library version: 1.02.145 (2017-11-03)
>>    Driver version:  4.37.0
>>
>> ceph-volume attempts to create a VG on a raw block device to use as a
>> bluestore OSD.  The command it uses looks like this:
>>
>> vgcreate --force --yes ceph-a637b0e7-e54f-4fe9-8afc-a74671d94f6e /dev/sdi
>>
>> The disk (/dev/sdi) in this case is a blank (no partition table) GPT
>> label 3.7T drive.
>
>
> So is it a GPT device or not? If yes, it HAS a partition table after all,
> and LVM filters such devices out, even if the partition table is empty.
>
> Run `wipefs -a /dev/sdi` first to remove any FS/GPT signatures.
>
> -- Martian
>
>>
>> vgcreate complains and fails:
>>       stderr: Device /dev/sdi excluded by a filter.
>>
>> I cannot figure out what "filter" is causing this.  The global_filter
>> in lvm.conf is wide open:
>> filter = [ "a|.*/|" ]
>>
>> Turning up debug logging does not show any additional reasons.
>> Repeatedly running pvscan or vgscan to update the cache does not fix
>> it either.
>>
>> What could be blocking this device from being used?
>>
>> thanks,
>>     Wyllys Ingersoll
>>     Keeper Technology, LLC
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
