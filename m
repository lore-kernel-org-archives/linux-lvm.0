Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p0PAp1xI031603
	for <linux-lvm@redhat.com>; Tue, 25 Jan 2011 05:51:01 -0500
Received: from mail.init.hr (mail.init.hr [74.207.229.89])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id p0PAoq0r013810
	for <linux-lvm@redhat.com>; Tue, 25 Jan 2011 05:50:52 -0500
Received: from localhost (localhost [127.0.0.1])
	by mail.init.hr (Postfix) with ESMTP id 955B6A9C6
	for <linux-lvm@redhat.com>; Tue, 25 Jan 2011 11:50:51 +0100 (CET)
Received: from mail.init.hr ([127.0.0.1])
	by localhost (mercury.init.hr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FRM2lVV1Jp+5 for <linux-lvm@redhat.com>;
	Tue, 25 Jan 2011 11:50:51 +0100 (CET)
Received: from [192.168.77.253] (78-0-234-146.adsl.net.t-com.hr [78.0.234.146])
	(using SSLv3 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: ivoks)
	by mail.init.hr (Postfix) with ESMTPSA id 95CAFA6E8
	for <linux-lvm@redhat.com>; Tue, 25 Jan 2011 11:50:50 +0100 (CET)
From: Ante Karamatic <ivoks@ubuntu.com>
Date: Tue, 25 Jan 2011 11:50:48 +0100
Message-ID: <1295952648.12713.8.camel@titan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] clvmd and corosync
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

Hi all

I've set up clvmd and corosync. It's working fine when all the nodes are
in the cluster. But, when I cleanly reboot/poweroff one of the nodes,
locking of clustered volume group isn't working well.

I've 'greped' trough archives and found out that I'm not alone. Whole
problem is nicely explained at:

http://www.mentby.com/xinwei-hu/vgscan-fails-when-other-nodes-quit-cleanly.html

Basically, vgscan returns 'cluster request failed: Host is down'. I've
reverted the commit Xinwei mentions and everything is working fine now.

Still, I'm not sure that's the right approach. I'm using 2.02.54
version, but I've also tried latest versions. Unfortunately with the
same results. clvmd/lvm is compiled with --with-clvmd=all. CKPT service
is enabled in corosync.

Could someone give me an input on what's going on here and where should
I look to fix this?

Thank you

-- 
Ante Karamatic <ivoks@ubuntu.com>
