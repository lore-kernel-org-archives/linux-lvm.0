Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1118A60856
	for <linux-lvm@redhat.com>; Mon, 13 May 2019 15:17:30 +0000 (UTC)
Received: from smtpout01.kabsi.at (smtpout01.kabsi.at [62.40.128.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 449943079B8E
	for <linux-lvm@redhat.com>; Mon, 13 May 2019 15:17:28 +0000 (UTC)
Received: from localhost.localdomain (h081217059079.dyn.cm.kabsi.at
	[81.217.59.79])
	by smtpout01.kabsi.at (Postfix) with ESMTPS id 452kvV14mvz3gH
	for <linux-lvm@redhat.com>; Mon, 13 May 2019 17:17:25 +0200 (CEST)
References: <3f6f98d1b5184853cf48b1f84337af83.squirrel@service.net-works.at>
	<6747eb8e-b15c-dfdd-610b-bc5143368a63@redhat.com>
From: =?UTF-8?Q?Rainer_F=c3=bcgenstein?= <rfu@oudeis.org>
Message-ID: <842d9f3d-5536-ee5b-71ab-60407cfd5dee@oudeis.org>
Date: Mon, 13 May 2019 17:17:25 +0200
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

> I don't understand how this could have happened by accident.
> lvm2 provides strong detection of duplicated devices.
> It also detects older metadata.

that's what also puzzles me, since I've never had any issues in this 
regard before.

> So you would have to put in 'exact' but just old 'copy' of your device
> and at the same time drop out the original one -� is that what you've 
> made ??

no. this is what happened: (from memory)

/dev/sda5 = only PV containing vg_sh64

about 2 months ago:

pvcreate /dev/sdc1 (temp. HD)
vgextend vg_sh64 /dev/sdc1
pvmove vg_sh64 /dev/sda5     (move VG from old to temp HD)
vgreduce vg_sh64 /dev/sda5

- replace "old" sda with a new, bigger one
- create same partition layout

pvcreate /dev/sda5
vgextend vg_sh64 /dev/sda5
pvmove vg_sh64 /dev/sdc1   (move everything back to new HD)
vgreduce vg_sh64 /dev/sdc1

what I *DID FORGET* then was to issue "pvremove /dev/sdc1"

a few days ago, I inserted the old temp HD sdc into the SATA hot swap 
bay and powered it on. shortly after that the system behaved strangely. 
issued "dmesg" and saw a lot of error messages regarding SATA. 
unfortunately, memory is blurry from then on since I entered panic mode.

Did a graceful shutdown though (closed all programms, executed 
"poweroff"). from this moment on, VG on /dev/sda5 was gone.

can't rule out that powering on sdc in the hot plug bay caused havoc on 
the SATA bus, just when lvm was doing some housekeeping.

> VG & LV are just 'terms' - there is no 'physical-conte
> lvm2 provides command:� 'vgcfgrestore' - which can restore your older 
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

thanks for the information (also to Roger). I managed to recover a 
promising LVM text file from lost+found on the temp disk. will try to 
restore it as soon as I'm back home again.

thanks - and wish me luck ;-)
