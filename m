Date: Sun, 1 Jul 2007 21:34:36 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] [PATCH]: don't use functions marked by SUSv3 as legacy
Message-ID: <20070701203436.GK30047@agk.fab.redhat.com>
References: <200707011529.08381.arekm@maven.pl>
	<20070701144829.GI30047@agk.fab.redhat.com>
	<200707011658.00819.arekm@maven.pl>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200707011658.00819.arekm@maven.pl>
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
To: Arkadiusz Miskiewicz <arekm@maven.pl>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Sun, Jul 01, 2007 at 04:58:00PM +0200, Arkadiusz Miskiewicz wrote:
> Please merge this one, too:
> http://cvs.pld-linux.org/cgi-bin/cvsweb/SOURCES/lvm2-as-needed.patch
 
Yep.

> The other one puts LDFLAGS (linker flags) not CFLAGS (cflags is for 
> compilation, ldflags for linking) and changes order so linking will success 
> when using -Wl,--as-needed flag.
 
For fsadm, which I don't consider production-ready yet - but if you're
using it successfully that'd be nice to know!

> There are also others mostly self explaining patches for device-mapper:
> http://cvs.pld-linux.org/cgi-bin/cvsweb/SOURCES/device-mapper-disable_dynamic_link.patch

Want to test that one - how does it handle configure --disable-dynamic without
--enable-static?  (A nice error message?  Is there a cleaner way?)

> http://cvs.pld-linux.org/cgi-bin/cvsweb/SOURCES/device-mapper-force-local-headers.patch

Not sure what the best way to achieve that upstream is: the patch breaks some
valid alternative configurations.

> http://cvs.pld-linux.org/cgi-bin/cvsweb/SOURCES/device-mapper-getopt.patch

OK

> http://cvs.pld-linux.org/cgi-bin/cvsweb/SOURCES/device-mapper-klibc.patch

basename: I'd rather call a local implementation if 'configure' didn't find one

fread+sscanf: I'd prefer not to change that at this stage unless you can show
if fixes bugs in the existing implementation (it's not easy to get this sort of
code correct, so any change involves avoidable risk) - again an alternative
function implementation (possibly with a little refactoring) would be more
acceptable.

Alasdair
-- 
agk@redhat.com
