Return-Path: <thomasko321d@gmx.at>
Message-ID: <0ac701c10b0a$85e4d6f0$0301a8c0@none56n4x0fcnq>
From: "Thomas Kotzian" <thomasko321d@gmx.at>
References: <85063BBE668FD411944400D0B744267A6433B5@AUSMAIL>
Date: Thu, 12 Jul 2001 21:40:22 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Misbehavior LVM - RAID
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

I've set up a server with a software-Raid 5 under linux. (6x80GB IDE). Raid5
(autodetect) works without any problems ... - but when i want to put the
raid into a pv the problems begin .... - everything works - creating a pv,
vg, lv but when i try to shutdown - the system stops (HARD FREEZE) when the
drives are unmounted .... - sometimes they can be unmounted - but then the
system freezes at the halt/reboot - command at the end of the halt-script
...

Are there any interactions between raid autodetect and lvm known???

Base Distro is: SuSE 7.1 and SuSE 7.2 on intel ...
Kernel from suse or original - linus-release ones - tested: 2.4.6-pre3,
2.4.6-pre5/6, 2.4.7-pre3, 2.4.7-pre6 - tested with the version 0.9.7_beta2
and patched with 0.9.7_beta7

Both show the same behaviour ....

Please help!!

Thomas K.
