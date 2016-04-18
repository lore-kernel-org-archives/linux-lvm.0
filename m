Received: from [10.40.200.44] (ovpn-200-44.brq.redhat.com [10.40.200.44])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3IHXuph004478
	for <linux-lvm@redhat.com>; Mon, 18 Apr 2016 13:33:57 -0400
References: <CAPD1+aPkA54SDUFf=OPzLwjE2p3QpcQgx8_Uh4dRYB+xmHX1rw@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <57151A83.2000400@redhat.com>
Date: Mon, 18 Apr 2016 19:33:56 +0200
MIME-Version: 1.0
In-Reply-To: <CAPD1+aPkA54SDUFf=OPzLwjE2p3QpcQgx8_Uh4dRYB+xmHX1rw@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvm2-2.02.150: error running autotools
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Dne 14.4.2016 v 12:24 Timo Gurr napsal(a):
> When running autotools on lvm2-2.02.150 I get the following error:
>
> Using autoconf:2.5
> Using automake:1.15
> eautoreconf: running in
> /var/tmp/paludis/build/sys-fs-lvm2-2.02.150/work/LVM2.2.02.150 ...
> aclocal
> aclocal-1.15: warning: autoconf input should be named 'configure.ac',
> not 'configure.in'
> autoconf
> configure.in:1527: error: possibly undefined macro: AC_PYTHON_MODULE
>       If this token and others are legitimate, please use m4_pattern_allow.
>       See the Autoconf documentation.
> * Failed Running autoconf !
>
> Attached is a full build.log and the error can also be observed on our CI:
> https://galileo.mailstation.de/jenkins/job/arbor/6248/console
>
> System is a 64bit Exherbo installation, lvm2-2.02.137
> configures/compiles und runs without any problems.


Hi

Well sorry for now -  the current state of upstream  configure.in file
does require newer version of autotools & autoconf & and few
other devel files installed.

So do not run autoconf and use already generated one - available
in both - git repo &  released tar ball.

Once there will be enough time we may possibly fix it and make
it more backward compatible. Until that - use exiting generated
configure script.

Regards

Zdenek
