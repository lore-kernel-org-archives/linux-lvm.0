Return-Path: <jweber@valinux.com>
Date: Wed, 24 Jan 2001 09:58:23 -0800 (PST)
From: Jay Weber <jweber@valinux.com>
Message-ID: <Pine.LNX.4.30.0101240945020.9779-100000@beefcake.hdqt.valinux.com>
MIME-Version: 1.0
Subject: [linux-lvm] Debugging help.
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

Hi,

I'm focusing on trying to figure out why I get system hangs in LVM
when a snapshot is in use (or maybe it only triggers when it runs out of
space) while there is heavy IO (although I don't think 8 consecutive cp's
constitue heavy IO).

Any suggestions on what to turn on debugging wise?  I'm currently
utilizing SysRq and kdb v1.5 on stock 2.2.18 with LVM patches applied from
0.9.1beta2 using the PATCHES/README instructions.  All I manage to get
after the system hangs, using SysRq's PrintPC or dropping into kdb
(manually) and doing a backtrace, is reference to cpu_idle and
init_task_union.  This leads me to believe the system is just sitting in
an indefinate idle loop state?

I've also initially tried enabling the debug code in lvm-snap.c but it's
not much help since the box hangs and the info that may be output from it
is stuck in buffer and SysRq Sync don't manage to drop it to disk for me
after hanging.

Any clues, suggestions, hints, pointers?

Nobody else sees this problem?  I'm currently reproducing this on my Vaio
laptop using a loop device attached file as the simulated disk, but will
use another box with real disks here shortly and double check. Granted,
this problem surfaced on another box to start with. :)
