Return-Path: <plamb_98@yahoo.com>
Message-ID: <20010724014053.45142.qmail@web13402.mail.yahoo.com>
Date: Mon, 23 Jul 2001 18:40:53 -0700 (PDT)
From: Pierre Lamb <plamb_98@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] Question
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

I recomplied my kernel (2.4.3-12) to include lvm as a
module, added the entries to "modules.conf" made the
pe/vg/lvol finally added vgscan and vgchange -ay to
rc.sysinit before hte line mounting the other fs.  The
problem is it does not do the vgscan/vgchane during
the boot ptocess thus forcing me to do these 2 steps
after logging in. What am I missing

Pierre

__________________________________________________
Do You Yahoo!?
Make international calls for as low as $.04/minute with Yahoo! Messenger
http://phonecard.yahoo.com/
