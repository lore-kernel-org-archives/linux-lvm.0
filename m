Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BE5CC171B0
	for <linux-lvm@redhat.com>; Fri,  3 Aug 2018 09:41:03 +0000 (UTC)
Received: from prv1-mh.provo.novell.com (prv1-mh.provo.novell.com
	[137.65.248.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E9F61308FB8C
	for <linux-lvm@redhat.com>; Fri,  3 Aug 2018 09:41:01 +0000 (UTC)
Message-Id: <5B642326020000F90002D274@prv1-mh.provo.novell.com>
Date: Fri, 03 Aug 2018 03:40:54 -0600
From: "Gang He" <ghe@suse.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] How to upgrade LVM2/CLVM to v2.02.180 from old versions
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

Hello List,

I want to upgrade LVM2/CLVM to v2.02.180 from v2.02.120, but there are some problems which I want to confirm with you guys.
1) How to migrate /etc/lvm/lvm.conf? since the existing configuration file does not include some new attributes, 
could you help to figure out which new key attributes, which should be considered during the upgrade installation?

2) lvmpolld is necessary in LVM2/CLVM v2.02.180? I can find the related files in the installation file list
/sbin/lvmpolld
/usr/lib/systemd/system/lvm2-lvmpolld.service
/usr/lib/systemd/system/lvm2-lvmpolld.socket
this daemon should be enable by default? if we disable this daemon, LVM2/CLVM related features (e.g. pvmove) will be affected, or not?

3) any other places (e.g. configuration files, binary files, features, etc.), which should be considered during the upgrade?

Thanks a lot.
Gang  
