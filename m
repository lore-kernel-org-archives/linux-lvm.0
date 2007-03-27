Message-ID: <46086CAD.2030402@ce.jp.nec.com>
Date: Mon, 26 Mar 2007 21:00:29 -0400
From: "Jun'ichi Nomura" <j-nomura@ce.jp.nec.com>
MIME-Version: 1.0
Subject: Re: A bug in report.c? WAS: [linux-lvm] vg attributes (vg_attr) in
	vgs program don't seem to match the man page
References: <200703251711.05482.benscott@nwlink.com>	<46078CE5.5050001@redhat.com>
	<200703261547.20641.benscott@nwlink.com>
In-Reply-To: <200703261547.20641.benscott@nwlink.com>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Alasdair Kergon <agk@redhat.com>

Hi,

ben scott wrote:
> The following lines in report.c seems to show that (c) will become (C) if the 
> lv is locked:
...
> That is also what the man page claims. However the start of report.c show 
> this: 
> 
>  switch (alloc) {
>         case ALLOC_CONTIGUOUS:
>                 return 'c';
>         case ALLOC_CLING:
>                 return 'C';
...
> Isn't that a conflict, or am I reading this wrong? BTW I am not a professional 
> programmer nor do I play one on TV. 

It's a bug.
I added the cling allocation policy and assigned 'C' to it
without checking the capitalization part of the report function...
Thanks for finding it.

Alasdair,
Sorry about this bug.
IMO, 'C' for ALLOC_CLING should be changed to other letter since it's
added after the capitalization.
It inevitably introduces possible compatibility issues for existing
user of attr field, however.

Thanks,
-- 
Jun'ichi Nomura, NEC Corporation of America
