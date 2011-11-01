Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id pA1JDrco009446
	for <linux-lvm@redhat.com>; Tue, 1 Nov 2011 15:13:53 -0400
Received: from QMTA11.westchester.pa.mail.comcast.net
	(qmta11.westchester.pa.mail.comcast.net [76.96.59.211])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pA1JDq7V015387
	for <linux-lvm@redhat.com>; Tue, 1 Nov 2011 15:13:53 -0400
Date: Tue, 1 Nov 2011 19:13:53 +0000 (UTC)
From: Dan White <ygor@comcast.net>
Message-ID: <1190544765.1654069.1320174833294.JavaMail.root@sz0126a.westchester.pa.mail.comcast.net>
In-Reply-To: <4EB03E2E.3050003@alteeve.com>
MIME-Version: 1.0
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
To: LVM general discussion and development <linux-lvm@redhat.com>

----- Digimer <linux@alteeve.com> wrote:
> On 11/01/2011 02:39 PM, Dan White wrote:
> > Is a logical volume group necessary before one can start making mountable partitions ?
> > 
> > I'm trying to work with a SAN.  We were allocated a 10Gb LUN to "play" with. Another admin created a logical volume on the LUN and then made a single partition out of the logical volume.  The flow I am familiar with from Red Hat's GUI is to first make a logical volume group, then make partitions in the group that I can adjust in size as necessary.
> > 
> > Are both workflows valid ?
> 
> LVs must be created from VGs.
> 

I agree.  Got a documentation reference I can use for backup ?

“Sometimes I think the surest sign that intelligent life exists elsewhere in the universe is that none of it has tried to contact us.”
Bill Waterson (Calvin & Hobbes)
