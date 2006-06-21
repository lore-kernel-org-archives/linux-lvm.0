Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5LAqexE010562
	for <linux-lvm@redhat.com>; Wed, 21 Jun 2006 06:52:40 -0400
Received: from conterra.de (vvv.conterra.de [212.124.44.162])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k5LAqSqD014421
	for <linux-lvm@redhat.com>; Wed, 21 Jun 2006 06:52:34 -0400
Received: from localhost (unknown [127.0.0.1])
	by conterra.de (-) with ESMTP id 3020F1F404E
	for <linux-lvm@redhat.com>; Wed, 21 Jun 2006 12:52:22 +0200 (CEST)
Received: from conterra.de ([127.0.0.1])
	by localhost (vvv.conterra.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 32438-01 for <linux-lvm@redhat.com>;
	Wed, 21 Jun 2006 12:52:10 +0200 (CEST)
Message-ID: <449924D9.9090007@conterra.de>
Date: Wed, 21 Jun 2006 12:52:09 +0200
From: =?ISO-8859-1?Q?Dieter_St=FCken?= <stueken@conterra.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] pvdisplay -m
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

is "pvdisplay -m" still unimplemented?

After I turned to a hardware raid5 system my PVs become
quite HUGE (about 2-4 TB  each!). This huge PVs easily
get fragmented. If I want to pvmove some LV it often does not
work by default. The huge PV has space to hold the additional
LV, but it is not contiguous, and "--alloc anywhere" won't
split a contiguous chunk to fit into smaller gaps. (and the
algorithm to do so is not trivial, even if it sounds easy).

So I frequently end up with a desk calculator to analyze my
/etc/lvm/backup/ metadata to extract a list of occupied and
free ranges on my PV to express pvmove commands with explicit
PE ranges.

To make this easier, I would propose the following extensions:

Some command/option to print out the layout of a PV including
the free gaps.

Extend the --units option to display LE counts. (one could use "e",
but I don't know, how long it takes until we need to express sizes
as exabytes :-) 

Express LE ranges by a "+" like /dev/sda:1000+500 as a shortcut
for /dev/sda:1000-1499.

btw: is there a more detailed description about how pvmove exactly
behaves when giving multiple source and/or target ranges?
--> can I explicitly express the splitting of source chunks into
target fragments by a single pvmove command?

If someone agrees that this is useful, I may start trying to
implement this and propose some patches.

Dieter.
