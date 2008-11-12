Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mACIF46B032145
	for <linux-lvm@redhat.com>; Wed, 12 Nov 2008 13:15:05 -0500
Received: from breeves.fab.redhat.com (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id mACIF4dS014406
	for <linux-lvm@redhat.com>; Wed, 12 Nov 2008 13:15:04 -0500
Message-ID: <491B1C9D.3090401@redhat.com>
Date: Wed, 12 Nov 2008 18:12:45 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] device filter in lvm.conf
References: <B668DE010628694A85EC2A4C53DCF769261FA0D8@SA000011>
In-Reply-To: <B668DE010628694A85EC2A4C53DCF769261FA0D8@SA000011>
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

Tuncel.Mutlu@akbank.com wrote:
> filter = [ "a/sda[1-9]$/" "a/sddlm*/" "r/.*/" ]
> 
> and types row has been added
> 
> types = [ "sddlmfdrv", 16 ]
> 
> This has been known to work on another Linux box, but not here. How must I
> alter the filter so the LVM should accept sda and sddlm devices but reject
> all others ?

When you say it doesn't work on this box, what actually happens? Do you 
fail to filter out the individual paths, or do you fail to include the 
multipath device that you want to use?

You may find that removing the cache (/etc/lvm/cache/.cache) after 
editing the filters straightens things out (this should be automatic but 
I've found that on some releases I've needed to manually remove it).

Also, is the filter really what you wanted?

 > filter = [ "a/sda[1-9]$/" "a/sddlm*/" "r/.*/" ]
                              ^^^^^^^^

This says to accept devices that have a string "sddl" followed by any 
zero or more "m" characters. I don't know the naming scheme for HDLM, 
but your example implies that they'd follow a pattern of 
sddlm[a-z][a-z], or something.

Perhaps "a/sddlm.*/" would work better (sddlm followed by any number of 
any character), since you're unlikely to have other device nodes with a 
prefix of sddlm. You could tighten that up further as: "a|/dev/sddlm.*|" 
if you liked (lvm filter expressions work like sed - you can uniformly 
replace the '//' delimiters with other chars - I like pipes as it means 
you need less \/ escaping when using paths).

Regards,
Bryn.
