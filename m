From: Dmitriy Samovskiy <dima@somic.org>
Message-ID: <20030731155430.A21290@somic.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] [bug report] SIGSEGV when /dev/lvm doesn't exist
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
Date: Thu Jul 31 15:55:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,

LVM userland tools (such as pvcreate, vgscan and so on) would crash with
SIGSEGV if /dev/lvm file does not exist. Plese find details below.

After I created /dev/lvm, everything is fine.
It's not actually a bug - just a minor inconvenience.

==============================
[15:37:18 1.0.7]# pvscan -h
Logical Volume Manager 1.0.7
Heinz Mauelshagen, Sistina Software  28/03/2003 (IOP 10)

pvscan --  scan for physical volumes

pvscan [-d|--debug] {-e|--exported | -n/--novolumegroup} [-h|--help]
	[-s|--short] [-u|--uuid] [-v[v]|--verbose [--verbose]] [--version]
===============================
[15:39:03 1.0.7]# cat /proc/lvm/global 
LVM driver LVM version 1.0.5+(22/07/2002)

Total:  0 VGs  0 PVs  0 LVs (0 LVs open)
Global: 153 bytes malloced   IOP version: 10   44 days 21:07:45 active
===============================
[15:39:07 1.0.7]# uname -a
Linux home.somic.org 2.4.21 #1 Mon Jun 16 22:40:39 CDT 2003 i686 unknown
===============================

-- 
  Dmitriy Samovskiy
  dsamovskiy@yahoo.com    dima@somic.org
  http://www.somic.org
  PGP (GnuPG) public key: http://www.somic.org/dima.gpg.asc
