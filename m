Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p7U8Lg10002582
	for <linux-lvm@redhat.com>; Tue, 30 Aug 2011 04:21:42 -0400
Received: from mail-iy0-f174.google.com (mail-iy0-f174.google.com
	[209.85.210.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p7U8LcUh025468
	for <linux-lvm@redhat.com>; Tue, 30 Aug 2011 04:21:38 -0400
Received: by iabu26 with SMTP id u26so1800103iab.33
	for <linux-lvm@redhat.com>; Tue, 30 Aug 2011 01:21:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4E5C993F.7050706@gmail.com>
References: <CAGRgLy7Q+Rd9-z_Wz6WGsEy5OmvtjaSBQNZ_Ez0uVxMXFM5j_g@mail.gmail.com>
	<4E5392A6.6000201@redhat.com>
	<CAGRgLy6AsAv-JMaTrzO0inR+y-9JkHGf8WjBBpKd+NevvMA7xg@mail.gmail.com>
	<CAJJYPd=-KrbxFG8uDf0muCzA+ZuF0zat0O+m0BENsAiUiYxAAA@mail.gmail.com>
	<CAGRgLy6OjHHwzs0Qufq2U6LG4U-zH10Nq2rA-0Ce=YiG1Fvsrw@mail.gmail.com>
	<4E5C993F.7050706@gmail.com>
Date: Tue, 30 Aug 2011 11:21:37 +0300
Message-ID: <CAGRgLy7pn-6V35f9Uc+zXcHx+TU8rv8EkQjZ6bNsfKCQPNPzLw@mail.gmail.com>
From: Alexander Lyakas <alex.bolshoy@gmail.com>
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Zdenek,
thank you.
I want to try the newer version.
Can you pls point me to the "latest version from upstream tarball",
because those Linux terms are still quite confusing to me.

Thanks,
  Alex.



On Tue, Aug 30, 2011 at 11:03 AM, Zdenek Kabelac
<zdenek.kabelac@gmail.com> wrote:
> Dne 29.8.2011 17:47, Alexander Lyakas napsal(a):
>> Hello Zdenek,
>> I did some investigations, and I think the problem is the following:
>>
>> When an LV is created, udev event comes in. It looks like the problem
>> happens only when this first udev event has the following properties:
>> ID_FS_UUID=3DINtL1j-fpvA-Xx13-iXSL-XtDx-ekzV-8aGHg1 (or something else)
>> ID_FS_UUID_ENC=3DINtL1j-fpvA-Xx13-iXSL-XtDx-ekzV-8aGHg1 (or something el=
se)
>> ID_FS_VERSION=3DLVM2\x20001
>> ID_FS_TYPE=3DLVM2_member
>> ID_FS_USAGE=3Draid
>>
>> Usually, I see these properties on PVs (which are MD arrays) and not on =
LVs.
>> I don't really know why these properties sometimes appear on a new LV
>> (some leftover on disk???), but when it happens, then the following
>> ubuntu udev rule kicks in:
>>
>> ---------- code ----------
>> # This file causes block devices with LVM signatures to be automatically
>> # added to their volume group.
>> # See udev(8) for syntax
>> SUBSYSTEM=3D=3D"block", ACTION=3D=3D"add|change",
>> ENV{ID_FS_TYPE}=3D=3D"lvm*|LVM*", RUN+=3D"watershed sh -c '/sbin/lvm vgs=
can;
>> /sbin/lvm vgchange -a y'"
>> ------ end code -------
>>
>> This rule is described here:
>> https://wiki.ubuntu.com/UdevLvm
>>
>> So vgscan is issued and it gets stuck waiting for the LVM lock,
>> because currently my thread is stuck in lv_create_linear(), waiting
>> for udev event, and my thread holds this lock.
>>
>> At this point the system is stuck. What I did then, I killed the
>> vgscan and vgchange processes, but still additional udev events did
>> not come. Then I issued 'udevadm settle' and next udev event arrived.
>> This next event did not contain the problematic ID_FS_XXX fields. And
>> then LV creation completed smoothly. Also, in all the cases, in which
>> LV creation went smoothly, I did not see the ID_FS_XXX fields.
>>
>> So I have several doubts:
>> 1) I understand why vgscan was stuck, but do not understand why udev
>> events stopped coming. Does udev need the previous event processing
>> rules to complete, before sending new events?
>> 2) Why these problematic ID_FS_XXX properties appeared, and how can we
>> prevent this?
>> 3) Or otherwise, do you think that ubuntu's rule is problematic? In my
>> case, I don't need this rule, because I activate all the LVs in my
>> code anyways.
>
> I assume udev vars are being set from blkid execution on block device.
>
> I really think version 2.02.66 is way to obsolete especially if all
> surrounding apps (like udev) have been upgraded many times.
>
> Vgscan should not be executed by any udev rules.
>
> lvm2 package is bundled with its own =EF=BF=BDudev rules - which are test=
ed and
> verified to work. If a distribution decides to ignore them and bundle its=
 own
> version I afraid you need to ask for help the package maintainer in your
> distro for such support.
>
> So I'd suggest to to install latest version from upstream tarball otherwi=
se
> you will be losing your time fighting with more then a year old bugs.
>
> Zdenek
>
