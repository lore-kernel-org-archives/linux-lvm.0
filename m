Return-Path: <terjekv@ifi.uio.no>
From: Terje Kvernes <terjekv@math.uio.no>
Date: 13 Apr 2001 14:52:47 +0200
Message-ID: <wxxwv8pklls.fsf@einn.ifi.uio.no>
MIME-Version: 1.0
Subject: [linux-lvm] LVM and devfs with /proc/lvm/global
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

  hm. I'm having a slight issue combining devfs and LVM at the moment.
  the issue is quite simple and regards naming.

  the issue is that /proc/lvm/global just gives the name as "part*"
  when you happen to use devfs. resolving this to a full path is, as
  far as I can tell, impossible.

  I _can_ do a `vgdisplay -v' and get a listing of all the PV's in the
  VG and compare the last name (and size and such) of each PV with
  what I have from /proc/lvm/global. that'll work -- most of the time.

  what happens if I have two identical-sized PV's on two disks,
  that'll show up as:

  [AA] part1  3076096 /751   0 /0  3076096 /751   
  [AA] part1  3076096 /751   0 /0  3076096 /751   

  in /proc/lvm/global. how do I _know_ which of these are:

  /dev/ide/host0/bus0/target0/lun0/part1
  /dev/ide/host0/bus0/target1/lun0/part1

  yes, there is a PV# that _could_ be used if it was given in
  /proc/lvm/global to check against, but if the information in /proc/
  requires you to actually check it against something, it is lacking
  something, isn't it?

  of course, one could say "then don't use what's in /proc/lvm/global"
  but I honestly _like_ to interface with kernel-related stuff through
  /proc in a file-like manner -- although I'll have to admit I've
  yelled for another naming than /proc. :)

  besides, one _has_ to run vgdisplay as root... which isn't all that
  grand either.

  in my honest opinion the format of /proc/lvm/global should be
  altered to contain the full path of the PV -- otherwise it is
  unusable for anything but a quick peek at current LVM status. and if
  the format is going to be change, it should be done before a
  1.*-release.

  (just my two cents :)

-- 
Terje
