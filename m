Return-Path: <plamb_98@yahoo.com>
Message-ID: <20010729024031.86517.qmail@web13406.mail.yahoo.com>
Date: Sat, 28 Jul 2001 19:40:31 -0700 (PDT)
From: Pierre Lamb <plamb_98@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] beta7 help
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

I recomplied my kernel to include lvm modules
(2.4.3-12), added the items to modules.conf and
included vgscan and vgchange -ay into my rc.sysinit
(located just before the line "mounting other
filesystems"). The log files sate that lvm loaded OK,
/proc/lvm is there, but no data in there, vgscan show
it ran and created the file/dirs but not populated.

If I run thise same commands after logging-in they run
properly and all works.

Why wouldn't it run during boot-up????

Pierre

__________________________________________________
Do You Yahoo!?
Make international calls for as low as $.04/minute with Yahoo! Messenger
http://phonecard.yahoo.com/
