Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n1N7BpmM015461
	for <linux-lvm@redhat.com>; Mon, 23 Feb 2009 02:11:51 -0500
Received: from e5.ny.us.ibm.com (e5.ny.us.ibm.com [32.97.182.145])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n1N7BY2Y017665
	for <linux-lvm@redhat.com>; Mon, 23 Feb 2009 02:11:34 -0500
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e5.ny.us.ibm.com (8.13.1/8.13.1) with ESMTP id n1N78jph014805
	for <linux-lvm@redhat.com>; Mon, 23 Feb 2009 02:08:45 -0500
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
	by d01relay02.pok.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id
	n1N7BXj3192064
	for <linux-lvm@redhat.com>; Mon, 23 Feb 2009 02:11:33 -0500
Received: from d01av02.pok.ibm.com (loopback [127.0.0.1])
	by d01av02.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	n1N7ALKt012647
	for <linux-lvm@redhat.com>; Mon, 23 Feb 2009 02:10:21 -0500
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d01av02.pok.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	n1N7AKQF012634
	for <linux-lvm@redhat.com>; Mon, 23 Feb 2009 02:10:20 -0500
Date: Sun, 22 Feb 2009 23:11:32 -0800
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] re --corelog: does synchronization re-copy all data?
Message-ID: <20090223071132.GA9670@us.ibm.com>
References: <49A0A252.30803@smart.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <49A0A252.30803@smart.net>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Daniel B. [dsb@smart.net] wrote:
> In the LVM Administrator's Guide, at least the one at
> http://www.centos.org/docs/5/html/Cluster_Logical_Volume_Manager/LV_create.html ,
> it says:"
>
>   LVM maintains a small log which it uses to keep track of which regions
>   are in sync with the mirror or mirrors. By default, this log is kept
>   on disk, which keeps it persistent across reboots. You can specify
>   instead that this log be kept in memory with the --corelog argument;
>   this eliminates the need for an extra log device, but it requires that
>   the entire mirror be resynchronized at every reboot.
>
> Does that last sentence mean that _all_ the data is recopied, or just
> that all _regions_ are checked and not all the data necessarily has
> to be copied (perhaps only change regions have to be copied, but
> unchanged regions don't)?

Everything has to be re-copied because it doesn't know what is changed
as the "log" is kept in memory which is lost after a reboot.

> More generally, can LVM perform RAID1-style mirroring with only
> two disks (without having to re-copy everything each boot)
> (and, of course, being recoverable in case either disk fails)?

You should be able to force LVM to create a log device on one of your
two devices (--alloc anywhere)

Thanks, Malahal.
