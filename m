Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4MFR6Im004149
	for <linux-lvm@redhat.com>; Mon, 22 May 2006 11:27:06 -0400
Received: from chaos.chaos.ao.net (root@chaos.ao.net [208.5.40.6])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k4MFQxf1024618
	for <linux-lvm@redhat.com>; Mon, 22 May 2006 11:27:00 -0400
Message-ID: <4471D65D.3090908@chaos.ao.net>
Date: Mon, 22 May 2006 11:18:53 -0400
From: "Harik A'ttar" <harik@chaos.ao.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Removing a Bad disk from LVM w/o a new disk
References: <1148307855.28182.4.camel@neuromancer.home.net>
In-Reply-To: <1148307855.28182.4.camel@neuromancer.home.net>
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
Cc: Ow.Mun.Heng@wdc.com

Ow Mun Heng wrote:
> Current situation is that I have a bad disk /dev/sdb1 in an existing lvm
> partition. (sda1/sda4/sdb1)
> 
> I would like to remove it from the VG. (There are no free PE anywhere.
> I've maxed it out.)
> 
> I've already reduced the existing VG to the size of sda1+sda4
> partition. 

> $vgreduce storage /dev/sdb1
> Physical volume "/dev/sdb1" still in use

You mean you reduced the existing LVs?

Try this:

pvmove -v /dev/sdb1

That will move all the data off sdb1 to the other drives.  You need 
dm-mirror either compiled in your kernel or as a module to use it.

Read the manpage for more information.
