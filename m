Message-ID: <3940BA5F.70544622@post10.tele.dk>
Date: Fri, 09 Jun 2000 11:35:27 +0200
From: Peter Michael Nielsen <pmn@post10.tele.dk>
MIME-Version: 1.0
Subject: [linux-lvm] patching linux kernel 2.2.16
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Help.

I need som information about patching kernel 2.2.16 with 0.8final
When I try to patch I get the following response:

------------------------------------------------------
[root@pemi /root]# tar xfz lvm_0.8final.tar.gz 

[root@pemi /root]# gzip -dc patch-lvm_0.8final-2.gz|(cd /usr/src/linux;
patch -p1)
can't find file to patch at input line 9
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|The following fixes are required to compile the user
|mode tools with glibc2.1 (SuSE 6.3, RHAT 6.?).
|
|Enjoy
|Michael <mike@msede.com>
|
|--- 0.8final/make.tmpl.orig    Tue Feb 22 03:43:40 2000
|+++ 0.8final/make.tmpl Tue Feb 22 04:07:05 2000
--------------------------
File to patch:

-------------------------------------------------------------------------

What did I do wrong or have I just missed do somthing before I started
to patch.

Can anyone give me at hint to solve this.

Peter Michael Nielsen
