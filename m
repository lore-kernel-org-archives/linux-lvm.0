From: Adrian Phillips <a.phillips@met.no>
Message-ID: <wvadoqfzpc.fsf@freeze.oslo.dnmi.no>
MIME-Version: 1.0
Subject: [linux-lvm] Compile errors : 2.2.21-rc4 and 1.0.5
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
Date: Wed Jul 17 04:53:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

2.2.20 + patch-2.2.21-rc4 + reiserfs patches + rawio + ide-2.2.20 patch

gives :-

cc -D__KERNEL__ -I/usr/local/cfengine/linux/kernel/build/src/linux-2.2.20/include -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -fno-strict-aliasing -D__SMP__ -pipe -fno-strength-reduce -m486 -malign-loops=2 -malign-jumps=2 -malign-functions=2 -DCPU=586 -DMODULE -DMODVERSIONS -include /usr/local/cfengine/linux/kernel/build/src/linux-2.2.20/include/linux/modversions.h   -c -o lvm.o lvm.c
lvm.c: In function `lvm_blk_ioctl':
lvm.c:1015: `BLKPG' undeclared (first use in this function)
lvm.c:1015: (Each undeclared identifier is reported only once
lvm.c:1015: for each function it appears in.)
lvm.c:1018: `BLKBSZGET' undeclared (first use in this function)
lvm.c:1019: `BLKBSZSET' undeclared (first use in this function)
lvm.c:1020: warning: implicit declaration of function `blk_ioctl'
{standard input}: Assembler messages:
{standard input}:9: Warning: ignoring changed section attributes for .modinfo
make[3]: *** [lvm.o] Error 1

Sincerely,

Adrian Phillips

-- 
Your mouse has moved.
Windows NT must be restarted for the change to take effect.
Reboot now?  [OK]
