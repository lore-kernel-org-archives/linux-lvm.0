Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p95JXE0I025329
	for <linux-lvm@redhat.com>; Wed, 5 Oct 2011 15:33:14 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p95JX9ki003098
	for <linux-lvm@redhat.com>; Wed, 5 Oct 2011 15:33:10 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id p95JWkm3029032
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 5 Oct 2011 15:32:46 -0400
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id p95JWj7c005190
	for <linux-lvm@redhat.com>; Wed, 5 Oct 2011 15:32:45 -0400
Date: Wed, 5 Oct 2011 15:32:45 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <883D98939E388E429EE8D771168A6560027F611931@USCMIMAIL1.corp.amdocs.com>
Message-ID: <alpine.LRH.2.00.1110051529280.5105@bmsred.bmsi.com>
References: <883D98939E388E429EE8D771168A6560027F61157F@USCMIMAIL1.corp.amdocs.com>
	<883D98939E388E429EE8D771168A6560027F611931@USCMIMAIL1.corp.amdocs.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] VG is showing resizable/read/write but LV is
 showing NOT available after vgchange
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 4 Oct 2011, Jewsco Pius Jacquez wrote:

> After doing vgchange -ay vg_name,  VG is showing resizable/read/write but LV
> is showing NOT available. Return status of vgchange is zero.
> 
> What are the possibilities?

This doesn't happen to other people - or maybe it does.  We aren't sure
because you didn't include any specific output.  How about including
the output of pvs and lvs before and after the vgchange (and any output or
errors from vgchange).  Since the issue is sporadic, you might not
have the "before" output, but at least include the vgchange command 
and "after" output.  You may just be misinterpreting something.

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
