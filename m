Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BA47E196AE
	for <linux-lvm@redhat.com>; Tue, 24 Sep 2019 09:42:36 +0000 (UTC)
Received: from m4a0039g.houston.softwaregrp.com
	(m4a0039g.houston.softwaregrp.com [15.124.2.85])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DF15880F83
	for <linux-lvm@redhat.com>; Tue, 24 Sep 2019 09:42:34 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
	m4a0039g.houston.softwaregrp.com WITH ESMTP FOR linux-lvm@redhat.com;
	Tue, 24 Sep 2019 09:41:40 +0000
From: Gang He <GHe@suse.com>
Date: Tue, 24 Sep 2019 09:04:56 +0000
Message-ID: <CH2PR18MB320633BFA3C024C348A1F91ECF840@CH2PR18MB3206.namprd18.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] questions about dlm: add TCP multihoming/failover
	support
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello List,

When I tried to upgrade libdlm to v4.0.9, I can see one commit for add TCP multihoming/failover support. 
commit 7a273b8714da400d292d6c9762acedcde1997e52
Author: David Windsor <dwindsor@redhat.com>
Date:   Tue May 7 09:56:53 2019 -0400
    dlm_controld: bind to all interfaces for failover 

According to the commit description, I can find there are some kernel related patches(fs/dlm in kernel space).
e.g. 
https://www.redhat.com/archives/cluster-devel/2019-January/msg00009.html
https://www.redhat.com/archives/cluster-devel/2019-January/msg00010.html

But, so far, these kernel patches have not been in Torvalds kernel git tree.
That means we cannot use this feature, although we upgrade libdlm to v4.0.9?

Second, how to use this feature after these kernel patch are available? There is any document to guide the use to use(or test) this feature?

Third, There is any differences between TCP multihoming/failover feature and STCP feature? Please give some comments when choice two features?

Thanks
Gang
