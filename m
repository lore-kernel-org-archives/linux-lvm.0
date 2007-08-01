Received: from [10.15.80.216] (dhcp80-216.msp.redhat.com [10.15.80.216])
	by pobox.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l71FHeg1006066
	for <linux-lvm@redhat.com>; Wed, 1 Aug 2007 11:17:41 -0400
Mime-Version: 1.0 (Apple Message framework v752.3)
In-Reply-To: <20070801072738.GA9466@dubh.id.au>
References: <20070801072738.GA9466@dubh.id.au>
Message-Id: <366C0458-4DED-43B6-B639-99252B03BAA3@redhat.com>
Content-Transfer-Encoding: 7bit
From: Jonathan Brassow <jbrassow@redhat.com>
Subject: Re: [linux-lvm] Missing logical volume
Date: Wed, 1 Aug 2007 10:14:28 -0500
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
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>


On Aug 1, 2007, at 2:27 AM, Nigel Duff wrote:

> We have since realised that one of the drives (/dev/sdd) isn't being
> recognised on boot. All other drives and partitions are shown  
> correctly in
> the output of pvscan.
>
> Would someone be able to please look at the information provided  
> and point
> me in the direction of a solution.

I think you need to figure out what happened to the missing disk.  If  
that's gone, so is your data.  Nothing you've described so far has  
given me reason to believe the drive shouldn't be there.  So, I'm  
assuming device failure...

If you can get that device to come back online, you can restore your  
original setup (vgcfgrestore).

  brassow
