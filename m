Return-Path: <jamesp@foobarhouse.com>
Date: Wed, 1 Aug 2001 19:17:15 +0100 (BST)
From: James Pattinson <jamesp@foobarhouse.com>
Message-ID: <Pine.LNX.4.33.0108011858070.1583-100000@beast.aethos.co.uk>
MIME-Version: 1.0
Subject: [linux-lvm] Help!!! (cant vgchange)
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: jpattinson@yahoo.com

Hi

I just re-booted my box, and now I can't vgchange -ay.

Here's what happens:

[root@greebo-rescue /root]# vgchange -ay
vgchange -- ERROR "Bad address" activating volume group "vg00"
[root@greebo-rescue /root]# dmesg
lvm -- _pv_get_number failed for rdev = 65535
lvm -- lvm_snapshot_fill_COW_page failed

I guess it's possible that my snapshots are full - is there any way of
activating my VG with the snapshots disabled?

Please email me if you have any ideas, I'd rather not restore from tape
again :(

Please email me jpattinson@yahoo.com because I cannot get my normal email
at the moment.

Tia,
James
