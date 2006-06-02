Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k52Hhu6q013150
	for <linux-lvm@redhat.com>; Fri, 2 Jun 2006 13:43:56 -0400
Received: from conterra.de (vvv.conterra.de [212.124.44.162])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k52Hhlgk025935
	for <linux-lvm@redhat.com>; Fri, 2 Jun 2006 13:43:48 -0400
Received: from localhost (unknown [127.0.0.1])
	by conterra.de (-) with ESMTP id 723831F404E
	for <linux-lvm@redhat.com>; Fri,  2 Jun 2006 19:43:41 +0200 (CEST)
Received: from conterra.de ([127.0.0.1])
	by localhost (vvv.conterra.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 15807-05 for <linux-lvm@redhat.com>;
	Fri,  2 Jun 2006 19:43:36 +0200 (CEST)
Message-ID: <448078C7.5040702@conterra.de>
Date: Fri, 02 Jun 2006 19:43:35 +0200
From: =?ISO-8859-1?Q?Dieter_St=FCken?= <stueken@conterra.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Bringing an existing filesystem under LVM2 control
References: <20060601134048.GJ10603@agk.surrey.redhat.com>
In-Reply-To: <20060601134048.GJ10603@agk.surrey.redhat.com>
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

Alasdair G Kergon wrote:
> LVM2 needs to use for itself just one sector on the device (for a label).
> By default this is the second sector - ext2 and ext3, for example, don't 
> use this sector.  But some bootloaders might - check first.

If the FS resides on the first partition it usually starts at some offset
of 63 sectors. So, if you simply erase the partition table and use hda
for the PV, you may use this space for LVM. Don't know, if this is big
enough, as I normally see "pe_start = 384".

Is there any brief description around about how a PV header is organized,
or do I have to analyze the LVM source code for this?

Dieter.
