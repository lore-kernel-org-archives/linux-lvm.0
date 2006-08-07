Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k77LxIJ6012521
	for <linux-lvm@redhat.com>; Mon, 7 Aug 2006 17:59:18 -0400
Received: from omner.org (www.omner.org [64.79.194.221])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k77LxGoF004257
	for <linux-lvm@redhat.com>; Mon, 7 Aug 2006 17:59:16 -0400
Received: from omner.org (vps.omner.org [127.0.0.1])
	by omner.org (Postfix) with ESMTP id 40A23163C031
	for <linux-lvm@redhat.com>; Mon,  7 Aug 2006 21:59:15 +0000 (UTC)
Received: from [192.168.80.173] (unknown [208.53.40.164])
	by omner.org (Postfix) with ESMTP id D52E6163C02F
	for <linux-lvm@redhat.com>; Mon,  7 Aug 2006 21:59:14 +0000 (UTC)
From: Joshua Aune <luken@omner.org>
Date: Mon, 07 Aug 2006 15:59:32 -0600
Message-Id: <1154987972.16651.28.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Running LVM on shared lun's
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

I have two systems that are connected to a SAN.  The SAN is exporting
the same 4 luns to each system (/dev/sd[b,c,d,e]).  Under normal
operation system1 will combine sdb with sdc into a vg and system2 will
combine sdd with sde into a vg with both vgs consisting of one large lv
and one small lv.  After the system is configured there will be no
modifications made to the LVM configuration.  LVM is configured on one
node and then copied over to the second node.

The million dollar question is, can system1 and system2 simultaneously
have both of the VGs active without hosing any data?  

I am not trying to have the same filesystem mounted simultaneously, just
have the LVs available simultaneously for failover needs

I know that this sort of config can be done with the GFS pool volume
manger but I have been told that many other VMs don't support this
behavior....

Thanks,
Josh
