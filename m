Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3C4HKs6030603
	for <linux-lvm@redhat.com>; Wed, 12 Apr 2006 00:17:20 -0400
Received: from web60419.mail.yahoo.com (web60419.mail.yahoo.com
	[209.73.178.147])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id k3C4HCM3000645
	for <linux-lvm@redhat.com>; Wed, 12 Apr 2006 00:17:12 -0400
Message-ID: <20060412041706.36220.qmail@web60419.mail.yahoo.com>
Date: Tue, 11 Apr 2006 21:17:06 -0700 (PDT)
From: <linux_user98765@yahoo.com>
Subject: Re: [linux-lvm] Concise LVM Summary
In-Reply-To: <0aa81d30ea28716535a28bd942327f3a@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

lvs,pvs,vgs each provide for output of specified columns (with optional
headers and field separators); HOWEVER this is still limited as (at
least on my debian pkg) PV and LV commands cannot be combined, thus
negating the possibility of anything even as simple as:

# vgs -o vg_name,lv_name,pv_name
  Can't report LV and PV fields at the same time

Also, the man pages (at least those provided with the debian pkg)
aren't particularly detailed.  They list some (but not all) of the
possible column headers and even exclude one of the default column
headers (I have no idea what optional column generates the "Log"
header).

While this can be segmented into separate commands, the whole idea was
concise presentation.  I'm basically using perl to parse the output of
vgs,lvs,pvs with full columns and output the pertitent (at least to me
anyway) information.

I still haven't figured out how to figure out the disk usage of a
particular PV in a given LV.  To illustrate:


# vgdisplay -v | grep -B3 Free
    Finding all volume groups
    Finding volume group "home"
  PE Size               4.00 MB
  Total PE              52205
  Alloc PE / Size       52205 / 203.93 GB
  Free  PE / Size       0 / 0
--
  PV Name               /dev/sdb
  PV UUID               zTUa5N-NtiP-6aMh-6WJi-d3Xk-MSwN-enKL2P
  PV Status             allocatable
  Total PE / Free PE    38156 / 0
--
  PV Name               /dev/hdb4
  PV UUID               9QYlyj-1dS2-NkVQ-fmZ5-v5bp-N9J6-qirHn6
  PV Status             allocatable
  Total PE / Free PE    14049 / 0


This returns the number of allocated PEs of a given PV to a particular
VG, but does not offer any indication of actual disk usage of those PE
on the PV in the LV.  Similarly:


# vgs -o vg_name,devices
  VG   Devices
  home /dev/sdb(0)
  home /dev/hdb4(0)


Reveals which PVs are allocated to which VG -- but none of the options
appear to offer anything akin to `df` specific to a particular PV in
the LV.  I'm looking for something like:


~# df -h /home
Filesystem            Size  Used Avail Use% Mounted on
/dev/mapper/home-lvol0
                      201G   72G  122G  38% /home


But with a per PV breakdown -- someting like (numbers made up):


VG home               Size  Used Avail Use% Mounted on
LV /dev/home/lvol0    201G   72G  122G  38% /home
PV /dev/sdb(0)        160G   50G  110G  31%
PV /dev/hdb4(0)        41G   22G   19G  54%


--- Jonathan E Brassow <jbrassow@redhat.com> wrote:
> You can pretty much print things how you want by specifying the right
> things on the command line.  'lvs' and friends will default to
> printing out certain columns, but you can change that.
> 
> prompt> lvs --noheadings # print things out without the headings
> prompt> lvs --noheadings -o lv_name  #print just the lv names
> prompt> lvs --noheadings -o lv_name, uuid  #print the lv names and 
> their uuid
> etc
> 
> for a more complete list, see the various man pages
> 
>   brassow

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
