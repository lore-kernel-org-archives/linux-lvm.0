Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mAEG31CX011428
	for <linux-lvm@redhat.com>; Fri, 14 Nov 2008 11:03:01 -0500
Received: from officeexchange.office.smartechcorp.net
	(exchange.office.smartechcorp.net [64.203.96.71])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mAEG2oCA024263
	for <linux-lvm@redhat.com>; Fri, 14 Nov 2008 11:02:50 -0500
From: Chris Edwards <cedwards@smartechcorp.net>
Date: Fri, 14 Nov 2008 11:02:49 -0500
Subject: RE: [linux-lvm] Moving Xen LV to image and mounting the image.
Message-ID: <61252CC53A97634BA52256DCF2344FBC66CA1457CD@OFFICEEXCHANGE.office.smartechcorp.net>
References: <491BF3CF.2090800@knebb.de>
	<C9F9ED04-6B26-4681-9D1D-46017DD7CF41@redhat.com>
	<491C019F.6060205@knebb.de>
	<361513C7-BBE2-45D0-A6BA-F42E6219706A@redhat.com>
	<491D34F3.7030108@knebb.de>
	<61252CC53A97634BA52256DCF2344FBC66CA1457C7@OFFICEEXCHANGE.office.smartechcorp.net>
	<87f94c370811140735s7687cabbp78179e646b556109@mail.gmail.com>
	<61252CC53A97634BA52256DCF2344FBC66CA1457CC@OFFICEEXCHANGE.office.smartechcorp.net>
	<C4DF03D6-8F75-4F5B-8FC9-39F323D59329@redhat.com>
In-Reply-To: <C4DF03D6-8F75-4F5B-8FC9-39F323D59329@redhat.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
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
To: LVM general discussion and development <linux-lvm@redhat.com>

>> sfdisk: ERROR: sector 0 does not have an msdos signature
>> /dev/loop5: unrecognized partition table type

>Why run sfdisk?

Just trying to see the partitions incase I have to mount with an offset.

>> mount -o loop wdcdns1.img /mnt/tmp/

>Why are you using '-o loop'.  You already have the loop device setup.   
>Couldn't you just:
>prompt> mount /dev/loop5 /mnt/tmp
>... or, if you didn't create the loop device already
>prompt> mount -o loop /root/wdcdns1.img /mnt/tmp

>> mount: you must specify the filesystem type
>> ---
>> mount -t xfs -o loop,ro,noatime,nodev,nofsck ~/wdcdns1.img /mnt/tmp/
>>
>> mount: unknown filesystem type 'xfs'

>Is the xfs module loaded?  (do you have xfs support?)

I installed the xfs module with yum and then deleted all the loopback devices with losetup -d and started over again...

[root@wdcxen1 ~]# losetup -a
[root@wdcxen1 ~]# losetup /dev/loop0 /root/wdcdns1.img
[root@wdcxen1 ~]# losetup -a
/dev/loop0: [0807]:14876937 (/root/wdcdns1.img)
[root@wdcxen1 ~]# mount -t xfs -o loop,ro,noatime,nodev,nofsck ~/wdcdns1.img /mnt/tmp/
mount: wrong fs type, bad option, bad superblock on /dev/loop1,
       missing codepage or other error
       In some cases useful info is found in syslog - try
       dmesg | tail  or so

I really appreciate everyones help, this has been stumping me for a week or so.

Thanks!

Chris Edwards
