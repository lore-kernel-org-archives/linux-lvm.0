Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9NISZQV021582
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 14:28:35 -0400
Received: from mailstore01.fastname.no (mailstore01.fastname.no
	[85.19.150.220])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9NISN0i022316
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 14:28:24 -0400
Received: from [209.85.218.214] (helo=mail-bw0-f214.google.com)
	by mailstore01.fastname.no with esmtpsa (TLSv1:RC4-MD5:128)
	(Exim 4.69) (envelope-from <morten@mortent.org>) id 1N1Os8-0004wA-Am
	for linux-lvm@redhat.com; Fri, 23 Oct 2009 20:28:20 +0200
Received: by bwz6 with SMTP id 6so1118274bwz.11
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 11:28:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20091023172914.GA12748@us.ibm.com>
References: <4AE1B9FB.504@mortent.org> <20091023172914.GA12748@us.ibm.com>
Date: Fri, 23 Oct 2009 20:28:19 +0200
Message-ID: <1958a88d0910231128x2b072b48q504d56b03da39196@mail.gmail.com>
Subject: Re: [linux-lvm] Mirrored LVs
From: Morten Torstensen <morten@mortent.org>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

>> Why cannot the mirrorlog be stored persistently in one or more LEs in
>> the LV? Why the need for a seperate PV for this?
>
> For better redundancy...

In a LE it would be mirrored too and a copy would be in each mirror...

> Use "--alloc anywhere" to place the log LV on one of them when you
> create your mirror.

Yes, but this will have the side effect of not ensuring separate PVs
for the mirrored LV? An the mirror log would still not be mirrored, so
in a failure situation you would still face data loss or force a fully
resync of the mirror.
-- 
//Morten
//morten@mortent.org
