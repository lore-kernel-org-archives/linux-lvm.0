Received: from dhcp80-216.msp.redhat.com (dhcp80-216.msp.redhat.com
	[10.15.80.216])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id mAELL1sQ003311
	for <linux-lvm@redhat.com>; Fri, 14 Nov 2008 16:21:01 -0500
Message-Id: <B62BC4FE-D042-4CFF-8E50-3197AE685FAC@redhat.com>
From: Jonathan Brassow <jbrassow@redhat.com>
In-Reply-To: <61252CC53A97634BA52256DCF2344FBC66CA1457D5@OFFICEEXCHANGE.office.smartechcorp.net>
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v929.2)
Subject: Re: [linux-lvm] Moving Xen LV to image and mounting the image.
Date: Fri, 14 Nov 2008 15:19:56 -0600
References: <491BF3CF.2090800@knebb.de>
	<C9F9ED04-6B26-4681-9D1D-46017DD7CF41@redhat.com>
	<491C019F.6060205@knebb.de>
	<361513C7-BBE2-45D0-A6BA-F42E6219706A@redhat.com>
	<491D34F3.7030108@knebb.de>
	<61252CC53A97634BA52256DCF2344FBC66CA1457C7@OFFICEEXCHANGE.office.smartechcorp.net>
	<87f94c370811140735s7687cabbp78179e646b556109@mail.gmail.com>
	<61252CC53A97634BA52256DCF2344FBC66CA1457CC@OFFICEEXCHANGE.office.smartechcorp.net>
	<C4DF03D6-8F75-4F5B-8FC9-39F323D59329@redhat.com>
	<61252CC53A97634BA52256DCF2344FBC66CA1457CD@OFFICEEXCHANGE.office.smartechcorp.net>
	<E0E207BE-0A63-42F0-9FC3-95F72A711818@redhat.com>
	<61252CC53A97634BA52256DCF2344FBC66CA1457CF@OFFICEEXCHANGE.office.smartechcorp.net>
	<6F40AF0D-743A-4E2D-BF1D-DA2A1E724179@redhat.com>
	<61252CC53A97634BA52256DCF2344FBC66CA1457D5@OFFICEEXCHANGE.office.smartechcorp.net>
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

On Nov 14, 2008, at 12:35 PM, Chris Edwards wrote:

> [root@wdcxen1 ~]# mount -t xfs -o loop,ro,noatime,nodev ~/ 
> wdcdns1.img /mnt/tmp/ mount: wrong fs type, bad option, bad  
> superblock on /dev/loop0,
>       missing codepage or other error
>       In some cases useful info is found in syslog - try
>       dmesg | tail  or so
>
> Still no luck, I am wondering if I made this image file correctly.

The error message tells us to look at the system log (/var/log/ 
messages), so let's do that.

  brassow
