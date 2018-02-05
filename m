Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C447E177CB
	for <linux-lvm@redhat.com>; Mon,  5 Feb 2018 09:26:33 +0000 (UTC)
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 33DCCC047B97
	for <linux-lvm@redhat.com>; Mon,  5 Feb 2018 09:26:31 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id x196so40678020lfd.12
	for <linux-lvm@redhat.com>; Mon, 05 Feb 2018 01:26:31 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1db28575-56ee-ca18-0261-760adc8742ce@suse.com>
References: <CAPE0SYxuLG3sqoaez=CV4ZjQEcB+iqzB+CM7q6jrLg9z+L6kzQ@mail.gmail.com>
	<38d3b050-7cc7-66cb-5579-5513a5d7b37e@suse.com>
	<CAPE0SYxR2NtM_vdrqSMBsy==YT2MF8we_Q+HJ9Upeb6an2PLpQ@mail.gmail.com>
	<1db28575-56ee-ca18-0261-760adc8742ce@suse.com>
From: Liwei <xieliwei@gmail.com>
Date: Mon, 5 Feb 2018 17:26:08 +0800
Message-ID: <CAPE0SYyQJPoFHAha82L3wK39wKKFOs0pUKt7m6UGMdrUyw-+UQ@mail.gmail.com>
Subject: Re: [linux-lvm] Unsync-ed LVM Mirror
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
To: Eric Ren <zren@suse.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

This is a long story. Precisely, I hit that bug (?), due to one half
of the mirror (the source) encountering bad sectors. So I was forced
to upgrade the kernel in order to salvage the situation (the bug was
so persistent, I could not get to a shell even in single-user mode -
had to boot a version of Ubuntu with the patch applied, chroot and
install the update).

I'm not versed enough with the inner workings of LVM to understand the
differences with what was accepted upstream and the 2 patches you
worked on (what is a bio?), so it didn't occur to me that I'd meet
with problems down the road.

I was using mirror because I was following this guide (which in
retrospect, was seriously outdated),
https://utcc.utoronto.ca/~cks/space/blog/linux/LVMCautiousMigration ,
and some reading made me think that it was not possible to cleanly
undo a mirror by raid1.

A little background: We were trying to (safely?) migrate our VG from
an antiquated 13x2TB raid6 array to a shiny new 6x6TB array while
minimizing downtime. So the plan was to turn on mirroring, wait for it
to sync, then split the mirror. Of course as with all poorly-planned
plans go, 2 of the source drives dropped out and a third drive
developed bad sectors, all within a few days. And here I am with this
problem.

Anyways, I'm still not sure what's happening, but is there an easy (in
terms of, do-not-need-to-resync-everything) way to proceed?

Warm regards,
Liwei




On 5 February 2018 at 16:43, Eric Ren <zren@suse.com> wrote:
> Months ago,   I worked on a NULL pointer deference crash on dm mirror
> target. I worked out two patches
> to fix the crash issue, but when I was submitting them, I found that
> upstream had "fixed" the crash by
> reverting, you can find the discussion here:
>
>    - https://patchwork.kernel.org/patch/9808897/
>
>
> Zdenek did through out his doubt, but no body gave response:
> """
>
>>> Which kernel version is this ?
>>>
>>> I'd thought we've already fixed this BZ for old mirrors:
>>> https://bugzilla.redhat.com/show_bug.cgi?id=1382382
>>>
>>> There similar BZ for md-raid based mirrors (--type raid1)
>>> https://bugzilla.redhat.com/show_bug.cgi?id=1416099
>> My base kernel version is 4.4.68, but with this 2 latest fixes applied:
>>
>> """
>> Revert "dm mirror: use all available legs on multiple failures"
>
> Ohh  - I've -rc6 - while this  'revert' patch went to 4.12-rc7.
>
> I'm now starting to wonder why?
>
> It's been a real fix for a real issue - and 'revert' message states
> there is no such problem ??
>
> I'm confused....
>
> Mike  - have you tried the sequence from BZ  ?
>
> Zdenek
>
> """
>
> I wrongly accepted the facts:
>
> 1. the crash issue do disappear;
> 2.  the "reverting" fixing way is likely wrong, but I did follow up it
> further because
> people now mainly uses raid1 instead of mirror  - my fault to think that
> way.
>
> But, I was just feeling it's hard to persuade the maintainer to revert the
> "reverting fixes"
> and try my fix.
>
> Anyway, why are you using mirror? why not raid1?
>
> Eric
>
>
>
> On 02/05/2018 03:42 PM, Liwei wrote:
>
> Hi Eric,
>     Thanks for answering! Here are the details:
>
> # lvm version
>   LVM version:     2.02.176(2) (2017-11-03)
>   Library version: 1.02.145 (2017-11-03)
>   Driver version:  4.37.0
>   Configuration:   ./configure --build=x86_64-linux-gnu --prefix=/usr
> --includedir=${prefix}/include --mandir=${prefix}/share/man
> --infodir=${prefix}/share/info --sysconfdir=/etc --localstatedir=/var
> --disable-silent-rules --libdir=${prefix}/lib/x86_64-linux-gnu
> --libexecdir=${prefix}/lib/x86_64-linux-gnu --runstatedir=/run
> --disable-maintainer-mode --disable-dependency-tracking --exec-prefix=
> --bindir=/bin --libdir=/lib/x86_64-linux-gnu --sbindir=/sbin
> --with-usrlibdir=/usr/lib/x86_64-linux-gnu --with-optimisation=-O2
> --with-cache=internal --with-clvmd=corosync --with-cluster=internal
> --with-device-uid=0 --with-device-gid=6 --with-device-mode=0660
> --with-default-pid-dir=/run --with-default-run-dir=/run/lvm
> --with-default-locking-dir=/run/lock/lvm --with-thin=internal
> --with-thin-check=/usr/sbin/thin_check --with-thin-dump=/usr/sbin/thin_dump
> --with-thin-repair=/usr/sbin/thin_repair --enable-applib
> --enable-blkid_wiping --enable-cmdlib --enable-cmirrord --enable-dmeventd
> --enable-dbus-service --enable-lvmetad --enable-lvmlockd-dlm
> --enable-lvmlockd-sanlock --enable-lvmpolld --enable-notify-dbus
> --enable-pkgconfig --enable-readline --enable-udev_rules --enable-udev_sync
>
> # uname -a
> Linux dataserv 4.14.0-3-amd64 #1 SMP Debian 4.14.13-1 (2018-01-14) x86_64
> GNU/Linux
>
> Warm regards,
> Liwei
>
> On 5 Feb 2018 15:27, "Eric Ren" <zren@suse.com> wrote:
>>
>> Hi,
>>
>> Your LVM version and kernel version please?
>>
>> like:
>> """"
>> # lvm version
>>   LVM version:     2.02.177(2) (2017-12-18)
>>   Library version: 1.03.01 (2017-12-18)
>>   Driver version:  4.35.0
>>
>> # uname -a
>> Linux sle15-c1-n1 4.12.14-9.1-default #1 SMP Fri Jan 19 09:13:51 UTC 2018
>> (849a2fe) x86_64 x86_64 x86_64 GNU/Linux
>> """
>>
>> Eric
>>
>> On 02/03/2018 05:43 PM, Liwei wrote:
>>>
>>> Hi list,
>>>      I had a LV that I was converting from linear to mirrored (not
>>> raid1) whose source device failed partway-through during the initial
>>> sync.
>>>
>>>      I've since recovered the source device, but it seems like the
>>> mirror is still acting as if some blocks are not readable? I'm getting
>>> this in my logs, and the FS is full of errors:
>>>
>>> [  +1.613126] device-mapper: raid1: Unable to read primary mirror
>>> during recovery
>>> [  +0.000278] device-mapper: raid1: Primary mirror (253:25) failed
>>> while out-of-sync: Reads may fail.
>>> [  +0.085916] device-mapper: raid1: Mirror read failed.
>>> [  +0.196562] device-mapper: raid1: Mirror read failed.
>>> [  +0.000237] Buffer I/O error on dev dm-27, logical block 5371800560,
>>> async page read
>>> [  +0.592135] device-mapper: raid1: Unable to read primary mirror
>>> during recovery
>>> [  +0.082882] device-mapper: raid1: Unable to read primary mirror
>>> during recovery
>>> [  +0.246945] device-mapper: raid1: Unable to read primary mirror
>>> during recovery
>>> [  +0.107374] device-mapper: raid1: Unable to read primary mirror
>>> during recovery
>>> [  +0.083344] device-mapper: raid1: Unable to read primary mirror
>>> during recovery
>>> [  +0.114949] device-mapper: raid1: Unable to read primary mirror
>>> during recovery
>>> [  +0.085056] device-mapper: raid1: Unable to read primary mirror
>>> during recovery
>>> [  +0.203929] device-mapper: raid1: Unable to read primary mirror
>>> during recovery
>>> [  +0.157953] device-mapper: raid1: Unable to read primary mirror
>>> during recovery
>>> [  +3.065247] recovery_complete: 23 callbacks suppressed
>>> [  +0.000001] device-mapper: raid1: Unable to read primary mirror
>>> during recovery
>>> [  +0.128064] device-mapper: raid1: Unable to read primary mirror
>>> during recovery
>>> [  +0.103100] device-mapper: raid1: Unable to read primary mirror
>>> during recovery
>>> [  +0.107827] device-mapper: raid1: Unable to read primary mirror
>>> during recovery
>>> [  +0.140871] device-mapper: raid1: Unable to read primary mirror
>>> during recovery
>>> [  +0.132844] device-mapper: raid1: Unable to read primary mirror
>>> during recovery
>>> [  +0.124698] device-mapper: raid1: Unable to read primary mirror
>>> during recovery
>>> [  +0.138502] device-mapper: raid1: Unable to read primary mirror
>>> during recovery
>>> [  +0.117827] device-mapper: raid1: Unable to read primary mirror
>>> during recovery
>>> [  +0.125705] device-mapper: raid1: Unable to read primary mirror
>>> during recovery
>>> [Feb 3 17:09] device-mapper: raid1: Mirror read failed.
>>> [  +0.167553] device-mapper: raid1: Mirror read failed.
>>> [  +0.000268] Buffer I/O error on dev dm-27, logical block 5367765816,
>>> async page read
>>> [  +0.135138] device-mapper: raid1: Mirror read failed.
>>> [  +0.000238] Buffer I/O error on dev dm-27, logical block 5367765816,
>>> async page read
>>> [  +0.000365] device-mapper: raid1: Mirror read failed.
>>> [  +0.000315] device-mapper: raid1: Mirror read failed.
>>> [  +0.000213] Buffer I/O error on dev dm-27, logical block 5367896888,
>>> async page read
>>> [  +0.000276] device-mapper: raid1: Mirror read failed.
>>> [  +0.000199] Buffer I/O error on dev dm-27, logical block 5367765816,
>>> async page read
>>>
>>>      However, if I take down the destination device and restart the LV
>>> with --activateoption partial, I can read my data and everything
>>> checks out.
>>>
>>>      My theory (and what I observed) is that lvm continued the initial
>>> sync even after the source drive stopped responding, and has now
>>> mapped the blocks that it 'synced' as dead. How can I make lvm retry
>>> those blocks again?
>>>
>>>      In fact, I don't trust the mirror anymore, is there a way I can
>>> conduct a scrub of the mirror after the initial sync is done? I read
>>> about --syncaction check, but seems like it only notes the number of
>>> inconsistencies. Can I have lvm re-mirror the inconsistencies from the
>>> source to destination device? I trust the source device because we ran
>>> a btrfs scrub on it and it reported that all checksums are valid.
>>>
>>>      It took months for the mirror sync to get to this stage (actually,
>>> why does it take months to mirror 20TB?), I don't want to start it all
>>> over again.
>>>
>>> Warm regards,
>>> Liwei
>>>
>>> _______________________________________________
>>> linux-lvm mailing list
>>> linux-lvm@redhat.com
>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>>
>>
>
