Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3EFdIn9019148
	for <linux-lvm@redhat.com>; Wed, 14 Apr 2010 11:39:18 -0400
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o3EFd7jM030883
	for <linux-lvm@redhat.com>; Wed, 14 Apr 2010 11:39:07 -0400
Received: from r74-192-24-94.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.24.94] helo=raydesk1.bettercgi.com)
	by ps536.phatservers.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.66) (envelope-from <support@bettercgi.com>)
	id 1O24gD-00039p-NY
	for linux-lvm@redhat.com; Wed, 14 Apr 2010 08:39:06 -0700
Date: Wed, 14 Apr 2010 10:42:47 -0500
From: Ray Morris <support@bettercgi.com>
In-Reply-To: <BAY110-W4728F879DCB6C9F915B971BE100@phx.gbl> (from
	vtmckoy@hotmail.com on Wed Apr 14 07:16:56 2010)
Message-Id: <1271259767.9436.17@raydesk1.bettercgi.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] How do I tell what disk a volume group reside on
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
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="Flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

> however, I want to ensure that /dev/md10 [root_vg] resides
> on the internal disks.  How can I ensure that?

   Note that this is no longer an LVM question, but a
softraid question, and when the softraid question is answered
it leads you to a SAN question.  Hat's because LVM doesn't
know or care where the md10 device is physically located, much
less know or care where any component devices are.

  To see which devices make up
/dev/md10, do:
cat /proc/mdstat

Output will look something like :

Personalities : [raid6] [raid5] [raid4]
md10 : active raid5 sda2[0] sdc2[2] sdb2[1]
       772370304 blocks level 5, 64k chunk, algorithm 2 [3/3] [UUU]

unused devices: <none>

    The second line tells us that md10 is made up of these devices:
sda2[0] sdc2[2] sdb2[1]

    Now the question becomes are those devices internal?  If you
can't tell from the names, lsscsi might come in handy.  If it's
still not apparent, you have a SAN question that depends on the
type of SAN you have.  It's even possible to set up a SAS SAN with
internal and external storage attached to the same card.  If the
"identify" lights aren't hooked up, the only way to know for sure
would be to compare serial numbers with the output of sdparm!

    It may seem strange that it can be so "hard" to know what's
what, but that's exactly where the magic comes from - you can
make a RAID of external devices, internal devices, or a mix
precisely because the RAID system doesn't know or care where they
are physically located.
--
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php


On 04/14/2010 07:16:56 AM, Vickie Troy-McKoy wrote:
> 
> 
>  Thank you; but I've tried that command.  It gives me the output  
> below;
> however, I want to ensure that /dev/md10 [root_vg] resides on the  
> internal
>  disks.  How can I ensure that?
> 
> 
>   PV         VG      Fmt  Attr PSize   PFree
>   /dev/dm-10 san_vg  lvm2 a-   299.99G     0
>   /dev/dm-9  san_vg  lvm2 a-   174.99G     0
>   /dev/md10  root_vg lvm2 a-    68.22G 12.44G
> 
> Regards,
