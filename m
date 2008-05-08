Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m488vt8e024426
	for <linux-lvm@redhat.com>; Thu, 8 May 2008 04:57:55 -0400
Received: from out3.laposte.net (out4.laposte.net [193.251.214.121])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m488vWgW012262
	for <linux-lvm@redhat.com>; Thu, 8 May 2008 04:57:32 -0400
Received: from meplus.info (localhost [127.0.0.1])
	by mwinf8318.laposte.net (SMTP Server) with ESMTP id 39E51E000087
	for <linux-lvm@redhat.com>; Thu,  8 May 2008 10:57:27 +0200 (CEST)
Received: from [192.168.28.96] (mar75-4-82-227-64-98.fbx.proxad.net
	[82.227.64.98])
	by mwinf8318.laposte.net (SMTP Server) with ESMTP id 1129BE000082
	for <linux-lvm@redhat.com>; Thu,  8 May 2008 10:57:26 +0200 (CEST)
Message-ID: <4822C057.60409@laposte.net>
Date: Thu, 08 May 2008 10:56:55 +0200
From: xdub <xdub@laposte.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] device /dev/sdb1 not found or ignored by filtering
References: <4821C3F1.6000108@saros.fr>
In-Reply-To: <4821C3F1.6000108@saros.fr>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi,

No sure what you want to do with your 2 raid1 arrays... and
why you want to incorporate the first one into LV (?).

Did you partition your second array ? if not, you can create a PV
like this: pvcreate /dev/sdb. "pvcreate" can initialize a disk or partition.

    - pvcreate /dev/sdb
    - vgcreate vg00 /dev/sdb

Again, no sure what you want to do, but with 4 HD you should consider
to build raid5 (hardware raid) and then create PV, VG, LV.

Regards


Gilles Guiot wrote:
> Hello Everybody
>
> I have two raid 1 arrays on a Dell PowerEdge 2950,
> 1) 2*500 Go
> 2) 2*750 Go
>
> I need to use LVM, to create a LV on the second raid array, in which i 
> will afterwards incorporate the first raid array. I have the latest 
> debian distro installed, with kernel updates, and LVM2 is installed.
>
> I encounter my first problem when typing pvcreate /dev/sdb1. ( the 
> partition of the second raid array) I get the message :
> device /dev/sdb1 not found or ignored by filtering
> I checked /etc/lvm/lvm.conf, and I commented out the line about the 
> filter.
> After a reboot, no more luck. I tried to circumvent the problem by 
> booting with an ubuntu CD, but i get the same error message.
> Could anybody tip me about what's wrong and more importantly suggest 
> solutions to me ? :-)
>
> Thanks a lot in advance.
>
>
