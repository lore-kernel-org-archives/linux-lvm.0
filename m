Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8UGN95Q016122
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 30 Sep 2016 12:23:09 -0400
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8E0167EA99
	for <linux-lvm@redhat.com>; Fri, 30 Sep 2016 16:23:08 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id n189so38285781qke.0
	for <linux-lvm@redhat.com>; Fri, 30 Sep 2016 09:23:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAE-HYsNPzk7QWZ0Uf5HTXyvfMFh2tCZ4pJUbshscptLu=D5ZWQ@mail.gmail.com>
References: <CAE-HYsPY0yWvQKYwbm74+pVp2+rr9zard+myAPXzUi+TZ4w1qw@mail.gmail.com>
	<CAE-HYsOLGU-ZxahjYApMhnLiKnvXu=6ekFLiyn0KgqVwe7jS8g@mail.gmail.com>
	<CAE-HYsNPzk7QWZ0Uf5HTXyvfMFh2tCZ4pJUbshscptLu=D5ZWQ@mail.gmail.com>
From: Giuliano Procida <giuliano.procida@gmail.com>
Date: Fri, 30 Sep 2016 17:22:40 +0100
Message-ID: <CAE-HYsNRAsN8LoJCj5Yjkt6Xhoe+NKgHs16TNR-A-0JD1TkYQw@mail.gmail.com>
Subject: Re: [linux-lvm] LVM RAID repair trouble
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

I have resolved this myself.

I wrote a tool to modify on-disk PV metadata in-place, recalculating checksums.
I had to write a bitmap superblock fixer script as well to get all my
testing done.

As I see things, these are the outstanding issues, not all of which
are LVM's fault.

0. bitm magic not always written to rmeta subLVs
reported as https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=839189

1. An aborted lvconvert --repair (for a RAID LV) can leave behind
__extracted subLVs and leave the new subLVs with their new name.

Might it make more sense to rename the missing subLVs out of the way
first and create new subLVs with the right name?

2. lvconvert --repair (often?) dies, probably due to a bad DM ioctl -
see logs previously gathered

3. A working but interrupted (e.g. due to power failure) or an aborted
lvconvert --repair will leave a sticky REBUILD flag on the new subLVs;
this will cause a full rebuild on every deactivated->open transition.

4. vgcfgrestore cannot be used to remove the REBUILD flag until all
LVs with missing devices have been repaired AND the missing PV has
been removed from metadata.
This really limits the usefulness of this as emergency repair tool
when RAID volumes are present.

5. Multiple REBUILDs happen concurrently even when the same PVs are in
use for each RAID LV - things really slow down.

I'll update the Google Drive folder with the utility source, scripts
and other notes in a day or so.

If someone finds these notes useful, let me know.
