Message-ID: <615A249B783CD41192F400D0B747AC8606BA85DB@hesse.bbn.hp.com>
From: "ZECHA,HOLGER (HP-Germany,ex1)" <holger_zecha@hp.com>
MIME-Version: 1.0
Subject: [linux-lvm] resize_reiserfs on SuSE Linux enterprise server
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
Date: Fri Jul 19 06:18:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello,

I extended a Logical Volume with reiserfs and tried to extend it online, but
got the following error:

mount -o remount,resize=1269715 /home/linuxrpm
mount: /home/linuxrpm not mounted already, or bad option

or with resize_reiserfs:

resize_reiserfs -s -10M /dev/vg00/lvlinux 
resize_reiserfs 3.x.1b (2002)

resize_reiserfs: remount failed: Invalid argument



Aborted

Has anybody some experience with this ?

Thanks

Holger
