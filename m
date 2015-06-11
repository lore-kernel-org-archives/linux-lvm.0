Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5B2sWmR030337
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 10 Jun 2015 22:54:32 -0400
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mx1.redhat.com (Postfix) with ESMTPS id B64801BE34C
	for <linux-lvm@redhat.com>; Thu, 11 Jun 2015 02:54:31 +0000 (UTC)
Received: by igbpi8 with SMTP id pi8so47189179igb.0
	for <linux-lvm@redhat.com>; Wed, 10 Jun 2015 19:54:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <557541A5.8050808@redhat.com>
References: <CAAYit8QCcaGvb5QPw_Xuk+oavthHR1c32oB0GsGd+Ypk0rPtRg@mail.gmail.com>
	<55704119.4000606@redhat.com>
	<CAAYit8T2YTHCrGf2rPYdQUTQOGn3uZVQkEkJ-DCbj+9iovRw+g@mail.gmail.com>
	<55715811.8020706@redhat.com>
	<CAAYit8Q9f+u0FFjR9h6ssUUpZwxwnV5k1rbYeUATMaDn0Un35g@mail.gmail.com>
	<557541A5.8050808@redhat.com>
Date: Thu, 11 Jun 2015 10:54:31 +0800
Message-ID: <CAAYit8SO2vwZa3o-ZTTZX=a9=SUafM16FuB8gQHCMDrk-Sw__Q@mail.gmail.com>
From: "M.H. Tsai" <mingnus@gmail.com>
Subject: Re: [linux-lvm] libdm cannot swap names between two child volumes
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

2015-06-08 15:17 GMT+08:00 Zdenek Kabelac <zkabelac@redhat.com>:
> It doesn't really matter here what you could confirm here - there is a race
> you can't avoid - i.e. udev is completely 'independent' and may execute
> trigger udev rules at any random point in time or some other command may try
> to open device in parallel (i.e. 'dd')
> So the only way how to ensure there is no such race - is to deactivate such
> device (which should be possible - since as you said - noone has it open)
> Also remember - activation routine is 'separate' from command code - as it
> could run on a completely different node - so you cannot 'validate' from
> command code there is no user of a device on 'activation' node unless device
> is locally active.
> Thus going through the proper sequence of steps and allowing udev to
> properly synchronize (i.e. you should not 'mix'  activation & deactivation
> under same cookie) is clearly the best way how to achieve your desired goal.

Hi,

Sorry for opening this question again. I could image the potential problem in
name swapping. But does that mean, It's even unrecommended to rename
an active device, although the target name are not used? The renaming path
in LVM is not suggested ?

## this is not recommended
# lvchange -ay vg1/lv1
# lvrename vg1/lv1 vg1/lv2

## do this instead
# lvchange -an vg1/lv1
# lvrename vg1/lv1 vg1/lv2


Thanks,
Ming-Hung Tsai


>> 2015-06-05 16:04 GMT+08:00 Zdenek Kabelac <zkabelac@redhat.com>:
>>> The problem with rename is -
>>> you have device   'lv1'  you rename it to 'lv2' - yet
>>> those who opened device with the name 'lv1' still thinks
>>> the 'lv1' device exits.
>>> So for safety reason before you 'reuse' any existing name in-use,
>>> there should be 'deactivating' such device first - so there is no 'race'
>>> in name usage.
