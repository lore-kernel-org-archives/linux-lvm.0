Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m4U842PG000514
	for <linux-lvm@redhat.com>; Fri, 30 May 2008 04:04:02 -0400
Received: from mail140.messagelabs.com (mail140.messagelabs.com
	[85.158.137.83])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m4U83l31022971
	for <linux-lvm@redhat.com>; Fri, 30 May 2008 04:03:48 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] Distributed LVM/filesystem/storage
Date: Fri, 30 May 2008 09:03:35 +0100
Message-ID: <A78DB34D00374344A0AB65B6523C05DC0304E8E1@marsden.win.datacash.com>
In-Reply-To: <20080529231213.GY19431@lug-owl.de>
References: <20080529231213.GY19431@lug-owl.de>
From: "Gerrard Geldenhuis" <Gerrard.Geldenhuis@datacash.com>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Maybe have a look at GFS.

Regards

> -----Original Message-----
> From: linux-lvm-bounces@redhat.com
[mailto:linux-lvm-bounces@redhat.com]
> On Behalf Of Jan-Benedict Glaw
> Sent: 30 May 2008 00:12
> To: linux-lvm@redhat.com
> Subject: [linux-lvm] Distributed LVM/filesystem/storage
> 
> Hi!
> 
> I'm just thinking about using my friend's overly empty harddisks for a
> common large filesystem by merging them all together into a single,
> large storage pool accessible by everybody.
> 
> However I still fail to find a good approach. One initial idea was to
> export all physical volumes (partitions or full disks) vie NBD, join
> them all on a single machine into one VG/LV, create a filesystem and
> re-export that via NFS/SMB/...  However, all data would need to go
> through the net twice. While speed isn't the most important thing here
> (but storage is!), that's way suboptimal.
> 
> I also thought about something like tahoe (www.allmydata.org), or
> other P2P based approaches like Freenet, but I'm not sure if that's a
> good start.
> 
> It would be nice to see if anybody of you did the same before (merging
> the free space from a lot computers into one commonly used large
> filesystem), if it was successful and what techniques
> (LVM/NBD/DM/MD/iSCSI/Tahoe/Freenet/Other P2P/...) you used to get
there,
> and how well that worked out in the end.
> 
> Thanks, JBG
> 
> --
>       Jan-Benedict Glaw      jbglaw@lug-owl.de              +49-172-
> 7608481
> Signature of:
> http://www.eyrie.org/~eagle/faqs/questions.html
> the second  :
