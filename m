Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AD1B74BC7
	for <linux-lvm@redhat.com>; Sat,  3 Feb 2018 09:43:29 +0000 (UTC)
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4D12085550
	for <linux-lvm@redhat.com>; Sat,  3 Feb 2018 09:43:28 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id q17so35010336lfa.9
	for <linux-lvm@redhat.com>; Sat, 03 Feb 2018 01:43:28 -0800 (PST)
MIME-Version: 1.0
From: Liwei <xieliwei@gmail.com>
Date: Sat, 3 Feb 2018 17:43:05 +0800
Message-ID: <CAPE0SYxuLG3sqoaez=CV4ZjQEcB+iqzB+CM7q6jrLg9z+L6kzQ@mail.gmail.com>
Subject: [linux-lvm] Unsync-ed LVM Mirror
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

Hi list,
    I had a LV that I was converting from linear to mirrored (not
raid1) whose source device failed partway-through during the initial
sync.

    I've since recovered the source device, but it seems like the
mirror is still acting as if some blocks are not readable? I'm getting
this in my logs, and the FS is full of errors:

[  +1.613126] device-mapper: raid1: Unable to read primary mirror
during recovery
[  +0.000278] device-mapper: raid1: Primary mirror (253:25) failed
while out-of-sync: Reads may fail.
[  +0.085916] device-mapper: raid1: Mirror read failed.
[  +0.196562] device-mapper: raid1: Mirror read failed.
[  +0.000237] Buffer I/O error on dev dm-27, logical block 5371800560,
async page read
[  +0.592135] device-mapper: raid1: Unable to read primary mirror
during recovery
[  +0.082882] device-mapper: raid1: Unable to read primary mirror
during recovery
[  +0.246945] device-mapper: raid1: Unable to read primary mirror
during recovery
[  +0.107374] device-mapper: raid1: Unable to read primary mirror
during recovery
[  +0.083344] device-mapper: raid1: Unable to read primary mirror
during recovery
[  +0.114949] device-mapper: raid1: Unable to read primary mirror
during recovery
[  +0.085056] device-mapper: raid1: Unable to read primary mirror
during recovery
[  +0.203929] device-mapper: raid1: Unable to read primary mirror
during recovery
[  +0.157953] device-mapper: raid1: Unable to read primary mirror
during recovery
[  +3.065247] recovery_complete: 23 callbacks suppressed
[  +0.000001] device-mapper: raid1: Unable to read primary mirror
during recovery
[  +0.128064] device-mapper: raid1: Unable to read primary mirror
during recovery
[  +0.103100] device-mapper: raid1: Unable to read primary mirror
during recovery
[  +0.107827] device-mapper: raid1: Unable to read primary mirror
during recovery
[  +0.140871] device-mapper: raid1: Unable to read primary mirror
during recovery
[  +0.132844] device-mapper: raid1: Unable to read primary mirror
during recovery
[  +0.124698] device-mapper: raid1: Unable to read primary mirror
during recovery
[  +0.138502] device-mapper: raid1: Unable to read primary mirror
during recovery
[  +0.117827] device-mapper: raid1: Unable to read primary mirror
during recovery
[  +0.125705] device-mapper: raid1: Unable to read primary mirror
during recovery
[Feb 3 17:09] device-mapper: raid1: Mirror read failed.
[  +0.167553] device-mapper: raid1: Mirror read failed.
[  +0.000268] Buffer I/O error on dev dm-27, logical block 5367765816,
async page read
[  +0.135138] device-mapper: raid1: Mirror read failed.
[  +0.000238] Buffer I/O error on dev dm-27, logical block 5367765816,
async page read
[  +0.000365] device-mapper: raid1: Mirror read failed.
[  +0.000315] device-mapper: raid1: Mirror read failed.
[  +0.000213] Buffer I/O error on dev dm-27, logical block 5367896888,
async page read
[  +0.000276] device-mapper: raid1: Mirror read failed.
[  +0.000199] Buffer I/O error on dev dm-27, logical block 5367765816,
async page read

    However, if I take down the destination device and restart the LV
with --activateoption partial, I can read my data and everything
checks out.

    My theory (and what I observed) is that lvm continued the initial
sync even after the source drive stopped responding, and has now
mapped the blocks that it 'synced' as dead. How can I make lvm retry
those blocks again?

    In fact, I don't trust the mirror anymore, is there a way I can
conduct a scrub of the mirror after the initial sync is done? I read
about --syncaction check, but seems like it only notes the number of
inconsistencies. Can I have lvm re-mirror the inconsistencies from the
source to destination device? I trust the source device because we ran
a btrfs scrub on it and it reported that all checksums are valid.

    It took months for the mirror sync to get to this stage (actually,
why does it take months to mirror 20TB?), I don't want to start it all
over again.

Warm regards,
Liwei
