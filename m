From: Jim Meyering <jim@meyering.net>
In-Reply-To: <878wymxf6h.fsf@rho.meyering.net> (Jim Meyering's message of
	"Wed, 07 May 2008 18:16:38 +0200")
References: <878wymxf6h.fsf@rho.meyering.net>
Date: Fri, 09 May 2008 23:06:30 +0200
Message-ID: <87bq3fxk4p.fsf@rho.meyering.net>
MIME-Version: 1.0
Subject: [linux-lvm] Re: [dm-devel] merging configure.in between dm and lvm
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
To: device-mapper development <dm-devel@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Jim Meyering <jim@meyering.net> wrote:
> I'm in the process of merging the configure.in files used by lvm and
> device-mapper.  The goal is to make them as similar as reasonable while
> the two packages are still separate, so that once dm and lvm coexist
> there will only be minimal changes.
...
> I've eliminated most of the differences between the two configure.in
> files, but haven't yet done the binary-comparison bit with lvm
> (that'll be harder because there are far more combinations of
> configure-time options to test).  I'll probably post both configure.in
> patches tomorrow or Friday.  So, for now, here's a preliminary
> version of the proposed device-mapper configure.in changes:
> [omitting changes in derived+VC'd files]

Those were the changes for device-mapper.
Here are the analogous ones for lvm.
Tested with the following script:
(examining diffs shows no significant binary differences)
-----------------------------------
#!/bin/bash

t=/t/lvm-test
mkdir -p $t

opts='
readline
selinux
realtime
devmapper
o_direct
cmdlib
fsadm
dmeventd
nls
'

# debug
# static_link
# with-cluster=shared
# with-snapshots=shared
# with-mirrors=shared

set -e

srcdir=$HOME/w/co/lvm+dm/lvm2
srcdir=/t/lvm2
dmdir=$HOME/w/co/lvm+dm/device-mapper

for enable in enable disable; do
  for opt in $opts; do
    for br in master a-conf-merge; do
      cd $srcdir && git checkout $br
      o=$enable-$opt
      echo "============= $br --$o"

      (./configure --$o --with-dmdir=$dmdir CFLAGS=-g &&
	make -j5) > log 2>&1 &&
      cp log $t/log-$br-$o
      rm -rf $t/$br
      cp -al $PWD $t/$br
      find $t/$br -type l -delete
      git clean -f -d > /dev/null 2>&1
    done

    diff -ur \
      -x config.status -x config.log -x .git -x autom4te.cache -x configure \
      -x configure.in -x configure.h -x configure.h.in -x log -x '*.a' \
      $t/master $t/a-conf-merge > $t/diff-$o 2>&1 || :
  done
done

================================
Of course, this just enables/disables each of those options one at a
time, and doesn't do the n-choose-2, n-choose-3, etc. combinations.
BTW, I noticed that when configured with --disable-devmapper,
the build failed.  Does that option even make sense anymore?
