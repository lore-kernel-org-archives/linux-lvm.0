Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o7BN21W5005612
	for <linux-lvm@redhat.com>; Wed, 11 Aug 2010 19:02:01 -0400
Received: from mail-wy0-f174.google.com (mail-wy0-f174.google.com
	[74.125.82.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o7BN1pl1022638
	for <linux-lvm@redhat.com>; Wed, 11 Aug 2010 19:01:51 -0400
Received: by wyb32 with SMTP id 32so925460wyb.33
	for <linux-lvm@redhat.com>; Wed, 11 Aug 2010 16:01:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.64.1008111831100.20515@bmsred.bmsi.com>
References: <AANLkTinnEDV-Vsx3LW9XirpDsN7mPyvphxeLsqYsSp0F@mail.gmail.com>
	<Pine.LNX.4.64.1008111831100.20515@bmsred.bmsi.com>
Date: Wed, 11 Aug 2010 18:01:50 -0500
Message-ID: <AANLkTimQgrEaG-eKZ23qFkxzdPAZ450gkTKiQH=pb+bt@mail.gmail.com>
From: Rahul Nabar <rpnabar@gmail.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: daksh@olemiss.edu

On Wed, Aug 11, 2010 at 5:40 PM, Stuart D. Gathman <stuart@bmsi.com> wrote:
> b) You are unclear on the concept. �Perhaps the explanation of how
> � it *could* be accomplished will illuminate. �Note especially the point
> � in step 1 - "the map is filesystem dependent".

What's still unclear to me is understanding why LVM decided to use
fully the first three PV's and then after that only partially the last
three PV's. Although it could have continued to use PV4 fully as well
and then partially PV5 and keep PV6 totally empty. (My total LV size
is a little greater than 4PVs but less than 5PVs)

I assume the answer to this mystery lies in the "Allocation Policy".
[contiguous, cling, normal, anywhere or inherit ] Is there a way on a
running LVM to query what its allocation policy is? Alternately if the
person creating an LVM omits an explicit specification then what
allocation policy does LVM use by default?

-- 
Rahul
