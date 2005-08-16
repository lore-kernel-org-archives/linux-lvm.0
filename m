Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7GNbYV19103
	for <linux-lvm@redhat.com>; Tue, 16 Aug 2005 19:37:34 -0400
Received: from hotmail.com (bay14-f31.bay14.hotmail.com [64.4.49.31])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j7GNbNOl020226
	for <linux-lvm@redhat.com>; Tue, 16 Aug 2005 19:37:23 -0400
Message-ID: <BAY14-F31384BD73E2425F096A5B3FEB00@phx.gbl>
From: "Satish Raghunath" <satish_raghunath@hotmail.com>
Date: Tue, 16 Aug 2005 23:37:17 +0000
Mime-Version: 1.0
Subject: [linux-lvm] Metadata location on disk
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi,

I am trying to read metadata off of the COW device. I used "lvcreate -s" to 
create the snapshot and "lvdisplay" indicates that it is active and 
available. I am using hexdump on the newly created /dev/VolGroup00/lvol1 and 
I dont see the structure mentioned in dm-exception-store.c:

37  * The first chunk of the COW device just contains the header.
38  * After this there is a chunk filled with exception metadata,
39  * followed by as many exception chunks as can fit in the
40  * metadata areas.

The first 1024 bytes are all zeros. When I skip a chunk (lvdisplay indicates 
that the chunk size is 8192 bytes), I dont see the magic byte-string. Am I 
understanding this wrong? I get a similar result when I use "read" followed 
by an "open" on the COW device.

Any help will be highly appreciated.

Thank you,
Satish

_________________________________________________________________
Enjoy Austria. http://www.coxandkings.com Only with Cox & Kings
