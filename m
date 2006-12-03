Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kB3LOrol015016
	for <linux-lvm@redhat.com>; Sun, 3 Dec 2006 16:24:53 -0500
Received: from ender.volumehost.net (adsl-69-154-123-202.dsl.fyvlar.swbell.net
	[69.154.123.202])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kB3LOpvC018722
	for <linux-lvm@redhat.com>; Sun, 3 Dec 2006 16:24:52 -0500
From: Zac Slade <krakrjak@volumehost.net>
Subject: Re: [linux-lvm] RAID5 expansion
Date: Sun, 3 Dec 2006 15:24:49 -0600
References: <Pine.LNX.4.62.0611281555070.13406@skywolf.cdf.toronto.edu>
In-Reply-To: <Pine.LNX.4.62.0611281555070.13406@skywolf.cdf.toronto.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200612031524.49986.krakrjak@volumehost.net>
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
To: linux-lvm@redhat.com
Cc: Andrew Park <apark@cdf.toronto.edu>

On Tuesday 28 November 2006 14:59, Andrew Park wrote:
> Hi all,
>
> I have ServeRAID 6m card which had 5 drive set. I had that expanded to 8
> drive set and now that it had finished migration I wish to make OS make
> use of the expanded storage.  Now the question... how?
>
> I am using LVM2 so I thought simply running pvresize /dev/sda would do
> the trick but it is doing absolutely nothing.  It stil reports back the
> old RAID size.  I am running RHAS4 + update3.
>
> So I thought perhaps fdisk may help but I don't want to risk losing my
> data since this is now into 2 TB range.  So can you please advise as to
> how to go about doing this?  I really need to make this happen soon
> because there will be an immediate demand for the space.
pvresize is the correct step to take here, but it might be that the blocksize 
hasn't actually increased in the kernel.  If that's the case you may have to 
reboot or reload the controller driver, both of those of course would be 
outages.

Here's what you can do to determine what the kernel believes the size of the 
device is you can issue blockdev --getsize /dev/sda and that will return the 
size of the device in 512 byte blocks, or to get it in KiB you can simply use 
this bash statement: echo "$(($(blockdev --getsize /dev/sda) >> 1))"
-- 
Zac Slade
krakrjak@volumehost.net
ICQ:1415282 YM:krakrjak AIM:ttyp99
