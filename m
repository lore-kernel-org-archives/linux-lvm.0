Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oAFI6V4m016067
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2010 13:06:31 -0500
Received: from mail-qy0-f181.google.com (mail-qy0-f181.google.com
	[209.85.216.181])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAFI6Hcr011338
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2010 13:06:17 -0500
Received: by qyk4 with SMTP id 4so2209927qyk.12
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2010 10:06:16 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AANLkTik5soU2jrS+MpDbAO6PBTEw-Qy-gtUiiyrXkEgs@mail.gmail.com>
References: <AANLkTi=+iwZLBxZFzhb++KMevOy55QJrg9xg9Ey2w_kX@mail.gmail.com>
	<4CDDBF95.9040104@q7.com> <4CDDCF7E.4070006@q7.com>
	<AANLkTik5soU2jrS+MpDbAO6PBTEw-Qy-gtUiiyrXkEgs@mail.gmail.com>
From: "chris (fool) mccraw" <gently@gmail.com>
Date: Mon, 15 Nov 2010 10:05:55 -0800
Message-ID: <AANLkTikgCFTtMBdDBirkyCto7r7N8oDxhqhMm1v+TOgF@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] advice for curing terrible snapshot performance?
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

On Fri, Nov 12, 2010 at 16:17, chris (fool) mccraw <gently@gmail.com> wrote:

> interestingly the default snapshot chunk size on my system:
>
> �LVM version: � � 2.02.56(1)-RHEL5 (2010-04-22)
> �Library version: 1.02.39-RHEL5 (2010-04-22)
> �Driver version: �4.11.5
>
> is 4k. �a tutorial i was reading suggested it was 64k, and i didn't
> doublecheck if that was true. �i am going to have to wait til after
> business hours to run more thorough tests, but i still see a slowdown
> way over 10x even at 64k chunk size with a single snapshot. �i'll try
> it at all the different available chunk sizes and report back by
> monday.

Well, I only made it through most chunk sizes.  here were my results:

(previously obtained:

no snapshot             = ~11sec (727MB/sec)
1 snapshot @4k chunks   = ~102sec (78MB/sec)

)

newly obtained:
1 snapshot @16k chunks  = ~639sec (12MB/sec)
1 snapshot @32k chunks  = ~367sec (21MB/sec)
1 snapshot @64k chunks  = ~252sec (31MB/sec)
1 snapshot @256k chunks = ~145sec (55MB/sec)
1 snapshot @512k chunks = ~100sec (80MB/sec)

wish i'd tried 8kb, since that's the most interesting area of the
graph now that i lay the numbers out together.  but no matter what
size i use, it's still nearly a factor of 10, and my numbers with the
default 4k chunks were almost as good as it gets.
