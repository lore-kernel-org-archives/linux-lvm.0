Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m62KIllQ022448
	for <linux-lvm@redhat.com>; Wed, 2 Jul 2008 16:18:47 -0400
Received: from fg-out-1718.google.com (fg-out-1718.google.com [72.14.220.158])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m62KIJ6E007637
	for <linux-lvm@redhat.com>; Wed, 2 Jul 2008 16:18:20 -0400
Received: by fg-out-1718.google.com with SMTP id e21so259149fga.7
	for <linux-lvm@redhat.com>; Wed, 02 Jul 2008 13:18:18 -0700 (PDT)
Message-ID: <1c748a490807021318l6761d917r27489e2de71c87c0@mail.gmail.com>
Date: Wed, 2 Jul 2008 13:18:18 -0700
From: "Larry Dickson" <ldickson@cuttedge.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_3226_16171243.1215029898764"
Subject: [linux-lvm] Is it possible to stripe part of a LV?
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

------=_Part_3226_16171243.1215029898764
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi all,

It says in Wikipedia that LVM can "Stripe whole or parts of logical volumes
across multiple PVs", but I haven't been able to find anything about how to
stripe part. What I want is a LV of which the first gigabyte is PV1 (a solid
state disk) and all the rest is striped across PV2 and PV3 (each several
terabytes). Is there any way to do this other than by creating VGA and
(striped) LVA out of PV2 and PV3 and then, in nested fashion, creating VGB
and (linear) LVB out of PV1 and PV(LVA)? What I would prefer is a VG out of
PV1, PV2, PV3, and then point the striping at PV2 and PV3 only.

TIA,

Larry Dickson
Cutting Edge Networked Storage

------=_Part_3226_16171243.1215029898764
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div>Hi all,</div>
<div>&nbsp;</div>
<div>It says in Wikipedia that LVM can &quot;Stripe whole or parts of logical volumes across multiple PVs&quot;, but I haven&#39;t been able to find anything about how to stripe part. What I want is a LV of which the first gigabyte is PV1 (a solid state disk) and all the rest is striped across PV2 and PV3 (each several terabytes). Is there any way to do this other than by creating VGA and (striped)&nbsp;LVA out of PV2 and PV3 and then,&nbsp;in nested fashion, creating&nbsp;VGB and (linear)&nbsp;LVB&nbsp;out of PV1 and PV(LVA)? What I would prefer is a VG out of PV1, PV2, PV3, and then point the striping at PV2 and PV3 only.</div>

<div>&nbsp;</div>
<div>TIA,</div>
<div>&nbsp;</div>
<div>Larry Dickson</div>
<div>Cutting Edge Networked Storage</div>

------=_Part_3226_16171243.1215029898764--
