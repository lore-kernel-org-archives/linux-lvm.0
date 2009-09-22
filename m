Date: Tue, 22 Sep 2009 13:47:14 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Problems at cross-compiling LVM2-2.02.52
Message-ID: <20090922124714.GM1210@agk-dp.fab.redhat.com>
References: <c9048c0a0909220516o23075a6h88111b4f42df3039@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c9048c0a0909220516o23075a6h88111b4f42df3039@mail.gmail.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Taylor <pi00100100@gmail.com>
Cc: linux-lvm@redhat.com

On Tue, Sep 22, 2009 at 02:16:16PM +0200, John Taylor wrote:
> I have some problems at cross-compiling LVM2-2.02.52 (latest release).
> The configure argument list is: --prefix=/usr
> --build=i486-unknown-linux-gnu --host=x86_64-unknown-linux-gnu
> --target=x86_64-unknown-linux-gnu --disable-nls. First of all, I
> noticed I can't build LVM2 from a directory different than that where
> I extracted the source tarball, because I get the following error when
> running make:
> make -C doc device-mapper
> make[1]: Entering directory `/mnt/clfs/sources/lvm2-build/doc'
> Makefile:21: ../../LVM2-2.02.52/make.tmpl: No such file or directory
> make[1]: *** No rule to make target `../../LVM2-2.02.52/make.tmpl'.  Stop.
> make[1]: Leaving directory `/mnt/clfs/sources/lvm2-build/doc'
> make: *** [doc.device-mapper] Error 2
 
Paths are stored by 'configure' - that could be where the problem is, if
the code is moved after running configure, or a path with symlinks is
supplied (so .. goes to the wrong place).
The top of my Makefile is:
  srcdir = .
  top_srcdir = .

'make' is designed only to be run from the top directory of the tree,
not subdirectories.

But your example makes no sense: there is nothing to do for
'device-mapper' in 'doc', and it works for me anyway, both with -C and
using the alternative internal 'dot' target directly.

$ make -C doc device-mapper
make: Entering directory `/d/LVM2/doc'
make: Nothing to be done for `device-mapper'.
make: Leaving directory `/d/LVM2/doc'

$ make doc.device-mapper
make -C doc device-mapper
make[1]: Entering directory `/d/LVM2/doc'
make[1]: Nothing to be done for `device-mapper'.
make[1]: Leaving directory `/d/LVM2/doc'


Alasdair
