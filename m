Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j2O1rfO31891
	for <linux-lvm@redhat.com>; Wed, 23 Mar 2005 20:53:41 -0500
Received: from w3f.coventive.coms.coventive.com (202-145-53-92.adsl.ttn.net
	[202.145.53.92])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j2O1rX4r025608
	for <linux-lvm@redhat.com>; Wed, 23 Mar 2005 20:53:34 -0500
Received: from [192.168.20.46] (pc46.sa.coventive.com [192.168.20.46])
	by w3f.coventive.coms.coventive.com (8.11.6/8.11.6) with ESMTP id
	j2O1rTB30794
	for <linux-lvm@redhat.com>; Thu, 24 Mar 2005 09:53:30 +0800
Message-ID: <42421E5B.3000001@coventive.com>
Date: Thu, 24 Mar 2005 09:56:43 +0800
From: Chung Hsien Hu <mozo@coventive.com>
MIME-Version: 1.0
References: <42398707.4070708@sara.nl>
In-Reply-To: <42398707.4070708@sara.nl>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Snapshot Rollback??
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
By reading the discussion of snapshot reset couple days ago, I more
interest in the feature of snapshot rollback, ie, to restore the
original volume to the saved state of some historial snapshots.
Could the LVM2/device-mapper do this?

-- 
Mozo Hu. mozo@coventive
R&D Assistant Manager, Coventive Advance Technologies
