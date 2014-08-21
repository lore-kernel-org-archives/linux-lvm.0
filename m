Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s7LGwKAB003063
	for <linux-lvm@redhat.com>; Thu, 21 Aug 2014 12:58:21 -0400
Received: from mail-yh0-f48.google.com (mail-yh0-f48.google.com
	[209.85.213.48])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s7LGwBGV005166
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Thu, 21 Aug 2014 12:58:12 -0400
Received: by mail-yh0-f48.google.com with SMTP id i57so8244930yha.7
	for <linux-lvm@redhat.com>; Thu, 21 Aug 2014 09:58:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <15785B7E063D464C86DD482FCAE4EBA501AA8A21A0F3@XCH11.scidom.de>
References: <15785B7E063D464C86DD482FCAE4EBA501AA8A21A0F1@XCH11.scidom.de>
	<20140820155010.GC23914@agk-dp.fab.redhat.com>
	<15785B7E063D464C86DD482FCAE4EBA501AA8A21A0F3@XCH11.scidom.de>
From: Roger Heflin <rogerheflin@gmail.com>
Date: Thu, 21 Aug 2014 11:57:51 -0500
Message-ID: <CAAMCDeeuinHwSho0GbZHpChKv9Z1M=TkO2FbwccUyEv_30EnqA@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] problem with lvcreate and redirection of
	stdout/stderr
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
To: LVM general discussion and development <linux-lvm@redhat.com>

stderr flushes on each write of an line to attempt to not lose data.

I can see how with the vg suspended that might have a problem.
Everything will stop waiting for the stderr flush to complete, ie the
print statement doing the output to standard error will never return
and then execute the next command to continue on with the vg work.

I would suggest sending the output data to another device (maybe a
tmpfs device) then when done copy it back.

On Wed, Aug 20, 2014 at 12:20 PM, Lentes, Bernd
<bernd.lentes@helmholtz-muenchen.de> wrote:
> Alasdair wrote:
>
>>
>> On Wed, Aug 20, 2014 at 05:27:52PM +0200, Lentes, Bernd wrote:
>> > lvcreate -v -L 45G -n lv_root_snapshot -s vg1/lv_root >>
>> > /var/log/update.log 2>&1
>>
>> > lvcreate    Suspending vg1-lv_root (252:0) with filesystem sync with device
>> flush
>>
>> /var/log is presumably part of a filesystem on the same LV that is getting its
>> I/O paused for a brief moment while the snapshot is taken.
>>
>
> Yes it is. I have just one lv for the whole directory / .
>
>> 1) Run lvm dumpconfig log/activation  to double-check this is not set to 1.
>
> log {
>         verbose=2
>         syslog=0
>         file="/var/log/lvm2.log"
>         overwrite=0
>         level=5
>         indent=1
>         command_names=1
>         prefix="  "
> }
>
> activation {
>         missing_stripe_filler="/dev/ioerror"
>         reserved_stack=256
>         reserved_memory=8192
>         process_priority=-18
>         mirror_region_size=512
>         readahead="auto"
>         monitoring=1
>         mirror_log_fault_policy="allocate"
>         mirror_device_fault_policy="remove"
>         thin_pool_autoextend_threshold=100
>         thin_pool_autoextend_percent=20
>         udev_rules=1
>         udev_sync=1
> }
>
>
>>
>> 2) What filesystem is this and precisely what kernel?  (cat /proc/mounts)
>
> FS is ext3, kernel is 3.0.76-0.11-default
>
> vm58820-6:~ # cat /proc/mounts
> rootfs / rootfs rw 0 0
> udev /dev tmpfs rw,relatime,nr_inodes=0,mode=755 0 0
> tmpfs /dev/shm tmpfs rw,relatime 0 0
> /dev/mapper/vg1-lv_root / ext3 rw,relatime,errors=continue,user_xattr,acl,barrier=1,data=ordered 0 0
> proc /proc proc rw,relatime 0 0
> sysfs /sys sysfs rw,relatime 0 0
> devpts /dev/pts devpts rw,relatime,gid=5,mode=620,ptmxmode=000 0 0
> debugfs /sys/kernel/debug debugfs rw,relatime 0 0
> /dev/vda3 /boot ext3 rw,relatime,errors=continue,user_xattr,acl,barrier=1,data=ordered 0 0
> fusectl /sys/fs/fuse/connections fusectl rw,relatime 0 0
> securityfs /sys/kernel/security securityfs rw,relatime 0 0
> none /var/lib/ntp/proc proc ro,nosuid,nodev,relatime 0 0
>
>
>>
>> 3) Try to obtain a stack trace at the point where this locks up e.g.
>> echo t > /proc/sysrq-trigger followed by dmesg (or divert your logging of
>> kernel messages to a different filesystem outside the snapshot).
>>
>> Alasdair
>
> the stack trace you find here (~190KB):  http://www.filedropper.com/stacktracevm58820-6lvcreate
>
> Strange thing is that it worked now once without system stop. But second time stop again.
>
>
> Thanks for your help.
>
>
>
> Bernd
>
> Helmholtz Zentrum M�nchen
> Deutsches Forschungszentrum f�r Gesundheit und Umwelt (GmbH)
> Ingolst�dter Landstr. 1
> 85764 Neuherberg
> www.helmholtz-muenchen.de
> Aufsichtsratsvorsitzende: MinDir�in B�rbel Brumme-Bothe
> Gesch�ftsf�hrer: Prof. Dr. G�nther Wess, Dr. Nikolaus Blum, Dr. Alfons Enhsen
> Registergericht: Amtsgericht M�nchen HRB 6466
> USt-IdNr: DE 129521671
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
