Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jB9JcwV16040
	for <linux-lvm@redhat.com>; Fri, 9 Dec 2005 14:38:58 -0500
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.199])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jB9Jcore030223
	for <linux-lvm@redhat.com>; Fri, 9 Dec 2005 14:38:50 -0500
Received: by wproxy.gmail.com with SMTP id i22so977868wra
	for <linux-lvm@redhat.com>; Fri, 09 Dec 2005 11:38:49 -0800 (PST)
Message-ID: <7119d52b0512091138s5615a650q5bad1a566cbde72b@mail.gmail.com>
Date: Fri, 9 Dec 2005 14:38:49 -0500
From: Jeff Cousino <jcousin3@gmail.com>
Subject: Re: [linux-lvm] Newbie of LVM
In-Reply-To: <4399D72B.80408@mattgillen.net>
MIME-Version: 1.0
Content-Disposition: inline
References: <20051209033914.33441.qmail@web32605.mail.mud.yahoo.com>
	<4399D72B.80408@mattgillen.net>
Content-Transfer-Encoding: 8bit
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

> You're out of luck.  You can't take an existing partition and keep the
> data yet switch it over to LVM.  It's like RAID that way: you need to
> set up the lower level stuff *before* you format the disk/partition with
> your filesystem and start putting data on it.
>

But couldn't he set up his new drive with LVM copy the data from the
old drive to it, provided it's large enough and then add the old drive
to the group?
