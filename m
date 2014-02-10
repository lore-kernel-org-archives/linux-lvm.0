Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s1AD7HTP002153
	for <linux-lvm@redhat.com>; Mon, 10 Feb 2014 08:07:23 -0500
Received: from mail.fibbs.org (phineas.fibbs.org [109.234.106.32])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s1AD6sc7023953
	for <linux-lvm@redhat.com>; Mon, 10 Feb 2014 08:06:54 -0500
Received: from localhost (localhost [127.0.0.1])
	by mail.fibbs.org (Postfix) with ESMTP id D50B6200416
	for <linux-lvm@redhat.com>; Mon, 10 Feb 2014 14:06:52 +0100 (CET)
Received: from mail.fibbs.org ([127.0.0.1])
	by localhost (mail.fibbs.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id ltAevmOIESYo for <linux-lvm@redhat.com>;
	Mon, 10 Feb 2014 14:06:52 +0100 (CET)
Received: from [192.168.0.11] (46.128.33.1.dynamic.cablesurf.de [46.128.33.1])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	by mail.fibbs.org (Postfix) with ESMTPSA id 3E9E220040E
	for <linux-lvm@redhat.com>; Mon, 10 Feb 2014 14:06:52 +0100 (CET)
Message-ID: <52F8CEEA.1070105@mglug.de>
Date: Mon, 10 Feb 2014 14:06:50 +0100
From: Oliver Rath <rath@mglug.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] thinpool undeleteable after server crash
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

Im using here lvm 2.02.104 with kernel 3.11 and today the server
crashed, so I had to power off and reboot the machin (dont know why at
the mom). After this, the used thinpool-device got an unrecoverable
error (thin_repair didnt help) so i tried to remove the whole vg
including the thinpool and its depending devices, which didnt work.

My only working solution was to overwrite the the first 30MB or the
beginning of the used pv with zeroes (dd if=/dev/zero of=/dev/sda1),
then to reboot and NOW to recreate the whole thing.

This seems not to be the best solution for this, so here my questions:

Is it possible to force recreate of a thinpool device when it is
crashing? What can I do to avoid unrecoverable errors on thinpools? Is
there a better possibility for recreation of pv/vg/thinpools?

Tfh!
Oliver
