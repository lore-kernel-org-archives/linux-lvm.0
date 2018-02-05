Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CF6619163
	for <linux-lvm@redhat.com>; Mon,  5 Feb 2018 03:22:13 +0000 (UTC)
Received: from mail-lf0-f45.google.com (mail-lf0-f45.google.com
	[209.85.215.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C059481DEE
	for <linux-lvm@redhat.com>; Mon,  5 Feb 2018 03:22:12 +0000 (UTC)
Received: by mail-lf0-f45.google.com with SMTP id t139so39709916lff.0
	for <linux-lvm@redhat.com>; Sun, 04 Feb 2018 19:22:12 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAPE0SYxuLG3sqoaez=CV4ZjQEcB+iqzB+CM7q6jrLg9z+L6kzQ@mail.gmail.com>
References: <CAPE0SYxuLG3sqoaez=CV4ZjQEcB+iqzB+CM7q6jrLg9z+L6kzQ@mail.gmail.com>
From: Liwei <xieliwei@gmail.com>
Date: Mon, 5 Feb 2018 11:21:49 +0800
Message-ID: <CAPE0SYzaQBe1YH2QoOMB=1CxEvqnUPP3e99z0djdrYzAvmE7jA@mail.gmail.com>
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
To: linux-lvm@redhat.com

On 3 February 2018 at 17:43, Liwei <xieliwei@gmail.com> wrote:
> Hi list,
>     I had a LV that I was converting from linear to mirrored (not
> raid1) whose source device failed partway-through during the initial
> sync.
>
>     I've since recovered the source device, but it seems like the
> mirror is still acting as if some blocks are not readable? I'm getting
> this in my logs, and the FS is full of errors:
>
> [  +1.613126] device-mapper: raid1: Unable to read primary mirror
> during recovery
> [  +0.000278] device-mapper: raid1: Primary mirror (253:25) failed
> while out-of-sync: Reads may fail.
> [  +0.085916] device-mapper: raid1: Mirror read failed.
> [  +0.196562] device-mapper: raid1: Mirror read failed.
> [  +0.000237] Buffer I/O error on dev dm-27, logical block 5371800560,
> async page read
> [  +0.592135] device-mapper: raid1: Unable to read primary mirror
> during recovery
> [  +0.082882] device-mapper: raid1: Unable to read primary mirror
> during recovery
> [  +0.246945] device-mapper: raid1: Unable to read primary mirror
> during recovery
> [  +0.107374] device-mapper: raid1: Unable to read primary mirror
> during recovery
> [  +0.083344] device-mapper: raid1: Unable to read primary mirror
> during recovery
> [  +0.114949] device-mapper: raid1: Unable to read primary mirror
> during recovery
> [  +0.085056] device-mapper: raid1: Unable to read primary mirror
> during recovery
> [  +0.203929] device-mapper: raid1: Unable to read primary mirror
> during recovery
> [  +0.157953] device-mapper: raid1: Unable to read primary mirror
> during recovery
> [  +3.065247] recovery_complete: 23 callbacks suppressed
> [  +0.000001] device-mapper: raid1: Unable to read primary mirror
> during recovery
> [  +0.128064] device-mapper: raid1: Unable to read primary mirror
> during recovery
> [  +0.103100] device-mapper: raid1: Unable to read primary mirror
> during recovery
> [  +0.107827] device-mapper: raid1: Unable to read primary mirror
> during recovery
> [  +0.140871] device-mapper: raid1: Unable to read primary mirror
> during recovery
> [  +0.132844] device-mapper: raid1: Unable to read primary mirror
> during recovery
> [  +0.124698] device-mapper: raid1: Unable to read primary mirror
> during recovery
> [  +0.138502] device-mapper: raid1: Unable to read primary mirror
> during recovery
> [  +0.117827] device-mapper: raid1: Unable to read primary mirror
> during recovery
> [  +0.125705] device-mapper: raid1: Unable to read primary mirror
> during recovery
> [Feb 3 17:09] device-mapper: raid1: Mirror read failed.
> [  +0.167553] device-mapper: raid1: Mirror read failed.
> [  +0.000268] Buffer I/O error on dev dm-27, logical block 5367765816,
> async page read
> [  +0.135138] device-mapper: raid1: Mirror read failed.
> [  +0.000238] Buffer I/O error on dev dm-27, logical block 5367765816,
> async page read
> [  +0.000365] device-mapper: raid1: Mirror read failed.
> [  +0.000315] device-mapper: raid1: Mirror read failed.
> [  +0.000213] Buffer I/O error on dev dm-27, logical block 5367896888,
> async page read
> [  +0.000276] device-mapper: raid1: Mirror read failed.
> [  +0.000199] Buffer I/O error on dev dm-27, logical block 5367765816,
> async page read
>
>     However, if I take down the destination device and restart the LV
> with --activateoption partial, I can read my data and everything
> checks out.
>
>     My theory (and what I observed) is that lvm continued the initial
> sync even after the source drive stopped responding, and has now
> mapped the blocks that it 'synced' as dead. How can I make lvm retry
> those blocks again?
>
>     In fact, I don't trust the mirror anymore, is there a way I can
> conduct a scrub of the mirror after the initial sync is done? I read
> about --syncaction check, but seems like it only notes the number of
> inconsistencies. Can I have lvm re-mirror the inconsistencies from the
> source to destination device? I trust the source device because we ran
> a btrfs scrub on it and it reported that all checksums are valid.
>
>     It took months for the mirror sync to get to this stage (actually,
> why does it take months to mirror 20TB?), I don't want to start it all
> over again.
>
> Warm regards,
> Liwei

Okay, the sync managed to reach 99.99%, and now there's no drive
activity, it is just stuck there. What should I do? Theoretically, if
I can take a look at the contents of mlog and manipulate it, I can
manually do a sync of the failed segments, and remove lvm's opinion of
them being missing.

I'm looking through the lvm2 source for the format but if someone can
point out the way (or a better way), I'll be very appreciative!

Also, is there a way I can access the mlog and mimage* subvolumes directly?

Warm regards,
Liwei
