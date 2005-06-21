Received: from dhcp59-169.rdu.redhat.com
	(IDENT:U2FsdGVkX19cuoUP1m/Du+FO8u6JuSleJ9lrWbPVT6s@dhcp59-169.rdu.redhat.com
	[172.16.59.169])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id j5LIvcjp009158
	for <linux-lvm@redhat.com>; Tue, 21 Jun 2005 14:57:38 -0400
From: Kent Baxley <kbaxley@redhat.com>
Date: Tue, 21 Jun 2005 14:57:08 -0400
Message-Id: <1119380228.17686.38.camel@dhcp59-169.rdu.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] calculating metadatasize
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

Is there any way to calculate how large you need to have --metadatasize
when creating a physical volume using pvcreate?  
-- 
Kent Baxley
Technical Account Manager
Global Support Services
Red Hat, Inc.
1-888-REDHAT1 (733-4281) ext. 44137
