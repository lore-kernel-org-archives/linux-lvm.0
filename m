Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DAFDF5D732
	for <linux-lvm@redhat.com>; Tue,  5 Mar 2019 16:59:53 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8CE7430842AB
	for <linux-lvm@redhat.com>; Tue,  5 Mar 2019 16:59:52 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id j125so3306772wmj.1
	for <linux-lvm@redhat.com>; Tue, 05 Mar 2019 08:59:52 -0800 (PST)
Received: from [10.30.72.133] ([185.156.175.59])
	by smtp.gmail.com with ESMTPSA id j15sm9572542wrt.1.2019.03.05.08.59.50
	for <linux-lvm@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Mar 2019 08:59:50 -0800 (PST)
References: <2b82b876-1fea-5eb4-e37f-bc8bd3262a83@gmail.com>
	<CAJCQCtQVsWfh0bpHvL2osC0iADhShm3pRc-tJDVCJdHe9xGUsg@mail.gmail.com>
From: kurcze <wannabeachicken@gmail.com>
Message-ID: <c56d0f32-0058-5539-2f46-5c5cefcdb2d0@gmail.com>
Date: Tue, 5 Mar 2019 17:59:49 +0100
MIME-Version: 1.0
In-Reply-To: <CAJCQCtQVsWfh0bpHvL2osC0iADhShm3pRc-tJDVCJdHe9xGUsg@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Subject: Re: [linux-lvm] LVM thin provisioning on encrypted root unreliable
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-lvm@redhat.com

Hello again,

thank you a lot for your answer. It brought me to the solution.

> I'd start with
> rd.udev.debug
>
> There's a nearly 1 minute delay with at least ata6.0, a.k.a. /dev/sdc
> I can't imagine what device is taking that long to be discovered. The
> transient nature makes it sound like a race could be happening. So the
> gotcha with debug options is that this can affect the race condition.
> Other options for debugging:
>
> rd.debug will show dracut/initrd debug messages
> systemd.log_level=debug will show systemd debug messages

After your suggestion I focused on udev (also turned on udev debugging). 
After that I got messages similar to this in dmesg (for various block 
devices):

[   26.374699] systemd-udevd[150]: Process '/sbin/lvm pvscan --cache 
--activate ay --major 259 --minor 2' failed with exit code 5.

Then I checked /lib/udev/rules.d/69-lvm-metad.rules and found a rule 
with this line:

RUN+="/sbin/lvm pvscan --cache --activate ay --major $major --minor 
$minor", ENV{LVM_SCANNED}="1"

So udev have already tried to automatically activate LVs. LVM scripts 
from initramfs try to do that later anyway, so I changed it to:

RUN+="/sbin/lvm pvscan --cache --major $major --minor $minor", 
ENV{LVM_SCANNED}="1"

It solved the problem.

Why can't udev cope with LV activation is not quite clear to me. Maybe 
this Call Trace would be of use if somebody wants to look at it:

[  182.362588] systemd-udevd[122]: worker [144] terminated by signal 9 
(KILL)
[  242.841504] INFO: task lvm:265 blocked for more than 120 seconds.
[  242.841573]       Not tainted 4.19.0-0.bpo.1-amd64 #1 Debian 
4.19.12-1~bpo9+1
[  242.841639] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" 
disables this message.
[  242.841714] lvm             D    0   265      1 0x00000000
[  242.841781] Call Trace:
[  242.841852]  ? __schedule+0x3f5/0x880
[  242.841918]  ? wait_for_completion+0x140/0x190
[  242.841984]  schedule+0x32/0x80
[  242.842049]  schedule_preempt_disabled+0xa/0x10
[  242.842116]  __mutex_lock.isra.4+0x296/0x4c0
[  242.842194]  ? table_load+0x370/0x370 [dm_mod]
[  242.842265]  ? dm_suspend+0x1f/0xc0 [dm_mod]
[  242.842335]  dm_suspend+0x1f/0xc0 [dm_mod]
[  242.842406]  dev_suspend+0x186/0x220 [dm_mod]
[  242.842478]  ctl_ioctl+0x1b5/0x4b0 [dm_mod]
[  242.842552]  dm_ctl_ioctl+0xa/0x10 [dm_mod]
[  242.842617]  do_vfs_ioctl+0xa2/0x640
[  242.842685]  ? vfs_write+0x144/0x190
[  242.842749]  ksys_ioctl+0x70/0x80
[  242.842813]  __x64_sys_ioctl+0x16/0x20
[  242.842878]  do_syscall_64+0x55/0x110
[  242.842943]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  242.843008] RIP: 0033:0x7f671fc93dd7
[  242.843075] Code: Bad RIP value.
[  242.843137] RSP: 002b:00007fffc07ba778 EFLAGS: 00000246 ORIG_RAX: 
0000000000000010
[  242.843214] RAX: ffffffffffffffda RBX: 00005600a8beb190 RCX: 
00007f671fc93dd7
[  242.843279] RDX: 00005600a8beb190 RSI: 00000000c138fd06 RDI: 
0000000000000008
[  242.843345] RBP: 000000000000000c R08: 00007f67203e1648 R09: 
00007fffc07ba5e0
[  242.843410] R10: 00007f67203dc413 R11: 0000000000000246 R12: 
00005600a8beb1c0
[  242.843476] R13: 00007f67203e0b53 R14: 00005600a8bf6540 R15: 
0000000000000000


> This has no rd.luks or rd.lvm hints for dracut to do early activation.
> I can't tell off hand what the layout is, if you've encrypted
> partitions on each drive, and then the dmcrypt devices are made PV's;
> or if the partitions are PV's, and you encrypt each LV separately?
> Either method is valid but will make a difference in how it gets
> assembled and therefore why and where it's failing. And anyway it
> seems like that command line needs the proper hints, but I'm not
> convinced that's the central problem because there's this huge 60
> second gap in the dmesg where udevd is waiting for a drive apparently
> to even appear and that's pretty strange.
>
> So maybe the problem there is that gap is when you're entering in the
> LUKS passphrase. So maybe the problem is that you enter that in, and
> dracut is only passing the passphrase to one or two devices, and the
> third device isn't there yet, so it never gets unlocked (?) and that's
> why volume assembly fails is because one device is just coming up a
> bit too slow.
>
> In that case you might need a delay somewhere to improve the chance
> the slow device is discovered. But that's speculation. Really we just
> need more information on the storage stack, like a partition by
> partition summary. If you get a successful boot, a sorted blkid (it
> comes out unsorted by default) would be useful. And also if you can
> figure out which drive is taking a long time to be discovered? It
> wouldn't happen to be an drive in a USB enclosure would it?
>
>

Actually I used initramfs-tools (standard on Debian) to generate initrd 
image. Entering of a passphrase happens after LMV activates the devices 
(and it hanged before that). The layout is:

Normal 83 Type Partitions are PVs

These PVs are pooled to VGs

LVs are made of these VGs

LVs are LUKS encrypted

LUKS devices are ext4 formatted


Anayway. Thanks. Would be interesting to know what causes the problem. 
Is it a bug of some kind?


Best regards


kurcze
