Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0O0WQO12823
	for <linux-lvm@redhat.com>; Sun, 23 Jan 2005 19:32:26 -0500
Received: from omx2.sgi.com (omx2-ext.sgi.com [192.48.171.19])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j0O0WO3N011306
	for <linux-lvm@redhat.com>; Sun, 23 Jan 2005 19:32:25 -0500
Date: Mon, 24 Jan 2005 11:32:05 +1100
From: Nathan Scott <nathans@sgi.com>
Subject: Re: [linux-lvm] Why the dramatic increase in filesystem performance
	when usingxfs????
Message-ID: <20050124113204.B1604791@wobbly.melbourne.sgi.com>
References: <1106304669.3943.14.camel@grma-lap>
	<87f94c3705012108241f812e0e@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87f94c3705012108241f812e0e@mail.gmail.com>;
	from greg.freemyer@gmail.com on Fri, Jan 21, 2005 at 11:24:29AM
	-0500
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Freemyer <greg.freemyer@gmail.com>, LVM general discussion and development <linux-lvm@redhat.com>
Cc: Gary.Mansell@ricardo.com

On Fri, Jan 21, 2005 at 11:24:29AM -0500, Greg Freemyer wrote:
> Specifically, I would not recommend XFS for the core filesystems.  i.e
> /, /var, /usr, etc.  A lot of debug tools still don't support XFS and
> XFS brings no value to the party.

Which debug tools are you referring to there?  I've found XFS
to be an excellent "core" filesystem, but I may be biased. :)

cheers.

-- 
Nathan
