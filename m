Return-Path: <lembark@wrkhors.com>
Message-ID: <3A870FAB.5BA5E49@wrkhors.com>
Date: Sun, 11 Feb 2001 16:18:19 -0600
From: Steven Lembark <lembark@wrkhors.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] 0.9.1-beta4 install bug
References: <3A85CE89.67D252D7@wrkhors.com> <17316403266.20010211154237@lopez.at> <20010211193524.B5840@colombina.comedia.it> <3A86F85C.ADEE5C04@wrkhors.com> <20010211224053.B6755@colombina.comedia.it>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> i requote myself:
> if you want to change the behaviour do this
> and rerun autoconf
> ^^^^^^^^^^^^^^^^^^

oops. 

oddity:  install blows up:

make[2]: Entering directory `/scratch/LVM/0.9.1_beta4/tools'
*** Installing e2fsadm lvchange lvcreate lvdisplay lvextend lvmchange
lvmdisksca                                   n lvmsadc lvmsar lvreduce
lvremove lvrename lvscan pvchange pvcreate pvdata
pvdi                                   splay pvmove pvscan vgcfgbackup
vgcfgrestore vgchange vgck vgcreate vgdisplay
vg                                   export vgextend vgimport vgmerge
vgmknodes vgreduce vgremove vgrename vgscan
vgs                                   plit lvmcreate_initrd in
/opt/lvm/0.91//sbin ***
/opt/bin//install: /opt/lvm/0.91//sbin/e2fsadm: Operation not permitted
/opt/bin//install: /opt/lvm/0.91//sbin/lvchange: Operation not permitted
/opt/bin//install: /opt/lvm/0.91//sbin/lvcreate: Operation not permitted
/opt/bin//install: /opt/lvm/0.91//sbin/lvdisplay: Operation not
permitted
/opt/bin//install: /opt/lvm/0.91//sbin/lvextend: Operation not permitted
/opt/bin//install: /opt/lvm/0.91//sbin/lvmchange: Operation not
permitted
/opt/bin//install: /opt/lvm/0.91//sbin/lvmdiskscan: Operation not
permitted
/opt/bin//install: /opt/lvm/0.91//sbin/lvmsadc: Operation not permitted
/opt/bin//install: /opt/lvm/0.91//sbin/lvmsar: Operation not permitted
/opt/bin//install: /opt/lvm/0.91//sbin/lvreduce: Operation not permitted
/opt/bin//install: /opt/lvm/0.91//sbin/lvremove: Operation not permitted
/opt/bin//install: /opt/lvm/0.91//sbin/lvrename: Operation not permitted
/opt/bin//install: /opt/lvm/0.91//sbin/lvscan: Operation not permitted
/opt/bin//install: /opt/lvm/0.91//sbin/pvchange: Operation not permitted
/opt/bin//install: /opt/lvm/0.91//sbin/pvcreate: Operation not permitted
/opt/bin//install: /opt/lvm/0.91//sbin/pvdata: Operation not permitted
/opt/bin//install: /opt/lvm/0.91//sbin/pvdisplay: Operation not
permitted
/opt/bin//install: /opt/lvm/0.91//sbin/pvmove: Operation not permitted
/opt/bin//install: /opt/lvm/0.91//sbin/pvscan: Operation not permitted
/opt/bin//install: /opt/lvm/0.91//sbin/vgcfgbackup: Operation not
permitted
/opt/bin//install: /opt/lvm/0.91//sbin/vgcfgrestore: Operation not
permitted
/opt/bin//install: /opt/lvm/0.91//sbin/vgchange: Operation not permitted
/opt/bin//install: /opt/lvm/0.91//sbin/vgck: Operation not permitted
/opt/bin//install: /opt/lvm/0.91//sbin/vgcreate: Operation not permitted
/opt/bin//install: /opt/lvm/0.91//sbin/vgdisplay: Operation not
permitted
/opt/bin//install: /opt/lvm/0.91//sbin/vgexport: Operation not permitted
/opt/bin//install: /opt/lvm/0.91//sbin/vgextend: Operation not permitted
/opt/bin//install: /opt/lvm/0.91//sbin/vgimport: Operation not permitted
/opt/bin//install: /opt/lvm/0.91//sbin/vgmerge: Operation not permitted
/opt/bin//install: /opt/lvm/0.91//sbin/vgmknodes: Operation not
permitted
/opt/bin//install: /opt/lvm/0.91//sbin/vgreduce: Operation not permitted
/opt/bin//install: /opt/lvm/0.91//sbin/vgremove: Operation not permitted
/opt/bin//install: /opt/lvm/0.91//sbin/vgrename: Operation not permitted
/opt/bin//install: /opt/lvm/0.91//sbin/vgscan: Operation not permitted
/opt/bin//install: /opt/lvm/0.91//sbin/vgsplit: Operation not permitted
make[2]: *** [install-bin] Error 1
make[2]: Target `install_this' not remade because of errors.
make[2]: Leaving directory `/scratch/LVM/0.9.1_beta4/tools'
make[1]: *** [install] Error 2


 installing into a directory that
i own w/ mods 755:

	drwxr-xr-x   2 lembark  bin          4096 Feb 11 16:09
/opt/lvm/0.91//sbin

looks like it's gone out of its way to set the directory
mods since /opt is suid bin and so is /opt/lvm/0.91:

drwxrwsr-x   5 lembark  bin          4096 Feb 11 16:09 /opt/lvm/0.91

everything got put in the proper place but the ownership
and mods are off (obviously i can fix these by hand):

1062 : dizzy : 0.9.1_beta4 $ ls -l /opt/lvm/0.91//sbin
total 496
-r-xr-xr-x   1 lembark  bin         14240 Feb 11 16:09 e2fsadm
-r-xr-xr-x   1 lembark  lembark     16812 Feb 11 16:09 lvchange
-r-xr-xr-x   1 lembark  lembark     25380 Feb 11 16:09 lvcreate
-r-xr-xr-x   1 lembark  lembark      9400 Feb 11 16:09 lvdisplay
-r-xr-xr-x   1 lembark  lembark     15632 Feb 11 16:09 lvextend
-r-xr-xr-x   1 lembark  lembark      7020 Feb 11 16:09 lvmchange
-r-xr-xr-x   1 lembark  lembark      9112 Feb 11 16:09 lvmdiskscan
-r-xr-xr-x   1 lembark  lembark      7520 Feb 11 16:09 lvmsadc
-r-xr-xr-x   1 lembark  lembark      6872 Feb 11 16:09 lvmsar
-r-xr-xr-x   1 lembark  lembark     14296 Feb 11 16:09 lvreduce
-r-xr-xr-x   1 lembark  lembark     12868 Feb 11 16:09 lvremove
-r-xr-xr-x   1 lembark  lembark     13728 Feb 11 16:09 lvrename
-r-xr-xr-x   1 lembark  lembark      9876 Feb 11 16:09 lvscan
-r-xr-xr-x   1 lembark  lembark     11652 Feb 11 16:09 pvchange
-r-xr-xr-x   1 lembark  lembark     12092 Feb 11 16:09 pvcreate
-r-xr-xr-x   1 lembark  lembark     11768 Feb 11 16:09 pvdata
-r-xr-xr-x   1 lembark  lembark     10064 Feb 11 16:09 pvdisplay
-r-xr-xr-x   1 lembark  lembark     17736 Feb 11 16:09 pvmove
-r-xr-xr-x   1 lembark  lembark     10216 Feb 11 16:09 pvscan
-r-xr-xr-x   1 lembark  lembark      7620 Feb 11 16:09 vgcfgbackup
-r-xr-xr-x   1 lembark  lembark     13152 Feb 11 16:09 vgcfgrestore
-r-xr-xr-x   1 lembark  lembark     19244 Feb 11 16:09 vgchange
-r-xr-xr-x   1 lembark  lembark      9748 Feb 11 16:09 vgck
-r-xr-xr-x   1 lembark  lembark     17688 Feb 11 16:09 vgcreate
-r-xr-xr-x   1 lembark  lembark     11724 Feb 11 16:09 vgdisplay
-r-xr-xr-x   1 lembark  lembark     10456 Feb 11 16:09 vgexport
-r-xr-xr-x   1 lembark  lembark     12672 Feb 11 16:09 vgextend
-r-xr-xr-x   1 lembark  lembark     15892 Feb 11 16:09 vgimport
-r-xr-xr-x   1 lembark  lembark     13652 Feb 11 16:09 vgmerge
-r-xr-xr-x   1 lembark  lembark      7788 Feb 11 16:09 vgmknodes
-r-xr-xr-x   1 lembark  lembark     13440 Feb 11 16:09 vgreduce
-r-xr-xr-x   1 lembark  lembark     10048 Feb 11 16:09 vgremove
-r-xr-xr-x   1 lembark  lembark     13688 Feb 11 16:09 vgrename
-r-xr-xr-x   1 lembark  lembark     10960 Feb 11 16:09 vgscan
-r-xr-xr-x   1 lembark  lembark     16052 Feb 11 16:09 vgsplit


any reason that the install has to set the ownership & mods?
i don't remember anything in the code that explicitly checks
file ownership (vs euid of proc execing them), but may have
missed something.

-- 
 Steven Lembark                                   2930 W. Palmer St.
                                                 Chicago, IL  60647
 lembark@wrkhors.com                                   800-762-1582
