Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r2JDWqgV029140
	for <linux-lvm@redhat.com>; Tue, 19 Mar 2013 09:32:52 -0400
Received: from c6-x64-devel.vds-ok.com (r02-ge0-SH.prague.vds-ok.com
	[88.86.97.52] (may be forged))
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r2JDWp9W026623
	for <linux-lvm@redhat.com>; Tue, 19 Mar 2013 09:32:51 -0400
From: Vladislav Bogdanov <bubble@hoster-ok.com>
Date: Tue, 19 Mar 2013 13:32:40 +0000
Message-Id: <1363699970-10002-1-git-send-email-bubble@hoster-ok.com>
Subject: [linux-lvm] [PATCH 00/10] Enhancements to a clustered logical
	volume activation
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

When using volumes in clustered volume groups, there is a need to convert
cluster locks between shared and exclusive.
Shared lock is needed to be able to perform live VM migration,
exclusive lock is needed to take LV shapshot (and just for safety).

Also, to use clvm as a locking mechanism for libvirt/qemu, there is a need to
be able to perform LV lock conversion on a remote node (because last phase
of live VM migration, when 'source' qemu process is actually killed and LV
becomes not opened, is performed on a migration source node and there is no
event available on a destination node to do local shared->exclusive conversion).

Vladislav Bogdanov (10):
  lvchange: Allow cluster lock conversion
  clvmd: Fix buffer size
  clvmd: Allow node names to be obtained from corosync's CMAP
  clvmd: fix positive return value is not an error in csid->name
    translation
  clvmd: use correct flags for local command execution
  clvmd: additional debugging - print message bodies
  locking: Allow lock management (activation, deactivation, conversion)
    on a remote nodes
  lvchange: implement remote lock management
  man: document --force option to lvchange, provide examples
  man: document --node option to lvchange
