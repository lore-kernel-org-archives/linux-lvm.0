Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sAPH0CBg027770
	for <linux-lvm@redhat.com>; Tue, 25 Nov 2014 12:00:12 -0500
Received: from mail-vc0-f171.google.com (mail-vc0-f171.google.com
	[209.85.220.171])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sAPH07NM026312
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Tue, 25 Nov 2014 12:00:08 -0500
Received: by mail-vc0-f171.google.com with SMTP id hy4so465672vcb.2
	for <linux-lvm@redhat.com>; Tue, 25 Nov 2014 09:00:06 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHDsjKvsC4J++4d1kdzP0wvhTYjxVEJxyTG5Gw9ETHGPc5uGrw@mail.gmail.com>
References: <CAE8gLhnfE2Dd3cKXS-wJajJ6h5wnW11QprDLPrrJX0_eXJ_F3A@mail.gmail.com>
	<54743766.7020502@redhat.com>
	<CAE8gLh=yKODk+7OcyB8=X5Qp1haEYOZuzVb8g4wUdENogs7wng@mail.gmail.com>
	<5474933E.8070007@redhat.com>
	<CAE8gLh=pJLBeWSWCkDOomH-7XjBWHJjx9z4Ss2r+JBTokisUtA@mail.gmail.com>
	<CAHDsjKvsC4J++4d1kdzP0wvhTYjxVEJxyTG5Gw9ETHGPc5uGrw@mail.gmail.com>
Date: Tue, 25 Nov 2014 18:00:06 +0100
Message-ID: <CAE8gLh=ju97Ne0y=tyXej3Ugh21VBSZq2fM7HExjcpxC1wFGyA@mail.gmail.com>
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

No, I don't have such kernel option.

But previously it was working without that. Aren't all volume groups
supposed to auto-activate, unless I set otherwise in lvm.conf?

I'll try this kernel option, however.

I have a "rootdelay" set to make initrd wait longer for the boot
device. With previous kernels, it worked, but now no matter how long I
set this value, the VG never activates. It only activates when I
manually activate it from the initrd prompt.


2014-11-25 17:15 GMT+01:00 Daniel Savard <daniel.savard@gmail.com>:
> What are your kernel boot options? Do you specify the VGs you wish to
> be activated at boot time there?
>
> I have one entry like this one for each VG: rd.lvm.vg=vgname
> -----------------
> Daniel Savard
>
>
> 2014-11-25 10:54 GMT-05:00 MegaBrutal <megabrutal@gmail.com>:
>> 2014-11-25 15:33 GMT+01:00 Peter Rajnoha <prajnoha@redhat.com>:
>>> On 11/25/2014 03:19 PM, MegaBrutal wrote:
>>>> 2014-11-25 9:01 GMT+01:00 Peter Rajnoha <prajnoha@redhat.com
>>>> <mailto:prajnoha@redhat.com>>:
>>>>
>>>>     What's the exact lvm2 version used (lvm --version)?
>>>>
>>>>
>>>> root@vmhost:~# lvm version
>>>>   LVM version:     2.02.98(2) (2012-10-15)
>>>>   Library version: 1.02.77 (2012-10-15)
>>>>   Driver version:  4.27.0
>>>>
>>>>
>>>>
>>>>     Is lvmetad enabled in your setup? (global/use_lvmetad=1 setting
>>>>     in lvm.conf and lvmetad daemon running?)
>>>>
>>>>
>>>>     use_lvmetad = 0
>>>>
>>>> No such daemon is running.
>>>
>>> This means that LV autoactivation is not enabled in that case too
>>> (as it depends on lvmetad to be active) and there must a direct
>>> call for the activation (vgchange/lvchange -ay/-aay)
>>>
>>> However, most distributions do not use lvmetad in initrd anyway
>>> (the only I know of at the moment is Arch Linux). As such, I think
>>> this is a problem with distribution's initrd that is not waiting
>>> properly for all PVs to show up and it calls LV activation prematurely.
>>> I'd report your issue to your distribution's initrd component as each
>>> distribution uses its own initrd scheme (I could help you with Fedora's
>>> dracut initrd, but I don't see into Debian's/Ubuntu initrd scheme).
>>>
>>>>
>>>>
>>>>
>>>>     Does it activate when you run vgchange -aay vmdata-vg vmhost-vg
>>>>     directly on the busybox cmd line?
>>>>
>>>>
>>>> The exact command I used to use in the BusyBox prompt is
>>>> lvm vgchange -ay vmhost-vg
>>>>
>>>> Or, if I remember correctly, it activates simply by
>>>> lvm vgchange -ay
>>>> as well.
>>>>
>>>> Then I exit the BusyBox prompt, and the boot process continues correctly.
>>>>
>>>> My root FS is in vmhost-vg, and I have no idea why it doesn't come up
>>>> automatically.
>>>
>>> Yeah, it all points to premature vgchange call in initrd's script.
>>> Please, report this in your distribution's bug tracking system if
>>> possible.
>>
>> Thanks for the advice!
>> I opened a Launchpad report here:
>> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1396213
