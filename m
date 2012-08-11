Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q7BFY6hm007832
	for <linux-lvm@redhat.com>; Sat, 11 Aug 2012 11:34:06 -0400
Received: from mail.fibbs.org (phineas.fibbs.org [109.234.106.32])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q7BFY4Js004303
	for <linux-lvm@redhat.com>; Sat, 11 Aug 2012 11:34:04 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.fibbs.org (Postfix) with ESMTP id 1541B1E6B78
	for <linux-lvm@redhat.com>; Sat, 11 Aug 2012 17:34:03 +0200 (CEST)
Received: from mail.fibbs.org ([127.0.0.1])
	by localhost (mail.fibbs.org [127.0.0.1]) (amavisd-new, port 10022)
	with ESMTP id ZmRo4RP9DbxE for <linux-lvm@redhat.com>;
	Sat, 11 Aug 2012 17:34:02 +0200 (CEST)
Received: from phineas.fibbs.org (localhost [127.0.0.1])
	by mail.fibbs.org (Postfix) with ESMTP id 7ADBE1E6B77
	for <linux-lvm@redhat.com>; Sat, 11 Aug 2012 17:34:02 +0200 (CEST)
Received: from 46.128.33.1.dynamic.cablesurf.de ([46.128.33.1])
	by phineas.fibbs.org with SMTP ID 50 for <linux-lvm@redhat.com>;
	Sat, 11 Aug 2012 17:34:02 +0200 (CEST)
Received: from [192.168.0.10] (46.128.33.1.dynamic.cablesurf.de [46.128.33.1])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	by mail.fibbs.org (Postfix) with ESMTPSA id 176A61E6B77
	for <linux-lvm@redhat.com>; Sat, 11 Aug 2012 17:34:02 +0200 (CEST)
Message-ID: <50267B69.7090505@mglug.de>
Date: Sat, 11 Aug 2012 17:34:01 +0200
From: Oliver Rath <rath@mglug.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] sparse copy i.e. /dev/sda3 -> /dev/mvlvm/mythinpool?
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

Hi list,

is it possible, to copy a real device like /dev/sda3 to a thinpool
device in a sparse way? I tried several things like dd_rescue -a .. ,
but there was no sparse-effect :-(

Any hints?

Tfh!

Oliver
