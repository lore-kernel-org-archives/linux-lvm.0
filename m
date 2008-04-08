Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m38BEl5V003685
	for <linux-lvm@redhat.com>; Tue, 8 Apr 2008 07:14:47 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m38BEalp005000
	for <linux-lvm@redhat.com>; Tue, 8 Apr 2008 07:14:37 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id m38BEVNR004921
	for <linux-lvm@redhat.com>; Tue, 8 Apr 2008 07:14:31 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.6) with ESMTP id m38BEVam023756
	for <linux-lvm@redhat.com>; Tue, 8 Apr 2008 07:14:31 -0400
Date: Tue, 8 Apr 2008 07:14:31 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] LVM mirroring questions...
In-Reply-To: <69649d440804080214v706eedf3m50e443182a1827ae@mail.gmail.com>
Message-ID: <Pine.LNX.4.44.0804080710220.23698-100000@bmsred.bmsi.com>
MIME-Version: 1.0
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 8 Apr 2008, Jess Bromley wrote:

> I've got a situation where I want to mirror only a partition of a
> physical disk on to that of another physical disk, not the whole disk;
> so software/hardware RAID isn't an option.

That is exactly what software RAID does for you - mirrors a partition.
LVM mirroring allows you to mirror a logical volume.

Here is an example status of partitions mirrored via software raid1:

$ cat /proc/mdstat
Personalities : [raid1] 
read_ahead 1024 sectors
md0 : active raid1 hda3[0] hdc3[1]
      530048 blocks [2/2] [UU]
      
md2 : active raid1 hda5[0] hdc2[1]
      18916032 blocks [2/2] [UU]
      
md1 : active raid1 hda2[0] hdc1[1]
      24000 blocks [2/2] [UU]
      
unused devices: <none>

You then make PVs on the mds if you want LVM.  For example (another system):

# pvs
  PV         VG      Fmt  Attr PSize   PFree  
  /dev/md2   rootvg  lvm2 a-    36.19G  15.69G
  /dev/md3   rootvg  lvm2 a-    55.88G   2.00G
  /dev/md4   rootvg  lvm2 a-    55.88G   6.50G
  /dev/md5   rootvg  lvm2 a-    83.81G  23.81G

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
