Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l2FJdFN2013656
	for <linux-lvm@redhat.com>; Thu, 15 Mar 2007 15:39:16 -0400
Received: from smtp4-g19.free.fr (smtp4-g19.free.fr [212.27.42.30])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l2FJd9D7029302
	for <linux-lvm@redhat.com>; Thu, 15 Mar 2007 15:39:09 -0400
Received: from [192.168.0.1] (bon31-1-82-66-78-161.fbx.proxad.net
	[82.66.78.161])
	by smtp4-g19.free.fr (Postfix) with ESMTP id D648D676C8
	for <linux-lvm@redhat.com>; Thu, 15 Mar 2007 20:39:07 +0100 (CET)
Message-ID: <45F9A0DB.3050407@free.fr>
Date: Thu, 15 Mar 2007 20:39:07 +0100
From: Georges Giralt <georges.giralt@free.fr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Aftermath of a dead hard disk
References: <45F99BD3.3000204@gmail.com>
In-Reply-To: <45F99BD3.3000204@gmail.com>
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

Will May a �crit :
> I recently had a hard disk die on me that was in my LVM group and so had 
> to replace it with a new one. When I added the new hard disk into the 
> group, I didn't format it first and so LVM still thinks the new hard 
> disk (250GB) is the size of the old one (60GB). I'd like to convince LVM 
> of the new size. Anyone know how?
> 
> I've tried just formatting the hard disk, but that just causes LVM to 
> cry that it can't find the pv on the disk.
Hi !
Just in case, did you pvremove the failed disk ?
If not, unplug the new one, pvremove -f the old one
re-plug the new one,
pvcreate the new one
vgextend the vg.
and enjoy.
read the manpages carefully in order to avoid mistakes.
Hope this helps.
-- 
Ce message est constitu� d'au moins 50 % d'�lectrons recycl�s.
S'il vous pla�t, aidez nous � conserver nos ressources,
recyclez vos �lectrons !
