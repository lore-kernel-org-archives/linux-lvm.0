Message-Id: <6.2.5.6.0.20051013152513.0a185940@nersc.gov>
Date: Thu, 13 Oct 2005 18:34:20 -0700
From: Jed Donnelley <jed@nersc.gov>
Subject: Re: [linux-lvm] Linux LVM - half baked?
In-Reply-To: <CA66F0ABC53BFD4B8A99FC27@dhcp-2-206.wgops.com>
References: <6.2.5.6.0.20051012165544.08ef32a0@nersc.gov>
	<CA66F0ABC53BFD4B8A99FC27@dhcp-2-206.wgops.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="=====================_804762875==.ALT"
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
To: LVM general discussion and development <linux-lvm@redhat.com>, rhn-users@redhat.com

--=====================_804762875==.ALT
Content-Type: text/plain; charset="us-ascii"; format=flowed

At 07:00 PM 10/12/2005, Michael Loftis wrote:
>Both of these sound more like RAID problems, not LVM.  What sort of 
>RAID are you using?  MD?  If not MD what RAID controller are you using?

Both of these failures are on Redhat ES 4.1 systems using MD.  Both 
are testing prior to Oracle installs.  In the second system, the x86 
system that loops through a reboot without giving me access to the 
problem file system to fsck:

/dev/VolGroup00/LogVol02 UNEXPECTED INCONSISTENCY; RUN fsck MANUALLY 
(i.e. without -a or -p options)
...
Give root password for maintenance (or type Control-D to continue)
<and then reboots in any case>

it is quite a simple install with 2 36GB SCSI disks.  Each has a 
RAID-1 mirror for /boot
and a RAID-1 mirror for VolGroup00 that includes LogVol02 for /, 
LogVol01 for swap,
and LogVol00 for /var.  In the kickstart syntax used to build the system:

clearpart --all --initlabel
part raid.10 --size=1024 --ondisk=sda --asprimary
part raid.11 --size=1024 --ondisk=sdb --asprimary
part raid.20 --size=1024 --grow --ondisk=sda
part raid.21 --size=1024 --grow --ondisk=sdb
raid /boot --fstype ext2 --level=RAID1 raid.10 raid.11
raid pv.1000 --level=RAID1 raid.20 raid.21
volgroup VolGroup00 --pesize=32768 pv.1000
logvol / --fstype ext3 --name=LogVol02 --vgname=VolGroup00 --size=10240 --grow
logvol /var --fstype ext3 --name=LogVol01 --vgname=VolGroup00 --size=8192
logvol swap --fstype swap --name=LogVol00 --vgname=VolGroup00 --size=2048

While it says to run fsck manually, when I bring up the
linux rescue system from the CD (Redhat ES 4.1) there is
no /dev/VolGroup00/LogVol02 file system to run fsck on.  Apparently the LVM
layer hasn't made it available?  What next?

While you suggest that these sound like RAID problems, I've been using MD RAID
on many systems (15+) for 3-4 years now, mostly on Redhat ES 2.1 
systems, without
any problems of this sort.  During that time I've had numerous disk 
failures (12-15)
and even a controller failure and I've always been able to recover without even
taking systems out of production.  I've never had a problem like this 
where I couldn't
recover a file system or even boot a system - though I could deal with that.

These problems might be related to a combination of LVM over MD RAID, 
but that's
the way I need to run these systems.  If I have to give up either MD 
RAID or LVM, at
this time I choose to give up LVM - "half baked".  My problem could 
also be a result
of some ignorance on my part about LVM.  That's why I'm posting these messages.
I'd be delighted if somebody would say something to the effect that, 
"Didn't you know
that you can use xyz to make that logical volume visible and then run 
fsck on it?"

In terms of replicating such a problem for testing and correcting, r.e.:

At 04:18 AM 10/13/2005, Robin Green wrote:
>Did you file a bug about this? It's rather hard to fix bugs if people don't
>file reproducable test cases in the relevant bug database.

It is indeed 'hard' as you say.  In the above case there were two hard disk
failures (/dev/sdb) that precipitated the problem.  After the first 
disk failure
I put in a replacement disk and apparently synchronized the RAID-1 pair
successfully.  However, some time about 1/2 day later (I often use rather
old disks for early development projects like this) that replacement
/dev/sdb also failed.  It was after that failure that I was unable to
boot the system off /dev/sda - an apparently still fully functional
disk (I tested it looking at it both from another system and of course
from the linux rescue system from the CD) and am stuck unable to
fsck the / file system that's nominally in /dev/VolGroup00/LogVol02
as above.

Of course I have the disk, so I can replicate the problem, as evidence
by the final state of that disk, at will.  I could dd the 36GB of that disk
to a file that I could make available (e.g. on the Web) so that somebody
else could copy it to an equivalent disk and replicate the problem or 
I could even
send that disk to somebody who was serious about working on the problem -
assuming I could get security approval to do so.  There wasn't much relevant
on that disk when the problem occurred.  I'm about out of ideas for 
working on it.

Here's what fdisk (when viewed from an essentially identically configured
system which is of course working) says about that disk in case anybody
would like to know more details about its configuration when considering
the dd proposal above:

[root@helpb ~]# fdisk /dev/sdb

The number of cylinders for this disk is set to 4462.
There is nothing wrong with that, but this is larger than 1024,
and could in certain setups cause problems with:
1) software that runs at boot time (e.g., old versions of LILO)
2) booting and partitioning software from other OSs
    (e.g., DOS FDISK, OS/2 FDISK)

Command (m for help): p

Disk /dev/sdb: 36.7 GB, 36703918080 bytes
255 heads, 63 sectors/track, 4462 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

    Device Boot      Start         End      Blocks   Id  System
/dev/sdb1   *           1         131     1052226   fd  Linux raid autodetect
/dev/sdb2             132        4462    34788757+  fd  Linux raid autodetect

Command (m for help): q

[root@helpb ~]#

When you refer to filing "reproducible test cases in the relevant bug 
database",
what do you suggest I do in this case?  My experience with such bug databases
has been poor.  To me they have mostly looked like black holes - though I admit
that's with a small number of experiences (~5) and there are some exceptions
(e.g. Sun Microsystems seems to follow up pretty well).  Still, I 
don't consider it
a good use of my time or particularly useful for LVM.

The basic problem is, How do I get at that logical volume file system to work
on it - e.g. to recover it?


The other apparent LVM failure that I'm dealing with is a bit more problematic
to replicate.  It's similar in some ways (the base partitioning of /dev/sda and
/dev/sdb are similar but on 146GB SCSI disks).  It also has a RAID-10 
configuration
(mentioned earlier in the sysinit bug) on four other disks.  However, 
the RAID-10
just holds a data logical volume that the system can, in principle, come up
without.  I think I need to do a bit more work on that system trying to
recover it before I send even more email about it.  It's also a 64 bit system
that might complicate things a bit.  I was hoping to get lucky and perhaps have
somebody recognize it's symptoms:
...
4 logical volume(s) in volume group "VolGroup00" now active
ERROR: failed in exec of defaults
ERROR: failed in exec of ext3
mount: error 2 mounting none
switchroot: mount failed: 23
ERROR: ext3 exited abnormally! (pid 284)
...  <three more similar to the above>
kernel panic - not syncing: Attempted to kill init!

and have some ideas on routes to pursue to try to recover that
system.  Again it is a test system, but if I can't recover problems
with test systems I certainly don't want to run the same LVM
software in our production systems.

I consider myself lucky to have run into such problems while
testing.  I sent my initial message partly in the hope somebody
might have ideas I could use to try to recover these systems and
partly to share my experiences so others might better be able to
evaluate whether they want to go use LVM on their production
systems.

--Jed http://www.nersc.gov/~jed/ 
--=====================_804762875==.ALT
Content-Type: text/html; charset="us-ascii"

<html>
<body>
At 07:00 PM 10/12/2005, Michael Loftis wrote:<br>
<blockquote type=cite class=cite cite="">Both of these sound more like
RAID problems, not LVM.&nbsp; What sort of RAID are you using?&nbsp;
MD?&nbsp; If not MD what RAID controller are you using?</blockquote><br>
Both of these failures are on Redhat ES 4.1 systems using MD.&nbsp; Both
are testing prior to Oracle installs.&nbsp; In the second system, the x86
system that loops through a reboot without giving me access to the
problem file system to fsck:<br><br>
/dev/VolGroup00/LogVol02 UNEXPECTED INCONSISTENCY; RUN fsck MANUALLY
(i.e. without -a or -p options)<br>
...<br>
Give root password for maintenance (or type Control-D to continue)<br>
&lt;and then reboots in any case&gt;<br><br>
it is quite a simple install with 2 36GB SCSI disks.&nbsp; Each has a
RAID-1 mirror for /boot<br>
and a RAID-1 mirror for VolGroup00 that includes LogVol02 for /, LogVol01
for swap,<br>
and LogVol00 for /var.&nbsp; In the kickstart syntax used to build the
system:<br><br>
<font face="Courier New, Courier">clearpart --all --initlabel<br>
part raid.10 --size=1024 --ondisk=sda --asprimary<br>
part raid.11 --size=1024 --ondisk=sdb --asprimary<br>
part raid.20 --size=1024 --grow --ondisk=sda<br>
part raid.21 --size=1024 --grow --ondisk=sdb<br>
raid /boot --fstype ext2 --level=RAID1 raid.10 raid.11<br>
raid pv.1000 --level=RAID1 raid.20 raid.21<br>
volgroup VolGroup00 --pesize=32768 pv.1000<br>
logvol / --fstype ext3 --name=LogVol02 --vgname=VolGroup00 --size=10240
--grow<br>
logvol /var --fstype ext3 --name=LogVol01 --vgname=VolGroup00
--size=8192<br>
logvol swap --fstype swap --name=LogVol00 --vgname=VolGroup00
--size=2048<br><br>
While it says to run fsck manually, when I bring up the<br>
linux rescue system from the CD (Redhat ES 4.1) there is<br>
no </font>/dev/VolGroup00/LogVol02 file system to run fsck on.&nbsp;
Apparently the LVM<br>
layer hasn't made it available?&nbsp; What next?<br><br>
While you suggest that these sound like RAID problems, I've been using MD
RAID<br>
on many systems (15+) for 3-4 years now, mostly on Redhat ES 2.1 systems,
without<br>
any problems of this sort.&nbsp; During that time I've had numerous disk
failures (12-15)<br>
and even a controller failure and I've always been able to recover
without even<br>
taking systems out of production.&nbsp; I've never had a problem like
this where I couldn't<br>
recover a file system or even boot a system - though I could deal with
that.<br><br>
These problems might be related to a combination of LVM over MD RAID, but
that's<br>
the way I need to run these systems.&nbsp; If I have to give up either MD
RAID or LVM, at<br>
this time I choose to give up LVM - &quot;half baked&quot;.&nbsp; My
problem could also be a result<br>
of some ignorance on my part about LVM.&nbsp; That's why I'm posting
these messages.<br>
I'd be delighted if somebody would say something to the effect that,
&quot;Didn't you know<br>
that you can use xyz to make that logical volume visible and then run
fsck on it?&quot;<br><br>
In terms of replicating such a problem for testing and correcting,
r.e.:<br><br>
At 04:18 AM 10/13/2005, Robin Green wrote:<br>
<blockquote type=cite class=cite cite="">Did you file a bug about this?
It's rather hard to fix bugs if people don't <br>
file reproducable test cases in the relevant bug
database.</blockquote><br>
It is indeed 'hard' as you say.&nbsp; In the above case there were two
hard disk<br>
failures (/dev/sdb) that precipitated the problem.&nbsp; After the first
disk failure<br>
I put in a replacement disk and apparently synchronized the RAID-1
pair<br>
successfully.&nbsp; However, some time about 1/2 day later (I often use
rather<br>
old disks for early development projects like this) that replacement<br>
/dev/sdb also failed.&nbsp; It was after that failure that I was unable
to<br>
boot the system off /dev/sda - an apparently still fully functional<br>
disk (I tested it looking at it both from another system and of
course<br>
from the linux rescue system from the CD) and am stuck unable to<br>
fsck the / file system that's nominally in /dev/VolGroup00/LogVol02<br>
as above.<br><br>
Of course I have the disk, so I can replicate the problem, as
evidence<br>
by the final state of that disk, at will.&nbsp; I could dd the 36GB of
that disk<br>
to a file that I could make available (e.g. on the Web) so that
somebody<br>
else could copy it to an equivalent disk and replicate the problem or I
could even<br>
send that disk to somebody who was serious about working on the problem
-<br>
assuming I could get security approval to do so.&nbsp; There wasn't much
relevant<br>
on that disk when the problem occurred.&nbsp; I'm about out of ideas for
working on it.<br><br>
Here's what fdisk (when viewed from an essentially identically
configured<br>
system which is of course working) says about that disk in case
anybody<br>
would like to know more details about its configuration when
considering<br>
the dd proposal above:<br><br>
[root@helpb ~]# fdisk /dev/sdb<br>
&nbsp;<br>
The number of cylinders for this disk is set to 4462.<br>
There is nothing wrong with that, but this is larger than 1024,<br>
and could in certain setups cause problems with:<br>
1) software that runs at boot time (e.g., old versions of LILO)<br>
2) booting and partitioning software from other OSs<br>
&nbsp;&nbsp; (e.g., DOS FDISK, OS/2 FDISK)<br>
&nbsp;<br>
Command (m for help): p<br>
&nbsp;<br>
Disk /dev/sdb: 36.7 GB, 36703918080 bytes<br>
255 heads, 63 sectors/track, 4462 cylinders<br>
Units = cylinders of 16065 * 512 = 8225280 bytes<br>
&nbsp;<br>
&nbsp;&nbsp; Device Boot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Start&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
End&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Blocks&nbsp;&nbsp; Id&nbsp; System<br>
/dev/sdb1&nbsp;&nbsp;
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
131&nbsp;&nbsp;&nbsp;&nbsp; 1052226&nbsp;&nbsp; fd&nbsp; Linux raid
autodetect<br>
/dev/sdb2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
132&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4462&nbsp;&nbsp;&nbsp;
34788757+&nbsp; fd&nbsp; Linux raid autodetect<br>
&nbsp;<br>
Command (m for help): q<br>
&nbsp;<br>
[root@helpb ~]# <br><br>
When you refer to filing &quot;reproducible test cases in the relevant
bug database&quot;,<br>
what do you suggest I do in this case?&nbsp; My experience with such bug
databases<br>
has been poor.&nbsp; To me they have mostly looked like black holes -
though I admit<br>
that's with a small number of experiences (~5) and there are some
exceptions<br>
(e.g. Sun Microsystems seems to follow up pretty well).&nbsp; Still, I
don't consider it<br>
a good use of my time or particularly useful for LVM.<br><br>
The basic problem is, How do I get at that logical volume file system to
work<br>
on it - e.g. to recover it?<br><br>
<br>
The other apparent LVM failure that I'm dealing with is a bit more
problematic<br>
to replicate.&nbsp; It's similar in some ways (the base partitioning of
/dev/sda and<br>
/dev/sdb are similar but on 146GB SCSI disks).&nbsp; It also has a
RAID-10 configuration<br>
(mentioned earlier in the sysinit bug) on four other disks.&nbsp;
However, the RAID-10<br>
just holds a data logical volume that the system can, in principle, come
up<br>
without.&nbsp; I think I need to do a bit more work on that system trying
to<br>
recover it before I send even more email about it.&nbsp; It's also a 64
bit system<br>
that might complicate things a bit.&nbsp; I was hoping to get lucky and
perhaps have<br>
somebody recognize it's symptoms:<br>
...<br>
4 logical volume(s) in volume group &quot;VolGroup00&quot; now
active<br>
ERROR: failed in exec of defaults<br>
ERROR: failed in exec of ext3<br>
mount: error 2 mounting none<br>
switchroot: mount failed: 23<br>
ERROR: ext3 exited abnormally! (pid 284)<br>
...&nbsp; &lt;three more similar to the above&gt;<br>
kernel panic - not syncing: Attempted to kill init!<br><br>
and have some ideas on routes to pursue to try to recover that<br>
system.&nbsp; Again it is a test system, but if I can't recover
problems<br>
with test systems I certainly don't want to run the same LVM<br>
software in our production systems.<br><br>
I consider myself lucky to have run into such problems while<br>
testing.&nbsp; I sent my initial message partly in the hope somebody<br>
might have ideas I could use to try to recover these systems and<br>
partly to share my experiences so others might better be able to<br>
evaluate whether they want to go use LVM on their production<br>
systems.<br>
<x-sigsep><p></x-sigsep>
--Jed
<a href="http://www.nersc.gov/~jed/" eudora="autourl">
http://www.nersc.gov/~jed/</a></body>
</html>

--=====================_804762875==.ALT--
