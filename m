Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5GEKQu24974
	for <linux-lvm@redhat.com>; Thu, 16 Jun 2005 10:20:26 -0400
Received: from gort.hpl.hp.com (gort.hpl.hp.com [192.6.10.17])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j5GEKNAg029364
	for <linux-lvm@redhat.com>; Thu, 16 Jun 2005 10:20:23 -0400
Received: from timmay.hpl.hp.com (timmay-hb.hpl.hp.com [15.144.59.39])
	by gort.hpl.hp.com (8.12.10/8.12.10) with ESMTP id j5GEJpBn023052
	for <linux-lvm@redhat.com>; Thu, 16 Jun 2005 15:19:52 +0100 (BST)
Received: from [127.0.0.1] (dhcp-28-108.hpl.hp.com [15.144.28.108])
	by timmay.hpl.hp.com (8.13.2/8.13.2) with ESMTP id j5GEJgG7019841
	for <linux-lvm@redhat.com>; Thu, 16 Jun 2005 15:19:43 +0100 (BST)
Message-ID: <42B18A7E.9090809@hp.com>
Date: Thu, 16 Jun 2005 15:19:42 +0100
From: Alistair Coles <alistair.coles@hp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] snapshot cow volume location?
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


As far as I can tell (using 2.2.01.09) , using lvcreate to create a 
snapshot results in the snapshot being in the same VG as the source. If 
that is correct, is there any way to force the snapshot to use different 
PV's than the source?

Also, is there a reason why snapshot cow volumes cannot be in a 
different VG than the source volume?

Thanks

Alistair Coles
