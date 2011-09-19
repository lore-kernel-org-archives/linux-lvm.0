Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p8JImLPG005380
	for <linux-lvm@redhat.com>; Mon, 19 Sep 2011 14:48:21 -0400
Received: from www.bettercgi.com (www.bettercgi.com [74.122.122.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p8JImGwr020658
	for <linux-lvm@redhat.com>; Mon, 19 Sep 2011 14:48:16 -0400
Received: from localhost (r74-192-17-33.bcstcmta01.clsttx.tl.dh.suddenlink.net
	[74.192.17.33])
	by www.bettercgi.com (Postfix) with ESMTPA id E87C32169F
	for <linux-lvm@redhat.com>; Mon, 19 Sep 2011 13:37:45 -0500 (CDT)
Date: Mon, 19 Sep 2011 13:48:14 -0500
From: Ray Morris <support@bettercgi.com>
Message-ID: <20110919134814.72bd8c3d@bettercgi.com>
In-Reply-To: <4E777DED.4090302@bsnw.nl>
References: <4E75F91D.4000601@bsnw.nl>
	<8f3368df-7c8b-4741-b859-d10e3eb56a24@email.android.com>
	<4E777DED.4090302@bsnw.nl>
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

The symptoms you are presenting, the "missing" 1MB are similar 
to if someone did this in the past:

mdadm --create /dev/md1 /dev/sd[ab]1
pvcreate /dev/md1

Then later someone did this:
mdadm --assemble /dev/md1 /dev/volgroup/firstLV

The VG, or the reported size of the PV, is 1MB smaller than 
the device the PV is on, due to the metadata. If the RAID array,
or rather any raid array, were created on /dev/sda1, for 
example, but then later activated using /dev/volgroup/LV, 
mdadm would report that the device was 1MB too small, which is 
exactly the message you are getting.
-- 
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php




On Mon, 19 Sep 2011 19:37:49 +0200
Gijs <info@bsnw.nl> wrote:

> Thank you for your response, however I don't quite understand what
> you mean by activating them in reverse order. Activating the PV
> before the raid system should be impossible right? And shouldn't
> activating them in the right order solve the problem? Or am I missing
> something here?
> 
> On 19-9-2011 3:23, adultsitesoftware@gmail.com wrote:
> > The  PV is 1MB smaller than the device it's on due to the metadata.
> >
> > The symptoms you are presenting is exactly what would happen if
> > someone had previously set up the RAID and LVM in the typical
> > fashion, with LVM atop RAID, then you tried to activate them in
> > reverse order.
> >
> > If.you value your data, backup the block devices before proceeding.
> >
> > Gijs<info@bsnw.nl>  wrote:
> >
> >> Dear List,
> >>
> >> After I ran into some trouble with my raid setup, I managed to get
> >> it online again, but somehow LVM won't activate the physical
> >> volume that was on it. Well, to be exact, it will activate the PV,
> >> but not all the LVs on it. It activates two of the three LVs.
> >>
> >> When I type in "lvchange -a y /dev/raid-5/data" to activate the
> >> remaining LV, it returns the following errors:
> >> device-mapper: resume ioctl failed: Invalid argument Unable to
> >> resume raid--5-data (253:2)
> >>
> >> Checking dmesg, it says the following:
> >> device-mapper: table: 253:2: md127 too small for target:
> >> start=5897914368, len=1908400128, dev_size=7806312448
> >>
> >> I pretty much tried everything and as a last resort I typed in the
> >> following:
> >> pvresize -v --setphysicalvolumesize 3996831973376B /dev/md127
> >> Where 3996831973376 is the exact amount of bytes available on the
> >> raid array. However, this gave me the following info:
> >> Using physical volume(s) on command line
> >> Archiving volume group "raid-5" metadata (seqno 21).
> >> /dev/md127: Pretending size is 7806312448 not 7806314496 sectors.
> >> Resizing physical volume /dev/md127 from 952919 to 952918 extents.
> >> /dev/md127: cannot resize to 952918 extents as later ones are
> >> allocated.
> >> 0 physical volume(s) resized / 1 physical volume(s) not resized
> >>
> >> Now I wonder why LVM wants to pretend it has more space than it
> >> actually
> >> has. Because when I subtract those sectors from each other, and I
> >> calculate how much bytes are in those "pretended sectors", it
> >> turns out
> >>
> >> that that's the exact amount that is missing (1MB).
> >>
> >> I'm running Fedora 15 from a rescue USB-stick at the moment, but
> >> the system itself was formatted/configured under Fedora 14. Could
> >> that be the cause of the problem? If not, what other options do I
> >> have to fix this? (without loosing the data on the volume)
> >>
> >> Kind regards,
> >>
> >> Gijs
> >>
> >> _______________________________________________
> >> linux-lvm mailing list
> >> linux-lvm@redhat.com
> >> https://www.redhat.com/mailman/listinfo/linux-lvm
> >> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
