Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7HCrdV26845
	for <linux-lvm@redhat.com>; Wed, 17 Aug 2005 08:53:39 -0400
Received: from hotmail.com (bay14-f2.bay14.hotmail.com [64.4.49.2])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j7HCrW2m017864
	for <linux-lvm@redhat.com>; Wed, 17 Aug 2005 08:53:33 -0400
Message-ID: <BAY14-F2DA521B6C0F2AAA1EEA01FEB30@phx.gbl>
In-Reply-To: <BAY14-F31384BD73E2425F096A5B3FEB00@phx.gbl>
From: "Satish Raghunath" <satish_raghunath@hotmail.com>
Date: Wed, 17 Aug 2005 12:53:26 +0000
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
by an "open" on the COW device. Where is the metadata on the disk?

Any help will be highly appreciated.

Thank you,
Satish

_________________________________________________________________
Search, meet and marry from millions on 
http://www.bharatmatrimony.com/cgibin/tracking.php?section=tagoff&siteurlsite=msn&domain=1&landing=cobrandbm.pl&creative=bm_aug05_text 
link_tagoff&referredby=716324 BharatMatrimony.com 
http://www.bharatmatrimony.com/
