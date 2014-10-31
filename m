Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s9VEoJpj017339
	for <linux-lvm@redhat.com>; Fri, 31 Oct 2014 10:50:19 -0400
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com
	[209.85.215.45])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s9VEoGth017165
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Fri, 31 Oct 2014 10:50:17 -0400
Received: by mail-la0-f45.google.com with SMTP id pn19so964670lab.4
	for <linux-lvm@redhat.com>; Fri, 31 Oct 2014 07:50:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <54539924.1020709@redhat.com>
References: <CANHNcP9F=xab3SDarH7X4hrVNY9Mg8aFHvAnBqn0QvfiM-4Hwg@mail.gmail.com>
	<54535811.3050906@redhat.com> <54535B0B.50700@redhat.com>
	<CANHNcP8vR-AJ7j9fkoWKLgSjX6Vgx4JiTCh=h4B=ftVRySag2w@mail.gmail.com>
	<54539924.1020709@redhat.com>
Date: Fri, 31 Oct 2014 10:50:15 -0400
Message-ID: <CANHNcP9PTzx1QH+LbKG1C=tr8wYvizUvL3GD+=RFcorme+eWpw@mail.gmail.com>
From: Roman Mashak <roman.mashak@gmail.com>
Subject: Re: [linux-lvm] vgscan can't see LVM volumes on QEMU image
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

Hi Marian,

2014-10-31 10:13 GMT-04:00 Marian Csontos <mcsontos@redhat.com>:
[skip]
> To me looks like `pvscan --cache` is not called on NBD devices as they
> appear.
>
> Could you post udev db dump for /dev/nbd0 and /dev/nbd0p1?
>
>     udevadm info --name=$NAME --query=all

% udevadm info --name=/dev/nbd0 --query=all
P: /devices/virtual/block/nbd0
N: nbd0
E: DEVNAME=/dev/nbd0
E: DEVPATH=/devices/virtual/block/nbd0
E: DEVTYPE=disk
E: MAJOR=43
E: MINOR=0
E: SUBSYSTEM=block
E: TAGS=:systemd:
E: USEC_INITIALIZED=149161867794
%
% udevadm info --name=/dev/nbd0p1 --query=all
P: /devices/virtual/block/nbd0/nbd0p1
N: nbd0p1
E: DEVNAME=/dev/nbd0p1
E: DEVPATH=/devices/virtual/block/nbd0/nbd0p1
E: DEVTYPE=partition
E: MAJOR=43
E: MINOR=1
E: SUBSYSTEM=block
E: SYSTEMD_READY=0
E: TAGS=:systemd:
E: USEC_INITIALIZED=1614479761
%

> It has to be disabled in lvm.conf. If you only stopped it, it is a socket
> activated service and will be restarted (at least on recent Fedora and
> RHEL.)
>

Yes, I only stopped the process. Thanks for point this.
