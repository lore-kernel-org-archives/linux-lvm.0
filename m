Message-ID: <38BBE421.6C441018@teil.soft.net>
Date: Tue, 29 Feb 2000 15:22:09 +0000
From: Bits <bits2@teil.soft.net>
MIME-Version: 1.0
Subject: [linux-lvm] Recompilation of Kernel..
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com


I tried recompiling the kernel n booting using the recompiled version..
I have a strange problem that the /proc/ksyms file gets mounted but
still loading the modules gives errors like unresolved symbol...

for eg::
the symbol found in ksyms table when the properly installd kernel is
run..
001169b0 register_symtab_from_R9872f07b

looks like this in the recompiled version..
00116750 register_symtab_from

Plz let me know what exactly the problem is...
This is necessary coz i wud like to make some changes in the kernel
code...

Regards
Gansu.
