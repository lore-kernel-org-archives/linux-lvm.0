Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p71B5iEs016264
	for <linux-lvm@redhat.com>; Mon, 1 Aug 2011 07:05:44 -0400
Received: from mail-wy0-f174.google.com (mail-wy0-f174.google.com
	[74.125.82.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p71B5giR012604
	for <linux-lvm@redhat.com>; Mon, 1 Aug 2011 07:05:43 -0400
Received: by wyg8 with SMTP id 8so1525093wyg.33
	for <linux-lvm@redhat.com>; Mon, 01 Aug 2011 04:05:42 -0700 (PDT)
Message-ID: <4E368882.2060700@redhat.com>
Date: Mon, 01 Aug 2011 13:05:38 +0200
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
MIME-Version: 1.0
References: <CAGRgLy4Qk1r7Zd-uOZc7araf2tpfFLgGGigv7xyzfvrkMo2hmQ@mail.gmail.com>
In-Reply-To: <CAGRgLy4Qk1r7Zd-uOZc7araf2tpfFLgGGigv7xyzfvrkMo2hmQ@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvm_t handles and thread-safety
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Alexander Lyakas <alex.bolshoy@gmail.com>

Dne 1.8.2011 10:12, Alexander Lyakas napsal(a):
> Hello everybody,
> I am using stock ubuntu natty with lvmlib 2.02.66.
> 
> In my application I would like to have several threads, each operating
> on a different VG.
> 
> When I tried to share the same lvm_t handle between the threads, very
> soon I got segmentation faults in dm_hash operations. Looking at the
> code, I indeed saw that the contents of lvm_t are used without
> synchronization.


lvm library is not thread safe and it's quite far from being thread safe.

So there is no point on having 2 handles on 2 VGs - it will not work.

> 
> Are there any plans or intentions to provide some support for
> threading with lvmlib?
> 

With current version of lvm2 code there is no way.

Just use the pthread mutex around the lvm command. It's serialized in kernel
anyway. So you cannot gain any speed by using threads. (Check the clvmd code.)


Zdenek
