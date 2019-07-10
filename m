Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C3CA82F77
	for <linux-lvm@redhat.com>; Wed, 10 Jul 2019 06:46:54 +0000 (UTC)
Received: from m4a0039g.houston.softwaregrp.com
	(m4a0039g.houston.softwaregrp.com [15.124.2.85])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1F4DE2F8BED
	for <linux-lvm@redhat.com>; Wed, 10 Jul 2019 06:46:52 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
	m4a0039g.houston.softwaregrp.com WITH ESMTP FOR linux-lvm@redhat.com;
	Wed, 10 Jul 2019 06:43:09 +0000
From: Gang He <GHe@suse.com>
Date: Wed, 10 Jul 2019 06:42:34 +0000
Message-ID: <CH2PR18MB3206CB2E1FB879E424FCA2BACFF00@CH2PR18MB3206.namprd18.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Which lvm2 code branches are important?
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

After you clone the code from git://sourceware.org/git/lvm2.git, you can find lots of remote code branches.
But which code branches are important for the third party users/ developer? That means we should monitor these code branches.
For example, 
Which code branches are main (or long-active) code branches?
Which code branches are used for which lvm2 products (big versions)?
What are the main differences between different lvm2 products? E.g. some features are added/removed.


Thanks a lot.
Gang
