Message-ID: <OF2D2C72C3.FF752A0C-ON85256C7E.006C3E7E@wk.dcx.com>
From: lg34@daimlerchrysler.com
MIME-Version: 1.0
Subject: [linux-lvm] LVM  &  S/390 Question
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
Date: Wed Nov 27 13:51:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: imb4@daimlerchrysler.com, nas@daimlerchrysler.com

We are in the process of installing LVM 1.0.6  on Linux S/390.

We installed the patches and are in the process of rebuilding the Kernel.
We were on our last step (make modules_install) and we came across the
following error condition.

Please see below. Any assistance would be greatly appreciate.
Respond to lg34@dcx.com.
_____________________________________

cp ctc.o netiucv.o lcs.o
/lib/modules/2.4.9-38custom/kernel/drivers/s390/net/
make[2]: Leaving directory `/usr/src/linux-2.4.9-38/drivers/s390/net'
make[1]: Leaving directory `/usr/src/linux-2.4.9-38/drivers/s390'
make -C  arch/s390/math-emu modules_install
make[1]: Entering directory `/usr/src/linux-2.4.9-38/arch/s390/math-emu'
make[1]: Nothing to be done for `modules_install'.
make[1]: Leaving directory `/usr/src/linux-2.4.9-38/arch/s390/math-emu'
cd /lib/modules/2.4.9-38custom; \
mkdir -p pcmcia; \
find kernel -path '*/pcmcia/*' -name '*.o' | xargs -i -r ln -sf ../{}
pcmcia
if [ -r System.map ]; then /sbin/depmod -ae -F System.map  2.4.9-38custom;
fi
depmod: *** Unresolved symbols in
/lib/modules/2.4.9-38custom/kernel/drivers/md/
lvm-mod.o
depmod:         alloc_kiovec
depmod:         lvm_init_fs
depmod:         lvm_fs_remove_vg
depmod:         lvm_fin_fs
depmod:         lvm_fs_remove_lv
depmod:         lvm_fs_remove_pv
depmod:         lvm_fs_create_vg
depmod:         lvm_fs_create_lv
depmod:         free_kiovec
depmod:         lvm_fs_create_pv
make: *** [_modinst_post] Error 1
[root@lnxc0014 linux-2.4]#

_________________________________

Thank You,
Larry C. Grillo
DaimlerChrysler ITM
SCM & Automation Technologies
lg34@dcx.com
(586) 274-7488
