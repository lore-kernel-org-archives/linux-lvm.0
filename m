Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r6MAmquk005669
	for <linux-lvm@redhat.com>; Mon, 22 Jul 2013 06:48:52 -0400
Received: from mail-pb0-f51.google.com (mail-pb0-f51.google.com
	[209.85.160.51])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r6MAmp7T004745
	for <linux-lvm@redhat.com>; Mon, 22 Jul 2013 06:48:51 -0400
Received: by mail-pb0-f51.google.com with SMTP id um15so6939711pbc.24
	for <linux-lvm@redhat.com>; Mon, 22 Jul 2013 03:48:51 -0700 (PDT)
Received: from gmail.com (nat-pool-pnq-t.redhat.com. [209.132.188.26])
	by mx.google.com with ESMTPSA id
	pv5sm38565393pac.14.2013.07.22.03.48.49 for <linux-lvm@redhat.com>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 22 Jul 2013 03:48:50 -0700 (PDT)
Date: Mon, 22 Jul 2013 01:15:02 -0400
From: Kumar amit mehta <gmate.amit@gmail.com>
Message-ID: <20130722051502.GA5685@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] lvcreate --thin gives "unknown segment type" error
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

While trying to create thin provisioned volume, I'm getting "unknown 
segment type" error. Please see the logs below:

# cat /etc/redhat-release 
Red Hat Enterprise Linux Server release 6.4 (Santiago)

# uname -r
2.6.32-358.el6.x86_64

# dmsetup targets
thin-pool        v1.5.1
thin             v1.5.1
multipath        v1.5.0
mirror           v1.12.0
striped          v1.5.6
linear           v1.1.0
error            v1.0.1

# lvm version
  LVM version:     2.02.99(2)-git (2012-10-22)
  Library version: 1.02.78-git (2012-10-22)
  Driver version:  4.23.6

# vgs|grep -i testvg
  testvg          2   0   0 wz--n- 3.99g    3.99g

# pvs -o +devices|grep -i testvg
  /dev/vdc   testvg        lvm2 a--  2.00g    2.00g                
  /dev/vde   testvg        lvm2 a--  2.00g    2.00g 

# lvcreate -L 1G -T testvg/thinlv1 -vvvv
#libdm-config.c:908       Setting activation/monitoring to 1
#lvmcmdline.c:1102         Processing: lvcreate -L 1G -T testvg/thinlv1 -vvvv
#lvmcmdline.c:1105         O_DIRECT will be used
#libdm-config.c:844       Setting global/locking_type to 1
#libdm-config.c:908       Setting global/wait_for_locks to 1
#locking/locking.c:241       File-based locking selected.
#libdm-config.c:813       Setting global/locking_dir to /var/lock/lvm
#libdm-config.c:908       Setting global/prioritise_write_locks to 1
#unknown/unknown.c:102       Initialised segtype: thin
  WARNING: Unrecognised segment type thin
#lvcreate.c:746   Unable to create LV with unknown segment type thin. <-
  Run `lvcreate --help' for more informationat am I missing?

What am I missing?

!!amit
