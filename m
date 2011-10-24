Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p9OCGOU3013543
	for <linux-lvm@redhat.com>; Mon, 24 Oct 2011 08:16:24 -0400
Received: from mail-gy0-f174.google.com (mail-gy0-f174.google.com
	[209.85.160.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p9OCGNZF021151
	for <linux-lvm@redhat.com>; Mon, 24 Oct 2011 08:16:23 -0400
Received: by gyb13 with SMTP id 13so7618607gyb.33
	for <linux-lvm@redhat.com>; Mon, 24 Oct 2011 05:16:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAJJYPdkzu_SXGjuoUmfMVOA_UJhAFsnZWf8z41pfGUxJFMT6xA@mail.gmail.com>
References: <CAGRgLy6mHYGGS-ydGCx_mWGuKE31TLu5xnAzkAb6ZoEHjzPW+A@mail.gmail.com>
	<CAJJYPdkzu_SXGjuoUmfMVOA_UJhAFsnZWf8z41pfGUxJFMT6xA@mail.gmail.com>
Date: Mon, 24 Oct 2011 14:16:23 +0200
Message-ID: <CAGRgLy5Sm_T19Ex+qLe=rTH3r_nSnYOhW+mU5HZy5Y1y2JnJAw@mail.gmail.com>
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

It appears that I don't understand part of your comments, or perhaps
we have a disconnect.

> Not really sure about lvmlib API capabilities - IMHO I'd not use it
> for anything else then lvs-like operations ATM. �(since there are
> quite a few rules to avoid deadlocks) If it's not a problem for you
> app I'd suggest to use lvm2cmd library preferable in a separate forked
> small process so there could be full control over memory and file
> descriptors....
Do you suggest not to use lvmlib at all? And always use command-line
LVM tools from within a forked process? Currently I use
command-line/fork only for pvcreate/pvremove, since these APIs are not
available in lvmlib.

> dm-xxx devices are created dynamicaly - there is currently no way to
> have a fixed dm device node and it would be quite ugly to provide such
> feature.
I did not understand this comment. Do you mean the dm-xxx devices that
LVM creates for its LVs? I was talking about dm-linear devices that I
use for PVs.

>
> So at dm level - you could use � /dev/mapper/devicename however at lvm
> level the only supported way �is /dev/vg/lv
> (even though they are visible through /dev/mapper �- only /dev/vg �are
> meant to be 'public')
Again, do you mean the LV dm-xxx devices? I was talking about PV
devices, which are dm-linear in my case.

> Yes, there is locking, so as long as you are using only lvm tools,
> there should be no collisions.
What I meant here, is that each time a command-line tool is invoked,
it has a fresh instance of caches of its own. While in my application,
if I keep the lvm_t handle open, then the caches within lvm are not
cleaned up. This (plus the change in dev_t) causes the problem I am
seeing.

> Recent versions of lvm should be getting list of block devices for
> scanning from udev, and then more filters are applied.
Is there an option to restrict this list only to certain devices? In
my system there is no point of scanning all the devices.

All in all, I fixed my code to issue lvm_config_reload() before each
LVM operation. This cleans all the caches, so I am not seeing the
problem anymore.

Basically, I looked at the various caches code in the LVM, and they
seem quite dangerous to me, if not refreshed before each LVM
operation. Since most LVM usage (I presume) is done via command-line
tools, which create a new process (i.e., new caches) each time
invoked, not sure how big is the gain of caching. But I am probably
not seeing the whole picture.

Thanks,
  Alex.
