From: pamvdam@ramoth.xs4all.nl
Date: Fri, 20 Aug 1999 18:39:24 +0200
Subject: [linux-lvm] 2.3.14/LVM 0.7 - Bad lvmmap ptr ...
Message-ID: <19990820183924.A21910@ladystrange.bluehorizon.nl>
Mime-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Hi!

During the installation of an Oracle instance (doing lots of
inserts) I get the following errors. I'm currently using kernel 2.3.14,
a revised LVM 2.3.13 patch and lvm 0.7 tools.

I saw this earlier with 2.3.13 and LVM 0.7.

Any ideas?

Best regards,

	Pascal

syslog--------------------------------------------------------------


Aug 20 18:13:21 dot kernel: Bad lvm_map in ll_rw_block
Aug 20 18:13:21 dot kernel: attempt to access beyond end of device
Aug 20 18:13:21 dot kernel: 08:21: rw=1, want=2780486, limit=4205429
Aug 20 18:13:21 dot kernel: attempt to access beyond end of device
Aug 20 18:13:21 dot kernel: 08:21: rw=1, want=2780525, limit=4205429
Aug 20 18:13:21 dot kernel: attempt to access beyond end of device
Aug 20 18:13:21 dot kernel: 08:21: rw=1, want=2780552, limit=4205429
Aug 20 18:13:21 dot kernel: attempt to access beyond end of device
Aug 20 18:13:21 dot kernel: 08:21: rw=1, want=2780638, limit=0
Aug 20 18:13:21 dot kernel: attempt to access beyond end of device
Aug 20 18:13:21 dot kernel: 08:21: rw=1, want=2780718, limit=4205429
Aug 20 18:13:21 dot kernel: attempt to access beyond end of device
Aug 20 18:13:21 dot kernel: 08:21: rw=1, want=2780723, limit=4205429
Aug 20 18:13:21 dot kernel: attempt to access beyond end of device
Aug 20 18:13:21 dot kernel: 08:21: rw=1, want=2780801, limit=4205429
Aug 20 18:13:21 dot kernel: attempt to access beyond end of device
Aug 20 18:13:21 dot kernel: 08:21: rw=1, want=2780805, limit=4205429
Aug 20 18:13:21 dot kernel: attempt to access beyond end of device
Aug 20 18:13:21 dot kernel: 08:21: rw=1, want=2780911, limit=4205429
Aug 20 18:13:21 dot kernel: lvm - lvm_map *rsector: 5562048 + size: 2 too large for 01:10
Aug 20 18:13:21 dot kernel: Bad lvm_map in ll_rw_block
Aug 20 18:13:21 dot kernel: attempt to access beyond end of device
Aug 20 18:13:21 dot kernel: 08:21: rw=1, want=2781279, limit=4205429
Aug 20 18:13:21 dot kernel: attempt to access beyond end of device
Aug 20 18:13:21 dot kernel: 08:21: rw=1, want=2781872, limit=4205429
Aug 20 18:13:21 dot kernel: attempt to access beyond end of device
Aug 20 18:13:21 dot kernel: 08:21: rw=1, want=14153, limit=4205429
Aug 20 18:13:21 dot kernel: attempt to access beyond end of device
Aug 20 18:13:21 dot kernel: 08:21: rw=1, want=14158, limit=0
Aug 20 18:13:21 dot kernel: lvm -- oops, got lvm request?
Aug 20 18:13:21 dot kernel: attempt to access beyond end of device
Aug 20 18:13:21 dot kernel: 08:21: rw=1, want=2781928, limit=4205429
Aug 20 18:13:21 dot kernel: attempt to access beyond end of device
Aug 20 18:13:21 dot kernel: 08:21: rw=1, want=2781945, limit=4205429
Aug 20 18:13:21 dot kernel: attempt to access beyond end of device
Aug 20 18:13:21 dot kernel: 08:21: rw=1, want=2781949, limit=4205429
Aug 20 18:13:21 dot kernel: attempt to access beyond end of device
Aug 20 18:13:21 dot kernel: 08:21: rw=1, want=2781966, limit=4205429
Aug 20 18:13:21 dot kernel: attempt to access beyond end of device
Aug 20 18:13:21 dot kernel: 08:21: rw=1, want=2782274, limit=4205429
Aug 20 18:13:21 dot kernel: attempt to access beyond end of device
Aug 20 18:13:21 dot kernel: 08:21: rw=1, want=14634, limit=4205429
Aug 20 18:13:21 dot kernel: attempt to access beyond end of device
Aug 20 18:13:21 dot kernel: 08:21: rw=1, want=14878, limit=4205429
Aug 20 18:13:41 dot kernel: lvm - lvm_map *rsector: 5740392 + size: 2 too large for 01:10
Aug 20 18:13:41 dot kernel: Bad lvm_map in ll_rw_block
