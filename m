Return-Path: <lembark@wrkhors.com>
Message-ID: <3A85CE89.67D252D7@wrkhors.com>
Date: Sat, 10 Feb 2001 17:28:09 -0600
From: Steven Lembark <lembark@wrkhors.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] 0.9.1-beta4 install bug
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

tried beta4 since the LVM_DIR_PREFIX replacement may have been
fixed.  

	./configure --prefix=/opt/lvm/0.9.1 

leaves only the man pages in the prefix dir, exec's still go
to /sbin.  this is bad news since it will blow off the entire
LVM installation the next time i test an install.  

checking ./configure --help:

<snip>

Directory and file names:
  --prefix=PREFIX         install architecture-independent files in
PREFIX
                          [/usr]
  --exec-prefix=EPREFIX   install architecture-dependent files in
EPREFIX
                          [same as prefix]
  --bindir=DIR            user executables in DIR [EPREFIX/bin]
  --sbindir=DIR           system admin executables in DIR [EPREFIX/sbin]
  --libexecdir=DIR        program executables in DIR [EPREFIX/libexec]
  --datadir=DIR           read-only architecture-independent data in DIR
                          [PREFIX/share]
  --sysconfdir=DIR        read-only single-machine data in DIR
[PREFIX/etc]
  --sharedstatedir=DIR    modifiable architecture-independent data in
DIR
                          [PREFIX/com]
  --localstatedir=DIR     modifiable single-machine data in DIR
[PREFIX/var]
  --libdir=DIR            object code libraries in DIR [EPREFIX/lib]
  --includedir=DIR        C header files in DIR [PREFIX/include]
  --oldincludedir=DIR     C header files for non-gcc in DIR
[/usr/include]
  --infodir=DIR           info documentation in DIR [PREFIX/info]
  --mandir=DIR            man documentation in DIR [PREFIX/man]
  --srcdir=DIR            find the sources in DIR [configure dir or ..]
  --program-prefix=PREFIX prepend PREFIX to installed program names
  --program-suffix=SUFFIX append SUFFIX to installed program names
  --program-transform-name=PROGRAM
                          run sed PROGRAM on installed program names

<snip>


so, prefix should set eprefix & friends which should leave the 
binaries in /opt/lvm/0.9.1/sbin, etc.

any chance this could be fixed for the next beta?

and/or was the LVM_DIR_PREFIX vs. hard-coded "/dev" entrys fixed
in this one?

thanx.

-- 
 Steven Lembark                                   2930 W. Palmer St.
                                                 Chicago, IL  60647
 lembark@wrkhors.com                                   800-762-1582
