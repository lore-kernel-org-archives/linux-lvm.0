Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l2QMnbB3016488
	for <linux-lvm@redhat.com>; Mon, 26 Mar 2007 18:49:37 -0400
Received: from smtp2.pacifier.net (smtp2.pacifier.net [64.255.237.172])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l2QMnUei012507
	for <linux-lvm@redhat.com>; Mon, 26 Mar 2007 18:49:31 -0400
Received: from bedroom.boskone (ip136.133.dsl-acs2.pdx.iinet.com
	[209.20.133.136])
	by smtp2.pacifier.net (Postfix) with ESMTP id F213623B8F
	for <linux-lvm@redhat.com>; Mon, 26 Mar 2007 15:47:21 -0700 (PDT)
From: ben scott <benscott@nwlink.com>
Subject: A bug in report.c? WAS: [linux-lvm] vg attributes (vg_attr) in vgs
	program don't seem =?utf-8?q?to=09match_the_man?= page
Date: Mon, 26 Mar 2007 15:47:20 -0700
References: <200703251711.05482.benscott@nwlink.com>
	<46078CE5.5050001@redhat.com>
In-Reply-To: <46078CE5.5050001@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200703261547.20641.benscott@nwlink.com>
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
>
> See lib/report/report.c in sources for exact description,
>
> Short overview
> (note that some attributes are used for hidden volumes only which are parts
> of snapshot, mirror, etc...)
>
> VG attributes
>
> wz--n-
>
> |||||`- clustered [c|-]
> ||||
> ||||`-- allocation policy
> |||| (c)ontiguous,(C)ling,(n)ormal,(a)nywhere,(i)nherit
> |||

<From the LVM2.2.02.24 source>
The following lines in report.c seems to show that (c) will become (C) if the 
lv is locked:

	repstr[2] = _alloc_policy_char(lv->alloc);

        	if (lv->status & LOCKED)
                	repstr[2] = toupper(repstr[2]);

That is also what the man page claims. However the start of report.c show 
this: 

 switch (alloc) {
        case ALLOC_CONTIGUOUS:
                return 'c';
        case ALLOC_CLING:
                return 'C';
        case ALLOC_NORMAL:
                return 'n';
        case ALLOC_ANYWHERE:
                return 'a';
        default:
                return 'i';
        }

Isn't that a conflict, or am I reading this wrong? BTW I am not a professional 
programmer nor do I play one on TV. 
