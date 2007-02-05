Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l15KbKU0012094
	for <linux-lvm@redhat.com>; Mon, 5 Feb 2007 15:37:20 -0500
Received: from mexforward.lss.emc.com (mexforward.lss.emc.com [128.222.32.20])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l15KbIq4019066
	for <linux-lvm@redhat.com>; Mon, 5 Feb 2007 15:37:19 -0500
Received: from mailhub.lss.emc.com (nirah.lss.emc.com [10.254.144.13])
	by mexforward.lss.emc.com (Switch-3.1.8/Switch-3.1.7) with ESMTP id
	l15KbDA1019540
	for <linux-lvm@redhat.com>; Mon, 5 Feb 2007 15:37:13 -0500 (EST)
Received: from corpussmtp3.corp.emc.com (corpussmtp3.corp.emc.com
	[10.254.64.53])
	by mailhub.lss.emc.com (Switch-3.1.8/Switch-3.1.7) with ESMTP id
	l15KakHc022122
	for <linux-lvm@redhat.com>; Mon, 5 Feb 2007 15:37:12 -0500 (EST)
From: Lin_ChiiShing@emc.com
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Mon, 5 Feb 2007 15:37:09 -0500
Message-ID: <97982DAF1EA1494DB6C65C2EEAA6296104FF4045@CORPUSMX40B.corp.emc.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Software versions for LVM2 mirroring
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


I am interested in looking at the LVM2 mirroring. My interpretation from
reading the archived information
is that this is still work in progress.

What are the recommended software versions that I need to install on my
cluster systems
in order to evaluate LVM2 mirroring ? My systems are running
2.6.9-42.0.3 kernel.

The CVS tag I used to checkout the source are:

	cluster:		RHEL4U4	
   	device-mapper	v1_02_14
	LVM2		v2_02_18

Should I use other versions for LVM2 mirroring evaluation for now ?


Thanks,
-chiishing
