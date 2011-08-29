Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p7TFm2qB001480
	for <linux-lvm@redhat.com>; Mon, 29 Aug 2011 11:48:02 -0400
Received: from mail-iy0-f174.google.com (mail-iy0-f174.google.com
	[209.85.210.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p7TFlw5f024550
	for <linux-lvm@redhat.com>; Mon, 29 Aug 2011 11:47:58 -0400
Received: by iabu26 with SMTP id u26so766758iab.33
	for <linux-lvm@redhat.com>; Mon, 29 Aug 2011 08:47:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAJJYPd=-KrbxFG8uDf0muCzA+ZuF0zat0O+m0BENsAiUiYxAAA@mail.gmail.com>
References: <CAGRgLy7Q+Rd9-z_Wz6WGsEy5OmvtjaSBQNZ_Ez0uVxMXFM5j_g@mail.gmail.com>
	<4E5392A6.6000201@redhat.com>
	<CAGRgLy6AsAv-JMaTrzO0inR+y-9JkHGf8WjBBpKd+NevvMA7xg@mail.gmail.com>
	<CAJJYPd=-KrbxFG8uDf0muCzA+ZuF0zat0O+m0BENsAiUiYxAAA@mail.gmail.com>
Date: Mon, 29 Aug 2011 18:47:55 +0300
Message-ID: <CAGRgLy6OjHHwzs0Qufq2U6LG4U-zH10Nq2rA-0Ce=YiG1Fvsrw@mail.gmail.com>
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
I did some investigations, and I think the problem is the following:

When an LV is created, udev event comes in. It looks like the problem
happens only when this first udev event has the following properties:
ID_FS_UUID=INtL1j-fpvA-Xx13-iXSL-XtDx-ekzV-8aGHg1 (or something else)
ID_FS_UUID_ENC=INtL1j-fpvA-Xx13-iXSL-XtDx-ekzV-8aGHg1 (or something else)
ID_FS_VERSION=LVM2\x20001
ID_FS_TYPE=LVM2_member
ID_FS_USAGE=raid

Usually, I see these properties on PVs (which are MD arrays) and not on LVs.
I don't really know why these properties sometimes appear on a new LV
(some leftover on disk???), but when it happens, then the following
ubuntu udev rule kicks in:

---------- code ----------
# This file causes block devices with LVM signatures to be automatically
# added to their volume group.
# See udev(8) for syntax
SUBSYSTEM=="block", ACTION=="add|change",
ENV{ID_FS_TYPE}=="lvm*|LVM*", RUN+="watershed sh -c '/sbin/lvm vgscan;
/sbin/lvm vgchange -a y'"
------ end code -------

This rule is described here:
https://wiki.ubuntu.com/UdevLvm

So vgscan is issued and it gets stuck waiting for the LVM lock,
because currently my thread is stuck in lv_create_linear(), waiting
for udev event, and my thread holds this lock.

At this point the system is stuck. What I did then, I killed the
vgscan and vgchange processes, but still additional udev events did
not come. Then I issued 'udevadm settle' and next udev event arrived.
This next event did not contain the problematic ID_FS_XXX fields. And
then LV creation completed smoothly. Also, in all the cases, in which
LV creation went smoothly, I did not see the ID_FS_XXX fields.

So I have several doubts:
1) I understand why vgscan was stuck, but do not understand why udev
events stopped coming. Does udev need the previous event processing
rules to complete, before sending new events?
2) Why these problematic ID_FS_XXX properties appeared, and how can we
prevent this?
3) Or otherwise, do you think that ubuntu's rule is problematic? In my
case, I don't need this rule, because I activate all the LVs in my
code anyways.

Thanks,
  Alex.


On Wed, Aug 24, 2011 at 12:41 PM, Zdenek Kabelac
<zdenek.kabelac@gmail.com> wrote:
> 2011/8/24 Alexander Lyakas <alex.bolshoy@gmail.com>:
>> Zdenek,
>> thank you for your reply.
>>
>> I am using stock ubuntu natty:
>> 2.6.38-8-server #42-Ubuntu SMP Mon Apr 11 03:49:04 UTC 2011 x86_64
>> x86_64 x86_64 GNU/Linux
>> and 2.02.66 is what comes with natty.
>>
>> I will check the udev rules part further.
>
> Best would be to use the latest package with it's own rule - but it
> might be not so easy if you are not udev experienced user to properly
> fix udev rules in Ubuntu. Eventually you may try this package:
>
> http://packages.debian.org/unstable/admin/lvm2
>
> It's not the latest - but there should be bigger chance of more
> correct udev behaviour.
>
>>
>> If I want to try the new LVM package, say LVM2.2.02.88.tgz, do I need
>> to do any update to the kernel, or will it work with my existing
>> kernel 2.6.38-8-server.
>>
>
> It should work out-of-the-box - if you will notice any problem - feel
> free to report.
>
> Zdenek
>
