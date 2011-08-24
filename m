Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p7O9ffQA011482
	for <linux-lvm@redhat.com>; Wed, 24 Aug 2011 05:41:41 -0400
Received: from mail-vx0-f174.google.com (mail-vx0-f174.google.com
	[209.85.220.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p7O9fMXw029727
	for <linux-lvm@redhat.com>; Wed, 24 Aug 2011 05:41:40 -0400
Received: by mail-vx0-f174.google.com with SMTP id 9so1214139vxi.33
	for <linux-lvm@redhat.com>; Wed, 24 Aug 2011 02:41:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAGRgLy6AsAv-JMaTrzO0inR+y-9JkHGf8WjBBpKd+NevvMA7xg@mail.gmail.com>
References: <CAGRgLy7Q+Rd9-z_Wz6WGsEy5OmvtjaSBQNZ_Ez0uVxMXFM5j_g@mail.gmail.com>
	<4E5392A6.6000201@redhat.com>
	<CAGRgLy6AsAv-JMaTrzO0inR+y-9JkHGf8WjBBpKd+NevvMA7xg@mail.gmail.com>
Date: Wed, 24 Aug 2011 11:41:39 +0200
Message-ID: <CAJJYPd=-KrbxFG8uDf0muCzA+ZuF0zat0O+m0BENsAiUiYxAAA@mail.gmail.com>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Subject: Re: [linux-lvm] lvm_vg_create_lv_linear() stuck in dm_udev_wait()
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
To: Alexander Lyakas <alex.bolshoy@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

2011/8/24 Alexander Lyakas <alex.bolshoy@gmail.com>:
> Zdenek,
> thank you for your reply.
>
> I am using stock ubuntu natty:
> 2.6.38-8-server #42-Ubuntu SMP Mon Apr 11 03:49:04 UTC 2011 x86_64
> x86_64 x86_64 GNU/Linux
> and 2.02.66 is what comes with natty.
>
> I will check the udev rules part further.

Best would be to use the latest package with it's own rule - but it
might be not so easy if you are not udev experienced user to properly
fix udev rules in Ubuntu. Eventually you may try this package:

http://packages.debian.org/unstable/admin/lvm2

It's not the latest - but there should be bigger chance of more
correct udev behaviour.

>
> If I want to try the new LVM package, say LVM2.2.02.88.tgz, do I need
> to do any update to the kernel, or will it work with my existing
> kernel 2.6.38-8-server.
>

It should work out-of-the-box - if you will notice any problem - feel
free to report.

Zdenek
