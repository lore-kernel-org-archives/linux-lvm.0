Return-Path: <dice@mfa.kfki.hu>
Date: Wed, 20 Dec 2000 10:29:23 +0100 (CET)
From: Gergely Tamas <dice@mfa.kfki.hu>
Message-ID: <Pine.LNX.4.30.0012201012130.4495-100000@falka.mfa.kfki.hu>
MIME-Version: 1.0
Subject: [linux-lvm] '/etc/init.d/lvm' script in debian package
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi!

Some notes to the /etc/init.d/lvm script in the debian packages ...

1] --- it would be better to add '-a ! -d /proc/lvm' as shown bellow,
       becouse in in the newer versions '/proc/lvm' is a directory
       (but what if compiled without /proc/lvm info...)

if [ ! -f /proc/lvm -a ! -d /proc/lvm ]; then
   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ was: '[ ! -f /proc/lvm ]; then'

	if [ ! -f /lib/modules/`uname -r`/block/lvm.o -a ! -f /lib/modules/`uname -r`/block/lvm-mod.o ]; then
		exit 0
	fi
fi
---

2] --- I still think that an init.d script should display a usage help as
       default

case "$1" in
	start)
        ^^^^^^ was: 'start|"")'

		echo "Setting up LVM Volume Groups..."
		#/sbin/vgscan
		/sbin/vgchange -a y
		;;

Thanks,
Gergely
