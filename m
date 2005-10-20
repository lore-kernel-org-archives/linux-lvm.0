Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9KDTbV09057
	for <linux-lvm@redhat.com>; Thu, 20 Oct 2005 09:29:37 -0400
Received: from karen.nerdshack.com (karen.nerdshack.com [209.189.235.41])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j9KDTaVA012783
	for <linux-lvm@redhat.com>; Thu, 20 Oct 2005 09:29:36 -0400
Received: from dispatchd.nerdshack.com (julie.nerdshack.com [209.189.235.39])
	by karen.nerdshack.com (Postfix) with SMTP id DD12A1E3BFA
	for <linux-lvm@redhat.com>; Thu, 20 Oct 2005 08:26:30 -0500 (CDT)
Date: Thu, 20 Oct 2005 17:26:54 +0400
From: Dmitry Comoda <asterius@nerdshack.com>
Message-Id: <20051020172654.3b938fd0.asterius@nerdshack.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Thu__20_Oct_2005_17_26_54_+0400_AGwopUjQvj5XI/Km"
Subject: [linux-lvm] Possible probings of my CDROM?
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

--Signature=_Thu__20_Oct_2005_17_26_54_+0400_AGwopUjQvj5XI/Km
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi list,

Here is the snippit from my dmesg:

thdb: media error (bad sector): status=3D0x51 { DriveReady SeekComplete Err=
or }
hdb: media error (bad sector): error=3D0x34 { AbortedCommand LastFailedSens=
e=3D0x03 }
ide: failed opcode was: unknown
end_request: I/O error, dev hdb, sector 1173936
Buffer I/O error on device hdb, logical block 293484
hdb: media error (bad sector): status=3D0x51 { DriveReady SeekComplete Erro=
r }
hdb: media error (bad sector): error=3D0x34 { AbortedCommand LastFailedSens=
e=3D0x03 }
ide: failed opcode was: unknown
end_request: I/O error, dev hdb, sector 1173940
Buffer I/O error on device hdb, logical block 293485
hdb: media error (bad sector): status=3D0x51 { DriveReady SeekComplete Erro=
r }
hdb: media error (bad sector): error=3D0x34 { AbortedCommand LastFailedSens=
e=3D0x03 }
ide: failed opcode was: unknown
end_request: I/O error, dev hdb, sector 1173944
Buffer I/O error on device hdb, logical block 293486
hdb: media error (bad sector): status=3D0x51 { DriveReady SeekComplete Erro=
r }
hdb: media error (bad sector): error=3D


I wonder if that is something to do with LVM? When CD in CDROM drive, it bo=
ots just
fine. I have uncommented the line in /etc/lvm/lvm.conf
Just in case, here is my lvm.conf file:

# This is an example configuration file for the LVM2 system.
# It contains the default settings that would be used if there was no
# /etc/lvm/lvm.conf file.
#
# Refer to 'man lvm.conf' for further information including the file layout.
#
# To put this file in a different directory and override /etc/lvm set
# the environment variable LVM_SYSTEM_DIR before running the tools.


# This section allows you to configure which block devices should
# be used by the LVM system.
devices {

    # Where do you want your volume groups to appear ?
    dir =3D "/dev"

    # An array of directories that contain the device nodes you wish
    # to use with LVM2.
    scan =3D [ "/dev" ]

    # A filter that tells LVM2 to only use a restricted set of devices.
    # The filter consists of an array of regular expressions.  These
    # expressions can be delimited by a character of your choice, and
    # prefixed with either an 'a' (for accept) or 'r' (for reject).
    # The first expression found to match a device name determines if
    # the device will be accepted or rejected (ignored).  Devices that
    # don't match any patterns are accepted.

    # Be careful if there there are symbolic links or multiple filesystem
    # entries for the same device as each name is checked separately against
    # the list of patterns.  The effect is that if any name matches any 'a'
    # pattern, the device is accepted; otherwise if any name matches any 'r'
    # pattern it is rejected; otherwise it is accepted.
 # An array of directories that contain the device nodes you wish
    # to use with LVM2.
    scan =3D [ "/dev" ]

    # A filter that tells LVM2 to only use a restricted set of devices.
    # The filter consists of an array of regular expressions.  These
    # expressions can be delimited by a character of your choice, and
    # prefixed with either an 'a' (for accept) or 'r' (for reject).
    # The first expression found to match a device name determines if
    # the device will be accepted or rejected (ignored).  Devices that
    # don't match any patterns are accepted.

    # Be careful if there there are symbolic links or multiple filesystem
    # entries for the same device as each name is checked separately against
    # the list of patterns.  The effect is that if any name matches any 'a'
    # pattern, the device is accepted; otherwise if any name matches any 'r'
    # pattern it is rejected; otherwise it is accepted.

    # Remember to run vgscan after you change this parameter to ensure
    # that the cache file gets regenerated (see below).

    # By default we accept every block device:
    filter =3D [ "a/.*/" ]

    # Exclude the cdrom drive
      filter =3D [ "r|/dev/cdrom|" ]

    # When testing I like to work with just loopback devices:
    # filter =3D [ "a/loop/", "r/.*/" ]

    # Or maybe all loops and ide drives except hdc:
    # filter =3D[ "a|loop|", "r|/dev/hdc|", "a|/dev/ide|", "r|.*|" ]

    # Use anchors if you want to be really specific
 # The results of the filtering are cached on disk to avoid
    # rescanning dud devices (which can take a very long time).  By
    # default this cache file is hidden in the /etc/lvm directory.
    # It is safe to delete this file: the tools regenerate it.
    cache =3D "/etc/lvm/.cache"

    # You can turn off writing this cache file by setting this to 0.
    write_cache_state =3D 1

    # Advanced settings.

    # List of pairs of additional acceptable block device types found
    # in /proc/devices with maximum (non-zero) number of partitions.
    # types =3D [ "fd", 16 ]
 # If sysfs is mounted (2.6 kernels) restrict device scanning to
    # the block devices it believes are valid.
    # 1 enables; 0 disables.
    sysfs_scan =3D 1

    # By default, LVM2 will ignore devices used as components of
    # software RAID (md) devices by looking for md superblocks.
    # 1 enables; 0 disables.
    md_component_detection =3D 1
}

# This section that allows you to configure the nature of the
# information that LVM2 reports.
log {

    # Controls the messages sent to stdout or stderr.
    # There are three levels of verbosity, 3 being the most verbose.

Any ideas? Thanks in advance.
Dmitry.

--Signature=_Thu__20_Oct_2005_17_26_54_+0400_AGwopUjQvj5XI/Km
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFDV5ssT36nf43Y1ncRAgI1AJkBznz2pvwRSnZDKZsqrnvJKMVj9gCfV0vb
sQ/3NVXiPfL+bKaeTleUFgo=
=d4mw
-----END PGP SIGNATURE-----

--Signature=_Thu__20_Oct_2005_17_26_54_+0400_AGwopUjQvj5XI/Km--
