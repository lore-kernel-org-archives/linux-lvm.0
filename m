Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p6AHUP4b029280
	for <linux-lvm@redhat.com>; Sun, 10 Jul 2011 13:30:26 -0400
Received: from Ishtar.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p6AHUPm2017330
	for <linux-lvm@redhat.com>; Sun, 10 Jul 2011 13:30:25 -0400
Received: from [192.168.3.140] (Athenae2 [192.168.3.140])
	by Ishtar.tlinx.org (8.14.4/8.14.4/SuSE Linux 0.8) with ESMTP id
	p6AHUFLT031337
	for <linux-lvm@redhat.com>; Sun, 10 Jul 2011 10:30:17 -0700
Message-ID: <4E19E1A7.2080705@tlinx.org>
Date: Sun, 10 Jul 2011 10:30:15 -0700
From: "Linda A. Walsh" <lvm@tlinx.org>
MIME-Version: 1.0
References: <4E16942E.9070204@tlinx.org>	<defbc387-1bad-4241-b8b4-b0f8a04f2cd8@email.android.com>
	<20110709005133.GA6588@redhat.com>
In-Reply-To: <20110709005133.GA6588@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] what use is virtualsize -- or how is it to be used?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>



Ah...of course...

When I create the FS, it will create it the size of the existing FS, 
which is less
efficient that calling "<fs>_extend" after each lv_extend...(presuming 
one is using
a fs with that ability)....(do most these days?  I usually just use xfs 
which does)...
