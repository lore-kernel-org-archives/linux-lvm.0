Return-Path: <jbglaw@dvmwest.gt.owl.de>
Date: Thu, 26 Jul 2001 04:21:40 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Message-ID: <20010726042140.B546@lug-owl.de>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Wrong use count?
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi!

I've got some little box which consists mainly of a SCSI HDD (used
as system disk) and a LV (to hold data):

db-pg:~# uname -a
Linux mirror 2.4.7 #1 Mon Jul 23 12:56:36 CEST 2001 i686 unknown
db-pg:~# mount
/dev/sda3 on / type ext2 (rw,errors=remount-ro,errors=remount-ro)
proc on /proc type proc (rw)
devpts on /dev/pts type devpts (rw,gid=5,mode=620)
/dev/sda1 on /boot type ext2 (rw)
/dev/data_vg/data_lv on /home/data type ext2 (rw)

data_vg consists currently of one IDE HDD. Because IDE is not
needed for boot-up, it's build as modules. However, IDE module's
use count is zero ATM, which is a bad think (TM) IMHO:

db-pg:~# lsmod 
Module                  Size  Used by
rtc                     5408   0  (autoclean)
nfs                    73104   1  (autoclean)
lockd                  49104   1  (autoclean) [nfs]
sunrpc                 60880   1  (autoclean) [nfs lockd]
3c59x                  25184   1  (autoclean)
lvm-mod                40624   2 
ide-disk                6784   0 
ide-probe-mod           8240   0 
ide-mod                62000   0  [ide-disk ide-probe-mod]
apm                     9040   0  (unused)
unix                   15040  34  (autoclean)

Is lvm-mod's use count correct? Two seems one too much. And the IDE
module'S use count seems to be wrong, too. They should be higher.
I could try to rmmod(8) ide-*, but I fear to loose the volume:-)

Could you please enlighten me WRT LVM's and IDE's use count?

MfG, JBG
