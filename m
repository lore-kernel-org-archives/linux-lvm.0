Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3RALxO02774
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2005 06:21:59 -0400
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j3RALqvp021607
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2005 06:21:52 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1DQja8-0008SU-VE
	for linux-lvm@redhat.com; Wed, 27 Apr 2005 12:15:49 +0200
Received: from 76.80-203-227.nextgentel.com ([80.203.227.76])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2005 12:15:48 +0200
Received: from mru by 76.80-203-227.nextgentel.com with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2005 12:15:48 +0200
From: =?iso-8859-1?q?M=E5ns_Rullg=E5rd?= <mru@inprovide.com>
Date: Wed, 27 Apr 2005 12:20:15 +0200
Message-ID: <yw1xacnkseqo.fsf@ford.inprovide.com>
References: <20050427043822.GI15110@monhost.curriculum.edu.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] Re: LVM2 on RAID
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

cpurn@cpurn.net (Christian Purnomo) writes:

> Hi All
>
> I use gentoo, lvm2, raid (lvm on top of raid-1).  My problem is that
> the kernel doesn't automatically detect my /dev/md[2-8] as the
> partitions are set to 8e (LVM2) instead of 0xFD ... the solution I
> have at the moment is to append md=2,/dev/sdXY,/dev/sdAB and so
> forth to my grub.conf.
>
> Is it safe to change the partition types from 8e to 0xFD? will I
> break my lvm?

It should be safe.  That's how I have mine set up.

-- 
M�ns Rullg�rd
mru@inprovide.com
