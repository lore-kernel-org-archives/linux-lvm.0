Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id pA1Ij8D8031494
	for <linux-lvm@redhat.com>; Tue, 1 Nov 2011 14:45:08 -0400
Received: from smtp.iplink.net (smtp.iplink.net [192.139.81.186])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pA1Ij746008947
	for <linux-lvm@redhat.com>; Tue, 1 Nov 2011 14:45:07 -0400
Message-ID: <4EB03E2E.3050003@alteeve.com>
Date: Tue, 01 Nov 2011 14:45:02 -0400
From: Digimer <linux@alteeve.com>
MIME-Version: 1.0
References: <604704853.1651560.1320172792894.JavaMail.root@sz0126a.westchester.pa.mail.comcast.net>
In-Reply-To: <604704853.1651560.1320172792894.JavaMail.root@sz0126a.westchester.pa.mail.comcast.net>
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

On 11/01/2011 02:39 PM, Dan White wrote:
> Is a logical volume group necessary before one can start making mountable partitions ?
> 
> I'm trying to work with a SAN.  We were allocated a 10Gb LUN to "play" with. Another admin created a logical volume on the LUN and then made a single partition out of the logical volume.  The flow I am familiar with from Red Hat's GUI is to first make a logical volume group, then make partitions in the group that I can adjust in size as necessary.
> 
> Are both workflows valid ?

LVs must be created from VGs.

-- 
Digimer
E-Mail:              digimer@alteeve.com
Freenode handle:     digimer
Papers and Projects: http://alteeve.com
Node Assassin:       http://nodeassassin.org
"omg my singularity battery is dead again.
stupid hawking radiation." - epitron
