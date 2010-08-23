Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o7N4Hjpk008275
	for <linux-lvm@redhat.com>; Mon, 23 Aug 2010 00:17:46 -0400
Received: from rd-fe01.sohu-rd.com (smtp.sohu-rd.com [202.106.180.43])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o7N4HW1w022081
	for <linux-lvm@redhat.com>; Mon, 23 Aug 2010 00:17:33 -0400
From: "Kirby Zhou" <kirbyzhou@sohu-rd.com>
Date: Mon, 23 Aug 2010 12:17:33 +0800
Message-ID: <0ef301cb427a$1c5d9710$5518c530$@com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Language: zh-cn
Subject: [linux-lvm] Is there any help for external locking of LVM?
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

I am working for getting a alternative of built-in clustered locking.
clvmd cannot support large size cluster well, and cannot across VLAN.
In my opinion, a centralized locking mechanism is more suitable for
large-scale cluster.

If I just put locking_dir on a NFS volume with locking_type=1, can I use LVM
to share a storage across machine?
Or is there any document can guide me to write a new locking plug-in?

Regards,
   Kirby Zhou    
   from   SOHU-RD   +86-10-6272-8261
