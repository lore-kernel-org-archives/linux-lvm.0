Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l8FAupw8025258
	for <linux-lvm@redhat.com>; Sat, 15 Sep 2007 06:56:51 -0400
Received: from hrndva-omtalb.mail.rr.com (hrndva-omtalb.mail.rr.com
	[71.74.56.123])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l8FAujCS002030
	for <linux-lvm@redhat.com>; Sat, 15 Sep 2007 06:56:45 -0400
Received: from [192.168.10.2] (really [75.177.6.165])
	by hrndva-omta04.mail.rr.com with ESMTP
	id <20070915105627.XUL3966.hrndva-omta04.mail.rr.com@[192.168.10.2]>
	for <linux-lvm@redhat.com>; Sat, 15 Sep 2007 10:56:27 +0000
Message-ID: <46EBB72E.4050609@earthlink.net>
Date: Sat, 15 Sep 2007 06:42:54 -0400
From: raptorfan <raptorfan@earthlink.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Q: Online resizing ext3 FS
References: <Pine.LNX.4.44.0709121600080.1583-100000@bmsred.bmsi.com>
In-Reply-To: <Pine.LNX.4.44.0709121600080.1583-100000@bmsred.bmsi.com>
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

Stuart D. Gathman wrote:
> This brings up an LVM related question I've had.  Can I do this:
> 
>   1) take snapshot of 500GB LV
>   2) resize source LV to 1TB

I think this is the step that will break. iirc you can't resize a lv 
with a snapshot attached.

>   3) run ext2online
>   4a) resize succeeds - remove shapshot
>   4b) resize fails horribly - copy shapshot to LV and restart
>     4b.1) is there a way to "revert" the source LV to the snapshot?
>     	(without allocating snapshot as big as source LV)


-r
