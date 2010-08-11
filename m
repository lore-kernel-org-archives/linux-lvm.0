Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o7BMeY1c032498
	for <linux-lvm@redhat.com>; Wed, 11 Aug 2010 18:40:34 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o7BMeORu020757
	for <linux-lvm@redhat.com>; Wed, 11 Aug 2010 18:40:24 -0400
Date: Wed, 11 Aug 2010 18:40:22 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <AANLkTinnEDV-Vsx3LW9XirpDsN7mPyvphxeLsqYsSp0F@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1008111831100.20515@bmsred.bmsi.com>
References: <AANLkTinnEDV-Vsx3LW9XirpDsN7mPyvphxeLsqYsSp0F@mail.gmail.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: daksh@olemiss.edu, LVM general discussion and development <linux-lvm@redhat.com>

On Wed, 11 Aug 2010, Daksh Chauhan wrote:

> This is interesting, and I understand your explaination Ray... But,
> how can I figure out how much data is on each PVs??

If by "data" you mean "allocated to LVs", then the free PPs for each PV tells 
you the answer.

But perhaps by "data" you mean "allocated to LVs *and* allocated to files
in the (arbitrary) filesystems on those LVs".

This would be difficult (and probably pointless).

1) Create a map for each LV of data blocks in use.  Obtaining this map is
   filesystem dependent, and very different for each filesystem type.

2) Use the LP->PV mapping for each LV to map in use filesystem blocks to PPs.

3) Count the PPs for each PV, and subtract from the total for each PV to get
   the total in use by files in each respective filesystem.

The whole point of LVM is that LVM knows *nothing* about the filesystems
that you put on the LVs.  You would not be asking the question unless:

a) You are coming from Sun ZFS, where the "LVM" *does* know about the
   filesystems.  (The drawback is that you can only ever use the ZFS
   filesystem.)

b) You are unclear on the concept.  Perhaps the explanation of how  
   it *could* be accomplished will illuminate.  Note especially the point
   in step 1 - "the map is filesystem dependent".

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
