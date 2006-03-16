Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k2GGNf116684
	for <linux-lvm@redhat.com>; Thu, 16 Mar 2006 11:23:41 -0500
Received: from hotmail.com (bay102-f27.bay102.hotmail.com [64.4.61.37])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k2GGNdZT024362
	for <linux-lvm@redhat.com>; Thu, 16 Mar 2006 11:23:39 -0500
Message-ID: <BAY102-F27F80FDF0326C7ED87E111EFE70@phx.gbl>
In-Reply-To: <H000007200bf1fff.1142521692.fsu50.nll.se@MHS>
From: "Christopher Probst" <probst_christopher@hotmail.com>
Date: Thu, 16 Mar 2006 15:35:13 +0000
Mime-Version: 1.0
Subject: [linux-lvm] Logical Volume, reiserfs and unwakeable processes.
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hello,

Has anyone had this problem? I am having trouble determining the exact 
symptoms. However, this is what I have:

I create a Volume Group, I create a logical volume inside this volume group, 
format it whith reiserfs. The process to mount it is uniterruptible...

What am I not understanding?

Christo


>From: fredrik.backman@nll.se
>Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
>To: linux-lvm@redhat.com
>Subject: [linux-lvm] (no subject)
>Date: Thu, 16 Mar 2006 16:08:12 +0100
>
>Hi
>
>Im doing a snapshot (hardware-based in EVA5000) of a LV (lvm2) and i
>wonder what is the correct way to use this snapshot? Problem is that
>this snapshot has the same ID as the original one. In HP-UX a would do a
>vgchgid on this snapshot-LV. Any help would be aprreciated.
>
>Regards Fredrik
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
