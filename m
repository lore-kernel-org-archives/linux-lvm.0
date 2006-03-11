Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k2B3fi123400
	for <linux-lvm@redhat.com>; Fri, 10 Mar 2006 22:41:44 -0500
Received: from relais.videotron.ca (relais.videotron.ca [24.201.245.36])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k2B3fgGO020944
	for <linux-lvm@redhat.com>; Fri, 10 Mar 2006 22:41:42 -0500
Received: from zherc.deepcosmos.ca ([70.83.147.82])
	by VL-MH-MR002.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IVX00IVAZHHZZD0@VL-MH-MR002.ip.videotron.ca> for
	linux-lvm@redhat.com; Fri, 10 Mar 2006 21:41:41 -0500 (EST)
Date: Fri, 10 Mar 2006 21:43:30 -0500
From: Bernard Fay <bfay@deepcosmos.ca>
Message-id: <1142045010.13046.23.camel@localhost.localdomain>
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Subject: [linux-lvm] Incorrect metadata area header checksum
Reply-To: bfay@deepcosmos.ca,
	LVM general discussion and development <linux-lvm@redhat.com>
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

For any LVM commands I run I receive the following message:

Incorrect metadata area header checksum

and/or 

Volume group mapper doesn't exist


Someone knows why and how it could be fixed?  I run Debian etch with
kernel 2.6.12-1-386 and lvm2 version 2.01.04-5.

TIA,
Bernard
