Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lBCEw0nq023060
	for <linux-lvm@redhat.com>; Wed, 12 Dec 2007 09:58:00 -0500
Received: from rv-out-0910.google.com (rv-out-0910.google.com [209.85.198.186])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lBCEvdna001212
	for <linux-lvm@redhat.com>; Wed, 12 Dec 2007 09:57:40 -0500
Received: by rv-out-0910.google.com with SMTP id k15so236147rvb.51
	for <linux-lvm@redhat.com>; Wed, 12 Dec 2007 06:57:39 -0800 (PST)
Message-ID: <5485940d0712120657t54d848a0l5f40bdc209ce2d6a@mail.gmail.com>
Date: Wed, 12 Dec 2007 14:57:39 +0000
From: "C'est Pierre" <cestpierre@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_28025_33150378.1197471459550"
Subject: [linux-lvm] Inconsistent VG
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

------=_Part_28025_33150378.1197471459550
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello everyone,

We're facing a curious inconsistency problem. From our checks, we've
concluded that vgdw2 metadata doesn't include lvol4, however, it exists,
it's created and it's mountable, altho, an lvdisplay on it fails and a
vgdisplay doesn't show it either.

  WARNING: Volume group "vgdw2" inconsistent
  --- Volume group ---
  VG Name               vgdw2
  System ID
  Format                lvm2
  Metadata Areas        25
  Metadata Sequence No  166
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                16
  Open LV               16
  Max PV                0
  Cur PV                24
  Act PV                24
  VG Size               1.84 TB
  PE Size               4.00 MB
  Total PE              483048
  Alloc PE / Size       465150 / 1.77 TB
  Free  PE / Size       17898 / 69.91 GB
  VG UUID               GTMKwf-S9Ma-34DN-9lxx-8qzb-3uML-8KxjJH

Does someone have any guesses?
Aside from that, we've checked from the lvm/archive/vgdw2_* files. The
recent-most, doesn't include lvol4. We've managed to pull the "lvol4 { }"
part from an older file and confirmed all pv's in the segment definitions
existed in the destination, but it didn't help either.


Thanks,
Pierre

------=_Part_28025_33150378.1197471459550
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello everyone,<br><br>We&#39;re facing a curious inconsistency problem. From our checks, we&#39;ve concluded that vgdw2 metadata doesn&#39;t include lvol4, however, it exists, it&#39;s created and it&#39;s mountable, altho, an lvdisplay on it fails and a vgdisplay doesn&#39;t show it either.
<br><br>&nbsp; WARNING: Volume group &quot;vgdw2&quot; inconsistent<br>&nbsp; --- Volume group ---<br>&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vgdw2<br>&nbsp; System ID<br>&nbsp; Format&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lvm2<br>&nbsp; Metadata Areas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 25<br>&nbsp; Metadata Sequence No&nbsp; 166
<br>&nbsp; VG Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write<br>&nbsp; VG Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; resizable<br>&nbsp; MAX LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>&nbsp; Cur LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 16<br>&nbsp; Open LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 16<br>&nbsp; Max PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>&nbsp; Cur PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 24
<br>&nbsp; Act PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 24<br>&nbsp; VG Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.84 TB<br>&nbsp; PE Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4.00 MB<br>&nbsp; Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 483048<br>&nbsp; Alloc PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 465150 / 1.77 TB<br>&nbsp; Free&nbsp; PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 17898 / 69.91 GB
<br>&nbsp; VG UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GTMKwf-S9Ma-34DN-9lxx-8qzb-3uML-8KxjJH<br><br>Does someone have any guesses?<br>Aside from that, we&#39;ve checked from the lvm/archive/vgdw2_* files. The recent-most, doesn&#39;t include lvol4. We&#39;ve managed to pull the &quot;lvol4 { }&quot; part from an older file and confirmed all pv&#39;s in the segment definitions existed in the destination, but it didn&#39;t help either. 
<br><br><br>Thanks,<br>Pierre<br><br><br>

------=_Part_28025_33150378.1197471459550--
