Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5DH17cN030717
	for <linux-lvm@redhat.com>; Tue, 13 Jun 2006 13:01:07 -0400
Received: from orko.netshadow.at (mail.netshadow.at [217.116.182.107])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k5DH10wf004410
	for <linux-lvm@redhat.com>; Tue, 13 Jun 2006 13:01:00 -0400
Received: from [192.168.191.20] (kuecken.unki.net [192.168.191.20])
	(authenticated bits=0)
	by orko.netshadow.at (8.13.6/8.13.6/Debian-1) with ESMTP id
	k5DH0mHL001726
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Tue, 13 Jun 2006 19:00:49 +0200
Message-ID: <448EEF41.7000404@netshadow.at>
Date: Tue, 13 Jun 2006 19:00:49 +0200
From: Andreas Unterkircher <unki@netshadow.at>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] undelete logical volume
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

Hi,

I made a big mistake and deleted a logical volume with some still needed data.

It was the only active lv and no other write access happened on the physical 
disks till yet. Also I have no backup of lvm's metadata.

Is there any way to recover the lost logical volume? (lvm2) 

Andreas
