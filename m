Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s0G1WidN017965
	for <linux-lvm@redhat.com>; Wed, 15 Jan 2014 20:32:44 -0500
Received: from mail-pb0-f51.google.com (mail-pb0-f51.google.com
	[209.85.160.51])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s0G1WZj2032427
	for <linux-lvm@redhat.com>; Wed, 15 Jan 2014 20:32:36 -0500
Received: by mail-pb0-f51.google.com with SMTP id rp16so1929181pbb.24
	for <linux-lvm@redhat.com>; Wed, 15 Jan 2014 17:32:35 -0800 (PST)
Received: from leela (host-134-71-248-24.allocated.csupomona.edu.
	[134.71.248.24]) by mx.google.com with ESMTPSA id
	yi8sm14323357pab.16.2014.01.15.17.32.33 for <linux-lvm@redhat.com>
	(version=TLSv1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 15 Jan 2014 17:32:34 -0800 (PST)
Sender: Paul Henson <paul.b.henson@gmail.com>
From: "Paul B. Henson" <henson@acm.org>
References: <87zjmxzmga.fsf@red.mvo.lan>	<52D6B4AF.9010007@mglug.de>
	<CADxRZqwmcmqjM6qV184HtD5-X4WRxExhchAo7twWHEt7_Vuf4w@mail.gmail.com>
In-Reply-To: <CADxRZqwmcmqjM6qV184HtD5-X4WRxExhchAo7twWHEt7_Vuf4w@mail.gmail.com>
Date: Wed, 15 Jan 2014 17:32:30 -0800
Message-ID: <084301cf125a$d4b4a980$7e1dfc80$@acm.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Language: en-us
Subject: Re: [linux-lvm] Identifying useable block devices
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

> Anatoly Pugachev
> Sent: Wednesday, January 15, 2014 12:25 PM
>
> > the /dev/mapper/.. devices are for internal use only.
> 
> If so, how come most commands use it (df, mount, findmnt, etc..) and
> not /dev/vg/vol notation?

Because /dev/vg/vol is just a symlink to /dev/mapper/vg-vol, and mount
dereferences it and uses the authoritative name when it actually mounts it.

It can be rather confusing to have an fstab full of /dev/vg/foo but then see
/dev/mapper/vg-foo listed by mount, it does tend to make one think they
should just use /dev/mapper paths directly.
