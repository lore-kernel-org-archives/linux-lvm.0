Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p9J1Rosv031145
	for <linux-lvm@redhat.com>; Tue, 18 Oct 2011 21:27:50 -0400
Received: from www.bettercgi.com (www.bettercgi.com [74.122.122.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p9J1Rn7U013121
	for <linux-lvm@redhat.com>; Tue, 18 Oct 2011 21:27:49 -0400
Received: from localhost (r74-192-17-33.bcstcmta01.clsttx.tl.dh.suddenlink.net
	[74.192.17.33])
	by www.bettercgi.com (Postfix) with ESMTPA id 1AB3A2151D
	for <linux-lvm@redhat.com>; Tue, 18 Oct 2011 19:27:21 -0500 (CDT)
Date: Tue, 18 Oct 2011 20:27:45 -0500
From: Ray Morris <support@bettercgi.com>
Message-ID: <20111018202745.40776deb@bettercgi.com>
In-Reply-To: <3389678474F1634EA260EC27A3C10968025C381E00A1@EXCHMBXSVR.corp.ad>
References: <3389678474F1634EA260EC27A3C10968025C381E00A1@EXCHMBXSVR.corp.ad>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Attempting to salvage data from a PV on a damaged
 disk
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com


> Question: if I do a 'vgcreate tempvolgroup /dev/sdc2', is it going to
> be destructive to the LVs inside the PV?

Don't do that. Had the LVM structure changed since the "mirror" disk
last synced? If not, it should have the LVM metatadata, which can be 
restored, preferably to an image of the recent disk. Ideally, the 
only thing that would be done with the failed disk is to make an 
image of it on another drive. Then work with the image. dd_rescue
may be useful for making the image.
-- 
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php




On Tue, 18 Oct 2011 17:51:37 -0700
Robert Gormley <rgormley@mgcare.com> wrote:

> I had an issue where a mirror failed (due to some incorrect RAID
> configuration by an ex-employee). We had two 150GB disks supposedly
> in a mirror on RHEL5.
> 
> One of those disks had not been synced since February. Of course,
> that disk isn't the disk that failed, it was the "live" disk.
> 
> For reasons unbeknownst to me, backups don't exist (a horrible
> situation, but it is what I have to work with).
> 
> The system would not boot from the "live disk" due to what appears to
> be a minor (but not minor enough) disk failure (SMART and other tests
> pass, but I get some I/O errors before operations work).
> 
> The drive has been moved to another server (as attempts to work on
> this issue on the original server lead to LVM complaining about
> duplicate IDs - we actually solved this about 18 months ago
> successfully, but recollection on how to do so fails me right now.
> But it is an option).
> 
> So, that's the preamble. I'm left with a situation now:
> 
> # pvscan
>   PV /dev/sdc2         lvm2 [139.63 GB]
>   Total: 1 [139.63 GB] / in use: 0 [0   ] / in no VG: 1 [139.63 GB]
> 
> I want to be able to get to a point where I can mount the LV(s) on
> this PV, so as to salvage the data.
> 
> Question: if I do a 'vgcreate tempvolgroup /dev/sdc2', is it going to
> be destructive to the LVs inside the PV?
> 
> If so, is there another way to attempt this?
> 
> Or... is there a different approach entirely that I should be looking
> at (disk recovery services are possible, though a last resort - and
> at this point I'm actually more concerned about preserving the
> PV/VG/LV structure to retrieve the data, rather than the raw sectors).
> 
> I do have access to the original machine which is booted with the
> "February drive", for access to /etc/lvm, should it help.
> 
> As I said, I do recall being able to resolve this by some uuid
> switching and swapping (so the OS/LVM didn't see /dev/sda2
> and /dev/sdb2 as having the same UUID). If anyone can offer guidance
> on that, this can also be done.
> 
> TIA,
> Robert
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
