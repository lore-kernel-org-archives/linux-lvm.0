Date: Tue, 17 Oct 2000 12:53:49 -0700 (PDT)
From: Myles Uyema <myles@puck.nether.net>
Subject: [linux-lvm] 2.4.0-test9, LVM0.8final
Message-ID: <Pine.LNX.4.21.0010171249450.10210-100000@uyema.net>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

I'm trying to build the LVM user tools, and at the end of the linking
stage I get numerous warnings regarding the use of the llseek function:

cc  -L/usr/src/LVM/0.8final/tools/lib -llvm -o lvextend lvextend.o
/usr/src/LVM/0.8final/tools/lib/liblvm.so: the `llseek' function may be
dangerous; use `lseek64' instead.

Can I safely ignore these warnings?
I'm running SuSE 7.0 with glibc-2.1.3 on Intel i686 architecture.
