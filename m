Return-Path: <plamb_98@yahoo.com>
Date: Thu, 26 Jul 2001 10:13:10 -0400
From: Pierre Lamb <plamb_98@yahoo.com>
Message-id: <3B602575.6E47A8F8@yahoo.com>
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Subject: [linux-lvm] lvm help
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
To: linux-lvm@sistina.com

I placed the 2 required commands in rc.sysinit (rh71)
before hte section "Mounting other file"
gave vgscan the -d option and left vgchange -ay.
During the boot process I see where vscan uodated
lvmtab and lvmtab.d and it say successfull but when I
look into lvmd.d it is empty. after I log in then do
the vgscan the correct entries are made. Ant help
would be appreciated.

Pierre
