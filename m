Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i881kB303934
	for <linux-lvm@redhat.com>; Tue, 7 Sep 2004 21:46:11 -0400
Received: from mproxy.gmail.com (rproxy.gmail.com [64.233.170.199])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i881k5S0018442
	for <linux-lvm@redhat.com>; Tue, 7 Sep 2004 21:46:10 -0400
Received: by mproxy.gmail.com with SMTP id 73so305947rnk
	for <linux-lvm@redhat.com>; Tue, 07 Sep 2004 18:46:05 -0700 (PDT)
Message-ID: <ce9f1f9e04090718394fa17cde@mail.gmail.com>
Date: Tue, 7 Sep 2004 18:39:24 -0700
From: Stanley Yue <stanley.yue@gmail.com>
Subject: Re: [linux-lvm] Resend: API for retrieving linux lvm information
In-Reply-To: <20040907094413.GA6264@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <ce9f1f9e04090623046460fed8@mail.gmail.com>
	<20040907094413.GA6264@agk.surrey.redhat.com>
Reply-To: Stanley Yue <stanley.yue@gmail.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: Stanley Yue <stanley.yue@gmail.com>, LVM general discussion and development <linux-lvm@redhat.com>

Alasdair:

Thanks for your response.

Given your last comment, I think i'm going to just perform the parsing
from cmd-line or through /proc/lvm instead if using the apis.

As far as the parsing goes, is it better (in terms of compatibility,
output stability) to parse against the command line output (i.e.
lvdisplay) or against the /proc/filesystems (i.e.
/proc/lvm/VGs/vg00/LVs)?

Also, it is unclear to me what is the meaning of each fields/values by
looking at the information stored in the /proc/* by itself.

[root@DAP-RHLNX1 LVs]# cat /proc/lvm/VGs/vg00/LVs/vol1 
name:         /dev/vg00/vol1
size:         409600
access:       3
status:       1
number:       0
open:         0
allocation:   0
device:       58:00

For example, what does it mean by "access: 3"?

Is all the information available from query apis (i.e. pvdisplay,
lvdisplay) also available from the /proc/lvm subdirectories?
How can we find out the meaning of each fields/value from the
/proc/lvm information?

Thanks,

Stanley


On Tue, 7 Sep 2004 10:44:13 +0100, Alasdair G Kergon <agk@redhat.com> wrote:
> These answers are for LVM2.
> 
> On Mon, Sep 06, 2004 at 11:04:09PM -0700, Stanley Yue wrote:
> > 1) Is there any api library for retrieve linux lvm configuration? I.e.
> > querying for all the vg(s), pv(s), lv(s) on the system?
>  
> The commands: lvs, pvs, vgs with numerous cmdline flags.
> See lib/report/columns.h for field names
> 
> Access to cmds via library interface: configure --enable-cmdlib
> 
> include lvm2cmd.h
> 
> Example usage: doc/example_cmdlib.c
> 
> Recommend only manipulating one thing at once, so if it
> returns an error you don't have to work out which thing
> went wrong.
> 
> [May yet add an optional argc/argv-style entry point.]
> 
> > 2) If yes, what license is the library release under?
> The library API is intended to be LGPL.
> It's effectively a wrapper around the command-line interface,
> but more efficient because it's able to cache some internal
> state between commands.
> [I shall correct the copyright notices: the library entry-point
> got moved which messed up the original GPL/LGPL code split.]
> 
> liblvm.a does *not* provide a supported API and will sometimes
> change in subtle or incompatible ways without warning.  Don't be
> tempted to link against it.  The only interface supported
> is the one based on the command-line.
> 
> Alasdair
> --
> agk@redhat.com
>
