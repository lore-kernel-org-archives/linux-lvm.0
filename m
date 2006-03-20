Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k2KCEw129652
	for <linux-lvm@redhat.com>; Mon, 20 Mar 2006 07:14:58 -0500
Received: from conterra.de (vvv.conterra.de [212.124.44.162])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k2KCEpSp018939
	for <linux-lvm@redhat.com>; Mon, 20 Mar 2006 07:14:52 -0500
Received: from localhost (unknown [127.0.0.1])
	by conterra.de (-) with ESMTP id 8829D1F4226
	for <linux-lvm@redhat.com>; Mon, 20 Mar 2006 13:14:45 +0100 (CET)
Received: from conterra.de ([127.0.0.1])
	by localhost (vvv.conterra.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 15147-09 for <linux-lvm@redhat.com>;
	Mon, 20 Mar 2006 13:14:35 +0100 (CET)
Message-ID: <441E9CA9.1030603@conterra.de>
Date: Mon, 20 Mar 2006 13:14:33 +0100
From: =?ISO-8859-15?Q?Dieter_St=FCken?= <stueken@conterra.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] migration to hardware raid
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
To: linux-lvm@redhat.com

I run 3 VGs of 1-3TB each and I'm about to migrate them to a hardware 
raid (3ware). Using individual disks, expanding my VGs was easy. Using
hardware raid, it get a single huge PV instead, that simply grows, if
I ever extend the underlaying raid. From the previous discussions it 
seems, "pvresize" is still beta, but will be available soon.

Alternatively I may think of creating partitions on this raid-PV. Thus I 
will get additional PVs (partitions) when growing my raid. But I dislike 
to depend on this stone-aged DOS-partitioning system (if it is capable 
to handle 4-10Tb disks at all). Should I consider other partition systems?

After the decision to use or not to use partitioning, it will be 
difficult to change it on later.

Any advice?

BTW:
I'm using an PE-size of 32MB (and lvm2 of course). Does this limit my 
max VG size? I already find one of my VGs with a "total PE 0 = 71538", 
thus it seems not to be limited to 65536, as with LVM1, any more.

Dieter.
