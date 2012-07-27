Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q6RDVRaF019802
	for <linux-lvm@redhat.com>; Fri, 27 Jul 2012 09:31:27 -0400
Received: from mail.profihost.ag (mail.profihost.ag [85.158.179.208])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q6RDVOki006494
	for <linux-lvm@redhat.com>; Fri, 27 Jul 2012 09:31:25 -0400
Message-ID: <50129825.1060302@profihost.ag>
Date: Fri, 27 Jul 2012 15:31:17 +0200
From: Stefan Priebe - Profihost AG <s.priebe@profihost.ag>
MIME-Version: 1.0
References: <501289B0.1020504@profihost.ag> <501292F4.8010108@profitbricks.com>
In-Reply-To: <501292F4.8010108@profitbricks.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com
Cc: sebastian.riemer@profitbricks.com

Hello Sebastian,

i was also able to fix this by set poolmetadatasize? But normally LVM 
should set this correctly? Are you using dm thin in production?

This fixes it:
lvcreate --poolmetadatasize 5G -L 10G -T thinvol/pool1 -V 100G --name disk1

Stefan
Am 27.07.2012 15:09, schrieb Sebastian Riemer:
> Hi Stefan,
>
> I had a similar issue some time ago.
>
> Which vgcreate commands did you use?
>
> The last device in the list is used for the meta data. If you don't give
> it a further device for the metadata then LVM puts the metadata onto the
> same device like the data resulting in your issue.
>
> Do it like this:
>
> vgcreate thinvg /dev/sda /dev/sdb
> lvcreate -L 10G -T thinvg/pool1
> lvcreate -V 100G -T thinvg/pool1 -n disk1
>
> The data is put on /dev/sda and the metadata is put on /dev/sdb. You can
> only use the size of /dev/sda for the data. /dev/sdb shouldn't be bigger
> than 16 GiB or your wasting disk space. You can also use a regular 16
> GiB LV as PV and put it as metadata device into the VG.
>
> Looks like this:
> pvcreate /dev/sdb
> vgcreate meta /dev/sdb
> lvcreate -L 16G meta -n meta1
> vgcreate thinvg /dev/sda /dev/mapper/meta-meta1
> lvcreate -L 10G -T thinvg/pool1
> lvcreate -V 100G -T thinvg/pool1 -n disk1
>
> Cheers,
> Sebastian
>
>
> On 27.07.2012 14:29, Stefan Priebe - Profihost AG wrote:
>> Hello list,
>>
>> i'm testing dm_thin_pool with lvm2 right now. And i'm always running
>> into the situation that the metadata get's full.
>>
>> Kernel: 3.5-rc7
>> lvm/dmeventd: up2date git version 186a2772
>>
>> I created my thin disk like this:
>> lvcreate -L 10G -T thinvol/pool1 -V 100G --name disk1
>>
>> After some autoresizing lvs looks like this:
>> # lvs
>>    LV    VG      Attr     LSize   Pool  Origin Data%  Move Log Copy%
>> Convert
>>    disk1 thinvol Vwi-a-tz 100,00g pool1         22,95
>>    pool1 thinvol twi-a-tz  33,77g               67,97
>>
>> # dmsetup table
>> thinvol-pool1: 0 70811648 linear 253:4 0
>> thinvol-disk1: 0 209715200 thin 253:4 1
>> thinvol-pool1-tpool: 0 70811648 thin-pool 253:2 253:3 128 0 0
>> thinvol-pool1_tdata: 0 20971520 linear 8:17 2048
>> thinvol-pool1_tdata: 20971520 49840128 linear 8:17 20998144
>> MYVOL-thin_pool2_tdata: 0 20971520 linear 8:129 2048
>> MYVOL-thin_pool2_tdata: 20971520 31227904 linear 8:129 20998144
>> thinvol-pool1_tmeta: 0 24576 linear 8:17 20973568
>> MYVOL-thin_pool2_tmeta: 0 24576 linear 8:129 20973568
>>
>> Last log messages:
>> lvm[2786]: Monitoring thin thinvol-pool1-tpool.
>> lvm[2786]: Logical volume pool1 successfully resized
>> lvm[2786]: Thin thinvol-pool1-tpool is now 100% full.
>> lvm[2786]: Extending logical volume pool1 to 33,77 GiB
>> lvm[2786]: Monitoring thin thinvol-pool1-tpool.
>> lvm[2786]: Logical volume pool1 successfully resized
>> lvm[2786]: Thin thinvol-pool1-tpool is now 84% full.
>> lvm[2786]: dm_task_run failed, errno = 22, Invalid argument
>> lvm[2786]: No longer monitoring thin thinvol-pool1-tpool.
>> lvm[2786]: No longer monitoring thin thinvol-pool1-tpool.
>> lvm[2786]: Thin metadata thinvol-pool1-tpool is now 99% full.
>> lvm[2786]: Resize for thinvol/pool1 is not yet supported.
>>
>> Greets
>> Stefan
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
