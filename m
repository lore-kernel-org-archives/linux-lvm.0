Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j1BKW6O17131
	for <linux-lvm@redhat.com>; Fri, 11 Feb 2005 15:32:06 -0500
Received: from kopparhuset.net (tp2internet.comun.org [212.75.75.26] (may be
	forged))
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j1BKVxg0004871
	for <linux-lvm@redhat.com>; Fri, 11 Feb 2005 15:32:00 -0500
Message-ID: <420D1635.7020503@webhackande.se>
Date: Fri, 11 Feb 2005 21:31:49 +0100
From: Rickard Olsson <richie@webhackande.se>
MIME-Version: 1.0
Subject: Re: [linux-lvm] waah waah - disaster recovery
References: <0B834CEE3453504B82AB821DFB7047C1FF0487@enyc11p32003.corpny.csfb.com>
In-Reply-To: <0B834CEE3453504B82AB821DFB7047C1FF0487@enyc11p32003.corpny.csfb.com>
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

Rosenstrauch, David wrote:

> Basically just dd the data from the partition on the bad disk to the partition
> on the new disk (e.g., "dd if=/dev/hda2 of=/dev/hdb3").

dd_rescue.

http://freshmeat.net/projects/ddrescue/
http://www.gnu.org/software/ddrescue/ddrescue.html

Nice feature: If the OP still had had the first disk, he could have run 
dd_rescue on *both* disks (since they were copies of each other) and in 
effect recovered all data that was still readable on *either* disk 
(unless disk #1 was totally dead, of course).



The Gentoo LiveCD has LVM2 support.

http://www.gentoo.org/doc/en/lvm2.xml

     / Rickard Olsson,IT-Konsult/
    / Telefon: +46 70 635 01 42/
   / http://www.webhackande.se/
