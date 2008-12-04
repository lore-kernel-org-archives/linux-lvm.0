Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mB4CpjG9013853
	for <linux-lvm@redhat.com>; Thu, 4 Dec 2008 07:51:45 -0500
Received: from om.cz.net (om.cz.net [193.85.2.13])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mB4CpXTw018867
	for <linux-lvm@redhat.com>; Thu, 4 Dec 2008 07:51:34 -0500
Received: from 192.168.60.224 ([193.179.76.212])
	by om.cz.net (8.13.8/8.13.8/om) with SMTP id mB4CpX3v044749
	for <linux-lvm@redhat.com>; Thu, 4 Dec 2008 13:51:33 +0100 (CET)
Received: from [192.168.58.13] (skadlec.es.gk-software.com [192.168.58.13])
	by hermes.es.gk-software.com (Postfix) with ESMTP id DF27F8FA40
	for <linux-lvm@redhat.com>; Thu,  4 Dec 2008 13:51:32 +0100 (CET)
Message-ID: <4937D295.8010105@gk-software.com>
Date: Thu, 04 Dec 2008 13:52:37 +0100
From: Stepan Kadlec <skadlec@gk-software.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] resizing physical volume
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi,
is there a way to resize the physical partition, that hosts the LVM? can 
it be done just by pvresize or do I have to resize the partition itself 
first? (by fdisk-like program?) I know I could add the free space as a 
new PV, but I would prefer directly extending current PV. is that 
possible? how?
thank you, stepan
