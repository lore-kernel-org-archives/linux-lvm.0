Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o8AGe40t027075
	for <linux-lvm@redhat.com>; Fri, 10 Sep 2010 12:40:04 -0400
Received: from q7.q7.com (q7.q7.com [69.168.48.248])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o8AGdrcs028868
	for <linux-lvm@redhat.com>; Fri, 10 Sep 2010 12:39:53 -0400
Received: from charon.spiretech.com (charon.spiretech.com [69.168.63.193])
	(authenticated bits=0)
	by q7.q7.com (8.13.1/8.13.1) with ESMTP id o8AGdmHc029257
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Fri, 10 Sep 2010 09:39:52 -0700
Message-ID: <4C8A5F54.3060007@q7.com>
Date: Fri, 10 Sep 2010 09:39:48 -0700
From: Joe Pruett <joey@q7.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] changing pe size
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
To: linux-lvm@redhat.com

 i have looked around the net and not found much info about this...

i have a centos 5 system with a 32m pe size vg and have attached some
storage with an lvm1 4m pe size vg.  i converted the old vg to lvm2
without problem, but i would like to merge the volumes and pvmove data
onto the newer 32m pe pvs.  but you can't merge things with different pe
size, so i've been trying to get the 4m pe vg changed to 32m pe.  after
much monkeying around i was able to get all the pvs and lvs to have le
counts that were the right size to be convertible to 32m pe.  but it
looks like each segment must be sized appropriately and i can't find a
way to merge segments together so that things are sized correctly.

the most recent error is:
# vgchange -s 32m lv
  New size 209051648 for disk0 segment length not an exact number of new
extents.

would i be better off converting the 32m pe vg to 4m pe?  this is all
with lvm2 now, and what i read says that the 64k segment limit doesn't
exist anymore, so 4m pe isn't a limiting factor for lv sizing.  or is
there a way i can combine segments so they are sized appropriately? 
i've got enough space that i should be able to pvmove stuff around to
coalesce segments, but it isn't clear if there is a tool to do that.

if all else fails, i guess i'll just have to do a filesystem level copy
onto the 32m pe vg.  or is there some other magic i'm missing?
