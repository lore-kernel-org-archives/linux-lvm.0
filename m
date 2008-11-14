Received: from dhcp80-216.msp.redhat.com (dhcp80-216.msp.redhat.com
	[10.15.80.216])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id mAEFnINm021282
	for <linux-lvm@redhat.com>; Fri, 14 Nov 2008 10:49:18 -0500
Message-Id: <C4DF03D6-8F75-4F5B-8FC9-39F323D59329@redhat.com>
From: Jonathan Brassow <jbrassow@redhat.com>
In-Reply-To: <61252CC53A97634BA52256DCF2344FBC66CA1457CC@OFFICEEXCHANGE.office.smartechcorp.net>
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v929.2)
Subject: Re: [linux-lvm] Moving Xen LV to image and mounting the image.
Date: Fri, 14 Nov 2008 09:48:14 -0600
References: <491BF3CF.2090800@knebb.de>
	<C9F9ED04-6B26-4681-9D1D-46017DD7CF41@redhat.com>
	<491C019F.6060205@knebb.de>
	<361513C7-BBE2-45D0-A6BA-F42E6219706A@redhat.com>
	<491D34F3.7030108@knebb.de>
	<61252CC53A97634BA52256DCF2344FBC66CA1457C7@OFFICEEXCHANGE.office.smartechcorp.net>
	<87f94c370811140735s7687cabbp78179e646b556109@mail.gmail.com>
	<61252CC53A97634BA52256DCF2344FBC66CA1457CC@OFFICEEXCHANGE.office.smartechcorp.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: LVM general discussion and development <linux-lvm@redhat.com>


On Nov 14, 2008, at 9:44 AM, Chris Edwards wrote:

> Here are some things I have tried with no luck...
>
> losetup /dev/loop5 ~/wdcdns1.img
> sfdisk -l /dev/loop5
>
> Disk /dev/loop5: 606 cylinders, 255 heads, 63 sectors/track
>
> sfdisk: ERROR: sector 0 does not have an msdos signature
> /dev/loop5: unrecognized partition table type

Why run sfdisk?

> mount -o loop wdcdns1.img /mnt/tmp/

Why are you using '-o loop'.  You already have the loop device setup.   
Couldn't you just:
prompt> mount /dev/loop5 /mnt/tmp
... or, if you didn't create the loop device already
prompt> mount -o loop /root/wdcdns1.img /mnt/tmp

> mount: you must specify the filesystem type
> ---
> mount -t xfs -o loop,ro,noatime,nodev,nofsck ~/wdcdns1.img /mnt/tmp/
>
> mount: unknown filesystem type 'xfs'

Is the xfs module loaded?  (do you have xfs support?)

  brassow
