Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l81N58EC016207
	for <linux-lvm@redhat.com>; Sat, 1 Sep 2007 19:05:08 -0400
Received: from py-out-1112.google.com (py-out-1112.google.com [64.233.166.179])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l81N57A7029091
	for <linux-lvm@redhat.com>; Sat, 1 Sep 2007 19:05:07 -0400
Received: by py-out-1112.google.com with SMTP id p76so4208871pyb
	for <linux-lvm@redhat.com>; Sat, 01 Sep 2007 16:05:06 -0700 (PDT)
Message-ID: <d00698fb0709011605h25edefbep1c989c23effe5c55@mail.gmail.com>
Date: Sun, 2 Sep 2007 01:05:06 +0200
From: noah <noah123@gmail.com>
Subject: Re: [linux-lvm] pvmove hung on 2.6.22 (ubuntu gutsy)
In-Reply-To: <46D9B8B2.3070104@theendofthetunnel.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <d00698fb0709011019x688e5363q931f16444685ea97@mail.gmail.com>
	<46D9B8B2.3070104@theendofthetunnel.de>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

2007/9/1, Hannes Dorbath <light@theendofthetunnel.de>:
> noah wrote:
> > Pvmove hung and now all commands that access the filesystem hang too,
> > possibly in uninterruptible sleep.
> > Is this a bug or did I do something forbidden, somehow? ;)
>
> To my knowledge pvmove is broken on 2.6.22. I'd go back to 2.6.21 until
> there is a fix. Maybe there is already a fix, I haven't followed it.

Thanks for a quick reply.
Has this problem been documented elsewhere?
Just curious what the problem is and whether anybody is working on a fix.

While looking through Ubuntu's bug database a found others who had
been countering problems with pvmove; something related to
device-mapper.
http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=376283
Is the problem I stumbled upon a different one?

  -- noah
