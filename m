Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0FF5NO27770
	for <linux-lvm@redhat.com>; Sat, 15 Jan 2005 10:05:23 -0500
Received: from postfix3-1.free.fr (postfix3-1.free.fr [213.228.0.44])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j0FF5ElZ031153
	for <linux-lvm@redhat.com>; Sat, 15 Jan 2005 10:05:14 -0500
Received: from scorpion (unknown [82.227.230.101])
	by postfix3-1.free.fr (Postfix) with ESMTP id 584C61734C5
	for <linux-lvm@redhat.com>; Sat, 15 Jan 2005 16:05:14 +0100 (CET)
Date: Sat, 15 Jan 2005 16:05:22 +0100
From: Stephane Dupuis <hoper@free.fr>
Message-ID: <87991128.20050115160522@free.fr>
Subject: Re[2]: [linux-lvm] understanding large LVM volumes
In-Reply-To: <415694421.20050115033804@e-liberty.pl>
References: <41E80382.1000403@svs.gsfc.nasa.gov>
	<1266458715.20050114224006@free.fr>
	<415694421.20050115033804@e-liberty.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: hoper@free.fr,
	LVM general discussion and development <linux-lvm@redhat.com>
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


Hi again,

> Unfortunatly man pages R not 100% compilant with latest of LVM.
> Buy hey, they are not right about limits, so we should be happy ;]

So, you were saying that there is really no limit with lvm2 ??!
I'm really impress because lot's of non free operating systems still
have lot's of limitations ! (just look at AIX..)

So can you confirm this :

* No limit for the number of PE in a LV (You already said yes)
* No limit for the number of PV in a VG ?
* No limit for the number of LV in ONE VG ?
* No limit for the number of LV (all VG included) ? (256 before ?)

Thanks a lot.

BTW, I also think that theses informations are quite important,
I guess that a chart with all limits and differences between LVM1
and LVM2 can help lot's of people...
I would be glad to make theses documents but I don't have the
knowledge :(
