Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k89Kfg2E013807
	for <linux-lvm@redhat.com>; Sat, 9 Sep 2006 16:41:42 -0400
Received: from ylpvm29.prodigy.net (ylpvm29-ext.prodigy.net [207.115.57.60])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k89KfUDt026644
	for <linux-lvm@redhat.com>; Sat, 9 Sep 2006 16:41:36 -0400
Received: from [69.105.169.202] (adsl-69-105-169-202.dsl.irvnca.pacbell.net
	[69.105.169.202])
	by ylpvm29.prodigy.net (8.13.7 out spool5000 dk/8.13.7) with ESMTP id
	k89Kf4GD010728
	for <linux-lvm@redhat.com>; Sat, 9 Sep 2006 16:41:04 -0400
Message-ID: <450326F9.2080902@pacbell.net>
Date: Sat, 09 Sep 2006 13:41:29 -0700
From: Duane Clark <fpga@pacbell.net>
MIME-Version: 1.0
References: <5b0681910609082019p4e0d9a36xf62f374eba4a201b@mail.gmail.com>
In-Reply-To: <5b0681910609082019p4e0d9a36xf62f374eba4a201b@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: resize an lvm partition
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
To: linux-lvm@redhat.com

Pradeep Kilambi wrote:
> OK I have a FC5 install on a full primary lym( not extended partition). 
> I would ike to resize this(/dev/hda2) to shrink a little to install 
> something else. Whats the best way to resize an lvm partition. Also my 
> filesystem says unknow filesystem type. I tried using parted and GParted 
> but none of these worked.
> 
> partition filesystem size used unused flags
> /dev/hda1 ext3 101.35MB 44.97MB 56.98MB boot
> /dev/hda2 unknown 74.43GB --- --- lvm

I recently did this exact task, and posted the steps I used:
https://www.redhat.com/archives/linux-lvm/2006-August/msg00081.html
