From: "Abu @ Trabas Dot Com" <abu@trabas.com>
Subject: Re: [linux-lvm] vgscan -- LVM driver/module not loaded?
Message-ID: <20011114162617.I9398@trabas.com>
References: <20011114152558.H9398@trabas.com> <20011114075148.B343@btconnect.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011114075148.B343@btconnect.com>; from thornber@btconnect.com on Wed, Nov 14, 2001 at 07:51:48AM +0000
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
Date: Wed Nov 14 03:09:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Joe Thornber(thornber@btconnect.com)@Wed, Nov 14, 2001 at 07:51:48AM +0000:
> On Wed, Nov 14, 2001 at 03:25:58PM +0700, Abu @ Trabas Dot Com wrote:
> > CONFIG_LVM_PROC_FS=y

I got src.rpm from redhat :(
ok this option is off now

#CONFIG_LVM_PROC_FS=y


> This option disappeared about 9 months ago.  Are you sure you patched
> the kernel correctly ?

yup. i am sure.

[abu@yusril] ~/rpm/BUILD >  /usr/bin/bunzip2 linux-2.4.9.tar.bz2 

[abu@yusril] ~/rpm/BUILD/linux > uname -a
Linux yusril.com 2.4.9-6 #1 Fri Oct 26 12:01:42 JAVT 2001 i686 unknown

[abu@yusril] ~/rpm/BUILD > cd linux

[abu@yusril] ~/rpm/BUILD/linux > patch -p1 < ~/sw/lvm/LVM/1.0.1-rc4/PATCHES/linux-2.4.9-VFS-lock.patch 
patching file drivers/md/lvm.c
Hunk #1 succeeded at 161 with fuzz 2 (offset -58 lines).
patching file fs/buffer.c
Hunk #1 succeeded at 372 (offset 22 lines).
patching file fs/reiserfs/super.c
Hunk #1 succeeded at 80 (offset 14 lines).
patching file fs/super.c
Hunk #1 succeeded at 681 (offset 44 lines).
patching file include/linux/fs.h
Hunk #1 succeeded at 1161 (offset -62 lines).
patching file kernel/ksyms.c
Hunk #1 succeeded@177 (offset -1 lines).

then build.

-- 
   __   
  (oo)  Open Solution Provider visit http://www.trabas.com
 / \/ \ GnuPg public information         pub 1024/EBD26280 
 `V__V' A9A9 8F57 9E9D 14E3 05B4  3EDB C241 A313 EBD2 6280
You teach best what you most need to learn.
