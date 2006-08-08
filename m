Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k78GKbCS011537
	for <linux-lvm@redhat.com>; Tue, 8 Aug 2006 12:20:37 -0400
Received: from navgwout.symantec.com (navgwout.symantec.com [198.6.49.12])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k78GKMOZ011402
	for <linux-lvm@redhat.com>; Tue, 8 Aug 2006 12:20:27 -0400
Received: from cup2opsmtapin02.ges.symantec.com
	(cup2opsmtapin02.ges.symantec.com [155.64.1.103])
	by navgwout.symantec.com (8.13.7/8.13.7) with ESMTP id k78GKFfi007851
	for <linux-lvm@redhat.com>; Tue, 8 Aug 2006 09:20:16 -0700 (PDT)
Received: from svl1xchecnpin01.veritas.com ([10.137.18.178]
	helo=SVL1XCHECNPIN01.enterprise.veritas.com)
	by cup2opsmtapin02.ges.symantec.com with esmtp (Exim 4.52)
	id 1GAUJT-0007mD-RQ
	for linux-lvm@redhat.com; Tue, 08 Aug 2006 09:20:15 -0700
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] Running LVM on shared lun's
Date: Tue, 8 Aug 2006 09:23:04 -0700
Message-ID: <9AF3EE740197A64881ED6E9265B2C31170DAC5@SVL1XCHCLUPIN02.enterprise.veritas.com>
In-Reply-To: <1154987972.16651.28.camel@localhost.localdomain>
From: "David Chan" <david_chan@symantec.com>
Content-Transfer-Encoding: 8bit
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

 
Don't think LVM is cluster aware.  Doing so can potentially cause loss
of LV's/data due to metadata corruption on the LVM level.  
-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
On Behalf Of Joshua Aune
Sent: Monday, August 07, 2006 3:00 PM
To: LVM general discussion and development
Subject: [linux-lvm] Running LVM on shared lun's

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

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
