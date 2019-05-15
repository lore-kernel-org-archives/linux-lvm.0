Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 17F035C690
	for <linux-lvm@redhat.com>; Wed, 15 May 2019 16:55:42 +0000 (UTC)
Received: from smtpout03.kabsi.at (smtpout03.kabsi.at [62.40.128.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7870330832CF
	for <linux-lvm@redhat.com>; Wed, 15 May 2019 16:55:40 +0000 (UTC)
Received: from [192.168.5.104] (h081217059079.dyn.cm.kabsi.at [81.217.59.79])
	by smtpout03.kabsi.at (Postfix) with ESMTPS id 4540zt3lxcz32L
	for <linux-lvm@redhat.com>; Wed, 15 May 2019 18:55:38 +0200 (CEST)
References: <3f6f98d1b5184853cf48b1f84337af83.squirrel@service.net-works.at>
	<6747eb8e-b15c-dfdd-610b-bc5143368a63@redhat.com>
From: =?UTF-8?Q?Rainer_F=c3=bcgenstein?= <rfu@oudeis.org>
Message-ID: <61004ae8-c29d-1402-9674-39e882bca6c8@oudeis.org>
Date: Wed, 15 May 2019 18:55:37 +0200
MIME-Version: 1.0
In-Reply-To: <6747eb8e-b15c-dfdd-610b-bc5143368a63@redhat.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] recover volume group & locical volumes from PV?
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-lvm@redhat.com

hi,

I discovered that the lvm text files recovered from lost+found where out 
of date. I got as far as reconstructing such a lvm config file from data 
stored in the first MB, but after some syntax errors and values that 
didn't look consistent, I decided to do a re-install.

fortunately, didn't lose much data.

thank you both for your help, provided valuable insight.

cu


On 13/05/2019 10:37, Zdenek Kabelac wrote:
> Dne 12. 05. 19 v 0:52 "Rainer F�genstein" napsal(a):
>> hi,
>>
>> I am (was) using Fedora 28 installed in several LVs on /dev/sda5 (= PV),
>> where sda is a "big" SSD.
>>
>> by accident, I attached (via SATA hot swap bay) an old harddisk
>> (/dev/sdc1), which was used about 2 months temporarily to move the volume
>> group / logical volumes from the "old" SSD to the "new" SSD (pvadd,
>> pvmove, ...)
>>
> 
> Hi
> 
> I don't understand how this could have happened by accident.
> lvm2 provides strong detection of duplicated devices.
> It also detects older metadata.
> 
> So you would have to put in 'exact' but just old 'copy' of your device
> and at the same time drop out the original one -� is that what you've 
> made ??
> 
>> this combination of old PV and new PV messed up the filesystems. when I
>> noticed the mistake, I did a shutdown and physically removed /dev/sdc.
>> this also removed VG and LVs on /dev/sda5, causing the system crash on
>> boot.
>>
>>
>> [root@localhost-live ~]# pvs
>> �� PV�������� VG������������� Fmt� Attr PSize��� PFree
>> �� /dev/sda5����������������� lvm2 ---�� <47.30g <47.30g
>> �� /dev/sdc1� fedora_sh64���� lvm2 a--� <298.09g 273.30g
>>
>> is there any chance to get VG and LVs back?
> 
> 
> VG & LV are just 'terms' - there is no 'physical-content' behind them - 
> so if you've already used your filesystem and modified it's bits on a 
> device - the physical content of your storage is simply overwritten and 
> there is no way to recover it's content by just fixing lvm2 metadata.
> 
> lvm2 provides command:� 'vgcfgrestore' - which can restore your older 
> metadata content (description which devices are used and where the 
> individual LVs use their extents - basically mapping of blocks) - 
> typically in your /etc/lvm/archive directory - and in the worst case - 
> you can obtain older metadata by scanning 1st. MiB of your physical 
> drive - data are there in ascii format in ring buffer so for your small 
> set of LVs you likely should have there full history.
> 
> When you put back your original 'drive set' - and you restore your lvm2 
> metadata to the point before you started to play with bad drive - then 
> your only hope is properly working 'fsck' - but there is nothing how 
> lvm2 can help with this.
> 
> Regards
> 
> Zdenek
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
