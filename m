Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id oAD0IWnK002745
	for <linux-lvm@redhat.com>; Fri, 12 Nov 2010 19:18:32 -0500
Received: from mail-qw0-f46.google.com (mail-qw0-f46.google.com
	[209.85.216.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAD0IIvk009237
	for <linux-lvm@redhat.com>; Fri, 12 Nov 2010 19:18:18 -0500
Received: by qwh5 with SMTP id 5so33120qwh.33
	for <linux-lvm@redhat.com>; Fri, 12 Nov 2010 16:18:18 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4CDDCF7E.4070006@q7.com>
References: <AANLkTi=+iwZLBxZFzhb++KMevOy55QJrg9xg9Ey2w_kX@mail.gmail.com>
	<4CDDBF95.9040104@q7.com> <4CDDCF7E.4070006@q7.com>
From: "chris (fool) mccraw" <gently@gmail.com>
Date: Fri, 12 Nov 2010 16:17:58 -0800
Message-ID: <AANLkTik5soU2jrS+MpDbAO6PBTEw-Qy-gtUiiyrXkEgs@mail.gmail.com>
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

On Fri, Nov 12, 2010 at 15:36, Joe Pruett <joey@q7.com> wrote:
> i just did a bit of poking around and discovered that snapshots have
> their own chunk size that is used for the copy on write magic.

indeed.  i was hoping someone would advise me if there was a better
chunk size, which is why i said what i thought i was using (default =
64k) in my first post.

> and it
> defaults to 4k, and you can only increase that to 512k. �a simple test
> of creating a 1g file went from 240mbytes/sec to 4mbytes/sec with 4k
> chunk, and 12mbytes/sec with 512k chunk. �so i'm not sure what the
> bottleneck is, but is surely is there.

interestingly the default snapshot chunk size on my system:

  LVM version:     2.02.56(1)-RHEL5 (2010-04-22)
  Library version: 1.02.39-RHEL5 (2010-04-22)
  Driver version:  4.11.5

is 4k.  a tutorial i was reading suggested it was 64k, and i didn't
doublecheck if that was true.  i am going to have to wait til after
business hours to run more thorough tests, but i still see a slowdown
way over 10x even at 64k chunk size with a single snapshot.  i'll try
it at all the different available chunk sizes and report back by
monday.

still curious about Zumastor--does anyone use this in production?
