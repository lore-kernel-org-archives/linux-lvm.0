Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7U62JOw009191
	for <linux-lvm@redhat.com>; Wed, 30 Aug 2006 02:02:19 -0400
Received: from milprog1.milprog.ch (milprog1.milprog.ch [157.161.104.194])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k7U62BF6026213
	for <linux-lvm@redhat.com>; Wed, 30 Aug 2006 02:02:12 -0400
Message-Id: <s4f54602.099@milprog1.milprog.ch>
Date: Wed, 30 Aug 2006 08:01:50 +0200
From: "Marcel Gsteiger" <Marcel.Gsteiger@milprog.ch>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Problem with lvm2 snapshot filling up on fc4
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

Hi all

I have a big problem. I did backups using LVM snapshots on my fc4 box (2.6.15-1). Now a snapshot filled to 100%. Since then, I cannot do anything anymore either with this snapshot nor with the original volume. lvremove always hangs with a message waiting for /var/lock/lvm/V_vg00 . Rebooting does not help either. How can I destroy just my snapshot? Any help would very much be appreciated.

Thanks
Marcel
