Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3S4ehQ7023866
	for <linux-lvm@redhat.com>; Mon, 28 Apr 2008 00:40:43 -0400
Received: from smtp4-g19.free.fr (smtp4-g19.free.fr [212.27.42.30])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3S4eVv8001549
	for <linux-lvm@redhat.com>; Mon, 28 Apr 2008 00:40:32 -0400
Received: from smtp4-g19.free.fr (localhost.localdomain [127.0.0.1])
	by smtp4-g19.free.fr (Postfix) with ESMTP id 974BB3EA0BA
	for <linux-lvm@redhat.com>; Mon, 28 Apr 2008 06:40:31 +0200 (CEST)
Received: from [192.168.1.2] (bon31-1-82-66-78-161.fbx.proxad.net
	[82.66.78.161])
	by smtp4-g19.free.fr (Postfix) with ESMTP id 6F86B3EA0B2
	for <linux-lvm@redhat.com>; Mon, 28 Apr 2008 06:40:31 +0200 (CEST)
Message-ID: <4815553F.5030806@free.fr>
Date: Mon, 28 Apr 2008 06:40:31 +0200
From: Georges Giralt <georges.giralt@free.fr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] How to move /usr from LVM back to non-LVM?
References: <4814E782.9080805@Media-Brokers.com>
In-Reply-To: <4814E782.9080805@Media-Brokers.com>
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Charles Marcus a �crit :
> Hello,
> 
> Ok, resizing my /var partition was without incident, so thanks much to 
> the replies I got for reassurance...
> 
> Now, I have another thing I'd like to do, but it is only incidentally 
> LVM related...
> 
> When this system was first set up - not by me - they put /home, /usr and 
> /var on LVM partitions.
> 
> I'm fine with /home and /var, but I'd like to put /usr back as part of 
> the / partition...
> 
> Has anyone ever done something like this before?
> 
> I'm thinking something along the lines of:
> 
> 1. Boot off of livecd
> 
> 2. mount /
> 
> 3. Mount /usr
> 
> 4. cp /usr to /usr2 on /
> 
> 5. umount /usr
> 
> 6. mv /usr2 /usr
> 
> ?
> 
> Thanks for any comments/suggestions/how-to pointers...
> 
Hi !
As file rights and protection are important on /usr,
Consider replacing #4 with :
(cd /usr && tar cf - . ) | (cd /usr2 && tar xpf -) as root
or if you prefer
still as root
dump 0uaf - /usr | (cd /usr2 && restore -rf -)
In this second way, you do not need to mount the original /usr (but in 
this case you've to give the device file to dump instead of /usr)
But some people will question the reason you will move from LVM to plain 
filesystem/partitioning....
-- 
Ce message est constitu� d'au moins 50 % d'�lectrons recycl�s.
S'il vous pla�t, aidez nous � conserver nos ressources,
recyclez vos �lectrons !
