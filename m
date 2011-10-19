Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p9J0pcFf022691
	for <linux-lvm@redhat.com>; Tue, 18 Oct 2011 20:51:38 -0400
Received: from p02c11o141.mxlogic.net (p02c11o141.mxlogic.net [208.65.144.74])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p9J0pbDA004976
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 18 Oct 2011 20:51:37 -0400
From: Robert Gormley <rgormley@mgcare.com>
Date: Tue, 18 Oct 2011 17:51:37 -0700
Message-ID: <3389678474F1634EA260EC27A3C10968025C381E00A1@EXCHMBXSVR.corp.ad>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Attempting to salvage data from a PV on a damaged disk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

I had an issue where a mirror failed (due to some incorrect RAID configuration by an ex-employee). We had two 150GB disks supposedly in a mirror on RHEL5.

One of those disks had not been synced since February. Of course, that disk isn't the disk that failed, it was the "live" disk.

For reasons unbeknownst to me, backups don't exist (a horrible situation, but it is what I have to work with).

The system would not boot from the "live disk" due to what appears to be a minor (but not minor enough) disk failure (SMART and other tests pass, but I get some I/O errors before operations work).

The drive has been moved to another server (as attempts to work on this issue on the original server lead to LVM complaining about duplicate IDs - we actually solved this about 18 months ago successfully, but recollection on how to do so fails me right now. But it is an option).

So, that's the preamble. I'm left with a situation now:

# pvscan
  PV /dev/sdc2         lvm2 [139.63 GB]
  Total: 1 [139.63 GB] / in use: 0 [0   ] / in no VG: 1 [139.63 GB]

I want to be able to get to a point where I can mount the LV(s) on this PV, so as to salvage the data.

Question: if I do a 'vgcreate tempvolgroup /dev/sdc2', is it going to be destructive to the LVs inside the PV?

If so, is there another way to attempt this?

Or... is there a different approach entirely that I should be looking at (disk recovery services are possible, though a last resort - and at this point I'm actually more concerned about preserving the PV/VG/LV structure to retrieve the data, rather than the raw sectors).

I do have access to the original machine which is booted with the "February drive", for access to /etc/lvm, should it help.

As I said, I do recall being able to resolve this by some uuid switching and swapping (so the OS/LVM didn't see /dev/sda2 and /dev/sdb2 as having the same UUID). If anyone can offer guidance on that, this can also be done.

TIA,
Robert
