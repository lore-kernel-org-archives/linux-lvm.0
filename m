Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2JIYXcn025374
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 19 Mar 2015 14:34:33 -0400
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mx1.redhat.com (Postfix) with ESMTPS id D561EB5BF9
	for <linux-lvm@redhat.com>; Thu, 19 Mar 2015 18:34:31 +0000 (UTC)
Received: by ieclw3 with SMTP id lw3so73830489iec.2
	for <linux-lvm@redhat.com>; Thu, 19 Mar 2015 11:34:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAE8gLh=ju97Ne0y=tyXej3Ugh21VBSZq2fM7HExjcpxC1wFGyA@mail.gmail.com>
References: <CAE8gLhnfE2Dd3cKXS-wJajJ6h5wnW11QprDLPrrJX0_eXJ_F3A@mail.gmail.com>
	<54743766.7020502@redhat.com>
	<CAE8gLh=yKODk+7OcyB8=X5Qp1haEYOZuzVb8g4wUdENogs7wng@mail.gmail.com>
	<5474933E.8070007@redhat.com>
	<CAE8gLh=pJLBeWSWCkDOomH-7XjBWHJjx9z4Ss2r+JBTokisUtA@mail.gmail.com>
	<CAHDsjKvsC4J++4d1kdzP0wvhTYjxVEJxyTG5Gw9ETHGPc5uGrw@mail.gmail.com>
	<CAE8gLh=ju97Ne0y=tyXej3Ugh21VBSZq2fM7HExjcpxC1wFGyA@mail.gmail.com>
Date: Thu, 19 Mar 2015 19:34:31 +0100
Message-ID: <CAE8gLhmWKur6vWEzv=NF-psPyMxHrS3S4Tgr82HD168J4c59=w@mail.gmail.com>
From: MegaBrutal <megabrutal@gmail.com>
Subject: Re: [linux-lvm] LVM VG is not activated during system boot
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Now I think I figured out what's going on. It seems to be
Debian/Ubuntu specific, but I post here, maybe Debian/Ubuntu devs are
here and see this.

Bug report:
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1396213

What actually makes the VG activation so long is that I have a
snapshot. Activating the snapshot takes very long, and bringing up the
entire VG takes about 5 minutes. This wouldn't be such a big problem,
as I could just patiently wait for the activation (with rootdelay).
But it seems something (maybe some kind of watchdog) kills vgchange
before it could finish bringing up all VGs. I had the fortune to boot
a developmental Vivid, and I've seen some 'watershed' messages stating
that 'vgchange' was killed because it was taking "too long". If we'd
let 'vgchange' to finish properly, I had the 2nd VG activated
properly, which contains my root FS.

It's a server. If it has a long boot time, so be it, it doesn't get
rebooted often anyway during normal circumstances. But it is required
to boot up without user interaction, e.g., when I issue a reboot
remotely. The main problem is that currently, user interaction is
necessary to pass initrd (as the root VG needs to be manually
activated), which means, I can only reboot the server when I'm
physically near.


2014-11-25 18:00 GMT+01:00 MegaBrutal <megabrutal@gmail.com>:
>
> No, I don't have such kernel option.
>
> But previously it was working without that. Aren't all volume groups
> supposed to auto-activate, unless I set otherwise in lvm.conf?
>
> I'll try this kernel option, however.
>
> I have a "rootdelay" set to make initrd wait longer for the boot
> device. With previous kernels, it worked, but now no matter how long I
> set this value, the VG never activates. It only activates when I
> manually activate it from the initrd prompt.
>
>
> 2014-11-25 17:15 GMT+01:00 Daniel Savard <daniel.savard@gmail.com>:
> > What are your kernel boot options? Do you specify the VGs you wish to
> > be activated at boot time there?
> >
> > I have one entry like this one for each VG: rd.lvm.vg=vgname
> > -----------------
> > Daniel Savard
> >
> >
> > 2014-11-25 10:54 GMT-05:00 MegaBrutal <megabrutal@gmail.com>:
> >> 2014-11-25 15:33 GMT+01:00 Peter Rajnoha <prajnoha@redhat.com>:
> >>> On 11/25/2014 03:19 PM, MegaBrutal wrote:
> >>>> 2014-11-25 9:01 GMT+01:00 Peter Rajnoha <prajnoha@redhat.com
> >>>> <mailto:prajnoha@redhat.com>>:
> >>>>
> >>>>     What's the exact lvm2 version used (lvm --version)?
> >>>>
> >>>>
> >>>> root@vmhost:~# lvm version
> >>>>   LVM version:     2.02.98(2) (2012-10-15)
> >>>>   Library version: 1.02.77 (2012-10-15)
> >>>>   Driver version:  4.27.0
> >>>>
> >>>>
> >>>>
> >>>>     Is lvmetad enabled in your setup? (global/use_lvmetad=1 setting
> >>>>     in lvm.conf and lvmetad daemon running?)
> >>>>
> >>>>
> >>>>     use_lvmetad = 0
> >>>>
> >>>> No such daemon is running.
> >>>
> >>> This means that LV autoactivation is not enabled in that case too
> >>> (as it depends on lvmetad to be active) and there must a direct
> >>> call for the activation (vgchange/lvchange -ay/-aay)
> >>>
> >>> However, most distributions do not use lvmetad in initrd anyway
> >>> (the only I know of at the moment is Arch Linux). As such, I think
> >>> this is a problem with distribution's initrd that is not waiting
> >>> properly for all PVs to show up and it calls LV activation prematurely.
> >>> I'd report your issue to your distribution's initrd component as each
> >>> distribution uses its own initrd scheme (I could help you with Fedora's
> >>> dracut initrd, but I don't see into Debian's/Ubuntu initrd scheme).
> >>>
> >>>>
> >>>>
> >>>>
> >>>>     Does it activate when you run vgchange -aay vmdata-vg vmhost-vg
> >>>>     directly on the busybox cmd line?
> >>>>
> >>>>
> >>>> The exact command I used to use in the BusyBox prompt is
> >>>> lvm vgchange -ay vmhost-vg
> >>>>
> >>>> Or, if I remember correctly, it activates simply by
> >>>> lvm vgchange -ay
> >>>> as well.
> >>>>
> >>>> Then I exit the BusyBox prompt, and the boot process continues correctly.
> >>>>
> >>>> My root FS is in vmhost-vg, and I have no idea why it doesn't come up
> >>>> automatically.
> >>>
> >>> Yeah, it all points to premature vgchange call in initrd's script.
> >>> Please, report this in your distribution's bug tracking system if
> >>> possible.
> >>
> >> Thanks for the advice!
> >> I opened a Launchpad report here:
> >> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1396213
