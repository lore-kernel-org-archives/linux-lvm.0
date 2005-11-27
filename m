Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jARD7kV17658
	for <linux-lvm@redhat.com>; Sun, 27 Nov 2005 08:07:46 -0500
Received: from viefep14-int.chello.at (viefep14-int.chello.at [213.46.255.13])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jARD7Tnd011039
	for <linux-lvm@redhat.com>; Sun, 27 Nov 2005 08:07:30 -0500
Received: from AthLux.PrivateLAN.at ([84.114.151.31]) by viefep14-int.chello.at
	(InterMail vM.6.01.04.04 201-2131-118-104-20050224) with ESMTP id
	<20051127130721.KGOV2167.viefep14-int.chello.at@AthLux.PrivateLAN.at>
	for <linux-lvm@redhat.com>; Sun, 27 Nov 2005 14:07:21 +0100
From: Matthias Meyer <Matthias.Meyer@gmx.li>
Subject: Re: [linux-lvm] can t resize my lvm
Date: Sun, 27 Nov 2005 14:07:20 +0100
References: <200511211934.13943.Matthias.Meyer@gmx.li>
	<200511252121.26572.Matthias.Meyer@gmx.li>
In-Reply-To: <200511252121.26572.Matthias.Meyer@gmx.li>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200511271407.20335.Matthias.Meyer@gmx.li>
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

Am Freitag 25 November 2005 21:21 schrieb Matthias Meyer:
> vdr:~# lvextend -l 1115 /dev/LVM2/Media /dev/hdc1
> vdr:~# e2fsadm -v -l 1115 /dev/LVM2/Media

reading man-page e2fsadm exactly ;-)
       it can extend the logical   volume   and   grow  the  filesystem

Therefore I try:
vdr:~# lvreduce -l 744 /dev/LVM2/Media
vdr:~# e2fsadm -v -l 1115 /dev/LVM2/Media

and it will work.

Thanks for all of your hints and for your help :-)
-- 
Don't Panic
