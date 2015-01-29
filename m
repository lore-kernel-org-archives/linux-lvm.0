Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t0T0IXii029927
	for <linux-lvm@redhat.com>; Wed, 28 Jan 2015 19:18:33 -0500
Received: from zorodyne.com (zorodyne.com [192.220.73.54])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t0T0IW0I012154
	for <linux-lvm@redhat.com>; Wed, 28 Jan 2015 19:18:32 -0500
Received: from unknown (HELO charis.zorodyne.com) ([127.0.0.1])
	(envelope-sender <linux@Zorodyne.COM>)
	by 127.0.0.1 (qmail-ldap-1.03) with SMTP
	for <linux-lvm@redhat.com>; 29 Jan 2015 00:18:31 -0000
Date: Wed, 28 Jan 2015 18:18:30 -0600
From: Philip Amadeo Saeli <psaeli@Zorodyne.COM>
Message-ID: <20150129001830.GA13453@zorodyne.com>
References: <20150128054622.GA25330@zorodyne.com> <54C8BC61.1010203@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <54C8BC61.1010203@redhat.com>
Subject: Re: [linux-lvm] LVM snapshot setup for mysql-zrm backups problem
Reply-To: Philip Amadeo Saeli <psaeli@Zorodyne.COM>,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Marian Csontos <mcsontos@redhat.com>

Thanks for the response.  More info and questions following.

* Marian Csontos <mcsontos@redhat.com> [2015-01-28 04:53]:
> On 01/28/2015 06:46 AM, Philip Amadeo Saeli wrote:

> What does `lvs` say? Is there any snapshot of the LV where your
> database lives? Copy if to backup destination and try to check the
> content - I presume there is a tool to check the backup...

The backups appear to be OK.  However, my suspicion is that they're
being made from the main database LVs rather than from a freshly-made
snapshot.

I am able to manually make a snapshot LV and it looks OK.  I have also
upped the LVM log level so I can better monitor any LVM errors or
warnings.

However, I have another question:

When I run any of the various LVM cmds with the "-v" flag, I get a
"DEGRADED MODE. Incomplete RAID LVs will be processed." message in the
output.  I find this surprising since none of the LVM vols on that
system are RAID vols.  They are simply single PV vols created for the
sole purpose of enabling snapshots for consistent point-in-time database
backups.  Any ideas why it is printing that?

> Just a word of warning:
> 
> if the script is using old-style snapshots, you want to copy and
> delete it ASAP, or you will see severely degraded performance, and
> much worse once you have multiple snapshots in the system.

What do you mean by "old-style" snapshots?  Does that mean non-thin
snapshots?  Or something else?  What type of degraded performance?  Any
references?

Note that the snapshots I'm using are ephemeral and are to exist only
long enough for the actual database backup operation to complete.

> Also once the space allocated for snapshot gets full, the snapshot
> becomes invalid, so hurry up!
> 
> -- Martian

Thanks!

--Phil

> >the appropriate place to ask this.  This is my first time setting up
> >LVM snapshots for mysql-zrm backups.
> >
> >CentOS-6.6
> >MySQL-5.6.22
> >MySQL-zrm-3.0 (EPEL).
> >
> >Short version:
> >
> >I am unable to tell if the MySQL-zrm LVM snapshots are indeed taking
> >place, or if the backup is being taken directly from the main database
> >LVs.  The log file info isn't giving me enough info to tell one way or
> >another.
> >
> >Some more info:
> >
> >I am setting up a database server with all of the database files on LVM
> >LVs and am using mysql-zrm for logical backups using LVM snapshots to
> >reduce the database lock times.
> >
> >I have followed all of the various setup instructions very closely, and
> >am using the default "lvm-snapshot.pl" plugin.  However, the only log
> >file lines mentioning snapshot are the following:
> >
> >   mysql:backup:INFO: Running snapshot verification using command /usr/share/mysql-zrm/plugins/lvm-snapshot.pl --action verify-config 2>/home/tmp/xH8KKpsF2O
> >
> >There are no other log entries following this one that seem to have
> >anything to do with snapshots.  There are no errors.  The backups
> >succeed.  Both "--verbose" and "--noquiet" are enabled.
> >
> >Here are the salient entries from the mysql-zrm.conf file:
> >
> >backup-level=0
> >backup-mode=logical
> >lvm-snapshot=20G
> >snapshot-plugin="/usr/share/mysql-zrm/plugins/lvm-snapshot.pl"
> >backup-type=regular
> >destination=/home/mysql-zrm
> >retention-policy=4W
> >compress=1
> >
> >Any info or help would be much appreciated!
> >
> >Thanks,
> >
> >--Phil

-- 
Philip Amadeo Saeli
psaeli@zorodyne.com
