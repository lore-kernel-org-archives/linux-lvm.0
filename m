Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6DHOan3028438
	for <linux-lvm@redhat.com>; Thu, 13 Jul 2006 13:24:36 -0400
Received: from shell.wgops.com (postfix@free.wgops.com [69.51.116.66])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6DHOZip002592
	for <linux-lvm@redhat.com>; Thu, 13 Jul 2006 13:24:35 -0400
Received: from [10.1.2.206] (localhost [127.0.0.1])
	by shell.wgops.com (Postfix) with ESMTP id 418C225642
	for <linux-lvm@redhat.com>; Thu, 13 Jul 2006 11:24:08 -0600 (MDT)
Date: Thu, 13 Jul 2006 11:24:08 -0600
From: Michael Loftis <mloftis@wgops.com>
Subject: Re: [linux-lvm] SAN setup with host mirrored disks
Message-ID: <ACF82DA558D73398BEAA7814@dhcp-2-206.wgops.com>
In-Reply-To: <7CA7BBF7F95AA245ACAB8E28A6285EB905191D94@s01edv50.warema.de>
References: <7CA7BBF7F95AA245ACAB8E28A6285EB905191D94@s01edv50.warema.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>



--On July 13, 2006 12:04:01 AM +0200 "Fiederling, Daniel" 
<daniel.fiederling@warema.de> wrote:

>
> Hi,
>
> I'm relatively new to SAN setup with linux boxes, so maybe this is a very
> easy question. Today I set up a linux box with two qlogic hbas, each one
> is connected to a EMC Clarion. So I got two disks (/dev/sda and /dev/sdb)
> from my storages that I have to mirror on the host system. There is on
> mirror set up in the san environment!

Uhhhmm...Clariion Can and does do RAID 0,1,5, as well as any combination of 
the three.  Depending on the model of Clariion and your specific setup (esp 
depending on if you're using powerpath or not) you'll see one or two 
'copies' of each LUN.

In fact I'd highly recomment using the Clariion to do all of your real RAID 
stuff, and if you can't use powerpath, then use md *just* for failover. 
You do not need MD for actual RAID with a Clariion.  Navisphere will allow 
you to configure mirrors of sets of drives.

>
> How can I set up mirroring of the two disks if I want to use lvm for the
> ease of later disk expansion? If I use raidtools (md-stuff) will it be
> possible to expand the two disks and the logical disk without data loss?
> What are the needed steps if I have to increase the disk space? First
> expand the md devices through raidreconf and then expand the volume group
> and file system? As far as I read the man pages raidreconf only works
> with raid 0 and 5. It seems to me as if I'm not on the right lane...
>
> Is it possible to use lvm for mirroring physical volumes? If this is
> possible I expect that this will be the better solution.
>
> Hope someone can tell me about his experiences with such an scenario.
>
> Ciao
> Daniel



--
"Genius might be described as a supreme capacity for getting its possessors
into trouble of all kinds."
-- Samuel Butler
