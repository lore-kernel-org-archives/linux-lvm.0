Date: Sun, 23 Jul 2000 08:44:53 +0200 (CEST)
From: Tamas Gergely <dice@dice.dhs.org>
Subject: Re: [linux-lvm] LVM and reiserfs resizing
In-Reply-To: <Pine.LNX.4.21.0007221611080.1573-100000@frame.pinchaser.com>
Message-ID: <Pine.LNX.4.21.0007230842570.132-100000@moon.dice.hu>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Troy E. Ablan" <chaser@mewl.net>
Cc: linux-lvm@msede.com

Hi!

> Does anyone know of any scripts/tools similar to e2fsadm that are
> wrappers around resize_reiserfs and lvreduce/lvextend?

Yes, the german 'Linux Magazin' published one two or three month ago.

Gergely
--
#!/usr/bin/perl

# resize_rfs V0.02
# Copyright (C) 2000 Harald Milz (hm@linux-magazin.de)
# This file is distributed under the GPL V2 or any later version... 

# ohmygod. someone invented lvextend, lvreduce, and resize_reiserfs,
# but did not think of integrating them. This is an UGLY HACK
# which does exactly that, while at the same time attempting to 
# perform some sanity checks before actually messing with the 
# filesystems. Better is that ... 

# BUGS:
# 1. BAD UGLY SPAGHETTI CODE
# 2. no proper documentation yet
# 3. works as designed. 

###################################################################
# Parameter
# --size [+|-]<size><kKmMgGtT>
# --lv lvname
# --pv pvname      optional - makes only sense when growing 
# --verbose
# --dry-run        and don't actually do something
# --help
###################################################################

###################################################################
# Exit codes
# 0       success or nothing to do
# 1       wrong syntax
# 2       VG not found
# 3       VG not read/write
# 4       VG not available/resizable
# 5       can't shrink FS while mounted
# 6       not enough free PE's left on VG
# 7       PV not valid
# 8       not enough free PE's left on PV
# 9       can't shrink FS - not enough space left
# 10      program not run as root
# 11      LV does not exist
###################################################################

use Getopt::Long;
GetOptions ("size=s" => \$size, 
	    "lv=s" => \$lv, 
	    "pv=s" => \$pv, 
	    "dry-run!" => \$dryrun, 
	    "verbose!", 
	    "help!");

sub usage () {
  print ("usage: $0 --size [+|-]<size><kKmMgGtT> --lv <logical volume> \\
          [--pv <pvname>] [--dry-run] [--verbose] [--help]\n");
  exit 1;
}

if ($< != 0) { 
  warn ("$0 must be run as root\n");
  exit 10;
}

# size and lv must be there, else usage();
if (!$size || !$lv || $opt_help) {
  usage();
}

# find out size parameter
usage() unless $size =~ m/^(.)(\d*)([K|M|G|T])$/i;
($sign, $num, $exp) = ($1, $2, $3);

# more elegant: quit if 1st char != 0-9, -, +
if ($sign eq "+") { 
  $grow = 1;
} elsif ($sign eq "-") {
  $grow = -1;
} elsif ($sign =~ /[0-9]+/) { 
  $grow = 0;
} else {
  usage ();
}

# scale everything to kBytes
$mysize = $sign . $num;
$mysize *= 1024 if (uc $exp eq "M");
$mysize *= 1024*1024 if (uc $exp eq "G");
$mysize *= 1024*1024*1024 if (uc $exp eq "T");   # ohmygod ...

###################################################################
# check VG if exists, R/W and active. get VG parameter from LV data
#             vgdisplay -c -> split ":" 
#             access:status must be 3:5 
#             else die (warning);
###################################################################

chomp ($lvdata = `lvdisplay -c $lv 2>&1`);

($lvname, $vgname, $lvwrite, $lvstatus, $lvno, $noopen, 
 $lvsize, $currentle, $allocle, $allocstrat, $readahead, 
 $blockdev) = split (/:/, $lvdata);

if ($lvname ne $lv) {
  warn ("$lvdata");
  exit 11;
}

$vg = $vgname;
chomp ($vgdata = `vgdisplay -c $vg 2>&1`);
chop $vgdata; # 2 trailing \n -... 

($vgname, $vgaccess, $vgstatus, $vgno, $maxlv, $curlv, 
 $openlv, $maxlvsize, $maxpv, $curpv, $actpv, $vgsize, 
 $pesize, $totalpe, $allocpe, $freepe) = split (/:/, $vgdata);

if ($vgname ne $vg) {
  warn ("$vgdata");
  exit 2;
} elsif ($vgaccess != 3) {
  warn ("VG $vgname not read/write\n");
  exit 3;
} elsif ($vgstatus != 5) {
  warn ("VG $vgname not available/resizable\n");
  exit 4;
}

###################################################################
# if no + or -: absolute size change. 
#    determine grow or shrink
###################################################################

$lvsize /= 2; # size in K
$mysize -= $lvsize if ($grow == 0);
 
if ($mysize == 0) {
  warn ("nothing to do.\n");
  exit 0;
}

###################################################################
# if shrink && mounted: die (warning);
###################################################################

$mount = `mount | grep $lv`;
if ($mount ne "" && $mysize < 0) {
  warn ("can't shrink fs $lv while mounted\n");
  exit 5;
}

# STRATEGY DISCUSSION
# we always use absolute growth/shrink here to prevent 
# LV and FS size from differing. 

if ($mysize > 0) { # grow

###################################################################
#    if grow: enough space left on VG?    
#             free kBytes = free PE's * 4K
#             if $pv: check whether valid pvname (pvdisplay) 
#                        and enough space left on PV
#             lvextend [$pvname], resize_reiserfs -f 
###################################################################

  $freekb = $freepe * 4096;
  if ($mysize > $freekb) {
    warn ("only $freepe free PE's ($freekb K) left on VG $vg\n"); 
    exit 6;
  }
  if ($pv) {
    # pvdisplay of LVM 0.8 has a bug which prevents the use of "-c":
    #   merlin:~ # pvdisplay -c /dev/hda4
    #   pvdisplay -- option v not allowed with option c
    # this ugly stuff needs a rewrite as soon as this is fixed. Bah. 
    chomp ($pvdata = `pvdisplay -vc $pv 2>&1`);

    ($pvname, $vgname, $pvsize, $pvno, $pvstat, $allocatable, $curlv,
     $pesize, $totalpe, $freepe, $allocpe) = split (/:/, $pvdata);

    if ($pvname ne $pv) { # ERROR
      warn ("$pvdata");
      exit 7;
    }
    $freekb = $freepe * 4096;
    if ($mysize > $freekb) {
      warn ("only $freepe free PE's ($freekb K) left on PV $pv\n"); 
      exit 8;
    }
  }

  $newsize = $lvsize + $mysize;

  # now comes the moment where the cow the water lets. 
  $cmd = sprintf ("lvextend -L %dK %s %s\n", $newsize, $lv, $pv);
  print $cmd if $opt_verbose;
  system ($cmd) unless $dryrun;
  $cmd = sprintf ("resize_reiserfs -s%dK -f %s\n", $newsize, $lv);
  print $cmd if $opt_verbose;
  system ($cmd) unless $dryrun;

} else { # shrink 
  
###################################################################
#    if shrink: enough free space left on FS?  
# 	      mount temporary! $tmpdir = `mktemp -d /tmp/temp.XXXXXX`;
#             df -k --sync 
#             umount ; rmdir $tmpdir ;
#             resize_reiserfs -f , lvreduce -f
###################################################################

  $mysize = abs ($mysize); 
  chomp ($tmpdir = `mktemp -d /tmp/temp.XXXXXX`);
  `mount -t reiserfs $lv $tmpdir`;
  $df = `df -k --sync $lv | sed 1d`;
  `umount $tmpdir`;
  rmdir $tmpdir;
  $df =~ m/\S+\s+(\S+)\s+\S+\s+(\S+).*/;
  ($fssize, $available) = ($1, $2);
  if ($available < $mysize) { 
    # should we add a minimum free size here? 
    warn ("can't shrink $lv by $mysize K: only $available K left.\n");
    exit 9;
  }
  $newsize = $fssize - $mysize;
  # now comes the moment where the cow the water lets. 

  #@the time of this writing, reducing a reiserfs requires a Y or N
  # works though. 
  $cmd = sprintf ("resize_reiserfs -s%dK -f %s\n", $newsize, $lv);
  print $cmd if $opt_verbose;
  system ($cmd) unless $dryrun;
  # we're allowed use the "-f" parameter because we hopefully made
  # all necessary sanity checks. 
  $cmd = sprintf ("lvreduce -f -L %dK %s %s\n", $newsize, $lv);
  print $cmd if $opt_verbose;
  system ($cmd) unless $dryrun;

}

print "Now you may want to restore your backup.
Err - you did make a backup before, no?\n";
exit 0;
