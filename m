Message-Id: <200207300739.g6U7dQU28837@zeus.dtts.co.jp>
From: Young Ui Park <youngui@dtts.co.jp>
Subject: RE:[linux-lvm] How to install lvm in Redhat 7.1
In-Reply-To: <20020729054718.6310.qmail@webmail6.rediffmail.com>
References: <20020729054718.6310.qmail@webmail6.rediffmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Tue Jul 30 02:39:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

--Shuvodeep  Ghosh<shuvodeep_ghosh@rediffmail.com> wrote:
>Hello lvm'rs,
>              I am new to Linux and i want install lvm on my OS 
>release 2.4.2-2.I was trying to do it with the .rpms available on 
>Susi, but i am stuck after the make dep and make modules 
>procedures.can someone suggest me whether that tar will allow me 
>to install lvm on my redhat release 7.1 or i would need a 
>different tar file for that??
Hi

I patched "LVM 1.0.5" against kernel 2.4.9-34 for RH7.2 as follows;

1.Replace files 
"KERNEL_DIR/drivers/md/lvm.c,lvm-fs.c,lvm-internal.h,lvm-snap.c;
KERNEL_DIR/include/linux/lvm.h".

with these files in lvm_1.0.5.tar.gz
"LVM/1.0.5/kernel/lvm.c,lvm-fs.c,lvm-internal.h,lvm-snap.c,lvm.h"

2.Modify lvm-snap.c as following;
Add 
"int nbhs = KIO_MAX_SECTORS;"
in the begining of both functions
"lvm_snapshot_alloc()" and "lvm_snapshot_release()"

then changes
	alloc_kiovec(1, &lv_snap->lv_iobuf),
	free_kiovec(1, &lv_snap->lv_COW_table_iobuf)
to
	alloc_kiovec_sz(1, &lv_snap->lv_iobuf, &nbhs),
	free_kiovec_sz(1, &lv_snap->lv_COW_table_iobuf, &nbhs) .

3. Apply LVM/1.0.5/PATCHES/linux-2.4.9-VFS-lock.patch like this;

cd KERNEL_DIR/
patch -p1 < LVM_DIR/LVM/1.0.5/PATCHES/linux-2.4.9-VFS-lock.patch


4. Add in KERNEL_DIR/fs/super.c
"static DECLARE_MUTEX(mount_sem);"

5. Make KERNEL

It seems to me that patch applied well and LVM worked.
----
Young Ui Park
