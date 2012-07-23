Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q6NDR8b5013763
	for <linux-lvm@redhat.com>; Mon, 23 Jul 2012 09:27:08 -0400
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q6NDR6Zi000340
	for <linux-lvm@redhat.com>; Mon, 23 Jul 2012 09:27:06 -0400
Received: by wgbdq10 with SMTP id dq10so4055647wgb.27
	for <linux-lvm@redhat.com>; Mon, 23 Jul 2012 06:27:05 -0700 (PDT)
MIME-Version: 1.0
Sender: fvzwieten@gmail.com
Date: Mon, 23 Jul 2012 15:27:05 +0200
Message-ID: <CALVifsbrDh=CmFoAegg1Q-E6maNGaCPRugmGONkr+wg045xH_w@mail.gmail.com>
From: Fred van Zwieten <fvzwieten@vxcompany.com>
Subject: [linux-lvm] LVM2 snapshotting and new blocks
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi,

I have a question. I am used to the NetApp snapshotting
implementation. These are what I call "new block" aware. This means a
block is only held in a snapshot when the changed block was already in
use. This means when new blocks are written they will not get snapped.
This is a great feature.

I have done some tests with LVM2 snapshots on Fedora17 and this seems
not to be the case in the LVM2 implementation. Can someone confirm
this?

Fred
