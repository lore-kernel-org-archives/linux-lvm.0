Message-ID: <54C8BC61.1010203@redhat.com>
Date: Wed, 28 Jan 2015 11:39:29 +0100
From: Marian Csontos <mcsontos@redhat.com>
MIME-Version: 1.0
References: <20150128054622.GA25330@zorodyne.com>
In-Reply-To: <20150128054622.GA25330@zorodyne.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM snapshot setup for mysql-zrm backups problem
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
To: LVM general discussion and development <linux-lvm@redhat.com>, psaeli@zorodyne.com

On 01/28/2015 06:46 AM, Philip Amadeo Saeli wrote:
> I'm not sure where is the best place to ask this so, since I am using

MySQL list, perhaps?

What does `lvs` say? Is there any snapshot of the LV where your database 
lives? Copy if to backup destination and try to check the content - I 
presume there is a tool to check the backup...

Just a word of warning:

if the script is using old-style snapshots, you want to copy and delete 
it ASAP, or you will see severely degraded performance, and much worse 
once you have multiple snapshots in the system.

Also once the space allocated for snapshot gets full, the snapshot 
becomes invalid, so hurry up!

-- Martian

> LVM, I am asking here in the hope that someone can at least direct me to
> the appropriate place to ask this.  This is my first time setting up
> LVM snapshots for mysql-zrm backups.
>
> CentOS-6.6
> MySQL-5.6.22
> MySQL-zrm-3.0 (EPEL).
>
> Short version:
>
> I am unable to tell if the MySQL-zrm LVM snapshots are indeed taking
> place, or if the backup is being taken directly from the main database
> LVs.  The log file info isn't giving me enough info to tell one way or
> another.
>
> Some more info:
>
> I am setting up a database server with all of the database files on LVM
> LVs and am using mysql-zrm for logical backups using LVM snapshots to
> reduce the database lock times.
>
> I have followed all of the various setup instructions very closely, and
> am using the default "lvm-snapshot.pl" plugin.  However, the only log
> file lines mentioning snapshot are the following:
>
>    mysql:backup:INFO: Running snapshot verification using command /usr/share/mysql-zrm/plugins/lvm-snapshot.pl --action verify-config 2>/home/tmp/xH8KKpsF2O
>
> There are no other log entries following this one that seem to have
> anything to do with snapshots.  There are no errors.  The backups
> succeed.  Both "--verbose" and "--noquiet" are enabled.
>
> Here are the salient entries from the mysql-zrm.conf file:
>
> backup-level=0
> backup-mode=logical
> lvm-snapshot=20G
> snapshot-plugin="/usr/share/mysql-zrm/plugins/lvm-snapshot.pl"
> backup-type=regular
> destination=/home/mysql-zrm
> retention-policy=4W
> compress=1
>
> Any info or help would be much appreciated!
>
> Thanks,
>
> --Phil
>
