Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t9HHnZdG022546
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sat, 17 Oct 2015 13:49:35 -0400
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mx1.redhat.com (Postfix) with ESMTPS id 8E195C0C189C
	for <linux-lvm@redhat.com>; Sat, 17 Oct 2015 17:49:34 +0000 (UTC)
Received: by wikq8 with SMTP id q8so887575wik.1
	for <linux-lvm@redhat.com>; Sat, 17 Oct 2015 10:49:33 -0700 (PDT)
Received: from [192.168.192.99] (ip-94-113-160-102.net.upcbroadband.cz.
	[94.113.160.102]) by smtp.gmail.com with ESMTPSA id
	cc8sm29519231wjc.46.2015.10.17.10.49.31 for <linux-lvm@redhat.com>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 17 Oct 2015 10:49:31 -0700 (PDT)
References: <CAAxjCEwMqpAWFc+BBNW6bLUC7mkjkjdvFkRz66WnZEB__qW2dw@mail.gmail.com>
	<20150911125104.GA8027@rh-vpn> <mvrdlj$6r9$1@ger.gmane.org>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <56228A2A.6050908@gmail.com>
Date: Sat, 17 Oct 2015 19:49:30 +0200
MIME-Version: 1.0
In-Reply-To: <mvrdlj$6r9$1@ger.gmane.org>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM cache (or dm-cache) shutdown
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Dne 16.10.2015 v 19:54 Ian Pilcher napsal(a):
> On 09/11/2015 07:51 AM, Joe Thornber wrote:
>> No, this is not expected.  The most likely cause is your system was
>> not shutdown cleanly so dm-cache has no choice but to assume all
>> blocks are dirty and need writing back.  Make sure your volumes are
>> being deactivated as part of shutdown.
>
> What exactly is required to cleanly shutdown an LVM cache or dm-cache
> device?
>
> AFAICT, systemd does a DM_DEV_REMOVE ioctl on all device mapper devices
> during shutdown/reboot.  Is this sufficient?


ONLY if the give device are UNUSED.

If the volume is e.g. mounted - then 'remove' is irrelevant.

You can't remove device with open count != 0.
(check with:  dmsetup info -c)

Zdenek
