From: Anders Henke <anders@schlund.de>
Message-ID: <20011109143013.A25638@schlund.de>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Errors compiling 2.2.20 with LVM
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
Date: Fri Nov  9 07:29:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

When trying to compile lvm-1.0.1-rc4 against 2.2.20, the lvm-patches apply
without any problems, but the compile failes:


[...]
/usr/bin/gcc272 -D__KERNEL__ -I/usr/src/linux-2.2.20-hap-1/include -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer  -D__SMP__ -pipe -fno-strength-reduce -m486 -malign-loops=2 -malign-jumps=2 -malign-functions=2 -DCPU=686   -c -o lvm.o lvm.c
lvm.c: In function `lvm_do_lv_create':
lvm.c:2192: structure has no member named `de'
lvm.c: In function `lvm_do_lv_remove':
lvm.c:2277: structure has no member named `de'
make[4]: *** [lvm.o] Error 1

Any ideas?

Anders
-- 
Schlund + Partner AG              Security and System Administration
Erbprinzenstrasse 4-12            v://49.721.91374.50
D-76133 Karlsruhe                 f://49.721.91374.212
