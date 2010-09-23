Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o8N6hSeK014081
	for <linux-lvm@redhat.com>; Thu, 23 Sep 2010 02:43:28 -0400
Received: from maude.comedia.it (mail.comedia.it [77.93.254.181])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o8N6hCdM005533
	for <linux-lvm@redhat.com>; Thu, 23 Sep 2010 02:43:13 -0400
Date: Thu, 23 Sep 2010 08:43:06 +0200
From: Luca Berra <bluca@comedia.it>
Message-ID: <20100923064306.GA3078@maude.comedia.it>
References: <4C8677BF.40500@thenewhams.com>
	<vmime.4c9a232f.1c6f.4fef62426d1bdb0e@pebblebeach.thenewhams.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <vmime.4c9a232f.1c6f.4fef62426d1bdb0e@pebblebeach.thenewhams.com>
Subject: Re: [linux-lvm] Unable to mount LVM partition - table too small
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Adam NEWHAM <adam@thenewhams.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Sep 22, 2010 at 08:39:27AM -0700, Adam NEWHAM wrote:
>Thanks for looking into this. Here is the requested info, but I think something might be up with the array. I've captured additional info - I also have a screen capture from the Disk Utility but I will probably have to send that in a private email as it requires an attachment.
>Here is what comes from mdmadm --examine --scan
>
>ARRAY /dev/md0 level=raid5 num-devices=4 UUID=b5e0fcd0:cfadbb04:a5b6f22e:457f47ae
>ARRAY /dev/md0 level=raid5 num-devices=4 UUID=08558923:881d9efd:464c249d:988d2ec6


can you please show the output of mdadm --examine --scan --verbose

and to be sure:
mdadm --examine --verbose /dev/sd[abcd] /dev/sd[abcd]1


i am starting to believe your array was originally composed of
partitions contained in /dev/sda, sdb, sdc, sdd

now md saw a complete array on the whole devices, and created a
partitioned /dev/md0 reading the partition table on the first drive

so the array size is ~2.7T but the md0p1 partition is ~.9T

lvm failure:
>kernel: [  553.685856] device-mapper: table: 252:0: md0p1 too small for target: start=384, len=5860556800, dev_size=1953520002
means just this (you tried to activate a logical volume starting at
sector 384, sized 5860556800 sectors (~2.7T) but the device is only
1953520002 sectors (~.9T)

this is consistent with the proc partitions you posted in the first
message
> 8 0 976762584 sda
> 8 1 976760001 sda1
> 8 16 976762584 sdb
> 8 17 976760001 sdb1
> 8 32 976762584 sdc
> 8 33 976760001 sdc1
> 8 48 976762584 sdd
> 8 49 976760001 sdd1
> 8 64 58605120 sde
> 8 65 56165376 sde1
> 8 66 1 sde2
> 8 69 2437120 sde5
> 9 0 2930287488 md0
> 259 0 976760001 md0p1
         ^^^^^^^^^  

if we find valid md metadata on the partitions we can create a
mdadm.conf with
DEVICE /dev/sd[abcd]1

which will ignore the whole drive

L.
