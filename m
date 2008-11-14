Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mAEIaB3N003010
	for <linux-lvm@redhat.com>; Fri, 14 Nov 2008 13:36:12 -0500
Received: from officeexchange.office.smartechcorp.net
	(exchange.office.smartechcorp.net [64.203.96.71])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mAEIZscF027625
	for <linux-lvm@redhat.com>; Fri, 14 Nov 2008 13:35:54 -0500
From: Chris Edwards <cedwards@smartechcorp.net>
Date: Fri, 14 Nov 2008 13:35:50 -0500
Subject: RE: [linux-lvm] Moving Xen LV to image and mounting the image.
Message-ID: <61252CC53A97634BA52256DCF2344FBC66CA1457D5@OFFICEEXCHANGE.office.smartechcorp.net>
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
In-Reply-To: <6F40AF0D-743A-4E2D-BF1D-DA2A1E724179@redhat.com>
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

[root@wdcxen1 ~]# mount -t xfs -o loop,ro,noatime,nodev ~/wdcdns1.img /mnt/tmp/ mount: wrong fs type, bad option, bad superblock on /dev/loop0,
       missing codepage or other error
       In some cases useful info is found in syslog - try
       dmesg | tail  or so

Still no luck, I am wondering if I made this image file correctly.

---

Chris Edwards
Smartech Corp.
Div. of AirNet Group
http://www.airnetgroup.com
http://www.smartechcorp.net
cedwards@smartechcorp.net
P:  423-664-7678 x114
C:  423-593-6964
F:  423-664-7680


> -----Original Message-----
> From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-
> bounces@redhat.com] On Behalf Of Jonathan Brassow
> Sent: Friday, November 14, 2008 12:26 PM
> To: LVM general discussion and development
> Subject: Re: [linux-lvm] Moving Xen LV to image and mounting the image.
> 
> You can take out the 'nofsck' mount option then.
> 
> [root@wdcxen1 ~]# mount -t xfs -o loop,ro,noatime,nodev ~/wdcdns1.img /
> mnt/tmp/
> 
>   brassow
> 
> On Nov 14, 2008, at 10:52 AM, Chris Edwards wrote:
> 
> > root@wdcxen1 ~]# mount -t xfs -o loop,ro,noatime,nodev,nofsck ~/
> > wdcdns1.img /mnt/tmp/
> > mount: wrong fs type, bad option, bad superblock on /dev/loop0,
> >       missing codepage or other error
> >       In some cases useful info is found in syslog - try
> >       dmesg | tail  or so
> >
> >
> > tail /var/log/messages
> >
> > Nov 14 10:44:50 wdcxen1 kernel: XFS: unknown mount option [nofsck].
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
