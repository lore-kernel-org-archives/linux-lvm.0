Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1QJeu819499
	for <linux-lvm@redhat.com>; Thu, 26 Feb 2004 14:40:56 -0500
Received: from orbb.hbedv.com (orbb.hbedv.com [217.11.63.31])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1QJetb19351
	for <linux-lvm@redhat.com>; Thu, 26 Feb 2004 14:40:56 -0500
Received: from chiron.bla.fasel.org (pD9E5C201.dip.t-dialin.net [217.229.194.1])
	(using TLSv1 with cipher EDH-RSA-DES-CBC3-SHA (168/168 bits))
	(No client certificate requested)
	by orbb.hbedv.com (H+BEDV Postfix) with ESMTP id B4E0D8BC83
	for <linux-lvm@redhat.com>; Thu, 26 Feb 2004 20:40:48 +0100 (CET)
Received: from localhost (unknown [127.0.0.1])
	by chiron.bla.fasel.org (Postfix) with ESMTP id 4A27023
	for <linux-lvm@redhat.com>; Thu, 26 Feb 2004 20:41:12 +0100 (CET)
Received: from prometheus.bla.fasel.org (prometheus.bla.fasel.org [192.168.0.2])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by chiron.bla.fasel.org (Postfix) with ESMTP id C9A1523
	for <linux-lvm@redhat.com>; Thu, 26 Feb 2004 20:41:11 +0100 (CET)
Received: from localhost (unknown [127.0.0.1])
	by prometheus.bla.fasel.org (Postfix) with ESMTP id 3A0F82BF92
	for <linux-lvm@redhat.com>; Thu, 26 Feb 2004 20:41:11 +0100 (CET)
From: Wolfram Schlich <lists@wolfram.schlich.org>
Message-ID: <20040226194110.ALLYOURBASEAREBELONGTOUS.H5909@bla.fasel.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Linux 2.6 + LVM2: ext3fs labels not supported?
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
Date: Thu Feb 26 14:39:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux-LVM mailinglist <linux-lvm@redhat.com>

Hi,

after switching from Linux 2.4 + LVM1 to Linux 2.6 + LVM2, I noticed
the ext3fs labels of the LVs were just "gone". Too bad, as I was using
LABEL=label instead of the device path in the fstab (I'm not anymore
since then ;)). So, my question is, is this a known issue? I have
neither tried to convert my VG/LVs to LVM2 metadata format nor to
create a "fresh" VG/LV with LVM2.
Thanks in advance.
-- 
Wolfram Schlich; Friedhofstr. 8, D-88069 Tettnang; +49-(0)178-SCHLICH
