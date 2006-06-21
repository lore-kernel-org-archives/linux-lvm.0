Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5LGTUFr021280
	for <linux-lvm@redhat.com>; Wed, 21 Jun 2006 12:29:30 -0400
Received: from nemesis.sciencephoto.co.uk (nemesis.sciencephoto.co.uk
	[194.200.237.131])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k5LGTOd3016028
	for <linux-lvm@redhat.com>; Wed, 21 Jun 2006 12:29:24 -0400
Received: from [194.200.237.140] (helo=[194.200.237.140])
	by nemesis.sciencephoto.co.uk with esmtp (Exim 4.50)
	id 1Ft5Zu-0008WQ-TB
	for linux-lvm@redhat.com; Wed, 21 Jun 2006 17:29:19 +0100
From: "Beginner" <dermot@sciencephoto.co.uk>
Date: Wed, 21 Jun 2006 17:29:12 +0100
MIME-Version: 1.0
Subject: Re: [linux-lvm] RESOLVED newbie lvm question
Message-ID: <449981E8.19455.1285A23F@dermot.sciencephoto.co.uk>
In-reply-to: <4499812F.16081.1282CF37@dermot.sciencephoto.co.uk>
References: <44997F05.3639.127A5C39@dermot.sciencephoto.co.uk>
Content-transfer-encoding: 7BIT
Content-description: Mail message body
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On 21 Jun 2006 at 17:26, Beginner wrote:

> On 21 Jun 2006 at 17:16, Beginner wrote:

> > Selinux is enabled, would that make a difference as I am running these as root?
> > I will disable it, reboot and try again.
> 
> That seems to have done it. With SELINUX enabled I was able to format volume1.

That should read With SELINUX disabled.
