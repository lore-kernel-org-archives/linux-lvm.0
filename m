Return-Path: <silva@athenea.ort.edu.uy>
From: Ernesto Silva <silva@athenea.ort.edu.uy>
Date: Tue, 24 Apr 2001 12:19:45 -0300
MIME-Version: 1.0
Message-Id: <01042412353404.07748@pc-silva>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] K=2.4.3 - LVM0.9.1.B7 compiling problem.
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

Hi,

	In order to make things right I downloaded the 2.4.3 kernel and
compiled it (i386).

	With the new kernel running (lvm-mod load ok) I'm trying to compile lvm
tools, but there are lots of warinigs, all the same thing, the first of them is:
-----------------------------------------------------------
gcc -c -pipe -g -O2 -Wall -DDEBUG -I ../../tools/lib -I ../../tools - debug.o
debug.c
In file included from ../../tools/lib/liblvm.h:97
		from basename.c:34
../../tools/lib/lvm_log.h:47:59: warning: nothing can be pasted after this token
../../tools/lib/lvm_log.h:48:59: warning: nothing can be pasted after this token
../../tools/lib/lvm_log.h:49:59: warning: nothing can be pasted after this token
../../tools/lib/lvm_log.h:52:39: warning: nothing can be pasted after this token
gasename.c:41:69: warning: pasting would not give a valid preprocessing token
gasename.c:59:68: warning: pasting would not give a valid preprocessing token
----------------------------------------------------------
 This messages repeats several times.

Does anyone had a problem like this before???
