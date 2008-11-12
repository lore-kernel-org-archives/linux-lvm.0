Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mACJ9DUe004030
	for <linux-lvm@redhat.com>; Wed, 12 Nov 2008 14:09:13 -0500
Received: from breeves.fab.redhat.com (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id mACJ9Duf019246
	for <linux-lvm@redhat.com>; Wed, 12 Nov 2008 14:09:13 -0500
Message-ID: <491B294E.508@redhat.com>
Date: Wed, 12 Nov 2008 19:06:54 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] device filter in lvm.conf
References: <B668DE010628694A85EC2A4C53DCF769261FA0D8@SA000011>	<491B1C9D.3090401@redhat.com>
	<B668DE010628694A85EC2A4C53DCF769261FA16A@SA000011>
In-Reply-To: <B668DE010628694A85EC2A4C53DCF769261FA16A@SA000011>
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
> Thanks a lot,

Great! Glad it's working for you now.

> 
> PS: By the way are you sure about sddlm* been the "sddl + 0 or more m". The
> LVM has been accepting my filter now.

Sorry, that was my mistake - this is true for regexes, but since LVM2 
filter regexes have an implicit ".*" at beginning/end (unless you use 
anchors - see the comments in the default lvm.conf) and the '*' will 
match 0 or more occurrences of the preceding character, it actually 
behaves as though there is no '*' there at all.

E.g. "/sdlm*/" would match sdl$ANYTHING, since "m*" is matched by zero 
occurrences of 'm' and the remaining string is consumed by the implicit 
".*" at the end.

Regards,
Bryn.
