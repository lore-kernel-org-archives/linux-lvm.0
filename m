Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r9MHcCxi000837
	for <linux-lvm@redhat.com>; Tue, 22 Oct 2013 13:38:12 -0400
Received: from mail.fibbs.org (phineas.fibbs.org [109.234.106.32])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r9MHc9tA008910
	for <linux-lvm@redhat.com>; Tue, 22 Oct 2013 13:38:10 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.fibbs.org (Postfix) with ESMTP id C51422003F5
	for <linux-lvm@redhat.com>; Tue, 22 Oct 2013 19:38:08 +0200 (CEST)
Received: from mail.fibbs.org ([127.0.0.1])
	by localhost (mail.fibbs.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id pDV76e2vQsNf for <linux-lvm@redhat.com>;
	Tue, 22 Oct 2013 19:38:08 +0200 (CEST)
Received: from [192.168.172.254] (host-80-81-18-2.customer.m-online.net
	[80.81.18.2])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	by mail.fibbs.org (Postfix) with ESMTPSA id 7E0442003EC
	for <linux-lvm@redhat.com>; Tue, 22 Oct 2013 19:38:08 +0200 (CEST)
Message-ID: <5266B803.5060308@mglug.de>
Date: Tue, 22 Oct 2013 19:38:11 +0200
From: Oliver Rath <rath@mglug.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm-raid5 with 3 disks?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hi list,

im wondering, that on the lvcreate man-page stands "specifying -i3 would 
use 3 devices for striped logical volumes, 4 devices for RAID 4/5, and 5 
devices for RAID 6"

Imho there is a Raid-5 device with 3 disks possible. Is there an error 
in the documentation or does lvm need more stripes for Raid-5 than 
normally used?

Tfh!
Oliver
