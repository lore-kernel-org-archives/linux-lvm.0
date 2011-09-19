Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p8J1DVWh016352
	for <linux-lvm@redhat.com>; Sun, 18 Sep 2011 21:13:31 -0400
Received: from www.bettercgi.com (www.bettercgi.com [74.122.122.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p8J1DPwM021961
	for <linux-lvm@redhat.com>; Sun, 18 Sep 2011 21:13:26 -0400
Received: from [10.0.2.103]
	(r74-192-17-33.bcstcmta01.clsttx.tl.dh.suddenlink.net [74.192.17.33])
	by www.bettercgi.com (Postfix) with ESMTPSA id 7CA9221512
	for <linux-lvm@redhat.com>; Sun, 18 Sep 2011 20:05:29 -0500 (CDT)
References: <4E75F91D.4000601@bsnw.nl>
In-Reply-To: <4E75F91D.4000601@bsnw.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: "adultsitesoftware@gmail.com" <support@bettercgi.com>
Date: Sun, 18 Sep 2011 20:13:09 -0500
Message-ID: <86306d8a-f268-4df9-bd0e-c700a2d2579c@email.android.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Without grepping the source for "pretending" I'd bet the reason the PV is 1MB smaller than the device is on is due to the 1MB used for metadata. You could recreate the PV with no metadata on it if you think that's what you did before.

However, are you 100% sure that you didn't previously use the RAID arryay as the PV? If you swapped the two layers, mdadm and lvm, that what cause exactly the sumption you are presenting - the PV being 1MB smaller than the RAID.

Gijs <info@bsnw.nl> wrote:

>Dear List,
>
>After I ran into some trouble with my raid setup, I managed to get it 
>online again, but somehow LVM won't activate the physical volume that 
>was on it. Well, to be exact, it will activate the PV, but not all the 
>LVs on it. It activates two of the three LVs.
>
>When I type in "lvchange -a y /dev/raid-5/data" to activate the 
>remaining LV, it returns the following errors:
>device-mapper: resume ioctl failed: Invalid argument Unable to resume 
>raid--5-data (253:2)
>
>Checking dmesg, it says the following:
>device-mapper: table: 253:2: md127 too small for target: 
>start=5897914368, len=1908400128, dev_size=7806312448
>
>I pretty much tried everything and as a last resort I typed in the 
>following:
>pvresize -v --setphysicalvolumesize 3996831973376B /dev/md127
>Where 3996831973376 is the exact amount of bytes available on the raid 
>array. However, this gave me the following info:
>Using physical volume(s) on command line
>Archiving volume group "raid-5" metadata (seqno 21).
>/dev/md127: Pretending size is 7806312448 not 7806314496 sectors.
>Resizing physical volume /dev/md127 from 952919 to 952918 extents.
>/dev/md127: cannot resize to 952918 extents as later ones are
>allocated.
>0 physical volume(s) resized / 1 physical volume(s) not resized
>
>Now I wonder why LVM wants to pretend it has more space than it
>actually 
>has. Because when I subtract those sectors from each other, and I 
>calculate how much bytes are in those "pretended sectors", it turns out
>
>that that's the exact amount that is missing (1MB).
>
>I'm running Fedora 15 from a rescue USB-stick at the moment, but the 
>system itself was formatted/configured under Fedora 14. Could that be 
>the cause of the problem? If not, what other options do I have to fix 
>this? (without loosing the data on the volume)
>
>Kind regards,
>
>Gijs
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 
Sent from my Android phone with K-9 Mail. Please excuse my brevity.
