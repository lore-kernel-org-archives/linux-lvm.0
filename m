Return-Path: <alec@shadowstar.net>
Date: Sat, 17 Mar 2001 18:19:22 -0500 (EST)
From: Alec Smith <alec@shadowstar.net>
Message-ID: <Pine.LNX.4.33.0103171814270.19966-100000@bugs.home.shadowstar.net>
MIME-Version: 1.0
Subject: [linux-lvm] Getting LVM to startup on RedHat
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

I've compiled kernel 2.2.17+LVM-0.9 patches on a RedHat 6.2 machine. If I
run

vgscan
vgchange -ay
mount /dev/malepages/data /data

at a command prompt, all works well. However, if I include

/usr/sbin/vgscan
/usr/sbin/vgchange -ay

(exactly as above) in my /etc/rc.d/rc.sysinit the commands don't seem to
be run at reboot. After the reboot, I can run the vgchange and mount
commands without first doing a vgscan without incident.

Any ideas what could be going on?

Thanks,
Alec
