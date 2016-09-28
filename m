Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8S6pOh6027882
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 28 Sep 2016 02:51:24 -0400
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7E3707EA83
	for <linux-lvm@redhat.com>; Wed, 28 Sep 2016 06:51:23 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id r60so3036698qtd.3
	for <linux-lvm@redhat.com>; Tue, 27 Sep 2016 23:51:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAE-HYsPY0yWvQKYwbm74+pVp2+rr9zard+myAPXzUi+TZ4w1qw@mail.gmail.com>
References: <CAE-HYsPY0yWvQKYwbm74+pVp2+rr9zard+myAPXzUi+TZ4w1qw@mail.gmail.com>
From: Giuliano Procida <giuliano.procida@gmail.com>
Date: Wed, 28 Sep 2016 07:51:02 +0100
Message-ID: <CAE-HYsOLGU-ZxahjYApMhnLiKnvXu=6ekFLiyn0KgqVwe7jS8g@mail.gmail.com>
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

On 26 September 2016 at 08:54, Giuliano Procida
<giuliano.procida@gmail.com> wrote:
> The net effect is that I now have RAID volumes in an odd state with
> extracted / missing images (I think just a cosmetic issue) and which
> rebuild on every boot (or rather re-activation and use).
> The volumes take a long time to resync, especially concurrently!

I'm mostly interested in fixing my system but I had a look at the
stderr for the last repair attempt. If I had to make a guess, it would
be that lvconvert is racing against state changes in the kernel and
eventually asking dm-raid to set up an array with mismatched
expectations about whether device 0 should be flagged for rebuild or
not.

Looking through the LVM code, there is clearly an effort to clear
rebuild flags to prevent just the problem I'm having. Unfortunately,
with lvconvert exiting early these paths are presumably not taken. I
also noticed that the rebuild flag is singled out for exclusion when
generating (backup?) metadata.

I've extracted metadata from the PVs using another small utility I
wrote. The format is not quite the same as the /etc/lvm one and in
particular REBUILD status flags are NOT filtered out here.

It turns out that I do have the REBUILD flag on the rmeta_5 and rimage_5 subLVs!

Questions:
How can I clear REBUILD safely?
Can I renumber _5 to _0 as well at the same time?
Does it make sense to try the latest version of LVM user space tools
to try the final repair conversions?

--gp
