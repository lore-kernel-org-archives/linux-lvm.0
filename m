MIME-Version: 1.0
In-Reply-To: <20170315142923.GA29110@redhat.com>
References: <CAB-bdyTrKbjREU_vRAHiLQvWBh=rt8Mh45CZ0_-3BsHKSkz_Nw@mail.gmail.com>
	<20170314140432.GB4723@redhat.com>
	<CAB-bdySA=nmmBn6uvhc9EOqmtgXA52Ot0=C38fZEwd-3+-8p1w@mail.gmail.com>
	<20170315142923.GA29110@redhat.com>
From: Neutron Sharc <neutronsharc@gmail.com>
Date: Wed, 15 Mar 2017 13:04:30 -0700
Message-ID: <CAB-bdyRgoovh_QcJpNRM0hFKtQn2HhUKPR+nOL3ZxvXFYEZ3KA@mail.gmail.com>
Subject: Re: [linux-lvm] vgcreate failed when using iscsi + dm-multipath +
	lvm
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Teigland <teigland@redhat.com>
Cc: linux-lvm@redhat.com

Thank you David.  I found build log at:
https://launchpadlibrarian.net/254074158/buildlog_ubuntu-xenial-amd64.lvm2_2.02.133-1ubuntu10_BUILDING.txt.gz

After builting lvm 2.02_168 and installed, it seems multipath-tools
has some conflict with lvm2  I may have to rebuild mulitpath-tools
from src again.

David:  do you usually rebuild lvm2 and multipath-tools at the same time?



On Wed, Mar 15, 2017 at 7:29 AM, David Teigland <teigland@redhat.com> wrote:
> On Tue, Mar 14, 2017 at 03:40:56PM -0700, Neutron Sharc wrote:
>> Thank you David!
>>
>> I grabbed lvm2 src (git://sourceware.org/git/lvm2.git)  and build from
>> tag v2_02_168.  It seems the basic "./configure" doesn't include a lot
>> of components such as lvmetad.  What are the config options you would
>> recommend to use?  Thanks.
>
> Finding configure options is a hassle.  One way to go is to look at the
> lvm package build logs for your distribution, and start with the configure
> used there (perhaps removing some things you know you don't need).  The
> configure used by the latest Fedora 26 build is
>
> from
> https://kojipkgs.fedoraproject.org//packages/lvm2/2.02.168/4.fc26/data/logs/x86_64/build.log
>
> ./configure --build=x86_64-redhat-linux-gnu --host=x86_64-redhat-linux-gnu
> --program-prefix= --disable-dependency-tracking --prefix=/usr
> --exec-prefix=/usr --bindir=/usr/bin --sbindir=/usr/sbin --sysconfdir=/etc
> --datadir=/usr/share --includedir=/usr/include --libdir=/usr/lib64
> --libexecdir=/usr/libexec --localstatedir=/var --sharedstatedir=/var/lib
> --mandir=/usr/share/man --infodir=/usr/share/info
> --with-default-dm-run-dir=/run --with-default-run-dir=/run/lvm
> --with-default-pid-dir=/run --with-default-locking-dir=/run/lock/lvm
> --with-usrlibdir=/usr/lib64 --enable-lvm1_fallback --enable-fsadm
> --with-pool=internal --enable-write_install --with-user= --with-group=
> --with-device-uid=0 --with-device-gid=6 --with-device-mode=0660
> --enable-pkgconfig --enable-applib --enable-cmdlib --enable-dmeventd
> --enable-blkid_wiping --enable-python2-bindings --enable-python3-bindings
> --with-cluster=internal --with-clvmd=corosync --enable-cmirrord
> --with-udevdir=/usr/lib/udev/rules.d --enable-udev_sync
> --with-thin=internal --enable-lvmetad --with-cache=internal
> --enable-lvmpolld --enable-lockd-dlm --enable-lockd-sanlock
> --enable-dbus-service --enable-notify-dbus
