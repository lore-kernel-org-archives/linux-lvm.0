Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iADM0kr13184
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2004 17:00:46 -0500
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.197])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iADM0ePP017987
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2004 17:00:40 -0500
Received: by wproxy.gmail.com with SMTP id 58so447378wri
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2004 14:00:35 -0800 (PST)
Message-ID: <87f94c37041113140053f493b0@mail.gmail.com>
Date: Sat, 13 Nov 2004 17:00:35 -0500
From: Greg Freemyer <greg.freemyer@gmail.com>
Subject: Re: [linux-lvm] Re: raid 1 on a single disk
In-Reply-To: <20041113211324.GA13108@dragonhold.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <89af10f90411130217467c439@mail.gmail.com>
	<lg4h62-8vg.ln1@news.it.uc3m.es>
	<89af10f90411130241e20e2c2@mail.gmail.com>
	<20041113211324.GA13108@dragonhold.org>
Reply-To: Greg Freemyer <greg.freemyer@gmail.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

> 
> P.S. I'd be really tempted to talk to the person asking you to do this, and ask them what they hope to achieve...
> 
I can almost envision times it would be useful.  i.e. disk speed is
unimportand, disk data rarely changes, but when it does it is very
important, and traditional backups are not feasible for some unknown
reason?

By having the data written to 2 different places on the disk, the
likelyhood of a failure making it  truly unrecoverable is extremely
small.

ie. If you have disk media problems, likely only one location of the
other will be affected.

If you have a drive electronics failure, you can ship the drive off to
have recovery performed.  (Over $1000 I know, but if the data is
important.)

Greg
