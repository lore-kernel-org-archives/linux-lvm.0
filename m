Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id l6JDqe0l030365
	for <linux-lvm@redhat.com>; Thu, 19 Jul 2007 09:52:40 -0400
Message-ID: <469F6C41.3070601@redhat.com>
Date: Thu, 19 Jul 2007 14:50:57 +0100
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm fails trying to expand an LV into available space
	in VG.
References: <469684EE.3030405@iinet.net.au> <46968AA5.40703@redhat.com>
	<469F62C2.4080709@iinet.net.au>
In-Reply-To: <469F62C2.4080709@iinet.net.au>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

David Timms wrote:
> James Parsons wrote:
>> Hi - I'm the s-c-lvm guy; this will take a bit to digest. Just wanted
>> to let you know you were heard.
>> Yes, 3 minutes to scan for state seems a bit abnormal :)  
> Actually, its more like 5-6 minutes (I get bored waiting and start doing
> other stuff). During boot up it takes about 8 seconds to activate the
> lvm volumes.

Nothing to do with the s-c-lvm problem, but these times sound perfectly
normal if you have a metadata area on each of the 25 PVs in the volume
group.

By default, pvcreate will set each PV up with a single metadata area
(MDA). This is fine for small volume groups but will kill tool
performance for volume groups with large numbers of PVs since the
runtime grows as something like N^3 in the number of metadata areas.

Note that it's only tool performance that suffers - I/O performance is
not affected.

You can prevent this by creating most of the PVs in such a VG with the
option "--metadatacopies=0" on the pvcreate command line. Create a small
number with either "--metadatacopies=1" (or just use the default - it's
1 anyway) and you should find the time to scan/activate the VG is much
shorter.

It's possible to fix this in-place without destroying the VG but you
need to be a little careful; it'd be wise to back up anything important
first in case things don't work out.

First, deactivate all volumes in the group and backup the metadata:

# vgchange -an <VolGroup>
# vgcfgbackup <VolGroup>

Now recreate all the PVs except those that you want to contain metadata
with their original UUIDs and the --restorefile and --metadatacopies=0
flags:

# pvcreate --uuid=$UUID --restorefile=/etc/lvm/backup/<VolGroup>
- --metadatacopies=0 /dev/$DEVICE

Next create the metadata-holding PVs:

# pvcreate --uuid=$UUID --restorefile=/etc/lvm/backup/<VolGroup>
- --metadatacopies=1 /dev/$DEVICE

And finally restore the metadata:

# vgcfgrestore <VolGroup>

The last time I had to do this was on a VG with 100 PVs, I used a script
that parsed the output of pvs to automate all this stuff. Drop me a line
off-list if you're interested & I'll see if I can pull it up.

Kind regards,
Bryn.


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFGn2xB6YSQoMYUY94RAh3tAJ905BwCeRUNVYu0xWW5DWYpB+ZZGQCcC63Q
NmZcYlIAlcC3wRRdRNDUuoc=
=oqzc
-----END PGP SIGNATURE-----
