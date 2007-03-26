Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l2QIdm6K006266
	for <linux-lvm@redhat.com>; Mon, 26 Mar 2007 14:39:48 -0400
Received: from smtp2.pacifier.net (smtp2.pacifier.net [64.255.237.172])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l2QIdie9019661
	for <linux-lvm@redhat.com>; Mon, 26 Mar 2007 14:39:45 -0400
Received: from bedroom.boskone (ip136.133.dsl-acs2.pdx.iinet.com
	[209.20.133.136])
	by smtp2.pacifier.net (Postfix) with ESMTP id 8F8AF23EC2
	for <linux-lvm@redhat.com>; Mon, 26 Mar 2007 11:38:34 -0700 (PDT)
From: ben scott <benscott@nwlink.com>
Subject: Re: [linux-lvm] vg attributes (vg_attr) in vgs program don't seem
	=?utf-8?q?to=09match_the_man?= page
Date: Mon, 26 Mar 2007 11:38:33 -0700
References: <200703251711.05482.benscott@nwlink.com>
	<46078CE5.5050001@redhat.com>
In-Reply-To: <46078CE5.5050001@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200703261138.33604.benscott@nwlink.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Monday 26 March 2007 02:05:41 am Milan Broz wrote:
> ben scott wrote:
> > The explanation of the attribute bits printed by the program "vgs" in the
> > man page are as follows:
> >
> > The vg_attr bits are:  (w)riteable, (r)ead only, resi(z)eable,
> > e(x)ported, (p)artial and (c)lustered.
> >
> > However "vgs" on my debian Etch system prints out this way:
>
> ...
>
> See lib/report/report.c in sources for exact description,
>
> |||| (c)ontiguous,(C)ling,(n)ormal,(a)nywhere,(i)nherit

Thank you. Now I am off to see what  (C)ling means.
