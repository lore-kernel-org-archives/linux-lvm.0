From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] LVM snap size weirdness...
Message-ID: <20030321152503.C13822@uk.sistina.com>
References: <0197B93B-5B79-11D7-91E2-000393CA5730@fib011235813.fsnet.co.uk> <1048256892.486.7.camel@tetra>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1048256892.486.7.camel@tetra>; from cbarry@infiniconsys.com on Fri, Mar 21, 2003 at 09:28:12AM -0500
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
Date: Fri Mar 21 09:25:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

You're quite right - you must *always* worry about applications 
changing the filesystem when taking a backup.

Backing up from a filesystem snapshot means your backup will at
least contain the complete filesystem as it looked at the moment in
time when the snapshot was created.
(Consider instead if you were to run 'tar' on a changing filesystem:
if a process was moving directories at the same time, your tar
backup might completely miss them e.g. if they were moved from a 
place 'tar' hadn't backed up yet into a place it already had.
If you backup from a snapshot, that problem disappears.)

If you backup from a snapshot, you want to ensure that your
on-disk application data is consistent (i.e. checkpointed)
at the time you create the snapshot.  So you have to worry
about applications that are running at the point at which 
you take the snapshot: e.g. quiesce them, take the snapshot,
then set them off again.

Alasdair
-- 
agk@uk.sistina.com
