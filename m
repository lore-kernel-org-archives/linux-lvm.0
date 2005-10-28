Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9SMMxV18516
	for <linux-lvm@redhat.com>; Fri, 28 Oct 2005 18:22:59 -0400
Received: from zeus.itg.uiuc.edu (zeus.itg.uiuc.edu [130.126.126.162])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j9SMMqvg012659
	for <linux-lvm@redhat.com>; Fri, 28 Oct 2005 18:22:52 -0400
Received: from zeus.itg.uiuc.edu (localhost.localdomain [127.0.0.1])
	by zeus.itg.uiuc.edu (8.13.1/8.13.1) with ESMTP id j9SMMqdh019198
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 28 Oct 2005 17:22:52 -0500
Received: from localhost (menscher@localhost)
	by zeus.itg.uiuc.edu (8.13.1/8.13.1/Submit) with ESMTP id
	j9SMMpSw019195
	for <linux-lvm@redhat.com>; Fri, 28 Oct 2005 17:22:51 -0500
Date: Fri, 28 Oct 2005 17:22:51 -0500 (CDT)
From: Damian Menscher <menscher@uiuc.edu>
Message-ID: <Pine.LNX.4.63.0510281718310.18789@zeus.itg.uiuc.edu>
MIME-Version: 1.0
Subject: [linux-lvm] lvm --minor changing
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

I need to specify the --minor value for my NFS-exported filesystems, 
since otherwise I get stale filehandles when rebooting the server:

   https://www.redhat.com/archives/linux-lvm/2005-May/msg00029.html

Question is how to do this w/o going into single-user mode?  If I change 
it while the system is up, won't the sudden change in the minor number 
break things?  Is it safest to just use fsid=num in my exports file?

Damian Menscher
-- 
-=#| <menscher@uiuc.edu> www.uiuc.edu/~menscher/ Ofc:(650)273-2757 |#=-
-=#| The above opinions are not necessarily those of my employers. |#=-
