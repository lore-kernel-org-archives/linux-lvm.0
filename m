Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAML2dr30535
	for <linux-lvm@redhat.com>; Mon, 22 Nov 2004 16:02:39 -0500
Received: from main.gmane.org (main.gmane.org [80.91.229.2])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iAML2SjA020427
	for <linux-lvm@redhat.com>; Mon, 22 Nov 2004 16:02:34 -0500
Received: from list by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 1CWLKN-0008GA-00
	for <linux-lvm@redhat.com>; Mon, 22 Nov 2004 22:02:27 +0100
Received: from 76.80-203-227.nextgentel.com ([80.203.227.76])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Mon, 22 Nov 2004 22:02:27 +0100
Received: from mru by 76.80-203-227.nextgentel.com with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Mon, 22 Nov 2004 22:02:27 +0100
From: =?iso-8859-1?q?M=E5ns_Rullg=E5rd?= <mru@inprovide.com>
Date: Mon, 22 Nov 2004 22:02:23 +0100
Message-ID: <yw1xwtwdwqao.fsf@ford.inprovide.com>
References: <41A250A0.5060702@ercwc.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] Re: lvextend error on XFS
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

"Frank J. Buchholz" <frankb@ercwc.org> writes:

> Hello,
>
> I recently attempted to extend my logical volume.  First I added an
> additional physical volume to an existing volume group.  This worked
> fine.
>
> vgextend Volume00 /dev/sba
> lvextend -L+100G /dev/Volume00/LogVol00
>
> However when it came time to run the lvextend command I received a
> number of  device-mapper errors.  While I was trying to determine what
> the errors were I noticed that the filesystem that sits on the logical
> volume being extended was no longer available.  I attempted to umount
> the filesystem however the command froze.  I then rebooted the system
> without mounting the filesystem in question and manually mounted the
> filesystem. XFS reported back that it could not locate the superblock.

I have done lvextend followed by xfs_growfs many times without any
problems.  Have you checked for hardware errors?

-- 
M�ns Rullg�rd
mru@inprovide.com
