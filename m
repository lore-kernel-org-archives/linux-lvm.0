Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q6RDnKxs026644
	for <linux-lvm@redhat.com>; Fri, 27 Jul 2012 09:49:20 -0400
Received: from mail-bk0-f46.google.com (mail-bk0-f46.google.com
	[209.85.214.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q6RDnHaH020058
	for <linux-lvm@redhat.com>; Fri, 27 Jul 2012 09:49:17 -0400
Received: by bkwj10 with SMTP id j10so1817762bkw.33
	for <linux-lvm@redhat.com>; Fri, 27 Jul 2012 06:49:16 -0700 (PDT)
Message-ID: <50129C5C.8060801@profitbricks.com>
Date: Fri, 27 Jul 2012 15:49:16 +0200
From: Sebastian Riemer <sebastian.riemer@profitbricks.com>
MIME-Version: 1.0
References: <501289B0.1020504@profihost.ag> <501292F4.8010108@profitbricks.com>
	<50129825.1060302@profihost.ag>
In-Reply-To: <50129825.1060302@profihost.ag>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] metadata problems while testing lvm2 git with
	dm_thin_pool
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
Content-Type: text/plain; charset="utf-8"
To: Stefan Priebe - Profihost AG <s.priebe@profihost.ag>
Cc: linux-lvm@redhat.com

Hi Stefan,

I've heard the talk of Alasdair G Kergon on LinuxTag in May 2012. Nobody
should use that LVM thin stuff in production for now (e.g. a data
consistency checker tool is missing).
He also said that it is documented now that the last PV in the list is
used for metadata.

http://people.redhat.com/agk/talks/LVM2-LinuxTag2012/


I've tested this stuff and it had also not enough storage performance
(half than it should have).

Do fixing the way you like to test. I've shown you how I know how it works.

The method with the 16 GiB LV for metadata also works for the low-level
dm-thin you can set up with dmsetup.

Cheers,
Sebastian


On 27.07.2012 15:31, Stefan Priebe - Profihost AG wrote:
> Hello Sebastian,
>
> i was also able to fix this by set poolmetadatasize? But normally LVM
> should set this correctly? Are you using dm thin in production?
>
> This fixes it:
> lvcreate --poolmetadatasize 5G -L 10G -T thinvol/pool1 -V 100G --name
> disk1
>
> Stefan
> Am 27.07.2012 15:09, schrieb Sebastian Riemer:
>> Hi Stefan,
>>
>> I had a similar issue some time ago.
>>
>> Which vgcreate commands did you use?
>>
>> The last device in the list is used for the meta data. If you don't give
>> it a further device for the metadata then LVM puts the metadata onto the
>> same device like the data resulting in your issue.
>>
>> Do it like this:
>>
>> vgcreate thinvg /dev/sda /dev/sdb
>> lvcreate -L 10G -T thinvg/pool1
>> lvcreate -V 100G -T thinvg/pool1 -n disk1
>>
>> The data is put on /dev/sda and the metadata is put on /dev/sdb. You can
>> only use the size of /dev/sda for the data. /dev/sdb shouldn't be bigger
>> than 16 GiB or your wasting disk space. You can also use a regular 16
>> GiB LV as PV and put it as metadata device into the VG.
>>
>> Looks like this:
>> pvcreate /dev/sdb
>> vgcreate meta /dev/sdb
>> lvcreate -L 16G meta -n meta1
>> vgcreate thinvg /dev/sda /dev/mapper/meta-meta1
>> lvcreate -L 10G -T thinvg/pool1
>> lvcreate -V 100G -T thinvg/pool1 -n disk1
>>
>> Cheers,
>> Sebastian
>>
>>
>> On 27.07.2012 14:29, Stefan Priebe - Profihost AG wrote:
>>> Hello list,
>>>
>>> i'm testing dm_thin_pool with lvm2 right now. And i'm always running
>>> into the situation that the metadata get's full.
>>>
>>> Kernel: 3.5-rc7
>>> lvm/dmeventd: up2date git version 186a2772
>>>
>>> I created my thin disk like this:
>>> lvcreate -L 10G -T thinvol/pool1 -V 100G --name disk1
>>>
>>> After some autoresizing lvs looks like this:
>>> # lvs
>>> LV VG Attr LSize Pool Origin Data% Move Log Copy%
>>> Convert
>>> disk1 thinvol Vwi-a-tz 100,00g pool1 22,95
>>> pool1 thinvol twi-a-tz 33,77g 67,97
>>>
>>> # dmsetup table
>>> thinvol-pool1: 0 70811648 linear 253:4 0
>>> thinvol-disk1: 0 209715200 thin 253:4 1
>>> thinvol-pool1-tpool: 0 70811648 thin-pool 253:2 253:3 128 0 0
>>> thinvol-pool1_tdata: 0 20971520 linear 8:17 2048
>>> thinvol-pool1_tdata: 20971520 49840128 linear 8:17 20998144
>>> MYVOL-thin_pool2_tdata: 0 20971520 linear 8:129 2048
>>> MYVOL-thin_pool2_tdata: 20971520 31227904 linear 8:129 20998144
>>> thinvol-pool1_tmeta: 0 24576 linear 8:17 20973568
>>> MYVOL-thin_pool2_tmeta: 0 24576 linear 8:129 20973568
>>>
>>> Last log messages:
>>> lvm[2786]: Monitoring thin thinvol-pool1-tpool.
>>> lvm[2786]: Logical volume pool1 successfully resized
>>> lvm[2786]: Thin thinvol-pool1-tpool is now 100% full.
>>> lvm[2786]: Extending logical volume pool1 to 33,77 GiB
>>> lvm[2786]: Monitoring thin thinvol-pool1-tpool.
>>> lvm[2786]: Logical volume pool1 successfully resized
>>> lvm[2786]: Thin thinvol-pool1-tpool is now 84% full.
>>> lvm[2786]: dm_task_run failed, errno = 22, Invalid argument
>>> lvm[2786]: No longer monitoring thin thinvol-pool1-tpool.
>>> lvm[2786]: No longer monitoring thin thinvol-pool1-tpool.
>>> lvm[2786]: Thin metadata thinvol-pool1-tpool is now 99% full.
>>> lvm[2786]: Resize for thinvol/pool1 is not yet supported.
>>>
>>> Greets
>>> Stefan
>>>
>>> _______________________________________________
>>> linux-lvm mailing list
>>> linux-lvm@redhat.com
>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>


-- 
Sebastian Riemer
Linux Kernel Developer

ProfitBricks GmbH � Greifswalder Str. 207 � 10405 Berlin, Germany
www.profitbricks.com � sebastian.riemer@profitbricks.com
Tel.: +49 - 30 - 60 98 56 991 - 915

Sitz der Gesellschaft: Berlin
Registergericht: Amtsgericht Charlottenburg, HRB 125506 B
Gesch�ftsf�hrer: Andreas Gauger, Achim Weiss
