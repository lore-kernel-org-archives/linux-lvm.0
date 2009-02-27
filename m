Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n1RGSimd010455
	for <linux-lvm@redhat.com>; Fri, 27 Feb 2009 11:28:44 -0500
Received: from breeves.fab.redhat.com (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id n1RGShHp016949
	for <linux-lvm@redhat.com>; Fri, 27 Feb 2009 11:28:43 -0500
Message-ID: <49A814EA.3090902@redhat.com>
Date: Fri, 27 Feb 2009 16:29:30 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] vgchange doesn't enable found VGs
References: <1235748997.1193.15.camel@pc.interlinx.bc.ca>
In-Reply-To: <1235748997.1193.15.camel@pc.interlinx.bc.ca>
Content-Transfer-Encoding: 7bit
Reply-To: bmr@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Brian J. Murrell wrote:
> Strange:
> 
> + /usr/sbin/vgscan --ignorelockingfailure Reading all physical
> volumes.  This may take a while... Found volume group "foobar"
> using metadata type lvm2 + /usr/sbin/vgchange -a y
> --ignorelockingfailure No volume groups found
> 
> It seems I have to tell vgchange to enable the foobar VG
> explicitly.
> 
> Why is this?

It's difficult to say from the output above. Try running the tools
with "-vvv" and looking at the detailed output. They'll produce a lot
of output when run this way - you may want to use something like
pastebin & send a link to the list rather than posting the entire output.

Why do you need the --ignorelockingfailure?

Bryn.
