Received: from mx2.redhat.com (ext-mx01.extmail.prod.ext.rdu2.redhat.com
	[10.11.55.1])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s1OCeIqa015450
	for <linux-lvm@redhat.com>; Mon, 24 Feb 2014 07:40:19 -0500
Received: from mail.fibbs.org (phineas.fibbs.org [109.234.106.32])
	by mx2.redhat.com (8.14.4/8.14.4) with ESMTP id s1OCeGOJ005458
	for <linux-lvm@redhat.com>; Mon, 24 Feb 2014 07:40:17 -0500
Received: from localhost (localhost [127.0.0.1])
	by mail.fibbs.org (Postfix) with ESMTP id F284420041F
	for <linux-lvm@redhat.com>; Mon, 24 Feb 2014 13:40:06 +0100 (CET)
Received: from mail.fibbs.org ([127.0.0.1])
	by localhost (mail.fibbs.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id 9hpsCER83M-w for <linux-lvm@redhat.com>;
	Mon, 24 Feb 2014 13:40:06 +0100 (CET)
Received: from [192.168.0.11] (46.128.33.1.dynamic.cablesurf.de [46.128.33.1])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	by mail.fibbs.org (Postfix) with ESMTPSA id B0BC520041C
	for <linux-lvm@redhat.com>; Mon, 24 Feb 2014 13:40:06 +0100 (CET)
Message-ID: <530B3DA6.50807@mglug.de>
Date: Mon, 24 Feb 2014 13:40:06 +0100
From: Oliver Rath <rath@mglug.de>
MIME-Version: 1.0
References: <530A77EC.5090900@mglug.de> <530B059F.3060502@redhat.com>
In-Reply-To: <530B059F.3060502@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] [SOLVED] unwanted autocreation of /dev/mapper/ entries
 while using parted on lvm devices
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hi Peter!

Am 24.02.2014 09:41, schrieb Peter Rajnoha:
> On 02/23/2014 11:36 PM, Oliver Rath wrote:
> The parted itself creates a new device-mapper mapping that represents
> the partition. Then it's like any other device-mapper device and so
> the /dev content is created by 10-dm-disk.rules (the /dev/mapper
> content) and 13-dm-disk.rules (the /dev/disk content). Parted has this
> functionality integrated so there's no need to call kpartx in addition. 

On my machine parted-2.3 was running. Upgrading to parted-3.1 didnt
help, BUT building parted-3.1 for myself with ./configure
--disable-device-mapper works! Then parted does his job without creating
these deices implicitly.

Maybe you know a less radical method? I.e. I could exclude some names in
lvm.conf or something like this? The names of the lvm whould should
create subvolumes are well defined.

Regards,
Oliver
