content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: RE: [linux-lvm] LVM snap size weirdness...
Message-ID: <08628CA53C6CBA4ABAFB9E808A5214CB0142B582@mercury.infiniconsys.com>
From: "Barry, Christopher" <cbarry@infiniconsys.com>
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
Date: Fri Mar 21 11:20:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Ok. Cool. Thanks very much for the knowledge. I have so much more to =
learn about LVM.

So, by quiesce, would you suggest then, that I stop samba, nfs, apache - =
take a snapshot and immediately restart them? Then, fire off my backups? =
Stopping/starting nfs can really wreak havoc on connections (e.g. 'stale =
file handles' and all).=20

For my clarification, and possibly others as well, what happens if, =
during a snapshot, someone is writing a file to the server via nfs? Is =
this file snapshotted is an unstable state? Is it skipped? Should I =
issue a sync immediately prior to snapshotting? How does snapshotting =
handle this case?=20

Regards and thanks,
--
Christopher Barry
Manager of Information Systems
InfiniCon Systems
http://www.infiniconsys.com

-----Original Message-----
From: Alasdair G Kergon [mailto:agk@uk.sistina.com]
Sent: Friday, March 21, 2003 10:25 AM
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] LVM snap size weirdness...


You're quite right - you must *always* worry about applications=20
changing the filesystem when taking a backup.

Backing up from a filesystem snapshot means your backup will at
least contain the complete filesystem as it looked at the moment in
time when the snapshot was created.
(Consider instead if you were to run 'tar' on a changing filesystem:
if a process was moving directories at the same time, your tar
backup might completely miss them e.g. if they were moved from a=20
place 'tar' hadn't backed up yet into a place it already had.
If you backup from a snapshot, that problem disappears.)

If you backup from a snapshot, you want to ensure that your
on-disk application data is consistent (i.e. checkpointed)
at the time you create the snapshot.  So you have to worry
about applications that are running at the point at which=20
you take the snapshot: e.g. quiesce them, take the snapshot,
then set them off again.

Alasdair
--=20
agk@uk.sistina.com

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
