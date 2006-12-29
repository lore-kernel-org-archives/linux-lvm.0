Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kBTDAWSG005571
	for <linux-lvm@redhat.com>; Fri, 29 Dec 2006 08:10:33 -0500
Received: from mexforward.lss.emc.com (mexforward.lss.emc.com [128.222.32.20])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kBTDAWpv022159
	for <linux-lvm@redhat.com>; Fri, 29 Dec 2006 08:10:32 -0500
Received: from mailhub.lss.emc.com (nagas.lss.emc.com [10.254.144.11])
	by mexforward.lss.emc.com (Switch-3.1.8/Switch-3.1.7) with ESMTP id
	kBTDAQuh026396
	for <linux-lvm@redhat.com>; Fri, 29 Dec 2006 08:10:26 -0500 (EST)
Received: from corpussmtp3.corp.emc.com (corpussmtp3.corp.emc.com
	[10.254.64.53])
	by mailhub.lss.emc.com (Switch-3.1.8/Switch-3.1.7) with ESMTP id
	kBTDAMsx012143
	for <linux-lvm@redhat.com>; Fri, 29 Dec 2006 08:10:23 -0500 (EST)
From: berthiaume_wayne@emc.com
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Fri, 29 Dec 2006 08:10:23 -0500
Message-ID: <D364D39DAD21D444BAE2C70919B6280903995145@CORPUSMX40A.corp.emc.com>
In-Reply-To: <45943EDA.5080209@nrel.colostate.edu>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Filter the Swap Partition
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
To: linux-lvm@redhat.com

Good morning all...

	I was wondering if anyone knew of a way of filtering out the
swap partition so that lvscan() won't look for it. This is a RHEL 3.0 U8
server with lvm-1.0.8-14.

Thanks and regards,
Wayne.
