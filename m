From: "David Orman" <orman@iastate.edu>
Message-ID: <001201c1987d$858e8b50$18c8ba81@ormanpc>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.33.0201081343410.2001-100000@lx1.daboard.com>
Subject: [linux-lvm] LVM on large drives
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
Date: Tue Jan  8 13:49:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com


David Orman
Network Administrator
ISU Center for NDE


Are there Issue on LVM and very large drives?

Im trying to play with it on a Maxtor 160G IDE and cant hardly get
started..


[root@habenero /root]# pvcreate /dev/hdc1
pvcreate -- physical volume "/dev/hdc1" successfully created
[root@habenero /root]# vgcreate test /dev/hdc1
vgcreate -- ERROR "pv_read(): PV identifier invalid" reading physical
volumes


A little drive info if that helps:

[root@habenero /root]# cat /proc/ide/ide1/hdc/geometry 
physical     266305/16/63
logical      266305/16/63
[root@habenero /root]# cat /proc/ide/ide1/hdc/model    
Maxtor 4G160J8

Disk /dev/hdc: 16 heads, 63 sectors, 266305 cylinders
Units = cylinders of 1008 * 512 bytes
   Device Boot    Start       End    Blocks   Id  System
/dev/hdc1             1    133000  67031968+  83  Linux
/dev/hdc2        133001    266305  67185720   83  Linux
