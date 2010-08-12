Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o7C0MX1K019382
	for <linux-lvm@redhat.com>; Wed, 11 Aug 2010 20:22:33 -0400
Received: from mail-ww0-f46.google.com (mail-ww0-f46.google.com [74.125.82.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o7C0MKU9002970
	for <linux-lvm@redhat.com>; Wed, 11 Aug 2010 20:22:21 -0400
Received: by wwb18 with SMTP id 18so788194wwb.27
	for <linux-lvm@redhat.com>; Wed, 11 Aug 2010 17:22:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20100811235656.GA1678@us.ibm.com>
References: <AANLkTinnEDV-Vsx3LW9XirpDsN7mPyvphxeLsqYsSp0F@mail.gmail.com>
	<Pine.LNX.4.64.1008111831100.20515@bmsred.bmsi.com>
	<AANLkTimQgrEaG-eKZ23qFkxzdPAZ450gkTKiQH=pb+bt@mail.gmail.com>
	<20100811235656.GA1678@us.ibm.com>
Date: Wed, 11 Aug 2010 19:22:19 -0500
Message-ID: <AANLkTi=rOeVixFV6zD6uNZgLXh6zKR1oPBXDDHzNN9hE@mail.gmail.com>
From: Rahul Nabar <rpnabar@gmail.com>
Subject: Re: [linux-lvm] calculating free capacity from pvdisplay and
	lvdisplay
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Aug 11, 2010 at 6:56 PM, Malahal Naineni <malahal@us.ibm.com> wrote:
>
> It is 'normal' for VG and 'inherit' for an LV. See 'man lvm' command for
> details. See 'man vgs' on how to get it. Allocation policy is part of vg
> 'Attr' field. Look for Attr value when you run 'vgs -o+attr'

THanks! I do have "normal" allocation policy on the VG and all the
LV's inherit this.
But that just deepens the mystery. Why are my first 3 PV's showing
full and the others not?

[root@eustorage ~]# vgs
  VG                      #PV #LV #SN Attr   VSize VFree
  euclid_highperf_storage   6   3   0 wz--n- 9.80T 1.22T
[root@eustorage ~]# lvs
  LV         VG                      Attr   LSize   Origin Snap%  Move
Log Copy%  Convert
  LV_export  euclid_highperf_storage -wi-ao 600.00G
  LV_home    euclid_highperf_storage -wi-ao   6.00T
  LV_polhome euclid_highperf_storage -wi-ao   2.00T

-- 
Rahul
