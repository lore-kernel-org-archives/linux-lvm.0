Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o7BNvPQt013047
	for <linux-lvm@redhat.com>; Wed, 11 Aug 2010 19:57:25 -0400
Received: from e5.ny.us.ibm.com (e5.ny.us.ibm.com [32.97.182.145])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o7BNvGfd030826
	for <linux-lvm@redhat.com>; Wed, 11 Aug 2010 19:57:17 -0400
Received: from d01relay03.pok.ibm.com (d01relay03.pok.ibm.com [9.56.227.235])
	by e5.ny.us.ibm.com (8.14.4/8.13.1) with ESMTP id o7BNcJVj031511
	for <linux-lvm@redhat.com>; Wed, 11 Aug 2010 19:38:19 -0400
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
	by d01relay03.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	o7BNuvZX321778
	for <linux-lvm@redhat.com>; Wed, 11 Aug 2010 19:56:57 -0400
Received: from d01av02.pok.ibm.com (loopback [127.0.0.1])
	by d01av02.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	o7BNuvM5015935
	for <linux-lvm@redhat.com>; Wed, 11 Aug 2010 20:56:57 -0300
Received: from malahal (malahal.beaverton.ibm.com [9.47.17.130])
	by d01av02.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	o7BNuubT015926
	for <linux-lvm@redhat.com>; Wed, 11 Aug 2010 20:56:57 -0300
Date: Wed, 11 Aug 2010 16:56:56 -0700
From: Malahal Naineni <malahal@us.ibm.com>
Message-ID: <20100811235656.GA1678@us.ibm.com>
References: <AANLkTinnEDV-Vsx3LW9XirpDsN7mPyvphxeLsqYsSp0F@mail.gmail.com>
	<Pine.LNX.4.64.1008111831100.20515@bmsred.bmsi.com>
	<AANLkTimQgrEaG-eKZ23qFkxzdPAZ450gkTKiQH=pb+bt@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AANLkTimQgrEaG-eKZ23qFkxzdPAZ450gkTKiQH=pb+bt@mail.gmail.com>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

Rahul Nabar [rpnabar@gmail.com] wrote:
> On Wed, Aug 11, 2010 at 5:40 PM, Stuart D. Gathman <stuart@bmsi.com> wrote:
> > b) You are unclear on the concept. �Perhaps the explanation of how
> > � it *could* be accomplished will illuminate. �Note especially the point
> > � in step 1 - "the map is filesystem dependent".
> 
> What's still unclear to me is understanding why LVM decided to use
> fully the first three PV's and then after that only partially the last
> three PV's. Although it could have continued to use PV4 fully as well
> and then partially PV5 and keep PV6 totally empty. (My total LV size
> is a little greater than 4PVs but less than 5PVs)
> 
> I assume the answer to this mystery lies in the "Allocation Policy".
> [contiguous, cling, normal, anywhere or inherit ] Is there a way on a
> running LVM to query what its allocation policy is? Alternately if the
> person creating an LVM omits an explicit specification then what
> allocation policy does LVM use by default?

It is 'normal' for VG and 'inherit' for an LV. See 'man lvm' command for
details. See 'man vgs' on how to get it. Allocation policy is part of vg
'Attr' field. Look for Attr value when you run 'vgs -o+attr'

Thanks, Malahal.
