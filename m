Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k597abIP030563
	for <linux-lvm@redhat.com>; Fri, 9 Jun 2006 03:36:37 -0400
Received: from ender.volumehost.net (adsl-69-154-123-202.dsl.fyvlar.swbell.net
	[69.154.123.202])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k597aTsd004097
	for <linux-lvm@redhat.com>; Fri, 9 Jun 2006 03:36:29 -0400
Received: from localhost (localhost [127.0.0.1])
	by ender.volumehost.net (Postfix) with ESMTP id 8AD9014656
	for <linux-lvm@redhat.com>; Fri,  9 Jun 2006 07:35:50 +0000 (UTC)
Received: from ender.volumehost.net ([127.0.0.1])
	by localhost (ender.volumehost.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 07084-09 for <linux-lvm@redhat.com>;
	Fri,  9 Jun 2006 07:35:47 +0000 (UTC)
Received: from ath600.krakrjak.com (ip70-178-219-238.ks.ks.cox.net
	[70.178.219.238])
	(using SSLv3 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by ender.volumehost.net (Postfix) with ESMTP id 8527914045
	for <linux-lvm@redhat.com>; Fri,  9 Jun 2006 07:35:46 +0000 (UTC)
From: Zac Slade <krakrjak@volumehost.net>
Subject: Re: [linux-lvm] Right way to resize LVM Volume on SAN?
Date: Fri, 9 Jun 2006 02:36:16 -0500
References: <4487E578.2060202@alienworld.org> <44882ED2.4050806@alienworld.org>
	<20060608195651.GF548@percy.comedia.it>
In-Reply-To: <20060608195651.GF548@percy.comedia.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200606090236.16205.krakrjak@volumehost.net>
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

On Thursday 08 June 2006 14:56, Luca Berra wrote:
> On Thu, Jun 08, 2006 at 04:06:10PM +0200, Alen Salamun wrote:
> >Thank you. I read that already. And since it only says:
> >
> >"Expand the PV on /dev/sda1 AFTER enlarging the partition with fdisk"
That should probably be more generalized in the documentation.  Instead it 
should say "Expand the PV on /dev/<dev name> AFTER englarging the block 
device.  If the block device is a partition then you will need to enlarge the 
partition utilizing a tool for managing partitions like fdisk."

If the device in LVM is just a SAN backed LU then you really don't need 
partitions on it at all.  This would simplify your setup in the future if you 
just exposed the LU to the server and then just simply pvcreate the entire 
disk next time.  Then when you increase the size of the LU on the SAN you can 
validate its size using blockdev --getsize64 /dev/sda both before and after 
the change.  At that point a simple pvresize will pick up the new size and 
move forward.

Hope that sheds some light.
-- 
Zac Slade
krakrjak@volumehost.net
ICQ:1415282 YM:krakrjak AIM:ttyp99
