Message-ID: <2D92FEBFD3BE1346A6C397223A8DD3FC09243E@THOR.goeci.com>
From: Murthy Kambhampaty <murthy.kambhampaty@goeci.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_000_01C394BD.540875DA"
Subject: [linux-lvm] RE: [ADMIN] [PERFORM] backup/restore - another area.
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
Date: Fri Oct 17 10:05:04 2003
List-Id: <linux-lvm.redhat.com>
To: 'Jeff' <threshar@torgo.978.org>, Josh Berkus <josh@agliodbs.com>
Cc: markw@osdl.org, pgsql-performance@postgresql.org, linux-lvm@sistina.com, pgsql-admin@postgresql.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_000_01C394BD.540875DA
Content-Type: text/plain;
	charset="iso-8859-1"

There's been a lot of discussion on the ADMIN list about postgresql backups
from LVM snapshots:
http://marc.theaimsgroup.com/?l=postgresql-admin&w=2&r=1&s=LVM+snapshot&q=b

Note that the existence of the snapshot slows the original filesystem down,
so you want to minimize the duration for which the snapshot exists. A two
phase rsync -- first off the "live" filesystem, second off the snapshot --
to a backup filesystem accomplishes this. If you don't have the capacity to
duplicate your $PGDATA folder, you'll want to consider doing incremental
backups with xfsdump. Since xfs and xfsdump has been around forever, so you
can bet your data on them; of course, xfsdump requires that pgdata be hosted
on an xfs volume (XFS is a fast filesystem with metadata journaling, giving
fast crash recovery, so this is a good idea anyway). For other filesystems,
incremental backup and restores are being developed in star:
http://freshmeat.net/projects/star/. star also claims to be faster than gnu
tar, so you might use it even if you aren't doing incremental backups.

The latest version of my backup script is attached. It demonstrates the
implementation of filesystem level backup of the postgresql data cluster
(the $PGDATA folder) using two-phase rsync. The $PGDATA folder is on an xfs
formatted LVM volume; various checks are done before and after backup, and
errors are e-mailed to a specified account. The script handles situations
where (i) the XFS filesystem containing $PGDATA has an external log and (ii)
the postmaster log ($PGDATA/pg_xlog) is written to a filesystem different
than the one containing the $PGDATA folder. These configurations enhance
database performance, though an external XFS log is not a big win for
postgresql, which creates relatively few new files and deletes relatively
few files (relative to an e-mail server). It should be possible, using this
script, to keep backup times below 10 minutes even for very high loads -
just increase the frequency at which you do backups (it has been tested to
run hourly, and runs every three hours on the production server).

Cheers,
	Murthy

(Note: I have experienced filesystem hangs within 2 days to a week, from
running this script frequently with XFS versions including XFS 1.3. The XFS
CVS kernel from Sep 30th 2003 seems not to have this problem - I have been
running this script hourly for two weeks without problems. So you might
either use a CVS kernel or wait for an XFS release based on linux 2.4.22 or
later; and you will be testing your own setup, right?!)






>-----Original Message-----
>From: Jeff [mailto:threshar@torgo.978.org]
>Sent: Thursday, October 16, 2003 13:37
>To: Josh Berkus
>Cc: markw@osdl.org; pgsql-performance@postgresql.org;
>linux-lvm@sistina.com; pgsql-admin@postgresql.org
>Subject: Re: [ADMIN] [PERFORM] backup/restore - another area.
>
>
>On Thu, 16 Oct 2003 10:09:27 -0700
>Josh Berkus <josh@agliodbs.com> wrote:
>
>> Jeff,
>> 
>> > I left the DB up while doing this.
>> >
>> > Even had a program sitting around committing data to try 
>and corrupt
>> > things. (Which is how I discovered I was doing the snapshot wrong)
>> 
>> Really?   I'm unclear on the method you're using to take the 
>snapshot,
>> then; I seem to have missed a couple posts on this thread.   Want to
>> refresh me?
>> 
>
>I have a 2 disk stripe LVM on /dev/postgres/pgdata/
>
>lvcreate -L4000M -s -n pg_backup /dev/postgres/pgdata
>mount /dev/postgres/pg_backup /pg_backup 
>tar cf - /pg_backup | gzip -1 > /squeegit/mb.backup 
>umount /pg_backup;
>lvremove -f /dev/postgres/pg_backup;
>
>In a nutshell an LVM snapshot is an atomic operation that 
>takes, well, a
>snapshot of hte FS as it was at that instant.  It does not make a 2nd
>copy of the data.   This way you can simply tar up the pgdata directory
>and be happy as the snapshot will not be changing due to db activity.
>
>-- 
>Jeff Trout <jeff@jefftrout.com>
>http://www.jefftrout.com/
>http://www.stuarthamm.net/
>
>---------------------------(end of 
>broadcast)---------------------------
>TIP 9: the planner will ignore your desire to choose an index 
>scan if your
>      joining column's datatypes do not match
>


------_=_NextPart_000_01C394BD.540875DA
Content-Type: application/octet-stream;
	name="pgSnapBack3.generic"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="pgSnapBack3.generic"

#!/bin/bash=0A=
# FN: pgSnapBack3.generic=0A=
# AB: creates and mounts snapshot of $PGDATA;=0A=
#		rsyncs to backup host;=0A=
#		unmounts and removes snapshot;=0A=
#		reinitializes database on backup server=0A=
# DT: 2003-03-05=0A=
# AU: S. Murthy Kambhampaty=0A=
=0A=
=0A=
PATH=3D/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin=0A=
# What is this script called and where is it running:=0A=
ThisCMD=3D$(echo -e "$(basename $0)" | awk 'BEGIN{FS=3D"."}{print =
$1}')=0A=
pgHost=3D$(echo -e "$(hostname)" | awk 'BEGIN{FS=3D"."}{print $1}')=0A=
ThisSession=3D$$=0A=
=0A=
# The postgresql superuser=0A=
# (if you want to mail error logs somewhere else, either=0A=
# set your mail server to forward pgSuper's mail, or add a pgMonitor=0A=
# and change the two sendmail command lines below:=0A=
pgSuper=3Dpostgres=0A=
BackupHost=3Dbkhost=0A=
DataFS=3D/home/db=0A=
pgData=3D/home/db/pgsql/pgdata=0A=
=0A=
RsyncDM=3D"mirrors_$pgHost" # What is the rsync module for this backup =
called=0A=
#=0A=
# As long as you have installed postgresql in=0A=
# "/usr/bin/pgsql-M.m/, where M.m=3D$(echo -n $(cat =
$PGDATA/PG_VERSION)),=0A=
# on both the production server and the backup server,=0A=
# you shouldn;t have to edit beyond this point=0A=
#=0A=
=0A=
=0A=
# If $pgData is a symlink, redefine pgData=0A=
[[ -L "$pgData" ]] && pgData=3D$(ls -l "$pgData" | awk '{FS=3D" =
"}{print $NF}')=0A=
pgMinor=3D$(echo -n "$(cat "$pgData/PG_VERSION")")=0A=
=0A=
# A function to execute commands on the backup server:=0A=
# 	Requires passwordless logins to $pgSuper@$BackupHost using SSH=0A=
#	See, for example,=0A=
# 	http://www.onlamp.com/pub/a/bsd/2002/11/14/FreeBSD_Basics.html=0A=
RMTExec () {=0A=
	ssh -i "/home/$pgSuper/.ssh/id_rsa" $pgSuper@$BackupHost "$1"=0A=
}=0A=
=0A=
=0A=
# A function to do the rsync=0A=
# 	/etc/rsync.d on the backup server must be configured=0A=
#	A module named mirrors_$pgHost must point to a directory=0A=
#	on the backup server. Within that folder a subdirectory=0A=
# 	named pgdata must exist, and will contain the backup=0A=
#	copy of the database=0A=
RsyncLockFile=3D"/home/$pgSuper/$ThisCMD.lock"=0A=
# rsync options:=0A=
# The -B option to increase block size on large files:=0A=
# 1. Reduces the chance of changes being missed=0A=
# 2. Uses more bandwidth=0A=
# If you are really paranoid about missing changes, or if most=0A=
# tables have very little common data from backup to backup, add the=0A=
# -W option to rsync whole files, rather than changes only.=0A=
# NOTE: give the -n option to rsync until sure that it=0A=
#	is configured properly. rsync is not forgiviging.=0A=
RsyncCMD () {=0A=
	rsync -avW --stats \=0A=
	 --delete --force --exclude=3D'postmaster.pid' \=0A=
	$1/ \=0A=
	$BackupHost::$RsyncDM/pgdata/$2=0A=
	# If you don't give a second arguement, $2 is null;=0A=
	# so it is optional=0A=
}=0A=
# When the postmaster is started on the backup server,=0A=
#	the data directory is:=0A=
pgDataBK=3D"$(RMTExec "cat /etc/rsyncd.conf" | sed -n /$RsyncDM/,/^$/p =
| grep path | awk 'BEGIN{FS=3D" =3D "}{print $2}')""/pgdata"=0A=
=0A=
=0A=
# A function to print a formatted timestamp in the log=0A=
DateCMD () {=0A=
	# Two trailing spaces are intentional=0A=
	echo -n "$(date +%Y-%m-%d) $(date +%X)  "=0A=
	return 0=0A=
}=0A=
=0A=
=0A=
# A function to call when exiting this script with errors=0A=
ExitOnError () {=0A=
	# This function takes two arguments an "exit code" and and "error =
message"=0A=
	# in order=0A=
	rm -f "$RsyncLockFile"=0A=
	RMTExec "rm -f ~/RsyncLockFile"=0A=
	lvremove -f "$DataVG/$SnapNM"=0A=
	lvremove -f "$DataVG/$xlSnapNM" # &> /dev/null=0A=
	find /mnt/ -maxdepth 1 -type d -name "*snap_$ThisSession" -exec rm -rf =
{} \;=0A=
	echo $'\n\n'"$(DateCMD) $2"$'\n\t'\=0A=
		"Notified superuser"\=0A=
		| tee -a "$STASFile" >&2=0A=
	exec  >&6 6>&-=0A=
	exec 2>&7 7>&-=0A=
	cat <(echo "Subject: ATTN: $2"\=0A=
			$'\n'"X-Priority: 2 (high)"\=0A=
			$'\n'"!"\=0A=
			$'\n\t'"Review $(echo -n "$LogFile"), the command log"\=0A=
			$'\n\t\t'"Error report listed below:" $'\n')\=0A=
		"$LogFile.err"\=0A=
		| sendmail "$pgSuper"=0A=
	exit $1=0A=
	return $1 # Superfluous: this function does not return=0A=
}=0A=
=0A=
=0A=
# A function for LVM snapshot creation and mounting=0A=
#	There must exist a directory named /mnt/$SnapNM=0A=
#	to which the snapshot is mounted=0A=
DataLV=3D"$(mount | grep "/home/db\>[^/]" | awk '{print $1}')"=0A=
DataVG=3D"$(dirname "$DataLV")" # Please keep the xlogLV and DataLV in =
the same VG=0A=
SnapNM=3D"snap_$ThisSession"=0A=
xlogLV=3D"$(mount | grep "$pgData/pg_xlog\>[^/]" | awk 'BEGIN{FS=3D" =
"}{print $1}')"=0A=
[[ -n "$xlogLV" ]] && { xlSnapMB=3D512; =
xlSnapNM=3D"xlsnap_$ThisSession"; }=0A=
DoSnap () {=0A=
	AvailMB=3D"$(echo -n $(vgdisplay --colon "$DataVG") | awk =
'BEGIN{FS=3D":"}{print $16 *$13/2048}')" # 2048 512-byte blocks per =
MB=0A=
	if [[ -n "$(lvscan | grep Snapshot | grep "$DataLV$")" || \=0A=
		-n "$(lvscan | grep Snapshot | grep "$xlogLV$")" ]]; then=0A=
		echo $'\n\t'"FATAL: Snapshot of $DataLV or $xlogLV already exists." =
>&2=0A=
		lvscan | grep Snapshot=0A=
		echo $'\n\t'"Terminating ..." >&2=0A=
		SnapTest=3D32 # lvcreate error: "32 snapshot already exists"; sort of =
...=0A=
	elif ((-xlSnapMB +AvailMB <=3D0)); then # Variables need not be =
preceeded by '$' in arithmetic expansion;=0A=
			# the above syntax does not work if you test ((-$xlSnapMB =
+$AvailMB)), so you'll=0A=
			# have to put up with the confusion over referencing variables =
without the preceding=0A=
			# $-sign sometimes=0A=
		echo $'\n\t'"FATAL: No space left in $DataVG for snapshot creation. =
Terminating ..." >&2=0A=
		SnapTest=3D19 # lvcreate error: "19 not enoungh space available to =
create logical volume"=0A=
	else=0A=
		# Use all the free space available in $DataVG for the snapshot!=0A=
		[[ -n "$xlogLV" ]] && xfs_freeze -f "$pgData/pg_xlog"=0A=
		xfs_freeze -f "$DataFS"=0A=
		[[ -n "$xlogLV" ]] && { lvcreate -s -L "$xlSnapMB"M -n "$xlSnapNM" =
"$xlogLV"; xlSnapTest=3D$?; }=0A=
		lvcreate -s -L "$((-xlSnapMB +AvailMB))"M -n "$SnapNM" "$DataLV"=0A=
		SnapTest=3D$?=0A=
		xfs_freeze -u "$DataFS"=0A=
		[[ -n "$xlogLV" ]] && xfs_freeze -u "$pgData/pg_xlog"=0A=
	fi=0A=
	# If snapshot creation failed bail; else mount the snapshot volume=0A=
	if ((+$xlSnapTest +$SnapTest >0)); then=0A=
		ExitOnError 991$SnapTextXL$SnapTest "pgBackup: Snapshot creation =
failed"=0A=
	else=0A=
		echo $'\n'"$(DateCMD) Successfully created snapshot(s):"=0A=
		lvscan | grep "snap_$ThisSession" # Report snapshot volumes list=0A=
		# If /mnt/ subfolders named "*snap_$ThisSession" exist,=0A=
		# delete them=0A=
		for SDir in $(find /mnt/ -maxdepth 1 -type d -name =
"*snap_$ThisSession"); do=0A=
			rm -rf $Sdir=0A=
		done=0A=
		mkdir "/mnt/$SnapNM"=0A=
		if [[ -n "$xlogLV" ]]; then=0A=
			mkdir "/mnt/$xlSnapNM"=0A=
			mount -t xfs "$DataVG/$xlSnapNM" "/mnt/$xlSnapNM" -o nouuid,ro=0A=
			xlMountTest=3D$?=0A=
		fi=0A=
		LogDev=3D"$(cat "/etc/mtab" | grep "$DataFS\>[^/]" | awk =
'BEGIN{FS=3D"logdev=3D"}{print $2}' | awk 'BEGIN{FS=3D","}{print =
$1}')"=0A=
		if [[ -n "$LogDev" ]]; then=0A=
				mount -t xfs "$DataVG/$SnapNM" "/mnt/$SnapNM" -o =
nouuid,ro,logdev=3D"$LogDev"=0A=
				MountTest=3D$?=0A=
		else=0A=
				mount -t xfs "$DataVG/$SnapNM" "/mnt/$SnapNM" -o nouuid,ro=0A=
				MountTest=3D$?=0A=
		fi=0A=
	fi=0A=
	# If snapshot mount failed, then bail;=0A=
	# else print mount report and return=0A=
	if ((+xlMountTest +MountTest >0)); then=0A=
		if [[ -n "$xlogLV" ]]; then=0A=
			umount "$DataVG/$xlSnapNM" &> /dev/null=0A=
			lvremove -f "$DataVG/$xlSnapNM"=0A=
		fi=0A=
			umount "$DataVG/$SnapNM" &> /dev/null=0A=
			lvremove -f "$DataVG/$SnapNM"=0A=
			ExitOnError 992 "pgBackup; Snapshot mount failed"=0A=
	else=0A=
		echo $'\n'"$(DateCMD) Successfully mounted snapshot(s):"=0A=
		mount | grep "snap_$ThisSession" # Report the mounts=0A=
	fi=0A=
	return 0 # Only returns on success=0A=
}=0A=
=0A=
=0A=
# Setup logging, and get going:=0A=
STASFile=3D"$pgData/pgSnapBack.status"=0A=
LogFile=3D"/home/$pgSuper/$ThisCMD-$(date +%Y%m%d-%H%M)"=0A=
exec 6>&1; exec  > "$LogFile"=0A=
exec 7>&2; exec 2> "$LogFile.err"=0A=
echo "$(DateCMD) Backup initiated"\=0A=
	| tee "$STASFile"=0A=
=0A=
=0A=
# Phase 1 rsync=0A=
# If the previous backup is still running, wait a bit:=0A=
while [[ -f "$RsyncLockFile" ]]; do=0A=
		echo "$(DateCMD) previous Rsync still running"$'\n'\=0A=
		"Waiting for completion" >&2=0A=
		sleep 300=0A=
done=0A=
# and now that it's not, proceed=0A=
echo $'\n\n'\=0A=
	"$(DateCMD) Phase 1 - rsync from pgdata to mirror on $BackupHost"\=0A=
	| tee -a "$STASFile"=0A=
# Before you start the backup, make sure that no postmaster is running =
on the backup folder:=0A=
# 	(test cribbed from the pg_ctl script)=0A=
while [[ -n $(RMTExec "sed -n 1p $pgDataBK/postmaster.pid 2>/dev/null") =
]]; do=0A=
		echo "$(DateCMD) A postmaster is running at the remote \=0A=
			location; waiting 5 minutes ..."=0A=
		sleep 300=0A=
done=0A=
# You don't want to start simultaneous rsyncs, and you don't want to=0A=
# start the postmaster on the "reflection" while an rsync is =
running;=0A=
# so put down some lock files # (there was something on linux-xfs=0A=
# about xfs' not recovering inodes allocated to empty files that=0A=
# are deleted, so don't just "touch" a lockfile, put something in =
it).=0A=
echo "$(DateCMD) Phase 1 - rsync" > "$RsyncLockFile"=0A=
tail -n1 "$RsyncLockFile" | RMTExec "cat - > ~/RsyncLockFile"=0A=
RsyncCMD "$pgData/" &&=0A=
	echo $'\n'"$(DateCMD) Rsync complete"$'\n\n'=0A=
=0A=
# Now create and mount the snapshot volume=0A=
echo $'\n\n'"$(DateCMD) Snapshot creation and mounting"\=0A=
	| tee -a "$STASFile"=0A=
DoSnap=0A=
=0A=
=0A=
# Phase 2 rsync=0A=
echo $'\n\n'"$(DateCMD) Phase 2 - rsync from snapshot to mirror on =
$BackupHost"=0A=
echo "$(DateCMD) Phase 2 rsync" > "$RsyncLockFile"=0A=
tail -n1 "$RsyncLockFile" | RMTExec "cat - > ~/RsyncLockFile"=0A=
( if [[ -n "$xlogLV" ]]; then=0A=
	RsyncCMD "--exclude=3Dpg_xlog/ $(echo $pgData | sed -e =
"s|$DataFS|/mnt/$SnapNM|")/" &&=0A=
	RsyncCMD "/mnt/$xlSnapNM/" "pg_xlog/"=0A=
else=0A=
	RsyncCMD "$(echo $pgData | sed -e "s|$DataFS|/mnt/$SnapNM|")/"=0A=
fi ) &&=0A=
	echo $'\n\t'"$(DateCMD) Phase 2 rsync complete"$'\n'\=0A=
	| tee -a "$STASFile"=0A=
=0A=
=0A=
# Now remove the snapshot=0A=
rm -f "$RsyncLockFile"=0A=
RMTExec "rm -f ~/RsyncLockFile"=0A=
if [[ -n "$xlogLV" ]]; then=0A=
	umount "$DataVG/$xlSnapNM"=0A=
	lvremove -f "$DataVG/$xlSnapNM"=0A=
fi=0A=
umount "$DataVG/$SnapNM"=0A=
lvremove -f "$DataVG/$SnapNM"=0A=
find /mnt/ -maxdepth 1 -type d -name "*snap_$ThisSession" -exec rm -rf =
{} \;=0A=
=0A=
=0A=
# "Reinitialize" the snapshot of the database on the backup server=0A=
echo $'\n\n'"$(DateCMD) Start postmaster on $BackupHost, capture =
output, and shutdown"=0A=
RMTExec "/usr/local/pgsql-$pgMinor/bin/postmaster -B4096 -p55432\=0A=
	-D $pgDataBK 2>&1" &=0A=
sleep 300 # give the postmaster time for recovery=0A=
RMTExec "/usr/local/pgsql-$pgMinor/bin/pg_ctl stop -D $pgDataBK -m =
immediate" &&=0A=
	echo $'\n\n'"$(DateCMD) Attempted to reinitialize backup; check for =
errors above"=0A=
=0A=
=0A=
# Mop up=0A=
if [[ ! -s "$LogFile.err" ]]; then=0A=
	echo "Completed, no errors" > "$LogFile.err"=0A=
	rm -f "$LogFile.err"=0A=
	echo $'\n\n'"$(DateCMD) Backup completed."\=0A=
		| tee -a "$STASFile"=0A=
	echo "$(DateCMD) Verify postmaster-messages, listed above, for =
success."=0A=
	exec  >&6 6>&-=0A=
	exec 2>&7 7>&-=0A=
	exit 0=0A=
else=0A=
	ExitOnError 999 "pgBackup; Backup encountered errors"=0A=
fi=0A=
true # Superflous=0A=

------_=_NextPart_000_01C394BD.540875DA--
