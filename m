Subject: Re: [linux-lvm] configure:sed: file conftest.s1 line 40: Unterminated `s' command
References: <FDEJIMPDHJAAPNLFKBMGAEILCOAA.tgs@iafrica.com>
From: Adrian Phillips <a.phillips@dnmi.no>
In-Reply-To: <FDEJIMPDHJAAPNLFKBMGAEILCOAA.tgs@iafrica.com>
Message-ID: <wv7ksb769w.fsf@freeze.oslo.dnmi.no>
MIME-Version: 1.0
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
Date: Wed Nov 28 00:33:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

>>>>> "Theo" == Theo  <tgs@iafrica.com> writes:

    Theo> Hi there, I downloaded version 1.0.1 and when I run
    Theo> configure I get the following problem. My guess would be I
    Theo> have an outdated version of sed. I'm running GNU sed version
    Theo> 3.02. What version do I need or am I totally of track ?

    Theo> Regards.

    Theo> PS: I'm currently running LVM 1.0 fine.

    Theo> checking for uname... (cached) yes creating ./config.status
    Theo> creating Makefile sed: file conftest.s1 line 40:
    Theo> Unterminated `s' command creating make.tmpl sed: file
    Theo> conftest.s1 line 40: Unterminated `s' command creating
    Theo> PATCHES/Makefile sed: file conftest.s1 line 40: Unterminated
    Theo> `s' command creating tools/Makefile sed: file conftest.s1
    Theo> line 40: Unterminated `s' command creating
    Theo> tools/tools_and_lib.make.tmpl sed: file conftest.s1 line 40:
    Theo> Unterminated `s' command creating tools/lib/Makefile sed:
    Theo> file conftest.s1 line 40: Unterminated `s' command creating
    Theo> tools/man8/Makefile sed: file conftest.s1 line 40:
    Theo> Unterminated `s' command

Well, I'm running 3.02 (3.02-8 Debian package) and have configured
1.0.1 without problems.

If you don't get a definite anwser, try adding set -x at the beginning
of configure and see what sed commands are being generated while the
Makefile is being created.

Sincerely,

Adrian Phillips

-- 
Your mouse has moved.
Windows NT must be restarted for the change to take effect.
Reboot now?  [OK]
