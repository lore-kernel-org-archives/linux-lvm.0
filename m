Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6CA3KeX001783
	for <linux-lvm@redhat.com>; Wed, 12 Jul 2006 06:03:20 -0400
Received: from conterra.de (vvv.conterra.de [212.124.44.162])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k6CA3ELi021828
	for <linux-lvm@redhat.com>; Wed, 12 Jul 2006 06:03:14 -0400
Received: from localhost (unknown [127.0.0.1])
	by conterra.de (-) with ESMTP id 2EC601F4045
	for <linux-lvm@redhat.com>; Wed, 12 Jul 2006 12:03:08 +0200 (CEST)
Received: from conterra.de ([127.0.0.1])
	by localhost (vvv.conterra.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 17273-08 for <linux-lvm@redhat.com>;
	Wed, 12 Jul 2006 12:02:57 +0200 (CEST)
Message-ID: <44B4C8D0.4050203@conterra.de>
Date: Wed, 12 Jul 2006 12:02:56 +0200
From: =?ISO-8859-15?Q?Dieter_St=FCken?= <stueken@conterra.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Whats happens? -> remove first phy disk from lvm
References: <1152697054.5934.3.camel@localhost.localdomain>
In-Reply-To: <1152697054.5934.3.camel@localhost.localdomain>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Denny Schierz wrote:
> i created a lvm volume over two partitions, hda8 and hdc8. Now hda8 is
> broken and have to replace the disk. 
> 
> on the lvm where several files. My questions, if i create a volume over
> more than one partition, is that a stipe? Or does lvm use the first
> partition, than the second?

have a look into /etc/lvm/backup/ to see how your VG was organized.

> on the lvm where several files.

You mean several "LVs"? If you have one big LV spread over both disks
it will be difficult to restore any files from the broke file system
within that LV.

Consider using smartmontools to monitor disk errors before it fails completely.

http://smartmontools.sourceforge.net/

Dieter.
