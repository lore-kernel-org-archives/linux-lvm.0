Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAF1RMr16038
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2004 20:27:22 -0500
Received: from mail.o2w.nl (postfix@mail.o2w.nl [213.227.141.209])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iAF1RB4v016873
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2004 20:27:16 -0500
Date: Mon, 15 Nov 2004 02:27:10 +0100
From: Jelle Herold <wires@defekt.nl>
Subject: Re: [linux-lvm] recover lost VG (VG data differs between PVs)
Message-ID: <20041115012710.GA23196@hotwire.nl>
References: <20041114225853.GB20425@hotwire.nl>
	<20041114232126.GH24229@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20041114232126.GH24229@agk.surrey.redhat.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sun, Nov 14, 2004 at 11:21:26PM +0000, Alasdair G Kergon wrote:
> >  VG data differs between PVs /dev/hde and /dev/hdf3
> >  Volume group "datavg" doesn't exist
>  
> So hde should be in the VG at the moment, but not hdf3?

Yes.

> Add a filter to lvm.conf so lvm only looks at hde.  Run
> vgscan and see check if things look OK eg vgcfgbackup and
> read the text backup file.  If things *are* OK like that,
> then pvremove hdf3, remove the filter & vgscan.

OK, I shall try that tomorrow. But a quick look at
vgdisplay -P -v shows:

 VG data differs between PVs /dev/hde and /dev/hdf3
 Partial mode. Incomplete volume groups will be activated read-only.
    Finding all volume groups
    Finding volume group "datavg"
  --- Volume group ---
  VG Name               datavg
  System ID             trigger1078793806
  Format                lvm1
  VG Access             read
  VG Status             resizable
  MAX LV                256
  Cur LV                1
  Open LV               0
  Max PV                256
  Cur PV                3
  Act PV                3
  VG Size               284.09 GB
  PE Size               32.00 MB
  Total PE              9091
  Alloc PE / Size       9091 / 284.09 GB
  Free  PE / Size       0 / 0   
  VG UUID               f49snm-PqWg-hfnp-Ms2k-dgyC-M72S-YqScuJ
   
  --- Logical volume ---
  LV Name                /dev/datavg/datalv
  VG Name                datavg
  LV UUID                000000-0000-0000-0000-0000-0000-000000
  LV Write Access        read/write
  LV Status              NOT available
  LV Size                284.09 GB
  Current LE             9091
  Segments               3
  Allocation             normal
  Read ahead sectors     1024
   
  --- Physical volumes ---
  PV Name               /dev/hde     
  PV UUID               ifxE7h-Z1c6-9mox-VYz5-XTFy-aBw2-vAkdk4
  PV Status             allocatable
  Total PE / Free PE    1831 / 0
   
  PV Name               /dev/hdg3     
  PV UUID               3AnIvc-DdzR-JqtO-hYkV-3vqw-4Qm0-FBKsCS
  PV Status             allocatable
  Total PE / Free PE    3580 / 0
   
  PV Name               /dev/hdh     
  PV UUID               oxjwHR-Cm3S-d0GZ-5LJy-xqa7-X4X6-RAzX02
  PV Status             allocatable
  Total PE / Free PE    3680 / 0

All PVs that should be in the VG are there (hdf3 was the one
I added (and removed again) later to move hde to).

So, *this* output looks OK to me as far as the PVs are
concerned, but I shall have a look at the text backup file
as you suggested. 

thanks for the help
Jelle.
