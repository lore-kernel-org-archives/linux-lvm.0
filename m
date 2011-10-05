Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p95Kqlk7002805
	for <linux-lvm@redhat.com>; Wed, 5 Oct 2011 16:52:47 -0400
Received: from cmiomail.amdocs.com (cmiomail.amdocs.com [68.77.114.71])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p95Kqgli012433
	for <linux-lvm@redhat.com>; Wed, 5 Oct 2011 16:52:42 -0400
Received: from USCMIMAILFE1.corp.amdocs.com (unknown [10.120.38.110])
	(using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by cmiomail.amdocs.com (Postfix) with ESMTPS id 72B6DD80DE
	for <linux-lvm@redhat.com>; Wed,  5 Oct 2011 15:52:35 -0500 (CDT)
From: Jewsco Pius Jacquez <JewscoPius.Jacquez@Amdocs.com>
Date: Wed, 5 Oct 2011 15:52:33 -0500
Message-ID: <883D98939E388E429EE8D771168A6560027F611C52@USCMIMAIL1.corp.amdocs.com>
References: <883D98939E388E429EE8D771168A6560027F61157F@USCMIMAIL1.corp.amdocs.com>
	<883D98939E388E429EE8D771168A6560027F611931@USCMIMAIL1.corp.amdocs.com>
	<alpine.LRH.2.00.1110051529280.5105@bmsred.bmsi.com>
In-Reply-To: <alpine.LRH.2.00.1110051529280.5105@bmsred.bmsi.com>
Content-Language: en-US
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

I don't have the output of the lvs or vgdisplays..but as per our log, the return status is 0.

Excerpt from log;

+ vgchange -a y /dev/vg_cln_VONCRM01_ix
  4 logical volume(s) in volume group "vg_cln_VONCRM01_ix" now active
+ [ 0 -ne 0 ]


Why would the all LVs under that will show "NOT available"?

Thanks,
Jewsco


-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On Behalf Of Stuart D. Gathman
Sent: Wednesday, October 05, 2011 2:33 PM
To: LVM general discussion and development
Subject: Re: [linux-lvm] VG is showing resizable/read/write but LV is showing NOT available after vgchange

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

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
This message and the information contained herein is proprietary and confidential and subject to the Amdocs policy statement,
you may review at http://www.amdocs.com/email_disclaimer.asp
