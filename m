Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l93J6npx013319
	for <linux-lvm@redhat.com>; Wed, 3 Oct 2007 15:06:49 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l93J6mP1008468
	for <linux-lvm@redhat.com>; Wed, 3 Oct 2007 15:06:48 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id l93J6h0i027598
	for <linux-lvm@redhat.com>; Wed, 3 Oct 2007 15:06:43 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.5) with ESMTP id l93J6g4G029420
	for <linux-lvm@redhat.com>; Wed, 3 Oct 2007 15:06:43 -0400
Date: Wed, 3 Oct 2007 15:06:42 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Message-ID: <Pine.LNX.4.44.0710031449370.29351-100000@bmsred.bmsi.com>
MIME-Version: 1.0
Subject: [linux-lvm] Poison pills
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I have an old server with a VG named "rootvg".  (AIX roots showing.) I
just bought a new server, and it now has a volume group named "rootvg".
I plan to remove the disk from the old server, put it in a USB enclosure, 
and put it on the new server to access old files and use for backup.

To be safe, I will rename the volume grouip on the old machine first.  But 
I'm curious.  What would happen if I connected the PV with a duplicate VG 
name?  The VGIDs will be different, so hopefully the system will keep them 
separate somehow.  Will it refuse to activate the hot plugged VG because 
of the differing VGID?  Will it let me rename it without activating?

That brings up the subject of "poison pills".  Suppose I added a PV with a 
matching VGID?  That was created maliciously to mess up my system, or is 
just an old PV that I disconnected from the VG (before the vgreduce) that 
I forgot about.  Is this a poison pill?  It would have a unique PVID that 
is not listed in the metadata for the existing VG, but how does the system 
know which metadata to believe?  AIX used a "quorum" voting system to 
prevent accidental poison pills.  What happens in linux LVM?  If it sees 
two conflicting metadatas for the same VGID, what happens?

I think an inexpensive torture test of this logic is to get 3 or 4 external USB
drives, put them all in a VG, and start playing games with hotplugging them.
(E.g. unplug drive, vgreduce, plug drive back in).

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
