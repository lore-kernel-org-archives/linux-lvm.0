Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lB7KMYuV025941
	for <linux-lvm@redhat.com>; Fri, 7 Dec 2007 15:22:34 -0500
Received: from mx.greatschools.net (mx.greatschools.net [198.144.205.131])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lB7KM3fR003889
	for <linux-lvm@redhat.com>; Fri, 7 Dec 2007 15:22:03 -0500
Received: from zimbra.greatschools.net (zimbra.greatschools.net
	[198.144.205.155])
	by mx.greatschools.net (8.13.1/8.13.1) with ESMTP id lB7KLvPG022386
	for <linux-lvm@redhat.com>; Fri, 7 Dec 2007 12:21:57 -0800
Received: from localhost (localhost.localdomain [127.0.0.1])
	by zimbra.greatschools.net (Postfix) with ESMTP id 749E8304DBC
	for <linux-lvm@redhat.com>; Fri,  7 Dec 2007 12:21:57 -0800 (PST)
Received: from zimbra.greatschools.net ([127.0.0.1])
	by localhost (zimbra.greatschools.net [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 6IuQub3fmsP5 for <linux-lvm@redhat.com>;
	Fri,  7 Dec 2007 12:21:56 -0800 (PST)
Received: from [198.144.205.132] (dh1.office.greatschools.net
	[198.144.205.132])
	by zimbra.greatschools.net (Postfix) with ESMTP id C6AC2304D88
	for <linux-lvm@redhat.com>; Fri,  7 Dec 2007 12:21:56 -0800 (PST)
From: Dane Miller <dane@greatschools.net>
In-Reply-To: <1197058441.23187.30.camel@danedesk.greatschools.net>
References: <1197058441.23187.30.camel@danedesk.greatschools.net>
Date: Fri, 07 Dec 2007 12:21:41 -0800
Message-Id: <1197058901.23187.34.camel@danedesk.greatschools.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: dm errors with lvcreate --snapshot
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

Oops, some software versions might be helpful...

OS: CentOS 4.4
Kernel: 2.6.9-42.0.10.ELsmp i686 athlon i386 GNU/Linux
LVM2: lvm2-2.02.21-5.el4
Device-mapper: device-mapper-1.02.17-3.0.1.el4

Dane Miller wrote:
> Hi,
> 
> I've recently started getting errors when creating a snapshot.  I'm new
> to LVM2 troubleshooting, so please point me in the right direction if
> these are obvious error messages.
> 
> The script 'amanda_snapshot.pl' removes yesterday's snapshot and creates
> a new snapshot, which amanda backs up some time later.  Here's the
> output of this script, including error messages:
> 
> amanda_snapshot.pl: umount /media/vm1optsnap
> amanda_snapshot.pl: lvremove -f /dev/vg0/vm1optsnap
>   Logical volume "vm1optsnap" successfully removed
> amanda_snapshot.pl: lvcreate --snapshot --name vm1optsnap --size
> 10G /dev/vg0/vm1opt
>   /dev/dm-9: stat failed: No such file or directory
>   Path /dev/dm-9 no longer valid for device(253,9)
>   Aborting - please provide new pathname for what used to be /dev/dm-9
>   /dev/dm-10: stat failed: No such file or directory
>   Path /dev/dm-10 no longer valid for device(253,10)
>   Aborting - please provide new pathname for what used to be /dev/dm-10
>   /dev/dm-11: stat failed: No such file or directory
>   Path /dev/dm-11 no longer valid for device(253,11)
>   Aborting - please provide new pathname for what used to be /dev/dm-11
>   Logical volume "vm1optsnap" created
> amanda_snapshot.pl: mount /dev/vg0/vm1optsnap /media/vm1optsnap
> 
> 
> What would cause these /dev/dm-* errors?  How can I find out what's
> going on?
> 
> 
> Dane
