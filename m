Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j6DDaPV25908
	for <linux-lvm@redhat.com>; Wed, 13 Jul 2005 09:36:25 -0400
Received: from jason.comodo.net (firewall2.comodogroup.com [195.92.253.138])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j6DDaEZ9032219
	for <linux-lvm@redhat.com>; Wed, 13 Jul 2005 09:36:18 -0400
Subject: Re: [linux-lvm] pvcreate prblem
From: susmitha <sushmitha@comodo.com>
In-Reply-To: <42D51683.7060106@berbee.com>
References: <1121258369.13309.29.camel@fortocent.comodo.net>
	<42D51683.7060106@berbee.com>
Message-Id: <1121262411.14004.1.camel@fortocent.comodo.net>
Mime-Version: 1.0
Date: Wed, 13 Jul 2005 19:16:51 +0530
Content-Transfer-Encoding: 7bit
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

Hi,

"fdisk -l " is showing correctly
I mean showing those partitions.
But I didn't get why it came.
Ok I will try by rebooting.

Thanks for immediate reply :)

On Wed, 2005-07-13 at 18:56, Alan Jurgensen wrote:
> sometimes you have to reboot for partition changes to take effect.
> what does this show:   fdisk -l
> 
> susmitha wrote:
> 
> >Hi,
> >
> >I am new to LVM.
> >I want t o create LVM volume group.
> >So first I created a partition and then runned "pvcreate"
> >root@localhost ~# pvcreate /dev/hda5
> >  Device /dev/hda5 not found.
> >
> >
> >But that is present.I didn't get why it is showing "Device not found"
> >Can anyone help me.It is urgent for me.
> >
> >Can I create volume group on EVMS volumes?
> >
> >
> >Thanks,
> >susmitha


Susmitha
