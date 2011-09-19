Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p8JKfssm025617
	for <linux-lvm@redhat.com>; Mon, 19 Sep 2011 16:41:55 -0400
Received: from www.bettercgi.com (www.bettercgi.com [74.122.122.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p8JKfmJ5008380
	for <linux-lvm@redhat.com>; Mon, 19 Sep 2011 16:41:49 -0400
Received: from localhost (r74-192-17-33.bcstcmta01.clsttx.tl.dh.suddenlink.net
	[74.192.17.33])
	by www.bettercgi.com (Postfix) with ESMTPA id 18EB5214FC
	for <linux-lvm@redhat.com>; Mon, 19 Sep 2011 15:30:59 -0500 (CDT)
Date: Mon, 19 Sep 2011 15:41:41 -0500
From: Ray Morris <support@bettercgi.com>
Message-ID: <20110919154141.3ab847af@bettercgi.com>
In-Reply-To: <4E779C7F.9010507@bsnw.nl>
References: <4E75F91D.4000601@bsnw.nl>
	<8f3368df-7c8b-4741-b859-d10e3eb56a24@email.android.com>
	<4E777DED.4090302@bsnw.nl> <20110919134814.72bd8c3d@bettercgi.com>
	<4E779C7F.9010507@bsnw.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM pretends it has more space than it actually has
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
To: linux-lvm@redhat.com

First, if at all possible make a copy of the underlying block 
device using dd or dd_rescue. Very often the most severe damage 
is done during the attempt at recovery.

Then let's find the oldest back up copies on the LVM meta data to 
see if we can verify how things were set up when they were working.
This will find metadata over 50 days old:

find /etc/lvm/archive -mtime +50

mainly what we're looking for is to see if any mdadm RAID devices 
were used as PVs at some point.

Next try mdadm --assemble --readonly --assume-clean /dev/sdFOO to see 
if you can assemble an array using the lower level device (which is 
also marked as a PV right now). If it assembles, do:
pvdisplay -m /dev/md0 
to see if it's a PV, and check to see if it has a filesystem.

Based on the messages you got, it looks like /dev/md0 at one point 
was the PV, rather than being assembled from LVs.
-- 
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php




On Mon, 19 Sep 2011 21:48:15 +0200
Gijs <info@bsnw.nl> wrote:

> Ah like that. Ok, I can't imagine I typed such a command, but I guess
> I can never really know. But let's say I did, would it be possible to 
> somehow retrieve the data from that volume? By increasing the
> underlying raid-5 maybe? Or is it forever lost?
> 
> On 19-9-2011 20:48, Ray Morris wrote:
> > The symptoms you are presenting, the "missing" 1MB are similar
> > to if someone did this in the past:
> >
> > mdadm --create /dev/md1 /dev/sd[ab]1
> > pvcreate /dev/md1
> >
> > Then later someone did this:
> > mdadm --assemble /dev/md1 /dev/volgroup/firstLV
> >
> > The VG, or the reported size of the PV, is 1MB smaller than
> > the device the PV is on, due to the metadata. If the RAID array,
> > or rather any raid array, were created on /dev/sda1, for
> > example, but then later activated using /dev/volgroup/LV,
> > mdadm would report that the device was 1MB too small, which is
> > exactly the message you are getting.
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
