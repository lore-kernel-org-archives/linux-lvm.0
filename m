Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o0CJGSMd001876
	for <linux-lvm@redhat.com>; Tue, 12 Jan 2010 14:16:28 -0500
Received: from e2.ny.us.ibm.com (e2.ny.us.ibm.com [32.97.182.142])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o0CJGCYn008825
	for <linux-lvm@redhat.com>; Tue, 12 Jan 2010 14:16:12 -0500
Received: from d01relay06.pok.ibm.com (d01relay06.pok.ibm.com [9.56.227.116])
	by e2.ny.us.ibm.com (8.14.3/8.13.1) with ESMTP id o0CJ6vcf024570
	for <linux-lvm@redhat.com>; Tue, 12 Jan 2010 14:06:57 -0500
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
	by d01relay06.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	o0CJGBrw204824
	for <linux-lvm@redhat.com>; Tue, 12 Jan 2010 14:16:11 -0500
Received: from d01av01.pok.ibm.com (loopback [127.0.0.1])
	by d01av01.pok.ibm.com (8.14.3/8.13.1/NCO v10.0 AVout) with ESMTP id
	o0CJGAdH010337
	for <linux-lvm@redhat.com>; Tue, 12 Jan 2010 14:16:10 -0500
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d01av01.pok.ibm.com (8.14.3/8.13.1/NCO v10.0 AVin) with ESMTP id
	o0CJGAU3010331
	for <linux-lvm@redhat.com>; Tue, 12 Jan 2010 14:16:10 -0500
Date: Tue, 12 Jan 2010 11:16:09 -0800
From: malahal@us.ibm.com
Message-ID: <20100112191609.GA28804@us.ibm.com>
References: <1263228858.2845.12.camel@pc7.dolda2000.com>
	<b74494e61001111026g29f01b4ei2fc339ff980edba7@mail.gmail.com>
	<1263268475.3246.1.camel@pc7.dolda2000.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1263268475.3246.1.camel@pc7.dolda2000.com>
Subject: Re: [linux-lvm] Removing a PV from a mirror
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
To: linux-lvm@redhat.com

Fredrik Tolf [fredrik@dolda2000.com] wrote:
> Oh, sorry; when I go back and read it, I realize that I was a bit
> unclear. :) The LV started working again once I reconnected the PV and
> rebooted again, so there's no damage done.
> 
> I'm still just wondering how to actually remove the PV from the mirror.

Since your PV is flakey (failing), probably the best way is to convert
the LV to linear first and then converting back to mirror with a new PV.

A failing PV should make the system convert to linear LV if you have
right software (works on RHEL based system). Or you can do the following
steps manually. First step may not be necessary, but it should not cause
any harm in your case.

0) Run vgcfgbackup to back up your LVM metadata. This is needed if
   something goes wrong. You have been warned. If you know, this data is
   already there in archives...
1) lvconvert --mirrorlog core <LV-name>
2) lvconvert -m0 <LV-name> <Failing-PV-name>
	Make sure this did remove the PV you wanted. If not, use
	vgcfgrestore to restore and ask for help...
3) Insert your new disk, create PV label on it, and add it to your VG
4) Run "lvconvert -m1 <LV-name> <New-PV-name>
5) If you need "disk" log, run another lvconvert to get disk log.

Hope this helps,
--Malahal.
