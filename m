From: Donald Thompson <dlt@lunanet.biz>
Message-ID: <Pine.LNX.4.52.0308262328280.23305@junior.lunanet.biz>
MIME-Version: 1.0
Subject: [linux-lvm] Kernel 2.4.22, LVM 1.0.7 and VFS patch for 2.4.20
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Wed Aug 27 00:39:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

2.4.22 kernel builds fail for me with 'undefined reference to `DQUOT_SYNC''
when it attempts to link to produce vmlinux . Looks like the definition
for DQUOT_SYNC in include/linux/quotaops.h changed from:

#define DQUOT_SYNC(dev) sync_dquots(dev, -1)

To:

#define DQUOT_SYNC_DEV(dev)     sync_dquots_dev(dev, -1)

in kernel 2.4.22 from 2.4.21. Can someone who knows better than I confirm
that it should be safe to change the reference in the VFS patch, repatch,
and rebuild?

-Don
