Return-Path: <adu@lmt.lv>
Message-ID: <3ACB0FED.C7F0668F@lmt.lv>
Date: Wed, 04 Apr 2001 15:13:33 +0300
From: Andrejs Dubovskis <adu@lmt.lv>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] alpha 2.4.2 + 0.9.1_beta6
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
To: Linux-LVM@sistina.com

Hi,

unfortunately, for my environment LVM subsystem does not look stable.
AlphaServer AS400
Redhat 7.0
2.4.2 + LVM 0.9.1_beta6
2 SCSI disk

pvcreate /dev/sda1
pvcreate /dev/sdb2
vgcreate vg01 /dev/sda1 /dev/sdb2
lvcreate -i 2 -I 8 -l 2040 -n sms vg01
mke2fs -m 0 /dev/vg01/sms

All test was done in single mode (no network, users, daemons, etc).

boot system in single mode 

vgchange -a y
mount /dev/vg01/sms /opt
dd if=/dev/zero of=/opt/1 count=10000
dd if=/dev/zero of=/opt/2 count=100000
dd if=/dev/zero of=/opt/3 count=1000000
(dd commands' count every next boot may be different)
Got kernel panic in interrupt handle.

boot system in single mode again

vgchange -a y 
Got kernel panic in interrupt handle (not reproducible at next boot).

Best regards, Andrejs Dubovskis
