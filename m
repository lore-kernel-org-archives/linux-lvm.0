Subject: Re: [linux-lvm] vgscan -- LVM driver/module not loaded?
Message-ID: <20011114094009.A406@btconnect.com>
References: <20011114152558.H9398@trabas.com> <20011114075148.B343@btconnect.com> <20011114162617.I9398@trabas.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011114162617.I9398@trabas.com>; from abu@trabas.com on Wed, Nov 14, 2001 at 04:26:17PM +0700
From: Joe Thornber <thornber@btconnect.com>
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
Date: Wed Nov 14 04:09:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Nov 14, 2001 at 04:26:17PM +0700, Abu @ Trabas Dot Com wrote:
> Joe Thornber(thornber@btconnect.com)@Wed, Nov 14, 2001 at 07:51:48AM +0000:
> > On Wed, Nov 14, 2001 at 03:25:58PM +0700, Abu @ Trabas Dot Com wrote:
> > > CONFIG_LVM_PROC_FS=y
> 
> I got src.rpm from redhat :(
> ok this option is off now
> 
> #CONFIG_LVM_PROC_FS=y
> 
> 
> > This option disappeared about 9 months ago.  Are you sure you patched
> > the kernel correctly ?
> 
> yup. i am sure.
> 
> [abu@yusril] ~/rpm/BUILD >  /usr/bin/bunzip2 linux-2.4.9.tar.bz2 
> 
> [abu@yusril] ~/rpm/BUILD/linux > uname -a
> Linux yusril.com 2.4.9-6 #1 Fri Oct 26 12:01:42 JAVT 2001 i686 unknown
> 
> [abu@yusril] ~/rpm/BUILD > cd linux
> 
> [abu@yusril] ~/rpm/BUILD/linux > patch -p1 < ~/sw/lvm/LVM/1.0.1-rc4/PATCHES/linux-2.4.9-VFS-lock.patch 

This is an extra patch that you only need if you're using reiserfs
with snapshots.  Read the README in PATCHES for instructions on how to
generate the real patch, which should be called something like
lvm-1.0.1-rc-2.4.9.patch

- Joe
