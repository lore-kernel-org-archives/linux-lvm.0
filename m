Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6DHG2PD026325
	for <linux-lvm@redhat.com>; Thu, 13 Jul 2006 13:16:02 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k6DHFtb0031968
	for <linux-lvm@redhat.com>; Thu, 13 Jul 2006 13:15:56 -0400
Date: Thu, 13 Jul 2006 19:15:54 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] SAN setup with host mirrored disks
Message-ID: <20060713171554.GB13821@percy.comedia.it>
References: <7CA7BBF7F95AA245ACAB8E28A6285EB905191D94@s01edv50.warema.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7CA7BBF7F95AA245ACAB8E28A6285EB905191D94@s01edv50.warema.de>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Thu, Jul 13, 2006 at 12:04:01AM +0200, Fiederling, Daniel wrote:
>Hi,
>
>I'm relatively new to SAN setup with linux boxes, so maybe this is a
>very easy question. Today I set up a linux box with two qlogic hbas,
>each one is connected to a EMC Clarion. So I got two disks (/dev/sda and
>/dev/sdb) from my storages that I have to mirror on the host system.
>There is on mirror set up in the san environment!
>
>How can I set up mirroring of the two disks if I want to use lvm for the
>ease of later disk expansion? If I use raidtools (md-stuff) will it be
do not use raidtools, it is an obsolete tool. use mdadm if you want md.

>possible to expand the two disks and the logical disk without data loss?
yes

>What are the needed steps if I have to increase the disk space? First
>expand the md devices through raidreconf and then expand the volume

you can use a recent mdadm with the --grow option instead of raidreconf

another option is to create and additional lun instead of enlarging the
current one, lvm will handle a vg on multiple pvs just fine.

>Is it possible to use lvm for mirroring physical volumes? If this is
>possible I expect that this will be the better solution.

recent lvm2 support mirroring of logical volumes, so you could use this
instead.
it is a relatively new feature and i did not test it personally, so
maybe someone else on the list can give you more feedback.

Regards,
L.


-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
