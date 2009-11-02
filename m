Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nA2GLjnv003852
	for <linux-lvm@redhat.com>; Mon, 2 Nov 2009 11:21:45 -0500
Received: from oxmail.iplink.net (smtp.iplink.net [192.139.81.186])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nA2GLXi3009956
	for <linux-lvm@redhat.com>; Mon, 2 Nov 2009 11:21:34 -0500
Received: from [10.255.0.237] (fw.iplink.net [192.139.81.98])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by oxmail.iplink.net (Postfix) with ESMTP id E36A1A60E07
	for <linux-lvm@redhat.com>; Mon,  2 Nov 2009 11:21:28 -0500 (EST)
Message-ID: <4AEF038A.50503@alteeve.com>
Date: Mon, 02 Nov 2009 11:06:34 -0500
From: Madison Kelly <linux@alteeve.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] 'pvdisplay' (et. al.?) causes fence loop with DRBD + Xen
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

Hi all,

   I posted a message similar to this on the DRBD mailing list, so I 
apologize up front if this seems like a cross-post. However, after 
sending it I thought that this might be a problem with how I've setup 
LVM to be cluster aware. :)

   I've got a two node cluster with three NICs each running CentOS 5. I 
have LVM running on DRBD with Xen virtual machines. The setup is:

eth0: Back channel + IPMI on internal network
eth1: DRBD dedicated link
eth2: Internet facing link.

   When I setup Xen to *not* virtualize eth0, my cluster is stable. 
However, when I add it, the cluster fences. The nodes will keep fencing 
each other until DRBD breaks. As soon as the array goes into StandAlone 
the fencing stops.

   At that time I can see that all three NICs are setup under Xen 
properly and the cluster is stable. Once I fix DRBD I can see the 
syncing start, however, as soon as I type 'pvdisplay', the call never 
returns and the cluster starts fencing again until the DRBD breaks, at 
which point I am back where I started.

   Now, if I take eh0 back out of Xen control, I can fix the DRBD array 
(on eth1) and the cluster stays stable... This makes no sense to me!

   Below is what the two nodes show in '/var/log/message' when the 
fencing starts:


-=] The First node to get fenced:

Oct 31 00:27:21 vsh02 openais[3133]: [TOTEM] FAILED TO RECEIVE
Oct 31 00:27:21 vsh02 openais[3133]: [TOTEM] entering GATHER state from 6.

-=] The surviving node that fences the other node:

Oct 31 00:35:47 vsh03 openais[3237]: [TOTEM] The token was lost in the 
OPERATIONAL state.
Oct 31 00:35:47 vsh03 openais[3237]: [TOTEM] Receive multicast socket 
recv buffer size (288000 bytes).
Oct 31 00:35:47 vsh03 openais[3237]: [TOTEM] Transmit multicast socket 
send buffer size (262142 bytes).
Oct 31 00:35:47 vsh03 openais[3237]: [TOTEM] entering GATHER state from 2.
Oct 31 00:35:51 vsh03 openais[3237]: [TOTEM] entering GATHER state from 0.
Oct 31 00:35:51 vsh03 openais[3237]: [TOTEM] Creating commit token 
because I am the rep.
Oct 31 00:35:51 vsh03 openais[3237]: [TOTEM] Saving state aru 2c high 
seq received 2c
Oct 31 00:35:51 vsh03 openais[3237]: [TOTEM] Storing new sequence id for 
ring 108
Oct 31 00:35:51 vsh03 openais[3237]: [TOTEM] entering COMMIT state.
Oct 31 00:35:51 vsh03 openais[3237]: [TOTEM] entering RECOVERY state.
Oct 31 00:35:51 vsh03 openais[3237]: [TOTEM] position [0] member 
10.255.135.3:
Oct 31 00:35:51 vsh03 openais[3237]: [TOTEM] previous ring seq 260 rep 
10.255.135.2
Oct 31 00:35:51 vsh03 openais[3237]: [TOTEM] aru 2c high delivered 2c 
received flag 1
Oct 31 00:35:51 vsh03 openais[3237]: [TOTEM] Did not need to originate 
any messages in recovery.
Oct 31 00:35:51 vsh03 openais[3237]: [TOTEM] Sending initial ORF token
Oct 31 00:35:51 vsh03 openais[3237]: [CLM  ] CLM CONFIGURATION CHANGE
Oct 31 00:35:51 vsh03 openais[3237]: [CLM  ] New Configuration:
Oct 31 00:35:51 vsh03 kernel: dlm: closing connection to node 1
Oct 31 00:35:51 vsh03 fenced[3256]: vsh02.domain.com not a cluster 
member after 0 sec post_fail_delay
Oct 31 00:35:51 vsh03 openais[3237]: [CLM  ]     r(0) ip(10.255.135.3)
Oct 31 00:35:51 vsh03 fenced[3256]: fencing node "vsh02.domain.com"

   It doesn't seem to be consistent which node survives and which node 
gets fenced. Also, when the fenced node comes back up, sometimes it will 
then fence the other node and somethimes it will get fenced again.

   Thanks for any insight! I'm bashing my head against a solid wall here.

Madi
