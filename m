Message-Id: <3C69A99A.398C19D4@bellsouth.net>
From: Jeff Layton <laytonjb@bellsouth.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Building LVM ona RH7.2 - errors
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
Date: Tue Feb 12 17:46:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Good evening,

   I tried building lvm-1.0.2 against a clean 2.4.17
kernel. I untarred the lvm tar.gz file as well as
the 2.4.17 kernel (into /usr/src/linux-2.4.17.clean).
Then I did a,

./configure --with-kernel_dir=/usr/src/linux-2.4.17.clean

from /usr/src/LVLM/1.0.2 I get the following errors
during the configure process,

[root@home2 1.0.2]# ./configure --with-kernel_dir=/usr/src/linux-2.4.17.clean
creating cache ./config.cache
checking for mawk... mawk
checking for gcc... gcc
checking whether the C compiler (gcc  ) works... yes
checking whether the C compiler (gcc  ) is a cross-compiler... no
checking whether we are using GNU C... yes
checking whether gcc accepts -g... yes
checking for a BSD compatible install... /usr/bin/install -c
checking whether ln -s works... yes
checking whether make sets ${MAKE}... yes
checking for dirent.h that defines DIR... yes
checking for opendir in -ldir... no
checking how to run the C preprocessor... gcc -E
checking for ANSI C header files... yes
checking for fcntl.h... yes
checking for malloc.h... yes
checking for sys/ioctl.h... yes
checking for unistd.h... yes
checking for working const... yes
checking for inline... inline
checking for off_t... yes
checking for pid_t... yes
checking for size_t... yes
checking for st_rdev in struct stat... yes
checking whether time.h and sys/time.h may both be included... yes
./configure: [: too many arguments
checking whether gcc needs -traditional... no
checking return type of signal handlers... void
checking for vprintf... yes
checking for mkdir... yes
checking for rmdir... yes
checking for uname... yes
updating cache ./config.cache
creating ./config.status
creating Makefile
sed: file conftest.s1 line 40: Unterminated `s' command
creating make.tmpl
sed: file conftest.s1 line 40: Unterminated `s' command
creating PATCHES/Makefile
sed: file conftest.s1 line 40: Unterminated `s' command
creating tools/Makefile
sed: file conftest.s1 line 40: Unterminated `s' command
creating tools/tools_and_lib.make.tmpl
sed: file conftest.s1 line 40: Unterminated `s' command
creating tools/lib/Makefile
sed: file conftest.s1 line 40: Unterminated `s' command
creating tools/man8/Makefile
sed: file conftest.s1 line 40: Unterminated `s' command


(sorry about the length). sed is not my string point at all.
Any ideas what I'm doing wrong?

TIA,

Jeff
