Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l6JEiIe5024240
	for <linux-lvm@redhat.com>; Thu, 19 Jul 2007 10:44:19 -0400
Received: from webmail.icp-qv1-irony3.iinet.net.au
	(webmail.icp-qv1-irony3.iinet.net.au [203.59.1.108])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l6JEiF5X003462
	for <linux-lvm@redhat.com>; Thu, 19 Jul 2007 10:44:16 -0400
Message-ID: <469F78BD.9030908@iinet.net.au>
Date: Fri, 20 Jul 2007 00:44:13 +1000
From: David Timms <dtimms@iinet.net.au>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm fails trying to expand an LV into available space
	in VG.
References: <469684EE.3030405@iinet.net.au>
	<46968AA5.40703@redhat.com>	<469F62C2.4080709@iinet.net.au>
	<469F6C41.3070601@redhat.com>
In-Reply-To: <469F6C41.3070601@redhat.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Bryn M. Reeves wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> David Timms wrote:
>> James Parsons wrote:
>>> Hi - I'm the s-c-lvm guy; this will take a bit to digest. Just wanted
>>> to let you know you were heard.
>>> Yes, 3 minutes to scan for state seems a bit abnormal :)  
>> Actually, its more like 5-6 minutes (I get bored waiting and start doing
>> other stuff). During boot up it takes about 8 seconds to activate the
>> lvm volumes.
> 
> Nothing to do with the s-c-lvm problem, but these times sound perfectly
> normal if you have a metadata area on each of the 25 PVs in the volume
> group.
> 
> By default, pvcreate will set each PV up with a single metadata area
> (MDA). This is fine for small volume groups but will kill tool
> performance for volume groups with large numbers of PVs since the
> runtime grows as something like N^3 in the number of metadata areas.
Hmmn, sounds like a good addition for the howto / FAQ !

I wonder if system-config-lvm has any tests for subprocesses taking to 
long, that might cause it to time before the process finishes ?

If the many of the existing pv assigned to the vg are full {0 bytes 
free}, could it cause the resizing of the lvm to fail due to no space to 
put more metadata ?

> Note that it's only tool performance that suffers - I/O performance is
> not affected.
> 
> You can prevent this by creating most of the PVs in such a VG with the
> option "--metadatacopies=0" on the pvcreate command line. Create a small
> number with either "--metadatacopies=1" (or just use the default - it's
> 1 anyway) and you should find the time to scan/activate the VG is much
> shorter.
Does value 1 means the original plus 1 copy, or only 1 copy total ?

...
> Now recreate all the PVs except those that you want to contain metadata
> with their original UUIDs and the --restorefile and --metadatacopies=0
> flags:
> 
> # pvcreate --uuid=$UUID --restorefile=/etc/lvm/backup/<VolGroup>
> - --metadatacopies=0 /dev/$DEVICE
Does this keep or trash the filesystem {ext3} within the lv that takes 
of most of this vg ?

Can I actually recreate the PVs without losing data ?

> Next create the metadata-holding PVs:
> 
...
> The last time I had to do this was on a VG with 100 PVs,
Had you created 100PV's during development / testing, or was that a live 
system ? How long did the scan take ?

> I used a script
> that parsed the output of pvs to automate all this stuff. Drop me a line
> off-list if you're interested & I'll see if I can pull it up.
Will do, hopefully it means finger errors wont trash the data.

Thanks, DavidT
