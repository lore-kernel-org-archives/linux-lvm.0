Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j6TLR8V31761
	for <linux-lvm@redhat.com>; Fri, 29 Jul 2005 17:27:08 -0400
Received: from omx3.sgi.com (omx3-ext.sgi.com [192.48.171.20])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j6TLR5MW013886
	for <linux-lvm@redhat.com>; Fri, 29 Jul 2005 17:27:05 -0400
Received: from nodin.corp.sgi.com (fddi-nodin.corp.sgi.com [198.29.75.193])
	by omx3.sgi.com (8.12.11/8.12.9/linux-outbound_gateway-1.1) with ESMTP
	id j6TM6AvR032224
	for <linux-lvm@redhat.com>; Fri, 29 Jul 2005 15:06:10 -0700
Received: from [192.26.74.95] (janus.corp.sgi.com [192.26.74.95])
	by nodin.corp.sgi.com (SGI-8.12.5/8.12.10/SGI_generic_relay-1.2) with
	ESMTP id j6TLR1bT97061940
	for <linux-lvm@redhat.com>; Fri, 29 Jul 2005 14:27:01 -0700 (PDT)
Message-ID: <42EA9F25.20608@deadhookers.org>
Date: Fri, 29 Jul 2005 14:27:01 -0700
From: Eric Wagar <eric@deadhookers.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] best way to make lv with 3 500G luns
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
To: LVM <linux-lvm@redhat.com>

What are the steps to create a volume comprised of 3 500G SGI TP9500 
LUNS on SLES9?

I'm only able to get as far as pvcreate.  Afterwards, I am unable to 
create a visible vg.  By that I mean, I receive no error when I issue 
vgcreate, but I am unable to vgdisplay the new vg.

This is on SLES9/SN2 with two module SGI A350 and using two FC paths.

thanks
eric
