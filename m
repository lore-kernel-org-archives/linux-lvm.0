Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q232Hxn5012015
	for <linux-lvm@redhat.com>; Fri, 2 Mar 2012 21:17:59 -0500
Received: from mail-iy0-f174.google.com (mail-iy0-f174.google.com
	[209.85.210.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q232HwQ0008140
	for <linux-lvm@redhat.com>; Fri, 2 Mar 2012 21:17:58 -0500
Received: by iagz16 with SMTP id z16so4258035iag.33
	for <linux-lvm@redhat.com>; Fri, 02 Mar 2012 18:17:58 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAOzFzEj=gBXL9UaVytrebU3gr2p1rJaMVPkz1X0oZOALQKbcNA@mail.gmail.com>
References: <CAOzFzEjKapphA5NKCWbEyx4nvjWw+e_dxr+fOLr8f5j586jiyA@mail.gmail.com>
	<CAOzFzEjffLGjYhOznTo1F3moHLq+nvKYZFoy7mkU-q8RPDd9oQ@mail.gmail.com>
	<CAC7rs0vpQAaF9uNhhy2ziLa+3EB6udJVRjGwf=RVoSk0TxuDcw@mail.gmail.com>
	<CAC7rs0us5Xqag_AWq=wsFYqn3Fub3qt59a9=vDeS5cLh2oOg0Q@mail.gmail.com>
	<CAOzFzEifqyFz2G=0OEPA9BN8-kU3MabUhGmU7-jSQCxwPcHrpw@mail.gmail.com>
	<CAH+dOx+eWJKvKz=HEGHaPu8tqqz2CqVjUC1+0GJqta0GE4aYNw@mail.gmail.com>
	<CAOzFzEj=gBXL9UaVytrebU3gr2p1rJaMVPkz1X0oZOALQKbcNA@mail.gmail.com>
Date: Fri, 2 Mar 2012 18:17:58 -0800
Message-ID: <CAH+dOxKznm_mhe_TkN5eOY8tz6snyAC0TF6bsZpi4P1KtDd9kA@mail.gmail.com>
From: Kent Overstreet <koverstreet@google.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] bcache and dm targets (specifically lvm)
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
To: Joseph Glanville <joseph.glanville@orionvm.com.au>
Cc: linux-bcache@vger.kernel.org, Kent Overstreet <kent.overstreet@gmail.com>, linux-lvm@redhat.com

I found the bug. Ugh...

pvcreate refuses to use a device it doesn't recognize - look at the
lvm2 source, lib/filters/filter.c

I don't know why and I don't think I want to know. I imagine it'd work
if you commented out the offending check (line 143 in my version).

Maybe one of them can explain what's going on.

On Fri, Mar 2, 2012 at 4:48 PM, Joseph Glanville
<joseph.glanville@orionvm.com.au> wrote:
> Cheers, I will try with a full disk device sometime later today.
>
> Thanks for you help,
> Joseph.
>
> On 3 March 2012 11:01, Kent Overstreet <koverstreet@google.com> wrote:
>> Strange, I don't see anything obvious in that log. Well, shouldn't be
>> too hard to track down, I'll see if I can reproduce it.
>>
>> On Fri, Mar 2, 2012 at 2:37 PM, Joseph Glanville
>> <joseph.glanville@orionvm.com.au> wrote:
>>> Hi Kent,
>>>
>>> The block device did indeed get created in /dev and the correct
>>> pointer exists in /sys/block/bcache0/dev
>>> I straced pvcreate and attached the outout, I couldn't see anything
>>> that far out of the ordinary though - bar the return that the device
>>> had been filtered.
>>> I am using commit f4c09286dd3f761310b24bc03e5ce95793a9a30c of
>>> bcache-tools.git and commit 7c3e597ca0f5c87767548d1e9aced024aa558b2a
>>> of linux-bcache.git
>>>
>>> The other thing I noticed was that the /dev/disk-by/uuid symlink
>>> wasn't created. I went ahead and created this myself but I will
>>> investigate why the udev rule didn't do this for me.
>>>
>>> Below is relevant lines from pvscan and pvcreate:
>>>
>>> dev05 ~ # cat pvscan.log | grep bcache
>>> execve("/sbin/pvscan", ["pvscan", "/dev/bcache0"], [/* 23 vars */]) = 0
>>> read(3, "strace\0pvscan\0/dev/bcache0\0", 31) = 27
>>> readlink("/sys/class/block/bcache0",
>>> "../../devices/virtual/block/bcache0"..., 1024) = 35
>>> stat("/sys/devices/virtual/block/bcache0/uevent",
>>> {st_mode=S_IFREG|0644, st_size=4096, ...}) = 0
>>> readlink("/sys/devices/virtual/block/bcache0", 0x7fff9e17aea0, 1024) =
>>> -1 EINVAL (Invalid argument)
>>> stat("/sys/devices/virtual/block/bcache0/uevent",
>>> {st_mode=S_IFREG|0644, st_size=4096, ...}) = 0
>>> open("/sys/devices/virtual/block/bcache0/uevent", O_RDONLY|O_CLOEXEC) = 4
>>> read(4, "MAJOR=252\nMINOR=0\nDEVNAME=bcache"..., 4096) = 47
>>> readlink("/sys/devices/virtual/block/bcache0/subsystem",
>>> "../../../../class/block"..., 1024) = 23
>>> read(4, "N:bcache0\nW:40\nI:580433490\n", 4096) = 27
>>> stat("/dev/bcache0", {st_mode=S_IFBLK|0660, st_rdev=makedev(252, 0), ...}) = 0
>>> stat("/sys/class/block/bcache0/dev", {st_mode=S_IFREG|0444,
>>> st_size=4096, ...}) = 0
>>> open("/sys/class/block/bcache0/dev", O_RDONLY) = 6
>>>
>>> dev05 ~ # cat pvcreate-strace.log | grep bcache
>>> execve("/sbin/pvcreate", ["pvcreate", "/dev/bcache0"], [/* 23 vars */]) = 0
>>> read(3, "strace\0pvcreate\0/dev/bcache0\0", 31) = 29
>>> stat("/dev/bcache0", {st_mode=S_IFBLK|0660, st_rdev=makedev(252, 0), ...}) = 0
>>> readlink("/sys/dev/block/252:0",
>>> "../../devices/virtual/block/bcache0", 1024) = 35
>>> stat("/sys/devices/virtual/block/bcache0/uevent",
>>> {st_mode=S_IFREG|0644, st_size=4096, ...}) = 0
>>> stat("/sys/class/block/bcache0/dev", {st_mode=S_IFREG|0444,
>>> st_size=4096, ...}) = 0
>>> open("/sys/class/block/bcache0/dev", O_RDONLY) = 6
>>> stat("/dev/bcache0", {st_mode=S_IFBLK|0660, st_rdev=makedev(252, 0), ...}) = 0
>>> stat("/dev/bcache0", {st_mode=S_IFBLK|0660, st_rdev=makedev(252, 0), ...}) = 0
>>> stat("/sys/class/block/bcache0/dev", {st_mode=S_IFREG|0444,
>>> st_size=4096, ...}) = 0
>>> open("/sys/class/block/bcache0/dev", O_RDONLY) = 6
>>> write(2, "Device /dev/bcache0 not found (o"..., 56Device /dev/bcache0
>>> not found (or ignored by filtering).) = 56
>>>
>>> Kind regards,
>>> Joseph.
>>>
>>>
>>> On 2 March 2012 17:44, Kent Overstreet <kent.overstreet@gmail.com> wrote:
>>>> Oh - try stracing the pvcreate and see what happens.
>>>>
>>>> On Thu, Mar 1, 2012 at 10:03 PM, Kent Overstreet
>>>> <kent.overstreet@gmail.com> wrote:
>>>>> Weird.
>>>>>
>>>>> Did the /dev/bcache0 device get create created by udev?
>>>>>
>>>>> It's possible my code isn't poking the right thing. *mutters about the
>>>>> block layer...*
>>>>>
>>>>> On Thu, Mar 1, 2012 at 9:49 PM, Joseph Glanville
>>>>> <joseph.glanville@orionvm.com.au> wrote:
>>>>>> Hi,
>>>>>>
>>>>>> I can't use bcache devices as members of lvm volume groups because
>>>>>> dmsetup can't find the devices.
>>>>>> It provides the ever useful feedback of:
>>>>>> # pvcreate /dev/bcache0
>>>>>> � Device /dev/bcache0 not found (or ignored by filtering).
>>>>>>
>>>>>> My LVM.conf is only filtering out nbd devices:
>>>>>> filter = [ "r|/dev/nbd.*|", "a/.*/" ]
>>>>>>
>>>>>> Any insight would be greatly appreciated. :)
>>>>>>
>>>>>> I also noted that bcache devices don't appear in iostat..
>>>>>>
>>>>>> Joseph.
>>>>>>
>>>>>> --
>>>>>> Founder | Director | VP Research
>>>>>> Orion Virtualisation Solutions�|�www.orionvm.com.au�| Phone: 1300 56
>>>>>> 99 52 | Mobile: 0428 754 846
>>>>>>
>>>>>>
>>>>>> --
>>>>>> Founder | Director | VP Research
>>>>>> Orion Virtualisation Solutions�|�www.orionvm.com.au�| Phone: 1300 56
>>>>>> 99 52 | Mobile: 0428 754 846
>>>>>> --
>>>>>> To unsubscribe from this list: send the line "unsubscribe linux-bcache" in
>>>>>> the body of a message to majordomo@vger.kernel.org
>>>>>> More majordomo info at �http://vger.kernel.org/majordomo-info.html
>>>
>>>
>>>
>>> --
>>> Founder | Director | VP Research
>>> Orion Virtualisation Solutions�|�www.orionvm.com.au�| Phone: 1300 56
>>> 99 52 | Mobile: 0428 754 846
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe linux-bcache" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at �http://vger.kernel.org/majordomo-info.html
>
>
>
> --
> Founder | Director | VP Research
> Orion Virtualisation Solutions�|�www.orionvm.com.au�| Phone: 1300 56
> 99 52 | Mobile: 0428 754 846
