From: Marc Cousin <cousinmarc@free.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200307151853.56054.cousinmarc@free.fr>
Subject: [linux-lvm] libgcc_s.so.1 dependancy
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
Date: Tue Jul 15 11:50:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,
I'm having trouble using LVM2 : lvm is linked with libgcc_c.so, which, of 
course, is in a logical volume ...

ldd tools/lvm
        libdevmapper.so.1.00 => /lib/libdevmapper.so.1.00 (0x40029000)
        libdl.so.2 => /lib/libdl.so.2 (0x40030000)
        libc.so.6 => /lib/libc.so.6 (0x40033000)
        libgcc_s.so.1 => 
/usr/lib/gcc-lib/i686-pc-linux-gnu/3.2.3/libgcc_s.so.1 (0x40160000)
        /lib/ld-linux.so.2 => /lib/ld-linux.so.2 (0x40000000)

That's weird, I'm having the problem on one of my gentoos, and not the other 
one. gcc is the same on both :

bash-2.05b$ gcc -v
Reading specs from /usr/lib/gcc-lib/i686-pc-linux-gnu/3.2.3/specs
Configured with: /var/tmp/portage/gcc-3.2.3-r1/work/gcc-3.2.3/configure 
--prefix=/usr --bindir=/usr/i686-pc-linux-gnu/gcc-bin/3.2 
--includedir=/usr/lib/gcc-lib/i686-pc-linux-gnu/3.2.3/include 
--datadir=/usr/share/gcc-data/i686-pc-linux-gnu/3.2 
--mandir=/usr/share/gcc-data/i686-pc-linux-gnu/3.2/man 
--infodir=/usr/share/gcc-data/i686-pc-linux-gnu/3.2/info --enable-shared 
--host=i686-pc-linux-gnu --target=i686-pc-linux-gnu --with-system-zlib 
--enable-languages=c,c++,ada,f77,objc,java --enable-threads=posix 
--enable-long-long --disable-checking --enable-cstdio=stdio 
--enable-clocale=generic --enable-__cxa_atexit 
--enable-version-specific-runtime-libs 
--with-gxx-include-dir=/usr/lib/gcc-lib/i686-pc-linux-gnu/3.2.3/include/g++-v3 
--with-local-prefix=/usr/local --enable-shared --enable-nls 
--without-included-gettext
Thread model: posix
gcc version 3.2.3 20030422 (Gentoo Linux 1.4 3.2.3-r1, propolice)

On one of them, I've got the libgcc_c dependancy, and not on the other one ...
I've md5sum'd both my gcc, and they're not the same file (probably not 
compiled from the same previous gcc, that's the gentoo touch :) )

How can I get rid of this dependancy (I allready tried gcc -static-libgcc, no 
success)
-- 
   If we don't all watch the same TV, what will keep our culture homogeneous?
		  -- Calvin
