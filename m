Date: Tue, 7 Sep 2004 10:44:13 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Resend: API for retrieving linux lvm information
Message-ID: <20040907094413.GA6264@agk.surrey.redhat.com>
References: <ce9f1f9e04090623046460fed8@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ce9f1f9e04090623046460fed8@mail.gmail.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stanley Yue <stanley.yue@gmail.com>, LVM general discussion and development <linux-lvm@redhat.com>

These answers are for LVM2.

On Mon, Sep 06, 2004 at 11:04:09PM -0700, Stanley Yue wrote:
> 1) Is there any api library for retrieve linux lvm configuration? I.e.
> querying for all the vg(s), pv(s), lv(s) on the system?
 
The commands: lvs, pvs, vgs with numerous cmdline flags.
See lib/report/columns.h for field names

Access to cmds via library interface: configure --enable-cmdlib

include lvm2cmd.h

Example usage: doc/example_cmdlib.c

Recommend only manipulating one thing at once, so if it
returns an error you don't have to work out which thing
went wrong.

[May yet add an optional argc/argv-style entry point.]

> 2) If yes, what license is the library release under?
The library API is intended to be LGPL.
It's effectively a wrapper around the command-line interface,
but more efficient because it's able to cache some internal 
state between commands.
[I shall correct the copyright notices: the library entry-point 
got moved which messed up the original GPL/LGPL code split.]

liblvm.a does *not* provide a supported API and will sometimes 
change in subtle or incompatible ways without warning.  Don't be 
tempted to link against it.  The only interface supported
is the one based on the command-line.

Alasdair
-- 
agk@redhat.com
