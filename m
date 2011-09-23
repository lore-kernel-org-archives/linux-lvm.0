Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p8NJefqf020234
	for <linux-lvm@redhat.com>; Fri, 23 Sep 2011 15:40:42 -0400
Received: from mail-iy0-f174.google.com (mail-iy0-f174.google.com
	[209.85.210.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p8NJeYo8019425
	for <linux-lvm@redhat.com>; Fri, 23 Sep 2011 15:40:34 -0400
Received: by iaqq3 with SMTP id q3so6396168iaq.33
	for <linux-lvm@redhat.com>; Fri, 23 Sep 2011 12:40:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAJJYPdkTyxDHifFWvap8pSZzzVmd+0bwrakQ+5-A9VRUSOx4bw@mail.gmail.com>
References: <CAGRgLy7Q+Rd9-z_Wz6WGsEy5OmvtjaSBQNZ_Ez0uVxMXFM5j_g@mail.gmail.com>
	<4E5392A6.6000201@redhat.com>
	<CAGRgLy6AsAv-JMaTrzO0inR+y-9JkHGf8WjBBpKd+NevvMA7xg@mail.gmail.com>
	<CAJJYPd=-KrbxFG8uDf0muCzA+ZuF0zat0O+m0BENsAiUiYxAAA@mail.gmail.com>
	<CAGRgLy6OjHHwzs0Qufq2U6LG4U-zH10Nq2rA-0Ce=YiG1Fvsrw@mail.gmail.com>
	<4E5C993F.7050706@gmail.com>
	<CAGRgLy7pn-6V35f9Uc+zXcHx+TU8rv8EkQjZ6bNsfKCQPNPzLw@mail.gmail.com>
	<CAJJYPdkTyxDHifFWvap8pSZzzVmd+0bwrakQ+5-A9VRUSOx4bw@mail.gmail.com>
Date: Fri, 23 Sep 2011 22:40:33 +0300
Message-ID: <CAGRgLy5EQLB0fcygz5QMQ-Cdbm3AztRSe6v=p2HdhCdJ1H2g3w@mail.gmail.com>
From: Alexander Lyakas <alex.bolshoy@gmail.com>
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
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Hello Zdenek,
I just wanted to update you:

- ubuntu confirmed that this rule is problematic, and causes also other issues:
https://bugs.launchpad.net/ubuntu/+source/udev/+bug/833891

- we have uninstalled the ubuntu lvm package, and using now the 88
version that you pointed at.

At this point, this are going pretty well, although sometimes we have
conflicts with other ubuntu packages, which try to install lvm/dmsetup
from ubuntu, so we are preventing them from doing that.

We had to add a code to manually activate the LVs once the VG shows up
(it was done by the ubuntu rule), but this is perfectly fine for us.

A question that we have: building the official LVM package has a lot
of configuration options. We have picked some that make sense,
especially the udev synchronization options. But perhaps we missed
some important ones. Do you think you can recommend a set of conf
options, to make the package most "friendly"?

Thanks for your help,
  Alex.


On Tue, Aug 30, 2011 at 12:15 PM, Zdenek Kabelac
<zdenek.kabelac@gmail.com> wrote:
>
> 2011/8/30 Alexander Lyakas <alex.bolshoy@gmail.com>:
> > Zdenek,
> > thank you.
> > I want to try the newer version.
> > Can you pls point me to the "latest version from upstream tarball",
> > because those Linux terms are still quite confusing to me.
>
> In this case it might not be so easy as you might need to be familiar
> with configure and installation of local binary files.
>
> Anyway here are some links:
>
> http://sourceware.org/lvm2/
>
> ftp://sources.redhat.com/pub/lvm2/LVM2.2.02.88.tgz
>
> Zdenek
