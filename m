Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o35Fk6qb018852
	for <linux-lvm@redhat.com>; Mon, 5 Apr 2010 11:46:06 -0400
Received: from EXHUB016-2.exch016.msoutlookonline.net
	(exhub016-2.exch016.msoutlookonline.net [207.5.72.164])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o35Fjr5T017192
	for <linux-lvm@redhat.com>; Mon, 5 Apr 2010 11:45:53 -0400
Message-ID: <4BBA05AB.7050302@cfl.rr.com>
Date: Mon, 5 Apr 2010 11:45:47 -0400
From: Phillip Susi <psusi@cfl.rr.com>
MIME-Version: 1.0
References: <1270478709.31665.99.camel@localhost>
In-Reply-To: <1270478709.31665.99.camel@localhost>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] help to recovering my home volume
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: KiKouN <kikoun@kikoun.org>

On 4/5/2010 10:45 AM, KiKouN wrote:
> I think that size_of_home_part1 is 11008*8192 but I want to know how to
> calculate start_sector_of_home_LV. How to calculate this value ?

It looks like your home lv is split into two segments, one that is 3 GB
long and at the start of the pv, and another segment that is 43 GB long
and elsewhere on the disk.  Did you create the home lv first only 3 GB
in size, then extend it later?

The second segment starts at extent 0, which is at sector 384, and is
768 4 MB segments long, or 768 x 4096 x 2 = 6291456 sectors.  The first
segment starts at extent 5376, which is at sector 5376 x 4096 x 2 + 384
= 44040576 and is 11008 extents or 90177536 sectors long.

These are all relative to the physical volume, which looks like it was
in /dev/sda7.  If you overwrite the partition table then you will need
to figure out where that partition started.

> In the lvm backup file, I don't know what is the value "pe_start" in pv0
> section. What is this value ? 

pe_start is the sector where the first physical extent is.
