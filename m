Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3TKb6HG000924
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 29 Apr 2016 16:37:06 -0400
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	(using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3EB34C049E18
	for <linux-lvm@redhat.com>; Fri, 29 Apr 2016 20:37:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u3TKb4Q0024934
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Fri, 29 Apr 2016 13:37:04 -0700 (PDT)
Message-ID: <5723C5EC.6020903@windriver.com>
Date: Fri, 29 Apr 2016 15:37:00 -0500
From: Chris Friesen <chris.friesen@windriver.com>
MIME-Version: 1.0
References: <75be777705b8abc643a67ca9b90d7b1b@dds.nl>
	<1009262601.20160429104420@marki-online.net>
In-Reply-To: <1009262601.20160429104420@marki-online.net>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] about the lying nature of thin
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

On 04/29/2016 03:44 AM, Marek Podmaka wrote:

> Now I'm not sure what your use-case for thin pools is.
>
> I don't see it much useful if the presented space is smaller than
> available physical space. In that case I can just use plain LVM with
> PV/VG/LV. For snaphosts you don't care much as if the snapshot
> overfills, it just becomes invalid, but won't influence the original
> LV.

One useful case for "presented space equal to physical space" with thin volumes 
is that it simplifies security issues.

With raw LVM volumes I generally need to zero out the whole volume prior to 
deleting it (to avoid leaking the contents to other users).  This takes time, 
and also seriously hammers the disks when you have multiple volumes being zeroed 
in parallel.

With thin, deletion is essentially instantaneous, and the zeroing penalty is 
paid when the disk block is actually written. Any disk blocks which have not 
been written are simply read as all-zeros.

Chris
