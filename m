Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4PNNToV022724
	for <linux-lvm@redhat.com>; Thu, 25 May 2006 19:23:29 -0400
Received: from biscayne-one-station.mit.edu (BISCAYNE-ONE-STATION.MIT.EDU
	[18.7.7.80])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k4PNNFN9011518
	for <linux-lvm@redhat.com>; Thu, 25 May 2006 19:23:15 -0400
Received: from outgoing.mit.edu (OUTGOING-AUTH.MIT.EDU [18.7.22.103])
	by biscayne-one-station.mit.edu (8.13.6/8.9.2) with ESMTP id
	k4PNNEpO011225
	for <linux-lvm@redhat.com>; Thu, 25 May 2006 19:23:14 -0400 (EDT)
Received: from [18.93.1.31] (DRACO-NKLAB.MIT.EDU [18.93.1.31])
	(authenticated bits=0) (User authenticated as sdang@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.13.6/8.12.4) with ESMTP id k4PNNCm2013556
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=NOT)
	for <linux-lvm@redhat.com>; Thu, 25 May 2006 19:23:12 -0400 (EDT)
Mime-Version: 1.0 (Apple Message framework v750)
Content-Transfer-Encoding: 7bit
Message-Id: <06F5C23A-EF8A-4DB1-898C-BCAF9AD9A9E3@mit.edu>
From: Sabin Dang <sdang@MIT.EDU>
Date: Thu, 25 May 2006 19:23:09 -0400
Subject: [linux-lvm] Restore LVM without UIDs
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
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: linux-lvm@redhat.com

Hi Everyone,

I assisted in restoring a server today that was connected to an  
external raid that used LVM. Unfortunately there was no backup of the  
LVM config files prior to reinstalling the operating system.

Is there any way to retrieve the data stored on the LVM without the  
old config files?

Thanks,
Sabin
