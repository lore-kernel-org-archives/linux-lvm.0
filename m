Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8S8XRA9011539
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 28 Sep 2016 04:33:27 -0400
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7993D7F7DA
	for <linux-lvm@redhat.com>; Wed, 28 Sep 2016 08:33:26 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id 38so18968922qte.1
	for <linux-lvm@redhat.com>; Wed, 28 Sep 2016 01:33:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAE-HYsOLGU-ZxahjYApMhnLiKnvXu=6ekFLiyn0KgqVwe7jS8g@mail.gmail.com>
References: <CAE-HYsPY0yWvQKYwbm74+pVp2+rr9zard+myAPXzUi+TZ4w1qw@mail.gmail.com>
	<CAE-HYsOLGU-ZxahjYApMhnLiKnvXu=6ekFLiyn0KgqVwe7jS8g@mail.gmail.com>
From: Giuliano Procida <giuliano.procida@gmail.com>
Date: Wed, 28 Sep 2016 09:33:05 +0100
Message-ID: <CAE-HYsNPzk7QWZ0Uf5HTXyvfMFh2tCZ4pJUbshscptLu=D5ZWQ@mail.gmail.com>
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
Cc: Giuliano Procida <giuliano.procida@gmail.com>

On 28 September 2016 at 07:51, Giuliano Procida
<giuliano.procida@gmail.com> wrote a load of rubbish:
> On 26 September 2016 at 08:54, Giuliano Procida
> <giuliano.procida@gmail.com> wrote:
>> The net effect is that I now have RAID volumes in an odd state with
>> extracted / missing images (I think just a cosmetic issue) and which
>> rebuild on every boot (or rather re-activation and use).
>> The volumes take a long time to resync, especially concurrently!
>
> I'm mostly interested in fixing my system but I had a look at the
> stderr for the last repair attempt. If I had to make a guess, it would
> be that lvconvert is racing against state changes in the kernel and
> eventually asking dm-raid to set up an array with mismatched
> expectations about whether device 0 should be flagged for rebuild or
> not.
>
> Looking through the LVM code, there is clearly an effort to clear
> rebuild flags to prevent just the problem I'm having. Unfortunately,
> with lvconvert exiting early these paths are presumably not taken. I
> also noticed that the rebuild flag is singled out for exclusion when
> generating (backup?) metadata.

The last bit's not true. Also, I *do* have consistently REBUILD flags
in the on-disk and backed up metadata for the new rmeta and rimage
subLVs. I must have been grepping a typo.

The questions still remain:

> How can I clear REBUILD safely?

vgcfgrestore -t and the source code show that trying this will fail
until I lvconvert --repair everything off the missing PV and vgreduce
--removemissing.

The only other thing I can think of at present is to overwrite the
text [, "REBUILD"] with spaces and recalculate and re-write the CRC
for the metadata; sync and power off the machine (well after running
various LVM commands that read the on-disk format!).

> Can I renumber _5 to _0 as well at the same time?
> Does it make sense to try the latest version of LVM user space tools
> to try the final repair conversions?
>
> --gp
