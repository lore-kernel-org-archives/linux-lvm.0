Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3LG4Lp21263
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2004 12:04:21 -0400
Received: from vega.voltaire.com ([212.143.27.73])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i3LG4JMc005383
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2004 12:04:20 -0400
Message-ID: <2F75AEE4E86FDE44BF97709D289BAA7C719752@vega.voltaire.com>
From: Dan Bar Dov <danb@voltaire.com>
Date: Wed, 21 Apr 2004 19:04:13 +0300
MIME-Version: 1.0
Subject: [linux-lvm] LVM and multiple HBA ports
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

I have a problem using two (or more) ports connected to the same storage.

Linux does not identify that the two LUNs it discovers is actually the same.
When I create a PV all is well. 
The PV gets created and is ACTIVE. However, through the other port, the PV
is also discovered, but is marked INACTIVE in the LVM database.

When I try to create a VG using the active path, LVM scans all PVs in order.
If it finds the INACTIVE instance first, the VG creation fails.

I'm using LVM 1.0.3, please let mw know if such a situation (connecting
storage through multiple ports) is handled better in another version, or
suggest how to overcome the problem.

Thanks,
Dan
