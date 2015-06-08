Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5829JhK021761
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Sun, 7 Jun 2015 22:09:19 -0400
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by mx1.redhat.com (Postfix) with ESMTPS id D4B5B19F968
	for <linux-lvm@redhat.com>; Mon,  8 Jun 2015 02:09:18 +0000 (UTC)
Received: by iebmu5 with SMTP id mu5so53843082ieb.1
	for <linux-lvm@redhat.com>; Sun, 07 Jun 2015 19:09:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <55715811.8020706@redhat.com>
References: <CAAYit8QCcaGvb5QPw_Xuk+oavthHR1c32oB0GsGd+Ypk0rPtRg@mail.gmail.com>
	<55704119.4000606@redhat.com>
	<CAAYit8T2YTHCrGf2rPYdQUTQOGn3uZVQkEkJ-DCbj+9iovRw+g@mail.gmail.com>
	<55715811.8020706@redhat.com>
Date: Mon, 8 Jun 2015 10:09:17 +0800
Message-ID: <CAAYit8Q9f+u0FFjR9h6ssUUpZwxwnV5k1rbYeUATMaDn0Un35g@mail.gmail.com>
From: "M.H. Tsai" <mingnus@gmail.com>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

2015-06-05 16:04 GMT+08:00 Zdenek Kabelac <zkabelac@redhat.com>:
> The problem with rename is -
>
> you have device   'lv1'  you rename it to 'lv2' - yet
> those who opened device with the name 'lv1' still thinks
> the 'lv1' device exits.
>
> So for safety reason before you 'reuse' any existing name in-use,
> there should be 'deactivating' such device first - so there is no 'race' in
> name usage.
>
> It's even possible we miss to track full history of active renamed device.
>
> Since you get into strange scenarios when you start to count
> with udev event handling and link generating here - it's getting nearly
> impossible to synchronize this properly...

Does that mean, if I can confirm that there's no program using the device name,
then it's safe to rename an active device? The devices I want to rename are
internal volumes. I think that there's no user space program using these names,
except LVM.

There's a typo error in my previous message.
The 2nd subLV is "vg1-lv1_child2", not "vg1-lv2_child2"

# dmsetup ls --tree
vg1-lv1 (253:3)
 ├─ vg1-lv1_child1 (253:1)
 └─ vg1-lv1_child2 (253:2)
