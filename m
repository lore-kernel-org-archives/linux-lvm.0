Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3OMeDHY018684
	for <linux-lvm@redhat.com>; Thu, 24 Apr 2008 18:40:13 -0400
Received: from nlpi025.prodigy.net (nlpi025.sbcis.sbc.com [207.115.36.54])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3OMdlnQ003400
	for <linux-lvm@redhat.com>; Thu, 24 Apr 2008 18:39:47 -0400
Received: from mail.kdzbn.homelinux.net
	(adsl-75-40-228-163.dsl.klmzmi.sbcglobal.net [75.40.228.163])
	(authenticated bits=0)
	by nlpi025.prodigy.net (8.13.8 smtpauth/dk/8.13.8) with ESMTP id
	m3OMddoE031372
	for <linux-lvm@redhat.com>; Thu, 24 Apr 2008 17:39:40 -0500
Received: from beta.mydomain ([192.168.2.237])
	by mail.kdzbn.homelinux.net with esmtp (Exim 4.62)
	(envelope-from <bryan@kadzban.is-a-geek.net>) id 1JpA6P-0007pw-9w
	for linux-lvm@redhat.com; Thu, 24 Apr 2008 18:39:41 -0400
Message-ID: <48110C2D.5020800@kadzban.is-a-geek.net>
Date: Thu, 24 Apr 2008 18:39:41 -0400
From: Bryan Kadzban <bryan@kadzban.is-a-geek.net>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------000702040605040003060406"
Subject: [linux-lvm] Offline fsck (checking snapshots)
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.
--------------000702040605040003060406
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: RIPEMD160

There was some discussion on the ext3-users list a few months ago, about
how e2fsck took a long time to run, and it was getting forced because it
keeps track of a couple of counters that can force it (the counters are
days since the last full fsck, and mounts since the last full fsck).
(The thread starts at [1], the script development started at [2], and
the most recent version is at [3].  The one extra thing I've added is
skipping ext2/3 FSes that have an external journal.)

The suggestion was made that if the user is using LVM, a temporary
snapshot could be taken, and then fsck could be run on that.  If it
succeeds, then it's possible to set the last-fsck-time and mount-count
while the real FS is mounted.

I've gotten a script that I think is reasonable, that handles this.
With some help from others, it now works with XFS as well as ext2/3, and
it's supposed to also work with JFS.  Since it requires LVM, I think it
might make sense to put something like it into the LVM userspace tools.

(There is one issue: it also requires blkid and logsave from e2fsprogs.
I could work around the requirement for logsave (using tee -a), but
blkid would be harder.)

The idea behind the script is, you run it at night from cron; it will
check each LV on the system and mail a user if there are any problems.
It also logs to syslog.

I've attached the script and its configuration file to this message.
Comments?

[1] https://www.redhat.com/archives/ext3-users/2008-January/msg00027.html

[2] https://www.redhat.com/archives/ext3-users/2008-January/msg00032.html

[3]
https://www.redhat.com/archives/ext3-users/2008-February/msg00004.html
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFIEQwpS5vET1Wea5wRA43cAKDWGJVFgV6fmJKeQUgcPH6Ebd1aygCfb4a9
TbiWVGUYFnPeQSWiJVl0x2k=
=Juq0
-----END PGP SIGNATURE-----

--------------000702040605040003060406
Content-Type: text/plain;
 name="lvcheck"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="lvcheck"

#!/bin/sh
#
# lvcheck, version 1.0
#  Maintainer: Bryan Kadzban <bryan@kadzban.is-a-geek.net>

# Other credits:
#  Concept and original script by Theodore Tso <tytso@mit.edu>
#  on_ac_power is mostly from Debian's powermgmt-base package
#  Lots of help (ideas, initial XFS/JFS support, etc.) from
#   Andreas Dilger <adilger@sun.com>
#  Better XFS support from Eric Sandeen <sandeen@redhat.com>

# Released under the GNU General Public License, either version 2 or
#  (at your option) any later version.

# Overview:
#
#  Run this from cron periodically (e.g. once per week).  If the
#  machine is on AC power, it will run the checks; otherwise they will
#  all be skipped.  (If the script can't tell whether the machine is
#  on AC power, it will use a setting in the configuration file
#  (/etc/lvcheck.conf) to decide whether to continue with the checks,
#  or abort.)
#
#  The script will then decide which logical volumes are active, and
#  can therefore be checked via an LVM snapshot.  Each of these LVs
#  will be queried to find its last-check day, and if that was more
#  than $INTERVAL days ago (where INTERVAL is set in the configuration
#  file as well), or if the last-check day can't be determined, then
#  the script will take an LVM snapshot of that LV and run fsck on the
#  snapshot.  The snapshot will be set to use 1/500 the space of the
#  source LV.  After fsck finishes, the snapshot is destroyed.
#  (Snapshots are checked serially.)
#
#  Any LV that passes fsck should have its last-check time updated (in
#  the real superblock, not the snapshot's superblock); any LV whose
#  fsck fails will send an email notification to a configurable user
#  ($EMAIL).  This $EMAIL setting is optional, but its use is highly
#  recommended, since if any LV fails, it will need to be checked
#  manually, offline.  Relevant messages are also sent to syslog.

# Set default values for configuration params.  Changes to these values
#  will be overwritten on an upgrade!  To change these values, use
#  /etc/lvcheck.conf.
EMAIL='root'
INTERVAL=30
AC_UNKNOWN="CONTINUE"
MINSNAP=256
MINFREE=0

# send $2 to syslog, with severity $1
# severities are emerg/alert/crit/err/warning/notice/info/debug
function log() {
	local sev="$1"
	local msg="$2"
	local arg=

	# log warning-or-higher messages to stderr as well
	[ "$sev" == "emerg" || "$sev" == "alert" || "$sev" == "crit" || \
			"$sev" == "err" || "$sev" == "warning" ] && arg=-s

	logger -t lvcheck $arg -p user."$sev" -- "$msg"
}

# determine whether the machine is on AC power
function on_ac_power() {
	local any_known=no

	# try sysfs power class first
	if [ -d /sys/class/power_supply ] ; then
		for psu in /sys/class/power_supply/* ; do
			if [ -r "${psu}/type" ] ; then
				type="`cat "${psu}/type"`"

				# ignore batteries
				[ "${type}" = "Battery" ] && continue

				online="`cat "${psu}/online"`"

				[ "${online}" = 1 ] && return 0
				[ "${online}" = 0 ] && any_known=yes
			fi
		done

		[ "${any_known}" = "yes" ] && return 1
	fi

	# else fall back to AC adapters in /proc
	if [ -d /proc/acpi/ac_adapter ] ; then
		for ac in /proc/acpi/ac_adapter/* ; do
			if [ -r "${ac}/state" ] ; then
				grep -q on-line "${ac}/state" && return 0
				grep -q off-line "${ac}/state" && any_known=yes
			elif [ -r "${ac}/status" ] ; then
				grep -q on-line "${ac}/status" && return 0
				grep -q off-line "${ac}/status" && any_known=yes
			fi
		done

		[ "${any_known}" = "yes" ] && return 1
	fi

	if [ "$AC_UNKNOWN" == "CONTINUE" ] ; then
		return 0   # assume on AC power
	elif [ "$AC_UNKNOWN" == "ABORT" ] ; then
		return 1   # assume on battery
	else
		log "err" "Invalid value for AC_UNKNOWN in the config file"
		exit 1
	fi
}

# attempt to force a check of $1 on the next reboot
function try_force_check() {
	local dev="$1"
	local fstype="$2"

	case "$fstype" in
	ext2|ext3)
		tune2fs -C 16000 "$dev"
		;;
	xfs)
		# XFS does not enforce check intervals; let email suffice.
		;;
	*)
		log "warning" "Don't know how to force a check on $fstype..."
		;;
	esac
}

# attempt to set the last-check time on $1 to now, and the mount count to 0.
function try_delay_checks() {
	local dev="$1"
	local fstype="$2"

	case "$fstype" in
	ext2|ext3)
		tune2fs -C 0 -T now "$dev"
		;;
	xfs)
		# XFS does not enforce check intervals; nothing to delay
		;;
	*)
		log "warning" "Don't know how to delay checks on $fstype..."
		;;
	esac
}

# print the date that $1 was last checked, in a format that date(1) will
#  accept, or "Unknown" if we don't know how to find that date.
function try_get_check_date() {
	local dev="$1"
	local fstype="$2"

	case "$fstype" in
	ext2|ext3)
		dumpe2fs -h "$dev" 2>/dev/null | grep 'Last checked:' | \
				sed -e 's/Last checked:[[:space:]]*//'
		;;
	*)
		# XFS does not save the last-checked date

		# TODO: add support for various other FSes
		echo "Unknown"
		;;
	esac
}

# do any extra checks for filesystem type $2, on device $1
function should_still_check() {
	local dev="$1"
	local fstype="$2"

	case "$fstype" in
	ext2|ext3)
		if tune2fs -l "$dev" | grep -q "Journal device" ; then
			log "warning" "Cowardly refusing to check $dev, which has an external journal."
			return 1
		fi
	esac

	return 0
}

# check the FS on $1 passively, saving output to $3.
function perform_check() {
	local dev="$1"
	local fstype="$2"
	local tmpfile="$3"

	case "$fstype" in
	ext2|ext3)
		# first clear the orphaned-inode list, to avoid unnecessary FS changes
		#  in the next step (which would cause an "error" exit from e2fsck).
		#  -C 0 is present for cases where  the script is run interactively
		#  (logsave -s strips out the progress bar).  ignore the return status
		#  of this e2fsck, as it doesn't matter.
		nice logsave -as "${tmpfile}" e2fsck -p -C 0 "$dev"

		# then do the real check; -y is here to give more info on any errors
		#  that may be present on the FS, in the log file.  the snapshot is
		#  writable, so it shouldn't break anything if e2fsck changes it.
		nice logsave -as "${tmpfile}" e2fsck -fy -C 0 "$dev"
		return $?
		;;
	reiserfs)
		echo Yes | nice logsave -as "${tmpfile}" fsck.reiserfs --check "$dev"
		# apparently can't fail?  let's hope not...
		return 0
		;;
	xfs)
		nice logsave -as "${tmpfile}" xfs_repair -n "$dev"
		return $?
		;;
	jfs)
		nice logsave -as "${tmpfile}" fsck.jfs -fn "$dev"
		return $?
		;;
	*)
		log "warning" "Don't know how to check $fstype filesystems passively: assuming OK."
		;;
	esac
}

# do everything needed to check and reset dates and counters on /dev/$1/$2.
function check_fs() {
	local vg="$1"
	local lv="$2"
	local fstype="$3"
	local snapsize="$4"

	local tmpfile=`mktemp -t lvcheck.log.XXXXXXXXXX`
	local errlog="/var/log/lvcheck-${vg}@${lv}"
	local snaplvbase="${lv}-lvcheck-temp"
	local snaplv="${snaplvbase}-`date +'%Y%m%d'`"

	# clean up any left-over snapshot LVs
	for lvtemp in /dev/${vg}/${snaplvbase}* ; do
		if [ -e "$lvtemp" ] ; then
			# Assume the script won't run more than one instance at a time?

			log "warning" "Found stale snapshot $lvtemp: attempting to remove."

			if ! lvremove -f "${lvtemp##/dev}" ; then
				log "error" "Could not delete stale snapshot $lvtemp"
				return 1
			fi
		fi
	done

	# and create this one
	lvcreate -s -l "$snapsize" -n "${snaplv}" "${vg}/${lv}"

	if perform_check "/dev/${vg}/${snaplv}" "${fstype}" "${tmpfile}" ; then
		log "info" "Background scrubbing of /dev/${vg}/${lv} succeeded."
		try_delay_checks "/dev/${vg}/${lv}" "$fstype"
	else
		log "err" "Background scrubbing of /dev/${vg}/${lv} failed: run fsck offline soon!"
		try_force_check "/dev/${vg}/${lv}" "$fstype"

		if test -n "$EMAIL"; then
			mail -s "Fsck of /dev/${vg}/${lv} failed!" $EMAIL < $tmpfile
		fi

		# save the log file in /var/log in case mail is disabled
		(
			echo ""
			echo -n "  Check on " ; date +'%Y-%m-%d'
			echo "======================="
			cat "$tmpfile"
		) >>"$errlog"
	fi

	rm -f "$tmpfile"
	lvremove -f "${vg}/${snaplv}"
}

# pull in configuration -- overwrite the defaults above if the file exists
[ -r /etc/lvcheck.conf ] && . /etc/lvcheck.conf

# check whether the machine is on AC power: if not, skip fsck
on_ac_power || exit 0

# parse up lvscan output
lvscan 2>&1 | grep ACTIVE | awk '{print $2;}' | \
while read DEV ; do
	# remove the single quotes around the device name
	DEV="`echo "$DEV" | tr -d \'`"

	# get the FS type: blkid prints TYPE="blah"
	eval `blkid -s TYPE "$DEV" | cut -d' ' -f2`

	# see whether this FS needs any extra checks that might disqualify this device
	should_still_check "$DEV" "$TYPE" || continue

	# get the last-check time
	check_date=`try_get_check_date "$DEV" "$TYPE"`

	# if the date is unknown, run fsck every time the script runs.  sigh.
	if [ "$check_date" != "Unknown" ] ; then
		# add $INTERVAL days, and throw away the time portion
		check_day=`date --date="$check_date $INTERVAL days" +'%Y%m%d'`

		# get today's date, and skip the check if it's not within the interval
		today=`date +'%Y%m%d'`
		[ $check_day -gt $today ] && continue
	fi

	# get the volume group and logical volume names
	VG="`lvs --noheadings -o vg_name "$DEV"`"
	LV="`lvs --noheadings -o lv_name "$DEV"`"

	# get the free space and LV size (in megs), guess at the snapshot
	#  size, and see how much the admin will let us use (keeping MINFREE
	#  available)
	SPACE="`lvs --noheadings --units M --nosuffix -o vg_free "$DEV"`"
	SIZE="`lvs --noheadings --units M --nosuffix -o lv_size "$DEV"`"
	SNAPSIZE="`expr "$SIZE" / 500`"
	AVAIL="`expr "$SPACE" - "$MINFREE"`"

	# if we don't even have MINSNAP space available, skip the LV
	if [ "$MINSNAP" -gt "$AVAIL" -o "$AVAIL" -le 0 ] ; then
		log "warning" "Not enough free space on volume group for ${DEV}; skipping"
		continue
	fi

	# make snapshot large enough to handle e.g. journal and other updates
	[ "$SNAPSIZE" -lt "$MINSNAP" ] && SNAPSIZE="$MINSNAP"

	# limit snapshot to available space (VG space minus min-free)
	[ "$SNAPSIZE" -gt "$AVAIL" ] && SNAPSIZE="$AVAIL"

	# don't need to check SNAPSIZE again: MINSNAP <= AVAIL, MINSNAP <= SNAPSIZE,
	#  and SNAPSIZE <= AVAIL, combined, means SNAPSIZE must be between MINSNAP
	#  and AVAIL, which is what we need -- assuming AVAIL > 0

	# check it
	check_fs "$VG" "$LV" "$TYPE" "$SNAPSIZE"
done


--------------000702040605040003060406
Content-Type: text/plain;
 name="lvcheck.conf"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="lvcheck.conf"

#!/bin/sh

# lvcheck configuration file

# This file follows the pattern of sshd_config: default
#  values are shown here, commented-out.

# EMAIL
#   Address to send failure notifications to.  If empty,
#   failure notifications will not be sent.

#EMAIL='root'

# INTERVAL
#   Days to wait between checks.  All LVs use the same
#   INTERVAL, but the "days since last check" value can
#   be different per LV, since that value is stored in
#   the filesystem superblock.

#INTERVAL=30

# AC_UNKNOWN
#   Whether to run the *fsck checks if the script can't
#   determine whether the machine is on AC power.  Laptop
#   users will want to set this to ABORT, while server and
#   desktop users will probably want to set this to
#   CONTINUE.  Those are the only two valid values.

#AC_UNKNOWN="CONTINUE"

# MINSNAP
#   Minimum snapshot size to take, in megabytes.  The
#   default snapshot size is 1/500 the size of the logical
#   volume, but if that size is less than MINSNAP, the
#   script will use MINSNAP instead.  This should be large
#   enough to handle e.g. journal updates, and other disk
#   changes that require (semi-)constant space.

#MINSNAP=256

# MINFREE
#   Minimum amount of space (in megabytes) to keep free in
#   each volume group when creating snapshots.

#MINFREE=0


--------------000702040605040003060406--
