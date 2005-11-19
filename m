Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jAJKsfV00735
	for <linux-lvm@redhat.com>; Sat, 19 Nov 2005 15:54:41 -0500
Received: from viefep20-int.chello.at (viefep12-int.chello.at [213.46.255.25])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jAJKseZr027468
	for <linux-lvm@redhat.com>; Sat, 19 Nov 2005 15:54:40 -0500
Received: from AthLux.PrivateLAN.at ([84.114.151.31]) by viefep20-int.chello.at
	(InterMail vM.6.01.04.04 201-2131-118-104-20050224) with ESMTP id
	<20051119205430.GZBS28648.viefep20-int.chello.at@AthLux.PrivateLAN.at>
	for <linux-lvm@redhat.com>; Sat, 19 Nov 2005 21:54:30 +0100
From: Matthias Meyer <Matthias.Meyer@gmx.li>
Subject: Re: [linux-lvm] can t reduce my lvm
Date: Sat, 19 Nov 2005 21:54:32 +0100
References: <200511192142.14779.Matthias.Meyer@gmx.li>
In-Reply-To: <200511192142.14779.Matthias.Meyer@gmx.li>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200511192154.32963.Matthias.Meyer@gmx.li>
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

And afer I try

lvreduce -l-5959 /dev/LVM/Media

all work well:
vdr:~# pvmove /dev/hdd2
pvmove -- no logical volumes on empty source physical volume "/dev/hdd2"

vdr:~# pvmove /dev/hdd1
pvmove -- no logical volumes on empty source physical volume "/dev/hdd1"

vdr:~# vgreduce LVM /dev/hdd1 /dev/hdd2
vgreduce -- doing automatic backup of volume group "LVM"
vgreduce -- volume group "LVM" successfully reduced by physical volumes:
vgreduce -- /dev/hdd1
vgreduce -- /dev/hdd2

-- 
Don't Panic
