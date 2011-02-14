Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p1EFkIBW032633
	for <linux-lvm@redhat.com>; Mon, 14 Feb 2011 10:46:18 -0500
Received: from mail-bw0-f46.google.com (mail-bw0-f46.google.com
	[209.85.214.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p1EFk5fA018862
	for <linux-lvm@redhat.com>; Mon, 14 Feb 2011 10:46:06 -0500
Received: by bwz15 with SMTP id 15so5749333bwz.33
	for <linux-lvm@redhat.com>; Mon, 14 Feb 2011 07:46:05 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 14 Feb 2011 09:46:05 -0600
Message-ID: <AANLkTi=sSJiVJkqOojR7HUs=STDR1-wXNEqaHsv7smWP@mail.gmail.com>
From: Jeff <jlar310@gmail.com>
Subject: [linux-lvm] lvcreate and lvremove --quiet option is not quiet
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
To: linux-lvm@redhat.com

Background: I am using lvm snapshots in a backup script. My general
scripting philosophy is that automation scripts that do not have
errors should not generate output that will cause cron to send an
email.

I am using Ubuntu 10.04 with lvm2.02.54-1ubuntu4.

Even with the --quiet option I get "Logical volume <name> created" on
stdout with lvcreate and "Logical volume <name> successfully removed"
with lvremove.

So... I grabbed the source code and started nosing around. In
lv_manip.c, I find that these messages are produced with a call to the
function log_print. log_print is a macro (in log.h) for
LOG_LINE(_LOG_WARN, args). So it looks like the logging system sees
these messages as warnings and is printing them even though verbosity
is turned down as far as possible. In addition to --quiet on the
command line, I have verbose = 0 in lvm.conf which according to the
man page "should produce no output".

From my point of view, lv_manip.c should be calling the log_info macro
for these messages and not log_print, thus giving the user control
over the output as advertised by the documentation. Disclaimer: I did
not dig into the source code far enough to be assured that log_info
will generated the proper results, but it certainly appears on the
surface to be the right option.

I also downloaded the latest source tarball (2.0.2.84) and the
situation appears to be the same.

Jeff
