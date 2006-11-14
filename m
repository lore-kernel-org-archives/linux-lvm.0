Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kAEIL5JH007163
	for <linux-lvm@redhat.com>; Tue, 14 Nov 2006 13:21:05 -0500
Received: from mail8.sea5.speakeasy.net (mail8.sea5.speakeasy.net
	[69.17.117.10])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id kAEIL3hD019396
	for <linux-lvm@redhat.com>; Tue, 14 Nov 2006 13:21:03 -0500
Date: Tue, 14 Nov 2006 13:20:57 -0500 (EST)
From: Matt McHenry <jerith@speakeasy.org>
Subject: Re: [linux-lvm] lvcreate gives 'device-mapper: reload ioctl failed:
	Invalid argument'
In-Reply-To: <20061114180125.GG30653@agk.surrey.redhat.com>
Message-ID: <Pine.LNX.4.58.0611141318040.18875@shell3.speakeasy.net>
References: <Pine.LNX.4.64.0611140009360.7393@localhost>
	<20061114180125.GG30653@agk.surrey.redhat.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alasdair G Kergon <agk@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>


> Now look in your kernel message log for a slightly more detailed error
> message.

Nov 13 20:03:03 [kernel] device-mapper: table: device 8:11 too small for target
Nov 13 20:03:03 [kernel] device-mapper: table: 254:11: linear: dm-linear: Device lookup failed
Nov 13 20:03:03 [kernel] device-mapper: ioctl: error adding target to table

# pvs -o +dev_size
  PV         VG        Fmt  Attr PSize  PFree   DevSize
  /dev/sda10 maingroup lvm2 a-   38.15G 516.00M  38.16G
  /dev/sda11 maingroup lvm2 a-   38.15G  23.15G  19.08G
  /dev/sda12 maingroup lvm2 a-   19.07G  19.07G  19.07G
  /dev/sda6  maingroup lvm2 a-   19.08G      0   19.08G
  /dev/sda7  maingroup lvm2 a-   38.15G      0   38.16G
  /dev/sda8  maingroup lvm2 a-   76.30G      0   76.31G
  /dev/sda9  maingroup lvm2 a-   76.30G      0   76.31G

----------------------
Matt McHenry
http://www.speakeasy.org/~jerith/
jerith@speakeasy.org
be052@scn.org
