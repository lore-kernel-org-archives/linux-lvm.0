Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o7HN9UZJ003508
	for <linux-lvm@redhat.com>; Tue, 17 Aug 2010 19:09:30 -0400
Received: from mckesson.com (mail6.mckesson.com [143.112.68.15])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o7HN9IID024404
	for <linux-lvm@redhat.com>; Tue, 17 Aug 2010 19:09:19 -0400
From: "Allen, Jack" <Jack.Allen@mckesson.com>
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Tue, 17 Aug 2010 19:09:10 -0400
Message-ID: <230ED15F81AFD3409345FFA4E565F0E50CE96ABE@NDHV3000.na.corp.mckesson.com>
In-Reply-To: <1282083145.10489.19.camel@zhadum.moger.at>
References: <230ED15F81AFD3409345FFA4E565F0E50CE525BF@NDHV3000.na.corp.mckesson.com>
	<1282083145.10489.19.camel@zhadum.moger.at>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] pvmove hangs
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
To: LVM general discussion and development <linux-lvm@redhat.com>

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
On Behalf Of Thomas Hager
Sent: Tuesday, August 17, 2010 6:12 PM
To: linux-lvm@redhat.com
Subject: Re: [linux-lvm] pvmove hangs

On Tue, 2010-08-17 at 15:26 -0400, Allen, Jack wrote:
> I know pvmove is part ofLVM2, but because it worked with PowerPath and
> not when using Multipath and all other things are the same is the
> reason I am asking the questions here.
we had similar problems with novell SLES every now and then, and they
were not reproduceable and occured in random time frames. 

among them:

- the pvmove simply stalled, outputting the same %-done message every 15
seconds until we reset the server.

- the server crashed and performed an automated reboot.

and worst:

- pvmove immediately threw an I/O error after starting, committed all
pending moves though -> all data previously residing on the old LUN was
lost :(

novell provided several updates to the kernel, lvm2 and the
device-mapper, but there might still lurk some bugs we haven't triggered
yet. one advise they gave us was to only migrate PEs of one LV at a
time, which we followed afterwards.

we've seen this behaviour only on SLES, which is the distribution we use
on most of our servers. the few redhats we have migrated fine with
pvmove, we didn't migrate much on these though (only some hundred GB
compared to the ~50TB we had to migrate with SLES). and it was not
related to the storage driver we used, we faced the same issues with
HP's adapted qlogic driver as well as with dm-mp.

anyway, you definitely should open an SR in redhat's CC, so they can
investigate the issue more closely.

hth,
tom.
=============
Thanks for the info Tom.

After sending the post I tried the pvmove command several more times,
this time adding the -v option. One PV had 3 LVs on it and it completed
the first LV with no problem and then as it completed the second LV is
displays suspending LV (the first one did to) and this is when
everything related to the PV hung. If you try to do any LVM commands on
the VG they hang, but if you abort them with a ^C it states aborted
while waiting on flock /var/lock/lvm/X, where X is the VG name. If I
remove the file I can then do LVM commands related to the VG, but the
pvmove is still hung. So it would seem there is some race condition,
deadly embrace, catch 22 of 2 resources waiting on each other. Writes
are waiting because the LV is suspended, and suspending is waiting
because there are outstanding writes to be done.

I plan to open case with Red Hat, but was hoping the problem had already
been handled. I am still concerned about it not working with multipath,
but works fine with Powerpath, because I would rather use multipath
because it makes doing yum updates a lot easier.

------
Jack Allen
