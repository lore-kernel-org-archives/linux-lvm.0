Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t38GQ0hc017730
	for <linux-lvm@redhat.com>; Wed, 8 Apr 2015 12:26:01 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
	[66.111.4.28])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t38GPtwc006230
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Wed, 8 Apr 2015 12:25:56 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 9FF9620AE3
	for <linux-lvm@redhat.com>; Wed,  8 Apr 2015 12:25:51 -0400 (EDT)
Message-Id: <1428510355.895040.250833725.003F7620@webmail.messagingengine.com>
From: lyndat3@your-mail.com
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20150408085334.725013jx13pxhfr2@webmail.uniserve.com>
References: <1428468634.31919.250585153.41525C63@webmail.messagingengine.com>
	<5525331B.20604@redhat.com>
	<1428506200.875940.250771177.6EF89B58@webmail.messagingengine.com>
	<20150408085334.725013jx13pxhfr2@webmail.uniserve.com>
Date: Wed, 08 Apr 2015 09:25:55 -0700
Subject: Re: [linux-lvm] unable to lvcreate _new_ LVs on existing VG with
 existing LVs and plenty of room?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Marian Csontos <mcsontos@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>



On Wed, Apr 8, 2015, at 06:54 AM, Marian Csontos wrote:
> Is it a home-brewed kernel? Have you tried with a different one?

I was able to find, install an older kernel

uname -rm
 3.16.7-7-default x86_64

It makes no difference.  Still can't create the LV

vcreate -L 30G -n LV_TEST /dev/VG0
  /dev/md1: lseek 18446744071795900416 failed: Invalid argument

LT
