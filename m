Received: from dhcp80-216.msp.redhat.com (dhcp80-216.msp.redhat.com
	[10.15.80.216])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id mAEGcS1s029489
	for <linux-lvm@redhat.com>; Fri, 14 Nov 2008 11:38:28 -0500
Message-Id: <E0E207BE-0A63-42F0-9FC3-95F72A711818@redhat.com>
From: Jonathan Brassow <jbrassow@redhat.com>
In-Reply-To: <61252CC53A97634BA52256DCF2344FBC66CA1457CD@OFFICEEXCHANGE.office.smartechcorp.net>
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v929.2)
Subject: Re: [linux-lvm] Moving Xen LV to image and mounting the image.
Date: Fri, 14 Nov 2008 10:37:23 -0600
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


On Nov 14, 2008, at 10:02 AM, Chris Edwards wrote:

>  installed the xfs module with yum and then deleted all the loopback  
> devices with losetup -d and started over again...
>
> [root@wdcxen1 ~]# losetup -a
> [root@wdcxen1 ~]# losetup /dev/loop0 /root/wdcdns1.img
> [root@wdcxen1 ~]# losetup -a
> /dev/loop0: [0807]:14876937 (/root/wdcdns1.img)
> [root@wdcxen1 ~]# mount -t xfs -o loop,ro,noatime,nodev,nofsck ~/ 
> wdcdns1.img /mnt/tmp/

Stop doing that!  :)  When you run 'mount' with '-o loop' it sets up  
the loop device for you.  There is no reason to create the loop device  
ahead of time.

> mount: wrong fs type, bad option, bad superblock on /dev/loop1,
>       missing codepage or other error
>       In some cases useful info is found in syslog - try
>       dmesg | tail  or so

Did you try checking syslog?

Also, if you are trying to mount the original device and the loop back  
device at the same time, xfs will complain about conflicting UUIDs.   
If that's what syslog says is going on, and you really want to mount  
the same file system (one from the original device and one from the  
loopback), then you will need to use the mount option 'nouuid'.

  brassow
