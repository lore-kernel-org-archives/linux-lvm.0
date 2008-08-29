Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m7TKAtYh002744
	for <linux-lvm@redhat.com>; Fri, 29 Aug 2008 16:10:57 -0400
Received: from rv-out-0506.google.com (rv-out-0506.google.com [209.85.198.225])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m7TKAYog018697
	for <linux-lvm@redhat.com>; Fri, 29 Aug 2008 16:10:40 -0400
Received: by rv-out-0506.google.com with SMTP id f6so989593rvb.51
	for <linux-lvm@redhat.com>; Fri, 29 Aug 2008 13:10:33 -0700 (PDT)
Message-ID: <1c748a490808291310g274df331ifc76fce539b56954@mail.gmail.com>
Date: Fri, 29 Aug 2008 13:10:33 -0700
From: "Larry Dickson" <ldickson@cuttedge.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_16827_1206899.1220040633630"
Subject: [linux-lvm] 15 snapshot limit?
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

------=_Part_16827_1206899.1220040633630
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi all,

With a 768 GB logical volume in a 2235 GB volume group, and 4 GB of memory,
I try to set up lots of snapshots (of 45 or 50 GB each) and can't get past
15. Sometimes I'll succeed in generating more than 15 COWs in /dev/mapper,
but lvdisplay never shows more than 15 snapshots in the "LV snapshot status
source of" listing under the parent volume. I searched and found 15
snapshots mentioned in a couple places like
wiki.samba.org/index.php/Shadow_Copies_with_Snapshots - but nothing really
authoritative.

Is there really such a limit? Or is it a memory requirement - I seem to
remember so many MB memory per GB of storage, but can't find that either.
Versions are (variants of) lvm2-2.02.38, device-mapper-1.02.26,
kernel-smp-2.6.20 (64 bit).

TIA,

Larry Dickson
Cutting Edge Networked Storage

------=_Part_16827_1206899.1220040633630
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div>Hi all,</div>
<div>&nbsp;</div>
<div>With a 768 GB logical volume in a 2235 GB volume group, and 4 GB of memory, I try to set up lots of snapshots (of 45 or 50 GB each)&nbsp;and can&#39;t get past 15. Sometimes I&#39;ll succeed in generating more than 15 COWs in /dev/mapper, but lvdisplay never shows more than 15 snapshots in the &quot;LV snapshot status source of&quot; listing under the parent volume. I searched and found 15 snapshots mentioned in a couple places like <span class="a"><a href="http://wiki.samba.org/index.php/Shadow_Copies_with_Snapshots">wiki.samba.org/index.php/Shadow_Copies_with_Snapshots</a> - but nothing really authoritative.</span></div>

<div><span class="a"></span>&nbsp;</div>
<div><span class="a">Is there really such a limit? Or is it a memory requirement - I seem to remember so many MB memory per GB of storage, but can&#39;t find that either. Versions are (variants of)&nbsp;lvm2-2.02.38, device-mapper-1.02.26, kernel-smp-2.6.20 (64 bit).</span></div>

<div><span class="a"></span>&nbsp;</div>
<div><span class="a">TIA,</span></div>
<div><span class="a"></span>&nbsp;</div>
<div><span class="a">Larry Dickson</span></div>
<div><span class="a">Cutting Edge Networked Storage</span></div>

------=_Part_16827_1206899.1220040633630--
