Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t0S5kPOx005745
	for <linux-lvm@redhat.com>; Wed, 28 Jan 2015 00:46:26 -0500
Received: from zorodyne.com (zorodyne.com [192.220.73.54])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t0S5kNKH019008
	for <linux-lvm@redhat.com>; Wed, 28 Jan 2015 00:46:24 -0500
Received: from unknown (HELO charis.zorodyne.com) ([127.0.0.1])
	(envelope-sender <linux@Zorodyne.COM>)
	by 127.0.0.1 (qmail-ldap-1.03) with SMTP
	for <linux-lvm@redhat.com>; 28 Jan 2015 05:46:23 -0000
Date: Tue, 27 Jan 2015 23:46:22 -0600
From: Philip Amadeo Saeli <psaeli@Zorodyne.COM>
Message-ID: <20150128054622.GA25330@zorodyne.com>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LVM snapshot setup for mysql-zrm backups problem
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
To: LVM general discussion and development <linux-lvm@redhat.com>

I'm not sure where is the best place to ask this so, since I am using
LVM, I am asking here in the hope that someone can at least direct me to
the appropriate place to ask this.  This is my first time setting up
LVM snapshots for mysql-zrm backups.

CentOS-6.6
MySQL-5.6.22
MySQL-zrm-3.0 (EPEL).

Short version:

I am unable to tell if the MySQL-zrm LVM snapshots are indeed taking
place, or if the backup is being taken directly from the main database
LVs.  The log file info isn't giving me enough info to tell one way or
another.

Some more info:

I am setting up a database server with all of the database files on LVM
LVs and am using mysql-zrm for logical backups using LVM snapshots to
reduce the database lock times.

I have followed all of the various setup instructions very closely, and
am using the default "lvm-snapshot.pl" plugin.  However, the only log
file lines mentioning snapshot are the following:

  mysql:backup:INFO: Running snapshot verification using command /usr/share/mysql-zrm/plugins/lvm-snapshot.pl --action verify-config 2>/home/tmp/xH8KKpsF2O

There are no other log entries following this one that seem to have
anything to do with snapshots.  There are no errors.  The backups
succeed.  Both "--verbose" and "--noquiet" are enabled.

Here are the salient entries from the mysql-zrm.conf file:

backup-level=0
backup-mode=logical
lvm-snapshot=20G
snapshot-plugin="/usr/share/mysql-zrm/plugins/lvm-snapshot.pl"
backup-type=regular
destination=/home/mysql-zrm
retention-policy=4W
compress=1

Any info or help would be much appreciated!

Thanks,

--Phil

-- 
Philip Amadeo Saeli
psaeli@zorodyne.com
