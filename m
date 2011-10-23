Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p9N8dlAV000982
	for <linux-lvm@redhat.com>; Sun, 23 Oct 2011 04:39:47 -0400
Received: from mail-ey0-f174.google.com (mail-ey0-f174.google.com
	[209.85.215.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p9N8dkU8006979
	for <linux-lvm@redhat.com>; Sun, 23 Oct 2011 04:39:46 -0400
Received: by eye27 with SMTP id 27so6766774eye.33
	for <linux-lvm@redhat.com>; Sun, 23 Oct 2011 01:39:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAGRgLy6mHYGGS-ydGCx_mWGuKE31TLu5xnAzkAb6ZoEHjzPW+A@mail.gmail.com>
References: <CAGRgLy6mHYGGS-ydGCx_mWGuKE31TLu5xnAzkAb6ZoEHjzPW+A@mail.gmail.com>
Date: Sun, 23 Oct 2011 10:39:45 +0200
Message-ID: <CAJJYPdkzu_SXGjuoUmfMVOA_UJhAFsnZWf8z41pfGUxJFMT6xA@mail.gmail.com>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: Alexander Lyakas <alex.bolshoy@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

2011/10/18 Alexander Lyakas <alex.bolshoy@gmail.com>:
> Hello Zdenek,
> I am testing a following scenario:
>
> I have 5 dm-linear devices, which I have setup manually using dmsetup.
> Their table points at some local disks, like this:
> /dev/mapper/alex0 =3D> /dev/sda
> /dev/mapper/alex1 =3D> /dev/sdb
>
> I create a VG on top of these 5 dm devices, using pvcreate and then
> lvmlib APIs. The VG has no LVs at this point.

Not really sure about lvmlib API capabilities - IMHO I'd not use it
for anything else then lvs-like operations ATM.  (since there are
quite a few rules to avoid deadlocks) If it's not a problem for you
app I'd suggest to use lvm2cmd library preferable in a separate forked
small process so there could be full control over memory and file
descriptors....

> Later I teardown all the dm devices (using dmsetup remove).
> Then I recreate the 5 dm devices, I give them the same names and setup
> the same linear tables.
>
> The difference is that I create them in different order.
> So, for example, previously I had /dev/mapper/alex0 pointing at
> /dev/sda, and it's real devnode was /dev/dm-0 (251:0), now
> /dev/mapper/alex0 still points at /dev/sda, but its devnode is
> /dev/dm-1 (251:1).
> The names that I feed to LVM are always =EF=BF=BD/dev/mapper/alex0,
> /dev/mapper/alex1 ...

dm-xxx devices are created dynamicaly - there is currently no way to
have a fixed dm device node and it would be quite ugly to provide such
feature.

So at dm level - you could use   /dev/mapper/devicename however at lvm
level the only supported way  is /dev/vg/lv
(even though they are visible through /dev/mapper  - only /dev/vg  are
meant to be 'public')

>
> The issue that I see is in _cache.devices handling: it maps devt to
> 'struct device*' objects. So when searching for 251:1, a stale entry
> for 251:1 is found (former /dev/mapper/alex1). So it contains an old
> list of aliases in dev->aliases, and now a new name is added there, so
> it contains now both /dev/mapper/alex0 and /dev/mapper/alex1 (and also
> other names)...
>
> In addition, this entry has dev->pvid of the /dev/mapper/alex1 PV.

Could be there is some bug in there - could you post a some simple
source file to expose this bug?

>
> Further I see a call to lvmcache_add with the following parameters:
> pvid =3D correct pvid of /dev/mapper/alex0 (pointing at /dev/sda)
> dev->pvid =3D the pvid of /dev/mapper/alex1
>
> As a result, the _pvid_hash gets messed up...basically it ends up
> having 4 PVs instead of 5. I am attaching a text file, which traces
> the contents of the _pvid_hash during lvmcache_add call (I added some
> prints there).
>
> So it looks like having an open lib_t handle cannot survive such a
> change in dev_t.

Maybe you could try to open bugzilla - where you would attach source file,
lvm.conf  and version you are trying to use.

>
> I have a couple of questions:
> - Is my analysis (at least more or less) correct?
> - Is this generally a bad idea to have dm-linear devices for PVs? (I
> guarantee that dm-linear table is always setup correctly).

It's perfecly normal usage - but it depends on your  lvm.conf filter settin=
gs
(i.e. if you will allow only   /dev/sdX devices,  then  /dev/mapper/
devices will be invisible)


> - Will using a fresh lib_t handle for each LVM operation solve this
> issue? Because the command-line tools, when invoked, seem to work fine
> (and they build a fresh cache each time). I will guarantee that nobody
> else touches relevant dm devices during the LVM operation.

Yes, there is locking, so as long as you are using only lvm tools,
there should be no collisions.

> - I also see that LVM scans devices like /dev/disk/by-id... while in
> lvm.conf I set the filter to accept only /dev/mapper/alex (all others
> I set to reject). What am I missing?

Recent versions of lvm should be getting list of block devices for
scanning from udev, and then more filters are applied.

Zdenek
