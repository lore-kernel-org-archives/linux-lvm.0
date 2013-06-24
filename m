Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r5O7KxF4021241
	for <linux-lvm@redhat.com>; Mon, 24 Jun 2013 03:20:59 -0400
Received: from nm24.access.bullet.mail.sp2.yahoo.com
	(nm24.access.bullet.mail.sp2.yahoo.com [98.139.44.151])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5O7KxN2019157
	for <linux-lvm@redhat.com>; Mon, 24 Jun 2013 03:20:59 -0400
Message-ID: <1372058457.24923.YahooMailBasic@web181506.mail.ne1.yahoo.com>
Date: Mon, 24 Jun 2013 00:20:57 -0700 (PDT)
From: matthew patton <pattonme@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] how to detect and take action on failed extents?
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I was thinking about emulating (loosely) the dispersed allocation of extents when creating an LV like 3Par does. But then I wondered, how do I detect when a PV (and thus sections of an LV) goes offline either partially or entirely? Obviously the lower level block level will throw errors, but does that necessarily mean the entire LV is marked bad even though only a small portion may be unavailable?

Assuming I've layered MD Raid on top of multiple of these "dispersed" LVs, is there a way I can inform MD that a section of the raid component is failed and to rebuild just those affected stripes? My understanding of typical MD behavior is that it expects the entire raid component (eg. a single LV) to be marked bad and to rebuild the entire block device after it's been replaced/fixed. This means an enormous amount of "unnecessary" copying and parity calculation which I'd rather avoid.

The only naive solution I've struck upon is to construct lots of MD devices where there is a direct 1:1 map between LV and PV (eg. raid5 devices of say 4-8GB in size) and then further assemble them into a concatenated device.
