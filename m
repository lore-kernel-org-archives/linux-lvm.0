Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q4JKUjx9026015
	for <linux-lvm@redhat.com>; Sat, 19 May 2012 16:30:45 -0400
Received: from eastrmfepo102.cox.net (eastrmfepo102.cox.net [68.230.241.214])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q4JKUjrg031660
	for <linux-lvm@redhat.com>; Sat, 19 May 2012 16:30:45 -0400
Received: from eastrmimpo109.cox.net ([68.230.241.222])
	by eastrmfepo102.cox.net
	(InterMail vM.8.01.04.00 201-2260-137-20101110) with ESMTP id
	<20120519203044.HXUL26743.eastrmfepo102.cox.net@eastrmimpo109.cox.net>
	for <linux-lvm@redhat.com>; Sat, 19 May 2012 16:30:44 -0400
Message-ID: <4FB8031A.90503@cox.net>
Date: Sat, 19 May 2012 15:31:22 -0500
From: Ron Johnson <ron.l.johnson@cox.net>
MIME-Version: 1.0
References: <1816793.YNuiVBaGhv@laptop>
	<20120519191004.GN29330@agk-dp.fab.redhat.com>
In-Reply-To: <20120519191004.GN29330@agk-dp.fab.redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Is the new RAID implementation going to deprecate
 traditional stripes and mirrors?
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
To: linux-lvm@redhat.com

On 05/19/2012 02:10 PM, Alasdair G Kergon wrote:
> On Sat, May 19, 2012 at 11:58:54AM -0700, ben wrote:
>> Does all the new RAID MD support mean the standard LVM type of mirrors and
>> stripes will go away or at least not be further developed?
>
> Current thinking:
>
> Stripes remain as-is (they're very simple, it's not worth changing).
>
> Preferred mirror switches to md, but existing mirror implementation
> remains available and continues to be used for temporary mirrors like
> pvmove.
>

IOW, md is "best practice" for mirroring?

-- 
"There is usually only a limited amount of damage that can be
done by dull or stupid people. For creating a truly monumental
disaster, you need people with high IQs."
Thomas Sowell
