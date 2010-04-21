Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3L5gOad008390
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2010 01:42:24 -0400
Received: from maude.comedia.it (maude.comedia.it [77.93.254.181])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o3L5gCxo008320
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2010 01:42:13 -0400
Received: from localhost (localhost [127.0.0.1])
	by maude.comedia.it (Postfix) with ESMTP id 83E3886FDE
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2010 07:42:12 +0200 (CEST)
Received: from maude.comedia.it ([127.0.0.1])
	by localhost (maude.comedia.it [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id Q0Yox9zPUyB4 for <linux-lvm@redhat.com>;
	Wed, 21 Apr 2010 07:42:07 +0200 (CEST)
Date: Wed, 21 Apr 2010 07:42:07 +0200
From: Luca Berra <bluca@comedia.it>
Message-ID: <20100421054207.GB17339@maude.comedia.it>
References: <4BCE79B5.9070600@cajuninc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4BCE79B5.9070600@cajuninc.com>
Subject: Re: [linux-lvm] Migrating LVM
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Tue, Apr 20, 2010 at 11:06:13PM -0500, M.Lewis wrote:
>
> I'm building a new machine with RAID1+LVM2. I plan to migrate the data from 
> the old machine HD to the new machine.
>
> Is it better to make the new VG the same name as the existing VG on the old 
> box? Or should I make it different.
>
> Is there an easy way to do this that I've not yet found? I was thinking to 
> make the new VG the same name as the old, add the old drives to the machine 
> then pvmove the data.

You cannot pvmove between two different VGs
You cannot have two VGs with the same name

You could skip creating the new vg, vgextend the old vg on the new
raid1, then pvmove, but i don't know if you need to change any parameter
in the new vg.
Another option is file level copy or dd-ing the logical volume.

L.

-- 
Luca Berra -- bluca@comedia.it
         Communication Media & Services S.r.l.
  /"\
  \ /     ASCII RIBBON CAMPAIGN
   X        AGAINST HTML MAIL
  / \
