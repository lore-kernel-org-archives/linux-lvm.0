Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m42245pX029054
	for <linux-lvm@redhat.com>; Thu, 1 May 2008 22:04:05 -0400
Received: from vms048pub.verizon.net (vms048pub.verizon.net [206.46.252.48])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m4223l1j002254
	for <linux-lvm@redhat.com>; Thu, 1 May 2008 22:03:53 -0400
Received: from [192.168.2.102] ([72.91.189.24])
	by vms048.mailsrvcs.net (Sun Java System Messaging Server 6.2-6.01
	(built Apr
	3 2006)) with ESMTPA id <0K0700L33XPQF5S0@vms048.mailsrvcs.net> for
	linux-lvm@redhat.com; Thu, 01 May 2008 21:03:27 -0500 (CDT)
Date: Thu, 01 May 2008 22:03:26 -0400
From: Gerry Reno <greno@verizon.net>
Subject: Re: [linux-lvm] F7 will not boot after running backup w/snapshot
In-reply-to: <Pine.LNX.4.44.0805012041160.26700-100000@bmsred.bmsi.com>
Message-id: <481A766E.1060001@verizon.net>
MIME-version: 1.0
Content-type: multipart/alternative;
	boundary=------------090608080008000002040605
References: <Pine.LNX.4.44.0805012041160.26700-100000@bmsred.bmsi.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.
--------------090608080008000002040605
Content-Type: text/plain; charset=US-ASCII; format=flowed
Content-Transfer-Encoding: 7bit

Stuart D. Gathman wrote:
> ZZZZOn Thu, 1 May 2008, Charles Marcus wrote:
>
>   
>> In Gerry's scenario here, if the snapshot volume had NOT been on a ram 
>> disk, would he have had the problem he had or not?
>>     
>
> Here is the snip from Fedora/RHEL for activating the VG containing
> the root filesystem (note: kernel modules and lvm command are contained in
> initrd filesystem, and do not depend on /lib/modules/...):
>
> ...
> echo "Loading dm-mod.ko module"
> insmod /lib/dm-mod.ko
> echo "Loading dm-mirror.ko module"
> insmod /lib/dm-mirror.ko
> echo "Loading dm-zero.ko module"
> insmod /lib/dm-zero.ko
> echo "Loading dm-snapshot.ko module"
> insmod /lib/dm-snapshot.ko
> echo Making device-mapper control node
> mkdmnod
> mkblkdevs
> echo Scanning logical volumes
> lvm vgscan --ignorelockingfailure
>   
So right ^^^here^^^ is where we need to test if old snapshot was 
read-only or read-write (how to do that? grep vgdisplay -v for some value?)
So maybe something like this?:

set removemissing flag false
if old snapshot is the only PV missing:
--if old snapshot was read-write:
------stop boot sequence
------show user some info about old snapshot
------prompt whether to remove the old snapshot from the VG so it can be 
activated
------if response yes:
----------set removemissing flag true
------else
----------alert user that manual action is required to correct problem 
related to old snapshot before VG can be activated
----------abort boot
--elsif old snapshot was read-only:
------set removemissing flag true
if removemissing flag true:
----vgreduce --removemissing VG PV(old snapshot)

Gerry

> echo Activating logical volumes
> lvm vgchange -ay --ignorelockingfailure  rootvg
> ...
>
> This will fail if any of the physical volumes are missing.  More logic
> in initrd is required to boot with missing PVs.
>
> So yes, a ram disk is guaranteed to be missing on reboot, and thus to 
> fail in the RH/Fedora distros.  There is no problem taking snapshots
> of the root fs otherwise.  If there is a robust way to reduce 
> missing PVs automagically in the above script from initrd, Fedora could
> use the contribution.
>
>   


--------------090608080008000002040605
Content-Type: text/html; charset=US-ASCII
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content="text/html;charset=US-ASCII" http-equiv="Content-Type">
</head>
<body bgcolor="#ffffff" text="#000000">
Stuart D. Gathman wrote:
<blockquote
 cite="midPine.LNX.4.44.0805012041160.26700-100000@bmsred.bmsi.com"
 type="cite">
  <pre wrap="">ZZZZOn Thu, 1 May 2008, Charles Marcus wrote:

  </pre>
  <blockquote type="cite">
    <pre wrap="">In Gerry's scenario here, if the snapshot volume had NOT been on a ram 
disk, would he have had the problem he had or not?
    </pre>
  </blockquote>
  <pre wrap=""><!---->
Here is the snip from Fedora/RHEL for activating the VG containing
the root filesystem (note: kernel modules and lvm command are contained in
initrd filesystem, and do not depend on /lib/modules/...):

...
echo "Loading dm-mod.ko module"
insmod /lib/dm-mod.ko
echo "Loading dm-mirror.ko module"
insmod /lib/dm-mirror.ko
echo "Loading dm-zero.ko module"
insmod /lib/dm-zero.ko
echo "Loading dm-snapshot.ko module"
insmod /lib/dm-snapshot.ko
echo Making device-mapper control node
mkdmnod
mkblkdevs
echo Scanning logical volumes
lvm vgscan --ignorelockingfailure
  </pre>
</blockquote>
So right ^^^here^^^ is where we need to test if old snapshot was
read-only or read-write (how to do that? grep vgdisplay -v for some
value?)<br>
So maybe something like this?:<br>
<br>
set removemissing flag false<br>
if old snapshot is the only PV missing:<br>
--if old snapshot was read-write:<br>
------stop boot sequence<br>
------show user some info about old snapshot<br>
------prompt whether to remove the old snapshot from the VG so it can
be activated<br>
------if response yes:<br>
----------set removemissing flag true<br>
------else <br>
----------alert user that manual action is required to correct problem
related to old snapshot before VG can be activated<br>
----------abort boot<br>
--elsif old snapshot was read-only:<br>
------set removemissing flag true<br>
if removemissing flag true:<br>
----vgreduce --removemissing VG PV(old snapshot)<br>
<br>
Gerry<br>
<br>
<blockquote
 cite="midPine.LNX.4.44.0805012041160.26700-100000@bmsred.bmsi.com"
 type="cite">
  <pre wrap="">echo Activating logical volumes
lvm vgchange -ay --ignorelockingfailure  rootvg
...

This will fail if any of the physical volumes are missing.  More logic
in initrd is required to boot with missing PVs.

So yes, a ram disk is guaranteed to be missing on reboot, and thus to 
fail in the RH/Fedora distros.  There is no problem taking snapshots
of the root fs otherwise.  If there is a robust way to reduce 
missing PVs automagically in the above script from initrd, Fedora could
use the contribution.

  </pre>
</blockquote>
<br>
</body>
</html>

--------------090608080008000002040605--
