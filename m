Message-ID: <3955A848.D5071D8E@inet.net.nz>
Date: Sun, 25 Jun 2000 18:35:52 +1200
From: Dale Kemp <dale@inet.net.nz>
MIME-Version: 1.0
Subject: [linux-lvm] LVM /dev and /proc problems and change proposal
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Linux LVM mailing list <linux-lvm@msede.com>

Hi all,

I've started using LVM thanks to Daniel Mehrmann 2.2.16 kernel patch
and the debian lvm package (apt-get install lvm). I notice that vg's and

lv's are created in /dev this means the volume name is limited since it
could
clash with similar named devices in the /dev directory. For example:

# ls -l /dev/par0
crw-rw----    1 root     lp         6,   0 Feb 23  1999 /dev/par0

# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/hda6" of VG "vdisk1" [3 GB / 3 GB free]
pvscan -- inactive PV "/dev/hde5"  is in no VG  [762.86 MB]
pvscan -- inactive PV "/dev/hde6"  is in no VG  [285.93 MB]
pvscan -- total: 3 [4.02 GB] / in use: 1 [3 GB] / in no VG: 2 [1.02 GB]

(create a volume group called par0)

# vgcreate par0 /dev/hde6
vgcreate -- INFO: using default physical extent size 4 MB
vgcreate -- INFO: maximum logical volume size is 255.99 Gigabyte
vgcreate -- doing automatic backup of volume group "par0"
vgcreate -- volume group "par0" successfully created and activated

# ls -ld /dev/par0
dr-xr-xr-x    2 root     root         1024 Jun 25 17:20 /dev/par0

Ouch! The device has been replace with a directory! Just adding
protection here doesn't solve the problem of potential name clashes.
I think the solution is to store these names in /etc/lvm* and use
another directory level in /dev.

e.g.. /dev/lvm/
      |
      +---- lvm (109,0)
      |
      +---- <name1> +---- group (109,0)
      |             |
      |             +---- <lv_name1> (58,0)
      |             +---- <lv_name2> (58,1)
      |
      +---- <name2> +---- group (109,1)
      |             |
      |             +---- <lv_name3> (58,2)
      |
      +---- etc (not needed if add vg_ and lv_ to above names)
            |
            +---- future_item (890,0)

OR...

    /dev/lvm
      |
      |
      +-- <name1> (109,0) [optional forced vg_ prefix to stop
name-clash]
      +-- <name2> (109,1)
      |
      +-- <name1> (58,0) [optional forced lv_ prefix to stop name-clash]

      +-- <name2> (58,1)
      +-- <name3> (58,2)
      |
      +-- future_item (890,0)

OR... (my favorite)

    /dev/lvm
      |
      |
      +-- pv (example to show future expansion options)
      |    |
      |    +-- pv0 --> /dev/hda6
      |    +-- pv1 --> /dev/hde5
      |    +-- pv2 --> /dev/hde6
      |
      +-- vg
      |    |
      |    +-- <name1> (109,0)
      |    +-- <name2> (109,1)
      |
      +-- lv
      |    |
      |    +-- <name1> (58,0)
      |    +-- <name2> (58,1)
      |    +-- <name3> (58,2)
      |
      +-- future_item (890,0)

I use the prefix 'vg_' and 'lv_' to stop any future name clashes. I
don't see
it being a good idea to list lv under the vg's since you might allow the
transfer
of lv's between vg's. We use the tools to find out more info, or create
readable
files in /etc/...

Also I think there should be a sub-directory for lvm itself in /proc
ie. /proc/lvm/lvm instead of /proc/lvm.

Example:

    # pvcreate /dev/hde[56]
    # vgcreate vdisk2 /dev/hde5 /dev/hde6
    # lvcreate -n XFilesVol -L 150M vdisk2
    # mke2fs /dev/lvm/lv/XFilesVol
    # mount -t ext2 /dev/lvm/lv/XFileVol /mnt/XFiles

The current system has name space problems and will be more difficult to
extend
in the future.

-- Dale (dale@sclnz.com)
