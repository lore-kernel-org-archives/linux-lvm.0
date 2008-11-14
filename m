Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mAEGqX1m011978
	for <linux-lvm@redhat.com>; Fri, 14 Nov 2008 11:52:33 -0500
Received: from officeexchange.office.smartechcorp.net
	(exchange.office.smartechcorp.net [64.203.96.71])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mAEGqK72026530
	for <linux-lvm@redhat.com>; Fri, 14 Nov 2008 11:52:20 -0500
From: Chris Edwards <cedwards@smartechcorp.net>
Date: Fri, 14 Nov 2008 11:52:17 -0500
Subject: RE: [linux-lvm] Moving Xen LV to image and mounting the image.
Message-ID: <61252CC53A97634BA52256DCF2344FBC66CA1457CF@OFFICEEXCHANGE.office.smartechcorp.net>
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
In-Reply-To: <E0E207BE-0A63-42F0-9FC3-95F72A711818@redhat.com>
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

Ok, forgive me I am fairly new to LV's, it was part of the RHCE test but I have never really had to use them until I started using a SAN and Xen.

No more losetup! 

[root@wdcxen1 ~]# mount -t xfs -o loop,ro,noatime,nodev,nofsck ~/wdcdns1.img /mnt/tmp/
mount: wrong fs type, bad option, bad superblock on /dev/loop0,
       missing codepage or other error
       In some cases useful info is found in syslog - try
       dmesg | tail  or so


tail /var/log/messages

Nov 14 10:44:50 wdcxen1 kernel: XFS: unknown mount option [nofsck].

[root@wdcxen1 ~]# modprobe -l | grep xfs
/lib/modules/2.6.18-92.1.13.el5xen/kernel/fs/freevxfs/freevxfs.ko
/lib/modules/2.6.18-92.1.13.el5xen/extra/xfs/xfs.ko

---

Chris Edwards


> -----Original Message-----
> From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-
> bounces@redhat.com] On Behalf Of Jonathan Brassow
> Sent: Friday, November 14, 2008 11:37 AM
> To: LVM general discussion and development
> Subject: Re: [linux-lvm] Moving Xen LV to image and mounting the image.
> 
> 
> On Nov 14, 2008, at 10:02 AM, Chris Edwards wrote:
> 
> >  installed the xfs module with yum and then deleted all the loopback
> > devices with losetup -d and started over again...
> >
> > [root@wdcxen1 ~]# losetup -a
> > [root@wdcxen1 ~]# losetup /dev/loop0 /root/wdcdns1.img
> > [root@wdcxen1 ~]# losetup -a
> > /dev/loop0: [0807]:14876937 (/root/wdcdns1.img)
> > [root@wdcxen1 ~]# mount -t xfs -o loop,ro,noatime,nodev,nofsck ~/
> > wdcdns1.img /mnt/tmp/
> 
> Stop doing that!  :)  When you run 'mount' with '-o loop' it sets up
> the loop device for you.  There is no reason to create the loop device
> ahead of time.
> 
> > mount: wrong fs type, bad option, bad superblock on /dev/loop1,
> >       missing codepage or other error
> >       In some cases useful info is found in syslog - try
> >       dmesg | tail  or so
> 
> Did you try checking syslog?
> 
> Also, if you are trying to mount the original device and the loop back
> device at the same time, xfs will complain about conflicting UUIDs.
> If that's what syslog says is going on, and you really want to mount
> the same file system (one from the original device and one from the
> loopback), then you will need to use the mount option 'nouuid'.
> 
>   brassow
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
