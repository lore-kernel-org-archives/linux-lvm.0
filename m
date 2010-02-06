Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o161gRHq003278
	for <linux-lvm@redhat.com>; Fri, 5 Feb 2010 20:42:27 -0500
Received: from smtp.iplink.net (smtp.iplink.net [192.139.81.186])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o161gBPY025372
	for <linux-lvm@redhat.com>; Fri, 5 Feb 2010 20:42:12 -0500
Received: from [192.168.1.108] (unknown [206.108.5.162])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.iplink.net (Postfix) with ESMTP id 06D9BA625AB
	for <linux-lvm@redhat.com>; Fri,  5 Feb 2010 20:42:06 -0500 (EST)
Message-ID: <4B6CC8ED.2070107@alteeve.com>
Date: Fri, 05 Feb 2010 20:42:05 -0500
From: Madison Kelly <linux@alteeve.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] pvscan connect() failed on local socket: Connection
	refused
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hi all,

   I've got a two-node Xen cluster I am trying to setup with a DRBD 
partition under an LVM pv. My layout is:

* Both node's hard drive is a PV used by one VG.
* Each node has the host OS  (dom0) install on an LV using a small 
portion of the available space.
* The majority of the space is assigned to an LV on either node that 
DRBD uses.
* The DRBD partition is itself setup as a new PV.

   The problem is; Once I setup '/dev/drbd0' as a VG, I had to enable 
cluster-aware mode by changing lvm.conf to:

filter = [ "a|drbd.*|", "r|.*|" ]
locking_type = 3

   And then running:

lvmconf --enable-cluster

   After that, when I run 'pvscan', I get this output on both nodes:

[root@an_san02 ~]# pvscan
   connect() failed on local socket: Connection refused
   WARNING: Falling back to local file-based locking.
   Volume Groups with the clustered attribute will be inaccessible.
   PV /dev/drbd0                      lvm2 [399.99 GB]
   Total: 1 [399.99 GB] / in use: 0 [0   ] / in no VG: 1 [399.99 GB]

   How can I tell what or where the connection is failing? It *should* 
be going over 'eth1' on both nodes which is outside of Xen's control. 
I've also checked iptables and I don't see any relevant rules (I've 
flushed the tables and there is only now Xen-related bridging rules). 
Also, I can ping the other node over the dedicated DRBD interfaces.

   Thanks for any insight!

Madi
