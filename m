Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id pA1LA0W7013025
	for <linux-lvm@redhat.com>; Tue, 1 Nov 2011 17:10:00 -0400
Received: from www.bettercgi.com (www.bettercgi.com [74.122.122.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pA1L9xBN021955
	for <linux-lvm@redhat.com>; Tue, 1 Nov 2011 17:09:59 -0400
Received: from localhost (r74-192-17-33.bcstcmta01.clsttx.tl.dh.suddenlink.net
	[74.192.17.33])
	by www.bettercgi.com (Postfix) with ESMTPA id 901E12150D
	for <linux-lvm@redhat.com>; Tue,  1 Nov 2011 17:07:38 -0500 (CDT)
Date: Tue, 1 Nov 2011 16:09:55 -0500
From: Ray Morris <support@bettercgi.com>
Message-ID: <20111101160955.42e8d74d@bettercgi.com>
In-Reply-To: <604704853.1651560.1320172792894.JavaMail.root@sz0126a.westchester.pa.mail.comcast.net>
References: <604704853.1651560.1320172792894.JavaMail.root@sz0126a.westchester.pa.mail.comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] N00b Question: Logical Volume without a Logical
 Volume Group ?
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

Just to clarify, this did not happen:

> Another admin created a logical volume on the LUN and
> then made a single partition out of the logical volume.

He may have done nothing with logical volumes at all and just 
partitioned the LUN. Alternatively, he may have made the LUN a 
physical volume, added that physical volume to a volume group, 
and made an LV within the group. There's no such thing as making
a logical volume that's in no group and is not stored on any 
physical volume, though.

> Are both workflows valid ?

If he just partitioned the LUN, that's just like partitioning
a physical drive. That's how it was done in 1971. It works, for the
immediate need. If you ever want to resize it, move it, mirror it, 
etc. it starts to get painful pretty fast. If you have a filesystem 
that's 100 GB on a disk that's 100GB, how to do make it larger?
Go buy a new larger disk, take the system off line, copy the data ...
A LUN or a physical disk, same thing process to resize it.
By using LVM, the resize process can be a single command:
lvextend -L 200GB mygroup/mylv
-- 
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php




On Tue, 1 Nov 2011 18:39:52 +0000 (UTC)
Dan White <ygor@comcast.net> wrote:

> Is a logical volume group necessary before one can start making
> mountable partitions ?
> 
> I'm trying to work with a SAN.  We were allocated a 10Gb LUN to
> "play" with. Another admin created a logical volume on the LUN and
> then made a single partition out of the logical volume.  The flow I
> am familiar with from Red Hat's GUI is to first make a logical volume
> group, then make partitions in the group that I can adjust in size as
> necessary.
> 
> Are both workflows valid ?
> 
> “Sometimes I think the surest sign that intelligent life exists
> elsewhere in the universe is that none of it has tried to contact
> us.” Bill Waterson (Calvin & Hobbes)
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
