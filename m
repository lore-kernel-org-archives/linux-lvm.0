Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p9OCSECD002793
	for <linux-lvm@redhat.com>; Mon, 24 Oct 2011 08:28:14 -0400
Received: from mail-ey0-f174.google.com (mail-ey0-f174.google.com
	[209.85.215.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p9OCSDiN007188
	for <linux-lvm@redhat.com>; Mon, 24 Oct 2011 08:28:13 -0400
Received: by eye27 with SMTP id 27so7637199eye.33
	for <linux-lvm@redhat.com>; Mon, 24 Oct 2011 05:28:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAGRgLy5Sm_T19Ex+qLe=rTH3r_nSnYOhW+mU5HZy5Y1y2JnJAw@mail.gmail.com>
References: <CAGRgLy6mHYGGS-ydGCx_mWGuKE31TLu5xnAzkAb6ZoEHjzPW+A@mail.gmail.com>
	<CAJJYPdkzu_SXGjuoUmfMVOA_UJhAFsnZWf8z41pfGUxJFMT6xA@mail.gmail.com>
	<CAGRgLy5Sm_T19Ex+qLe=rTH3r_nSnYOhW+mU5HZy5Y1y2JnJAw@mail.gmail.com>
Date: Mon, 24 Oct 2011 14:28:12 +0200
Message-ID: <CAJJYPdk2KXkYRTA5cQTAhkv=7fZoQKdopTySBA+mQ+Jp7K8QBg@mail.gmail.com>
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

2011/10/24 Alexander Lyakas <alex.bolshoy@gmail.com>:
> Hi Zdenek,
>
> It appears that I don't understand part of your comments, or perhaps
> we have a disconnect.
>
>> Not really sure about lvmlib API capabilities - IMHO I'd not use it
>> for anything else then lvs-like operations ATM. �(since there are
>> quite a few rules to avoid deadlocks) If it's not a problem for you
>> app I'd suggest to use lvm2cmd library preferable in a separate forked
>> small process so there could be full control over memory and file
>> descriptors....
> Do you suggest not to use lvmlib at all? And always use command-line
> LVM tools from within a forked process? Currently I use
> command-line/fork only for pvcreate/pvremove, since these APIs are not
> available in lvmlib.

If you expect stable behavior - and the best memory efficiency and the
most supported features
 - then I'd go this way for now.



>
>> dm-xxx devices are created dynamicaly - there is currently no way to
>> have a fixed dm device node and it would be quite ugly to provide such
>> feature.
> I did not understand this comment. Do you mean the dm-xxx devices that
> LVM creates for its LVs? I was talking about dm-linear devices that I
> use for PVs.

/dev/dm-xxx   gets  its  'xxx' value in the order in which they appear
in the kernel processing.
Thus you should never ever depend on any fixed 'xxx' here - i.e. do
not reference /dev/dm-xxx
anywhere in you code - since it may change between reboots.


>> So at dm level - you could use � /dev/mapper/devicename however at lvm
>> level the only supported way �is /dev/vg/lv
>> (even though they are visible through /dev/mapper �- only /dev/vg �are
>> meant to be 'public')
> Again, do you mean the LV dm-xxx devices? I was talking about PV
> devices, which are dm-linear in my case.

Always reference   /dev/vgname/lvname to stay safe.


>> Yes, there is locking, so as long as you are using only lvm tools,
>> there should be no collisions.
> What I meant here, is that each time a command-line tool is invoked,
> it has a fresh instance of caches of its own. While in my application,
> if I keep the lvm_t handle open, then the caches within lvm are not
> cleaned up. This (plus the change in dev_t) causes the problem I am
> seeing.

Internal caching knows it's changes devices and should properly flush them.

So if you get there some unexpected behavior - create a simple test case code,
and create regular bug.

(open handle, make few lvm2api operations causing problem)

>> Recent versions of lvm should be getting list of block devices for
>> scanning from udev, and then more filters are applied.
> Is there an option to restrict this list only to certain devices? In
> my system there is no point of scanning all the devices.

lvm.conf   - look for  setting 'filter='


> All in all, I fixed my code to issue lvm_config_reload() before each
> LVM operation. This cleans all the caches, so I am not seeing the
> problem anymore.
>
> Basically, I looked at the various caches code in the LVM, and they
> seem quite dangerous to me, if not refreshed before each LVM
> operation. Since most LVM usage (I presume) is done via command-line
> tools, which create a new process (i.e., new caches) each time
> invoked, not sure how big is the gain of caching. But I am probably
> not seeing the whole picture.

Yeah, you are not alone ;)
But in this case it looks like a bug you might be hitting - since this
case should work.

Zdenek
