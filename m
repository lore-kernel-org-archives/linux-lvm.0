Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j8T43dV13189
	for <linux-lvm@redhat.com>; Thu, 29 Sep 2005 00:03:39 -0400
Received: from zeus.itg.uiuc.edu (zeus.itg.uiuc.edu [130.126.126.162])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j8T43Wss007521
	for <linux-lvm@redhat.com>; Thu, 29 Sep 2005 00:03:32 -0400
Received: from zeus.itg.uiuc.edu (localhost.localdomain [127.0.0.1])
	by zeus.itg.uiuc.edu (8.13.1/8.13.1) with ESMTP id j8T43Yvn016503
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 28 Sep 2005 23:03:35 -0500
Received: from localhost (menscher@localhost)
	by zeus.itg.uiuc.edu (8.13.1/8.13.1/Submit) with ESMTP id
	j8T43Yhx016500
	for <linux-lvm@redhat.com>; Wed, 28 Sep 2005 23:03:34 -0500
Date: Wed, 28 Sep 2005 23:03:34 -0500 (CDT)
From: Damian Menscher <menscher@uiuc.edu>
Message-ID: <Pine.LNX.4.63.0509282256220.2707@zeus.itg.uiuc.edu>
MIME-Version: 1.0
Subject: [linux-lvm] lvm2 snapshot support?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I've been impatiently waiting to see bugfixes that would allow me to 
make snapshots of the root filesystem:

https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=145342
https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=168824

Even more annoying is the instability of snapshots in general (about 1% 
of snapshot attempts cause a kernel-level crash):

https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=145342
https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=168824

Since this issue has been ongoing for a year, and I can't find much 
online about it, I figured this is the place to ask... What's up?

Damian Menscher
-- 
-=#| Physics Grad Student & SysAdmin @ U Illinois Urbana-Champaign |#=-
-=#| 488 LLP, 1110 W. Green St, Urbana, IL 61801 Ofc:(217)333-0038 |#=-
-=#| 4602 Beckman, VMIL/MS, Imaging Technology Group:(217)244-3074 |#=-
-=#| <menscher@uiuc.edu> www.uiuc.edu/~menscher/ Fax:(217)333-9819 |#=-
-=#| The above opinions are not necessarily those of my employers. |#=-
