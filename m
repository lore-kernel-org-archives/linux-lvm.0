Return-Path: <plamb_98@yahoo.com>
Message-ID: <20010726154218.2155.qmail@web13402.mail.yahoo.com>
Date: Thu, 26 Jul 2001 08:42:18 -0700 (PDT)
From: Pierre Lamb <plamb_98@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] help
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

I placed the 2 required commands in rc.sysinit (rh71)
before hte section "Mounting other file"
gave vgscan the -d option and left vgchange -ay.
During the boot process I see where vscan uodated
lvmtab and lvmtab.d and it say successfull but when I
look into lvmd.d it is empty. after I log in then do
the vgscan the correct entries are made. Ant help
would be appreciated.

Pierre



__________________________________________________
Do You Yahoo!?
Make international calls for as low as $.04/minute with Yahoo! Messenger
http://phonecard.yahoo.com/
