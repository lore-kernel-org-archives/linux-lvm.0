Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3K3K6Rg021128
	for <linux-lvm@redhat.com>; Sat, 19 Apr 2008 23:20:06 -0400
Received: from rv-out-0506.google.com (rv-out-0708.google.com [209.85.198.248])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3K3JsJO017927
	for <linux-lvm@redhat.com>; Sat, 19 Apr 2008 23:19:55 -0400
Received: by rv-out-0506.google.com with SMTP id b17so718930rvf.51
	for <linux-lvm@redhat.com>; Sat, 19 Apr 2008 20:19:54 -0700 (PDT)
Message-ID: <480AB63C.4070605@gmail.com>
Date: Sun, 20 Apr 2008 13:19:24 +1000
From: David Robinson <zxvdr.au@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Adding PVs to a group
References: <48091663.2070404@Media-Brokers.com>
	<480A3291.7070702@Media-Brokers.com>
In-Reply-To: <480A3291.7070702@Media-Brokers.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Charles Marcus wrote:
> Actually, now I'm confusing myself...
> 
> Currently, /dev/sdb is partitioned into two partitions...
> 
> Since I'm no longer using the second partition at all, wouldn't it be 
> simpler/cleaner to just delete the second partition entirely (using 
> fdisk) and then just resize /dev/sdb1 to include the new free space 
> using vgextend?
> 
> Or will that not work?

That will work. You'll need to run pvresize after resizing the 
partition, and you wouldn't need to use vgextend.

--Dave
