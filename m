Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1FI4Hi26472
	for <linux-lvm@redhat.com>; Sun, 15 Feb 2004 13:04:17 -0500
Received: from ptb-relay03.plus.net (ptb-relay03.plus.net [212.159.14.214])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1FI4Hb24334
	for <linux-lvm@redhat.com>; Sun, 15 Feb 2004 13:04:17 -0500
Received: from [80.229.5.88] (helo=192.168.0.121)
	 by ptb-relay03.plus.net with esmtp (Exim) id 1AsQcl-000CCh-04
	for linux-lvm@redhat.com; Sun, 15 Feb 2004 18:04:11 +0000
From: Duncan Hill <dhill@nacnud.force9.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Message-Id: <200402151804.14727.dhill@nacnud.force9.co.uk>
Subject: [linux-lvm] LVM 1 volumes and 2.6.2 kernel
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Mon Feb 16 09:10:23 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Silly me decided a month or so back to migrate to 2.6, but I forgot that I had 
a LVM1 installation on my portable drive.  Said installation doesn't seem to 
work now - even with dm-mod loaded, I get errors about /dev/mapper/control.  
What parts am I missing?

Fedora Core 1
2.6.2 kernel
lvm1 and lvm2 packages installed.
