Date: Thu, 18 Feb 1999 00:33:57 -0600 (CST)
From: Chris Stamborski <cstambor@uiuc.edu>
Subject: [linux-lvm] Problems on compile
Message-ID: <Pine.GSO.3.96.990218002100.11391B-100000@eesnop1.ews.uiuc.edu>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com


I haven't seen this answered anywhere on the website or on the mailing
list.  It's a simple error, but my coding skills are a little rusty...

Stats:

RedHat 5.2, glibc system
kernel 2.2.0 (patched with the a version of the lvm kernel patch) compiled
	smp 
dual p200 system 

lvm code image lvm-19990213, I have the same problem with
lvm_0.5alpha

Problem: 

Initial compile dumps out immediately with:

cc -pipe -c -Wall -I/root/LVM/0.6alpha/tools
-I/root/LVM/0.6alpha/tools/lib -I/root/LVM/0.6alpha/kernel -D__KERNEL__
-O2 -DDEBUG -o basename.o basename.c
cc -pipe -c -Wall -I/root/LVM/0.6alpha/tools
-I/root/LVM/0.6alpha/tools/lib -I/root/LVM/0.6alpha/kernel -D__KERNEL__
-O2 -DDEBUG -o debug.o debug.c
In file included from /root/LVM/0.6alpha/tools/lib/liblvm.h:100,
                 from basename.c:26:
/usr/include/linux/genhd.h:128: parse error before `__u32'
/usr/include/linux/genhd.h:128: warning: no semicolon at end of struct or
union
/usr/include/linux/genhd.h:129: warning: data definition has no type or
storage class
/usr/include/linux/genhd.h:130: parse error before `d_subtype'
/usr/include/linux/genhd.h:130: warning: data definition has no type or
storage class





-----------------------------------------------------------------------------
Chris Stamborski   |    "Make it idiot proof and someone will make a
cstambor@uiuc.edu  |	 better idiot." 
