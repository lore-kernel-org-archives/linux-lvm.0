Date: Mon, 3 Sep 2001 13:51:04 +0200
From: Luca Berra <bluca@comedia.it>
Message-ID: <20010903135104.B3006@colombina.comedia.it>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] [bluca@comedia.it: [lvm-devel] VFS lock and 2.4.9ac]
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

has someone looked into this?

L.
----- Forwarded message from Luca Berra <bluca@comedia.it> -----

From: Luca Berra <bluca@comedia.it>
To: lvm-devel@sistina.com
Cc: linux-kernel@vger.kernel.org
Subject: [lvm-devel] VFS lock and 2.4.9ac
Sender: lvm-devel-admin@sistina.com
Date: Wed, 29 Aug 2001 20:22:19 +0200

hello, i saw that patch 2.3.9ac moves mount_sem from fs/super.c to
fs/namespace.c (it is devlared static), this has problems
with VFS lock patch that is needed fro LVM snapshots and journaled fs
which uses mount_sem in unlockfs()
I believe the best way to fix this is moving unlockfs()
to fs/namespace.c, but i am not 100% positive
what would you suggest?

L.
(btw i am not on l-k, so please cc replies)

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \

_______________________________________________
lvm-devel mailing list
lvm-devel@sistina.com
http://lists.sistina.com/mailman/listinfo/lvm-devel

----- End forwarded message -----

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
