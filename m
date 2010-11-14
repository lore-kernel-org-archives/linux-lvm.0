Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id oAE1k28t016287
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2010 20:46:05 -0500
Received: from twist.antaree.com (diego.snet.sk [188.123.97.30])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAE1jlK5001593
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2010 20:45:48 -0500
Received: from localhost (localhost [127.0.0.1])
	by twist.antaree.com (Postfix) with ESMTP id A15C012EA37F
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2010 02:45:29 +0100 (CET)
Received: from twist.antaree.com ([127.0.0.1])
	by localhost (diego.snet.sk [127.0.0.1]) (amavisd-new, port 10024)
	with SMTP id RIo8cyM+amh6 for <linux-lvm@redhat.com>;
	Sun, 14 Nov 2010 02:45:28 +0100 (CET)
Received: from polar.office-ke.antaree.com (static-78-141-85-220.orange.sk
	[78.141.85.220]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by twist.antaree.com (Postfix) with ESMTPSA id B38FC12EA355
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2010 02:45:28 +0100 (CET)
Date: Sun, 14 Nov 2010 02:45:27 +0100
From: Marek Soha <marek@snet.sk>
Message-ID: <606057079.20101114024527@snet.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] LVM volume umask change
Reply-To: Marek Soha <marek@snet.sk>,
	LVM general discussion and development <linux-lvm@redhat.com>
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

Hi all.

When I create file/directory in LVM volume, it is created with
permissions (mode) 666. I need to get 644.
I changed umask in /etc/lvm/lvm.conf, but it did not helped.
Any ideas?

Many thanks in advance.

MS
