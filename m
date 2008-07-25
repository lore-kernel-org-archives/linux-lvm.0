From: Jim Meyering <jim@meyering.net>
In-Reply-To: <1216958314.10255.3.camel@localhost.localdomain> (Dave
	Wysochanski's message of "Thu, 24 Jul 2008 23:58:34 -0400")
References: <1216661693.3355.6.camel@localhost.localdomain>
	<87od4r15b3.fsf@rho.meyering.net>
	<1216669323.3355.7.camel@localhost.localdomain>
	<87vdyyx6z4.fsf@rho.meyering.net>
	<1216958314.10255.3.camel@localhost.localdomain>
Date: Fri, 25 Jul 2008 09:59:19 +0200
Message-ID: <87fxpyo0mg.fsf@rho.meyering.net>
MIME-Version: 1.0
Subject: [linux-lvm] Re: lvm build failures without readline-devel installed?
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
To: dwysocha@redhat.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Dave Wysochanski <dwysocha@redhat.com> wrote:
...
> I'm seeing build failures now with readline-devel _not_ installed and a
> configure line with the readline options absent (only "--enable-debug"
> and "--with-dmdir" options)
>
> http://10.11.231.162:8010/waterfall

Thanks, Dave!

These are the relevant warnings:

  lvm.c:135: warning: implicit declaration of function 'completion_matches'
  lvm.c:135: warning: nested extern declaration of 'completion_matches'
  lvm.c:135: warning: assignment makes pointer from integer without a cast
  lvm.c:138: warning: assignment makes pointer from integer without a cast

In my recent change, I made the mistake of specifying the
previously unspecified ACTION_IF_FOUND parameter to AC_CHECK_LIB.
That overrode the default action (which would prepend -lreadline to LIBS),
so the subsequent check for rl_completion_matches would fail.
Then, the work-around C code would redefine it to "completion_matches",
which would not be declared, resulting in the warnings above.

The following patch also replaces AC_CHECK_FUNC+AC_DEFINE
with an equivalent AC_CHECK_FUNCS call.

I confirmed that this works on a RHEL5 system
with readline-devel not installed.
