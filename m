Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id pA1JKva3011912
	for <linux-lvm@redhat.com>; Tue, 1 Nov 2011 15:20:57 -0400
Received: from smtp.iplink.net (smtp.iplink.net [192.139.81.186])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pA1JKtxB020530
	for <linux-lvm@redhat.com>; Tue, 1 Nov 2011 15:20:56 -0400
Message-ID: <4EB04692.3060705@alteeve.com>
Date: Tue, 01 Nov 2011 15:20:50 -0400
From: Digimer <linux@alteeve.com>
MIME-Version: 1.0
References: <1190544765.1654069.1320174833294.JavaMail.root@sz0126a.westchester.pa.mail.comcast.net>
In-Reply-To: <1190544765.1654069.1320174833294.JavaMail.root@sz0126a.westchester.pa.mail.comcast.net>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Dan White <ygor@comcast.net>

On 11/01/2011 03:13 PM, Dan White wrote:
> ----- Digimer <linux@alteeve.com> wrote:
>> On 11/01/2011 02:39 PM, Dan White wrote:
>>> Is a logical volume group necessary before one can start making mountable partitions ?
>>>
>>> I'm trying to work with a SAN.  We were allocated a 10Gb LUN to "play" with. Another admin created a logical volume on the LUN and then made a single partition out of the logical volume.  The flow I am familiar with from Red Hat's GUI is to first make a logical volume group, then make partitions in the group that I can adjust in size as necessary.
>>>
>>> Are both workflows valid ?
>>
>> LVs must be created from VGs.
>>
> 
> I agree.  Got a documentation reference I can use for backup ?

man lvcreate? Not being flippant, but the 'VolumeGroupName' is a
required value. :)

Also from the man page;

DESCRIPTION
       lvcreate creates a new logical volume in a volume group  (  see
vgcre-
       ate(8), vgchange(8) ) by allocating logical extents from the free
phys-
       ical extent pool of that volume group.  If there are  not  enough
 free
       physical  extents  then  the  volume  group can be extended ( see
vgex-
       tend(8) ) with other physical volumes or by reducing  existing
logical
       volumes  of this volume group in size ( see lvreduce(8) ). If you
spec-
       ify one or more PhysicalVolumes, allocation of physical extents
will be
       restricted to these volumes.
       The second form supports the creation of snapshot logical volumes
which
       keep the contents of the original logical volume for backup purposes.


-- 
Digimer
E-Mail:              digimer@alteeve.com
Freenode handle:     digimer
Papers and Projects: http://alteeve.com
Node Assassin:       http://nodeassassin.org
"omg my singularity battery is dead again.
stupid hawking radiation." - epitron
