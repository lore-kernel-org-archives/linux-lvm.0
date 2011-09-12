Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p8C3FIU4027416
	for <linux-lvm@redhat.com>; Sun, 11 Sep 2011 23:15:18 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p8C3FE1r008447
	for <linux-lvm@redhat.com>; Sun, 11 Sep 2011 23:15:14 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id p8C3Es0f002425
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Sun, 11 Sep 2011 23:14:54 -0400
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id p8C3Eo89005860
	for <linux-lvm@redhat.com>; Sun, 11 Sep 2011 23:14:53 -0400
Date: Sun, 11 Sep 2011 23:14:50 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <alpine.LRH.2.00.1109112258290.5505@bmsred.bmsi.com>
Message-ID: <alpine.LRH.2.00.1109112310400.5744@bmsred.bmsi.com>
References: <4E6D5600.4060008@tlinx.org>
	<alpine.LRH.2.00.1109112258290.5505@bmsred.bmsi.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] more vg problems or oddities...not using dmsetup
 remove seems to be bad?
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sun, 11 Sep 2011, Stuart D. Gathman wrote:

> On Sun, 11 Sep 2011, Linda A. Walsh wrote:
>
>> tried -- merging it...
>
> Ooops.  You likely did not want that.  That reverts the origin volume
> to the snapshot by copying the original data for updated sectors from
> the snapshot.  This is an extremely useful feature, but *not* when
> you invoke it accidentally!

>> I'm wondering if I really want this 'merge' it wants to do...and if not, 
>> how do I abort it?
>
> If it is really delayed until boot (or close), then you have a chance to 
> abort
> it, but I don't know how.  I hope an expert answers.  Meanwhile, I'll
> peruse the man page to see if it talks about delayed merge.

The man page says:

   If both the origin and snapshot volume are not open the merge will start
   immediately.   Otherwise, the  merge  will start the first time either the
   origin or snap??? shot are activated and both are closed.  Merging a snapshot
   into an  origin that cannot be closed, for example a root filesystem, is
   deferred until the next time the origin volume is  activated.  When  merging
   starts, the resulting logical volume will have the origin's name, minor
   number and UUID.  While  the  merge  is  in progress,  reads  or  writes  to
   the origin appear as they were directed to the snapshot being merged.  When
   the merge finishes, the merged snapshot is removed.  Multiple snapshots may
   be specified on the commandline or a @tag may be used to specify multi??? ple
   snapshots be merged to their respective origin.

If you have space, I would copy your origin LV while you can.  There is
nothing about cancelling the merge.  I suspect you could restore the metadata
backup from before your merge.  But make backups first!

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
