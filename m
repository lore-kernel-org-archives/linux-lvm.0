Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m040rBbq018411
	for <linux-lvm@redhat.com>; Thu, 3 Jan 2008 19:53:11 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m040qpVL005419
	for <linux-lvm@redhat.com>; Thu, 3 Jan 2008 19:52:51 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id m040qjSK010495
	for <linux-lvm@redhat.com>; Thu, 3 Jan 2008 19:52:45 -0500
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.6) with ESMTP id m040qjCf030276
	for <linux-lvm@redhat.com>; Thu, 3 Jan 2008 19:52:45 -0500
Date: Thu, 3 Jan 2008 19:52:45 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] How to 'copy' a volume?
In-Reply-To: <477D7E55.3050003@soe.ucsc.edu>
Message-ID: <Pine.LNX.4.44.0801031949260.29485-100000@bmsred.bmsi.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, 3 Jan 2008, Erich Weiler wrote:

> I know that LVM has the 'snapshot' capability.  But this doesn't look 
> like it's what I need, as I don't want my duplicate volume to have any 
> affiliation with the original at all.  I actually want to duplicate VM 
> to take up just as much space as the first and be completely independent 
> of any changes on the first.  Is there a way of achieving this?  Could I 
> maybe simply make sure the volume is unmounted and not in use, then copy 
> the /dev/mapper/myvolume file to something else?  I bet it's more 
> involved than that...  :)

That's all these is to it.  You can also take a snapshot first, then
copy the snapshot.  With a journalling filesystem (e.g. ext3), it will recover
the copy when mounted.  Caveat: if you are mounting by filesystem label
(LABEL=foo), then both the copy and the snapshot will have duplicate labels,
and the filesystem will refuse to mount.  Use e2label (for ext3) to change the
label of the copy.  If not mounting by label, the duplicates won't matter.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
