Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1GGlei08313
	for <linux-lvm@redhat.com>; Mon, 16 Feb 2004 11:47:40 -0500
Received: from ip66-106-138-51.z138-106-66.customer.algx.net (ip66-106-138-51.z138-106-66.customer.algx.net [66.106.138.51])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1GGldb06131
	for <linux-lvm@redhat.com>; Mon, 16 Feb 2004 11:47:39 -0500
Received: from [192.168.1.126] (rich [192.168.1.126])
	by ip66-106-138-51.z138-106-66.customer.algx.net (Postfix) with ESMTP id E255C11804
	for <linux-lvm@redhat.com>; Mon, 16 Feb 2004 08:47:32 -0800 (PST)
From: Rich Turner <rich@storix.com>
Message-Id: <1076950052.2404.33.camel@rich>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] snapshots and VFS lock patch
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
Date: Mon Feb 16 11:46:27 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

the way i understand it is that the only way to create a snapshot of a
journaled filesystem (ext3, XFS, etc.) is to have the VFS lock patch
applied to the kernel. this will lock the filesystem and allow it to
flush the journal before it creates the snapshot. is this true?

is there anyway to check to see if the VFS lock patch has been applied
on a system before creating the snapshot?

has this patch ever been added to the stock kernel or will every user
that wishes to create a snapshot of a journaled filesystem have to
manually apply the patch?

is the VFS lock patch required for LVM2?

what happens when a snapshot is created with a kernel that does not have
the VFS lock patch? does the snapshot creation fail with valid return
code? does the snapshot just hang up? is there any effect on the
original LV?
