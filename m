Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m82IM7Vq006356
	for <linux-lvm@redhat.com>; Tue, 2 Sep 2008 14:22:07 -0400
Received: from scidubsmtp01.stercomm.com (scidubsmtp01.stercomm.com
	[209.95.244.35])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m82ILudA014940
	for <linux-lvm@redhat.com>; Tue, 2 Sep 2008 14:21:56 -0400
Received: from IWDUBCORMSG001.sci.local (iwdubcormsg001.sci.local
	[10.105.142.31])
	by boamail1.stercomm.com (Postfix) with ESMTP id DF33933FC8
	for <linux-lvm@redhat.com>; Tue,  2 Sep 2008 14:21:58 -0400 (EDT)
Subject: Re: [linux-lvm] can't remove /dev/sdd
From: Chris Cox <chris_cox@stercomm.com>
In-Reply-To: <14bab3630809021113g8805062he133c27bae762501@mail.gmail.com>
References: <14bab3630809021113g8805062he133c27bae762501@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Date: Tue, 02 Sep 2008 13:21:54 -0500
Message-Id: <1220379714.23050.28.camel@behemoth.csg.stercomm.com>
Mime-Version: 1.0
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

On Tue, 2008-09-02 at 14:13 -0400, qian chen wrote:
> Hello:
> I need help getting rid of /dev/sdd.
> I have tried vgreduce /dev/VolEmailNew /dev/sdd, vgreduce
> /dev/VolGroup00 /dev/sdd, vgreduce /dev/VolShared /dev/sdd.

You'll have to clear out the device mapper entry.

man dmsetup

There may be something else you have to do... can't recall.
I'm just saying this because I've had to do this before
with a SAN disk that changed/went away.

> 
> "
> /dev/dm-2: read failed after 0 of 4096 at 0: Input/output error
>   /dev/dm-3: read failed after 0 of 4096 at 0: Input/output error
>   /dev/sdd: read failed after 0 of 4096 at 0: Input/output error
>   Physical Volume "/dev/sdd" not found in Volume Group "VolGroup00"
> "
> Thanks for your help.
