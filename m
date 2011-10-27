Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p9R9uOuU012724
	for <linux-lvm@redhat.com>; Thu, 27 Oct 2011 05:56:24 -0400
Received: from mail-ey0-f174.google.com (mail-ey0-f174.google.com
	[209.85.215.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p9R9tvC9017130
	for <linux-lvm@redhat.com>; Thu, 27 Oct 2011 05:56:23 -0400
Received: by mail-ey0-f174.google.com with SMTP id 27so3049170eye.33
	for <linux-lvm@redhat.com>; Thu, 27 Oct 2011 02:56:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAGRgLy5HdNkeNAfXAxhDAmM25XUmYTj_qgeWdzm8DYTdSDzTLw@mail.gmail.com>
References: <CAGRgLy6mHYGGS-ydGCx_mWGuKE31TLu5xnAzkAb6ZoEHjzPW+A@mail.gmail.com>
	<CAJJYPdkzu_SXGjuoUmfMVOA_UJhAFsnZWf8z41pfGUxJFMT6xA@mail.gmail.com>
	<CAGRgLy5Sm_T19Ex+qLe=rTH3r_nSnYOhW+mU5HZy5Y1y2JnJAw@mail.gmail.com>
	<CAJJYPdk2KXkYRTA5cQTAhkv=7fZoQKdopTySBA+mQ+Jp7K8QBg@mail.gmail.com>
	<CAGRgLy5HdNkeNAfXAxhDAmM25XUmYTj_qgeWdzm8DYTdSDzTLw@mail.gmail.com>
Date: Thu, 27 Oct 2011 11:56:22 +0200
Message-ID: <CAJJYPd=XyR1BfzRRv=AEYOiJWupSp+E8XO+YtKoTA03iCfuETQ@mail.gmail.com>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
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
To: Alexander Lyakas <alex.bolshoy@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

2011/10/27 Alexander Lyakas <alex.bolshoy@gmail.com>:
> Hi Zdenek,
>
>> If you expect stable behavior - and the best memory efficiency and the
>> most supported features
>> �- then I'd go this way for now.
> It's quite frustrating, but I understand. Thanks.

As this new lvmapi is not yet fully finished - it's the solution which
gives you something that works now.
IMHO there is no big progress currently  in this api library - so I'd
not expect major upgrade in the near future.

>
>> /dev/dm-xxx � gets �its �'xxx' value in the order in which they appear
>> in the kernel processing.
>> Thus you should never ever depend on any fixed 'xxx' here - i.e. do
>> not reference /dev/dm-xxx
>> anywhere in you code - since it may change between reboots.
> Since my application is the one creating the dm-linear devices after
> boot, I am controlling their dm names. So I know exactly how to
> reference them.
>
>> lvm.conf � - look for �setting 'filter='
> I am using filter to match only a very small set of devices, something like:
> filter = [ "a|^/dev/mapper/alex-|", "r/.*/" ]
> So accept only something that looks like /dev/mapper/alex-...., reject
> everything else (right?).
>
> Still, when looking at a liblvm "_cache.devices" in gdb, I see a lot
> of devices there (~300). Perhaps the filter does not affect this
> particular cache.

The problem is the order of filter application - I've proposed to
switch the order, but it's not so simple as it might look.
In some cases the regular expression filter might be more expensive
then other type of filters so doing other checks before may give
better performance.  Anyway at the end  lvm should not read it's data
from filtered devices - while it might be possible to that during
filter processing some devices are read because filter with higher
priority may needed.

I'll try to probably propose a better version where the filter will
have it's priority and user may select what he prefers.
In my devel tree I keep the regex filter first - since it makes logs
considerably smaller ;)
(We may as well reevaluate the expensiveness of each filters to put
the in the best order - the fastest should be the first)

> I will try to put up a short code, which reproduces the problem....
> although to reproduce it, I need to create a couple of dm-linears,
> delete them, then re-create so that they receive different minor
> numbers. So the code might not be as short after all....

I'll take a look once it's ready.

Zdenek
