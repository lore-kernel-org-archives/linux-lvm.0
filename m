Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BF455D961
	for <linux-lvm@redhat.com>; Sun, 23 Dec 2018 18:57:38 +0000 (UTC)
Received: from s1-smtprelay.thinkmo.de (s1n.thinkmo.de [213.239.209.163])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3E28B58E3D
	for <linux-lvm@redhat.com>; Sun, 23 Dec 2018 18:57:36 +0000 (UTC)
Received: from shell.thinkmo.de (shell.thinkmo.de
	[IPv6:2a01:4f8:221:1902:0:22:0:1])
	by s1-smtprelay.thinkmo.de (Postfix) with ESMTPS id 43NBSZ07DHz5k
	for <linux-lvm@redhat.com>; Sun, 23 Dec 2018 18:57:34 +0000 (UTC)
Date: Sun, 23 Dec 2018 19:57:31 +0100
From: Bastian Blank <waldi@debian.org>
Message-ID: <20181223185731.ddtmh3wqsrvx5kug@shell.thinkmo.de>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] systemd generator fails if lvmconfig does not find a
	value
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Moin

The systemd generator in 2.03.01 fails if the config does not yet
contain the variables it tries to read via lvmconfig.  It aborts as
lvmconfig exits with exit value 5.

| % /sbin/lvmconfig config/checks te/t 2>/dev/null; echo $? 
| checks=1
| 5

As generators should not fail, ignoring lvmconfig problems might be the
best option.  The fallback of just generating services is safe.

Regards,
Bastian

-- 
Each kiss is as the first.
		-- Miramanee, Kirk's wife, "The Paradise Syndrome",
		   stardate 4842.6
