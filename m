Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p9R9LLJW015190
	for <linux-lvm@redhat.com>; Thu, 27 Oct 2011 05:21:21 -0400
Received: from mail-iy0-f174.google.com (mail-iy0-f174.google.com
	[209.85.210.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p9R9LKAB007913
	for <linux-lvm@redhat.com>; Thu, 27 Oct 2011 05:21:21 -0400
Received: by iaby12 with SMTP id y12so4203700iab.33
	for <linux-lvm@redhat.com>; Thu, 27 Oct 2011 02:21:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAJJYPdk2KXkYRTA5cQTAhkv=7fZoQKdopTySBA+mQ+Jp7K8QBg@mail.gmail.com>
References: <CAGRgLy6mHYGGS-ydGCx_mWGuKE31TLu5xnAzkAb6ZoEHjzPW+A@mail.gmail.com>
	<CAJJYPdkzu_SXGjuoUmfMVOA_UJhAFsnZWf8z41pfGUxJFMT6xA@mail.gmail.com>
	<CAGRgLy5Sm_T19Ex+qLe=rTH3r_nSnYOhW+mU5HZy5Y1y2JnJAw@mail.gmail.com>
	<CAJJYPdk2KXkYRTA5cQTAhkv=7fZoQKdopTySBA+mQ+Jp7K8QBg@mail.gmail.com>
Date: Thu, 27 Oct 2011 11:21:20 +0200
Message-ID: <CAGRgLy5HdNkeNAfXAxhDAmM25XUmYTj_qgeWdzm8DYTdSDzTLw@mail.gmail.com>
From: Alexander Lyakas <alex.bolshoy@gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Changing dev_t-devname mapping in lvmlib seems to
	be problematic
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
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Hi Zdenek,

> If you expect stable behavior - and the best memory efficiency and the
> most supported features
> �- then I'd go this way for now.
It's quite frustrating, but I understand. Thanks.

> /dev/dm-xxx � gets �its �'xxx' value in the order in which they appear
> in the kernel processing.
> Thus you should never ever depend on any fixed 'xxx' here - i.e. do
> not reference /dev/dm-xxx
> anywhere in you code - since it may change between reboots.
Since my application is the one creating the dm-linear devices after
boot, I am controlling their dm names. So I know exactly how to
reference them.

> lvm.conf � - look for �setting 'filter='
I am using filter to match only a very small set of devices, something like:
filter = [ "a|^/dev/mapper/alex-|", "r/.*/" ]
So accept only something that looks like /dev/mapper/alex-...., reject
everything else (right?).

Still, when looking at a liblvm "_cache.devices" in gdb, I see a lot
of devices there (~300). Perhaps the filter does not affect this
particular cache.

I will try to put up a short code, which reproduces the problem....
although to reproduce it, I need to create a couple of dm-linears,
delete them, then re-create so that they receive different minor
numbers. So the code might not be as short after all....

Thanks,
  Alex.
