Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3M2Xip02671
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2004 22:33:44 -0400
Received: from mail.execflight.com (207.66.193.130.nwinternet.com
	[207.66.193.130] (may be forged))
	by mx3.redhat.com (8.12.10/8.12.10) with SMTP id i3M2XhMc022812
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2004 22:33:43 -0400
From: sterling@zixion.com
Subject: Re: [linux-lvm] SuSe 8 Enterprise version, LVM and Oracle
Date: Wed, 21 Apr 2004 19:33:33 -0700
References: <1935187734.20040421215725@sanderscorner.com>
In-Reply-To: <1935187734.20040421215725@sanderscorner.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Message-Id: <200404211933.33673.sterling@zixion.com>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

> Hi,
>
> For a client I intend to install SuSe 8 and Oracle with LVM. Are there
> any known issues with LVM in this combination?
>
> Thanks in advance.

We have used SLES 8 and LVM for about a year now and it works great. We 
recently upgraded to LVM2 due to a drive failure that took out an entire 
400Gig spanned Volume Group. Ouch!

The VG was spanned across two 200Gig disks. The first disk failed and left the 
entire VG unusable. LVM2 uses meta-data stores and allows you to mount an 
incomplete VG ( one that is missing pv's ) to aid in recovering data.

LVM and SLES 8 have been great.

Sterling.
