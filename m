Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n86IkWMu010893
	for <linux-lvm@redhat.com>; Sun, 6 Sep 2009 14:46:32 -0400
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n86IkGkU032766
	for <linux-lvm@redhat.com>; Sun, 6 Sep 2009 14:46:17 -0400
Received: from johann (chello212017090083.12.15.vie.surfer.at [212.17.90.83])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTPSA id 3C91B1012A98
	for <linux-lvm@redhat.com>; Sun,  6 Sep 2009 20:46:15 +0200 (CEST)
Date: Sun, 6 Sep 2009 20:46:14 +0200
From: Lars Ellenberg <lars.ellenberg@linbit.com>
Subject: Re: [linux-lvm] Inode usage on lvm volumes?
Message-ID: <20090906184614.GB9722@johann>
References: <4AA3EB65.40909@Media-Brokers.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4AA3EB65.40909@Media-Brokers.com>
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

On Sun, Sep 06, 2009 at 01:03:33PM -0400, Charles Marcus wrote:
> Hello,
> 
> I've googled for an hour now and cannot find an answer to this question...
> 
> I'm on gentoo linux, and when I run:
> 
> df -i
> 
> I get a list of inode usage for everything except my lvm volumes - they
> show zeros all the way across:
> 
> /dev/sda3            2501856   11865 2489991    1% /
> udev                  257496    4956  252540    2% /dev
> /dev/sda4            8437760      11 8437749    1% /backups
> /dev/mapper/vg2-home       0       0       0    -  /home
> /dev/mapper/vg2-usr        0       0       0    -  /usr
> /dev/mapper/vg2-var        0       0       0    -  /var
> 

do a "df -T -i"
and I bet it will show that you are using ext3 for / and /backups,
tmpfs for /dev, and reiserfs for those "zero inode" volumes.

> Is this normal? If so, how do I check inode usage on an lvm volume?

In which case that is normal, yes.
Reiserfs simply puts its inodes anywhere, until there is no more space.
It does not have any notion of "total" inodes, thus there are no
"free" inodes, either.  It probably knows the number of used inodes.
But because statfs() does only provide for "total" and "free",
and leaves "used" to be calculated, there is no way to return that info.


-- 
: Lars Ellenberg
: LINBIT | Your Way to High Availability
: DRBD/HA support and consulting http://www.linbit.com

DRBD� and LINBIT� are registered trademarks of LINBIT, Austria.
