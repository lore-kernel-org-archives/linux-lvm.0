Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m75Dbc5a006015
	for <linux-lvm@redhat.com>; Tue, 5 Aug 2008 09:37:38 -0400
Received: from smtp-msa-out01.orange.fr (smtp-msa-out01.orange.fr
	[193.252.23.120])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m75Daq1J006634
	for <linux-lvm@redhat.com>; Tue, 5 Aug 2008 09:36:53 -0400
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf2353.orange.fr (SMTP Server) with ESMTP id 526F0700009F
	for <linux-lvm@redhat.com>; Tue,  5 Aug 2008 15:36:47 +0200 (CEST)
Received: from [172.20.20.150] (LPuteaux-151-41-11-129.w217-128.abo.wanadoo.fr
	[217.128.26.129])
	by mwinf2353.orange.fr (SMTP Server) with ESMTP id 2F5CD700009A
	for <linux-lvm@redhat.com>; Tue,  5 Aug 2008 15:36:47 +0200 (CEST)
Message-ID: <48985774.2080509@squirk.org>
Date: Tue, 05 Aug 2008 15:36:52 +0200
From: Jean Spirat <jeanspirat@squirk.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] the lvm shared storage question of the week
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

Hello there,

  Is there any hint or any links anyone could share for the use of lvm 
on an AOE storage (shared block device over the network). I wanted to 
know how to create lvm group on a device that is shared among several host.


so i use debian 4 servers that acces a AOE target drive. The servers all 
mount the etherdrive and i want to use lvm to partition this 4Terabyte  
block device in smaller chunck. what should be the best way to do that ?

 While googling about this i found  references to clvm but no 
documentation i could use on how to set it up. Is this the way to go ?


regards,
Jean.
