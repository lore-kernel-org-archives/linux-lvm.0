Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r67L9iBa022993
	for <linux-lvm@redhat.com>; Sun, 7 Jul 2013 17:09:44 -0400
Received: from mail-in-01.arcor-online.net (mail-in-01.arcor-online.net
	[151.189.21.41])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r67L9fcE013507
	for <linux-lvm@redhat.com>; Sun, 7 Jul 2013 17:09:42 -0400
Received: from mail-in-16-z2.arcor-online.net (mail-in-16-z2.arcor-online.net
	[151.189.8.33]) by mx.arcor.de (Postfix) with ESMTP id BD2145A163
	for <linux-lvm@redhat.com>; Sun,  7 Jul 2013 23:09:39 +0200 (CEST)
Received: from mail-in-02.arcor-online.net (mail-in-02.arcor-online.net
	[151.189.21.42])
	by mail-in-16-z2.arcor-online.net (Postfix) with ESMTP id B3F5421201A
	for <linux-lvm@redhat.com>; Sun,  7 Jul 2013 23:09:39 +0200 (CEST)
Received: from lazy.lzy (p57A5E9E1.dip0.t-ipconnect.de [87.165.233.225])
	(Authenticated sender: piergiorgio.sartor@arcor.de)
	by mail-in-02.arcor-online.net (Postfix) with ESMTPSA id 732B331B9D
	for <linux-lvm@redhat.com>; Sun,  7 Jul 2013 23:09:37 +0200 (CEST)
Received: from lazy.lzy (localhost [127.0.0.1])
	by lazy.lzy (8.14.7/8.14.5) with ESMTP id r67L9XgC024951
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Sun, 7 Jul 2013 23:09:36 +0200
Received: (from red@localhost)
	by lazy.lzy (8.14.7/8.14.6/Submit) id r67L9W1Q024949
	for linux-lvm@redhat.com; Sun, 7 Jul 2013 23:09:32 +0200
Date: Sun, 7 Jul 2013 23:09:32 +0200
From: Piergiorgio Sartor <piergiorgio.sartor@nexgo.de>
Message-ID: <20130707210931.GA24938@lazy.lzy>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LV snapshot and filesystem sync
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

Hi all,

I apologize in advance in case this was already
discussed, but I seem not to be able to find a
clear answer, using the standard search engines.

The question is: when doing a snapshot of a LV
volume, is it necessary to "sync" the filesystem
above? Or is it done automatically?

If done automatically, does it work with all
filesystems or only with some? Which?

Thanks a lot in advance,

bye,

-- 

piergiorgio
