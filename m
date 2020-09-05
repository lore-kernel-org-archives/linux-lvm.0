Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1921E202451D
	for <linux-lvm@redhat.com>; Sat,  5 Sep 2020 11:04:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1FF65800CAF
	for <linux-lvm@redhat.com>; Sat,  5 Sep 2020 11:04:26 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id y11so5182644lfl.5
	for <linux-lvm@redhat.com>; Sat, 05 Sep 2020 04:04:20 -0700 (PDT)
Received: from [192.168.1.101] (m83-187-174-206.cust.tele2.se.
	[83.187.174.206]) by smtp.gmail.com with ESMTPSA id
	a192sm2005225lfd.51.2020.09.05.04.04.18 for <linux-lvm@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sat, 05 Sep 2020 04:04:18 -0700 (PDT)
From: =?utf-8?Q?Tomas_Dalebj=C3=B6rk?= <tomas.dalebjork@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Sat, 5 Sep 2020 13:04:17 +0200
Message-Id: <079AAA2F-B532-446C-ABA7-A2E262059826@gmail.com>
References: <20200905082101.GA756355@localhost.localdomain>
In-Reply-To: <20200905082101.GA756355@localhost.localdomain>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] pvcreate to memory
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
To: LVM general discussion and development <linux-lvm@redhat.com>

thanks

I thought that LVM was originally a source copy clone from HPUX LVM?
Hence the questions related to VGDA

so once I have created this pv header informations, what more do I need in order for the lvconvert -s to accept my cow device?
do I have to also create the minor,major device for the logical volume, or will some other os command do that for me?

the offsets on the cow device is relative to the lv view, so I assume a device mapper device is needed to be created, perhaps that is done automatically by some os command?

Will read through the materials and perform some experiments 
regards Tomas

Sent from my iPhone

> On 5 Sep 2020, at 10:21, Bryn M. Reeves <bmr@redhat.com> wrote:
> 
> ﻿On Sat, Sep 05, 2020 at 01:40:54AM +0200, Tomas Dalebjörk wrote:
>> is there a way to create vgda information to memory?
> 
> The VGDA (volume group descriptor area) is a term from AIX's volume manager:
> it's not going to apply directly to LVM2.
> 
> There are PV labels (headers), which identify a disk as belonging to LVM and
> include the PV UUID, and there is the text metadata area (mda) which contains
> the volume group metadata that describes an LVM2 VG and the logical volumes
> that it includes. All physical volumes must have a PV label, but some PVs in
> a VG (especially if it has many PVs) need not contain metadata.
> 
> If you understand this then you can push the limits of what you can do in
> various ways and even construct devices "by hand" with dmsetup. This doesn't
> mean you can do anything but the better you know the component parts the more
> possibilities are available to you (and it's worth pointing out that these
> configurations place a lot more responsibility on the user than normal - you
> get to keep all the pieces when they break).
> 
> If you're interested in LVM internals you should start with something like
> Alasdair's talk from a few years ago, and learn how the VG metadata read from
> devices is translated into device-mapper tables.
> 
> It's easy enough to create a PV (and a volume group) on a RAM based device but
> unless you understand how the various layers opperate you will have a very
> hard time trying to get the tools to do what you want.
> 
>  http://people.redhat.com/agk/talks/LVM2-LinuxTag2006/
> 
> Regards,
> Bryn.
> 
>> I want to create a virtual LVM disk
>> We have all the cow data on a disk, but 
>> # lvconvert -s vg/lv /dev/mydisk
>> doesn’t accept the path to the disk device
>> and if I create a symbolic disk in /dev/vg/mydisk of in /dev/mapper/vg—mydisk pointing to /dev/mydisk
>> the ‘lvconvert’ command doesnt accept the cow data on the disk
>> so I guess that the VGDA data has to be present on the disk in order for the lvconvert command to accept the data
>> what do you think could be missing?
>> is it the vgda meta data on the disk?
>> 
>> if so, how can I create and emulate the vgda data so that the lvconvert command works?
>> 
>> thanks in advance 
>> regards Tomas
>> 
>> Sent from my iPhone
>> 
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
