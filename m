Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4Q6ieJF016439
	for <linux-lvm@redhat.com>; Fri, 26 May 2006 02:44:40 -0400
Received: from conterra.de (vvv.conterra.de [212.124.44.162])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k4Q6iWkF011659
	for <linux-lvm@redhat.com>; Fri, 26 May 2006 02:44:33 -0400
Received: from localhost (unknown [127.0.0.1])
	by conterra.de (-) with ESMTP id 3FC2F1F4204
	for <linux-lvm@redhat.com>; Fri, 26 May 2006 08:44:25 +0200 (CEST)
Received: from conterra.de ([127.0.0.1])
	by localhost (vvv.conterra.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 14112-10 for <linux-lvm@redhat.com>;
	Fri, 26 May 2006 08:43:53 +0200 (CEST)
Message-ID: <4476A39C.8040108@conterra.de>
Date: Fri, 26 May 2006 08:43:40 +0200
From: =?ISO-8859-1?Q?Dieter_St=FCken?= <stueken@conterra.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Restore LVM without UIDs
References: <06F5C23A-EF8A-4DB1-898C-BCAF9AD9A9E3@mit.edu>
In-Reply-To: <06F5C23A-EF8A-4DB1-898C-BCAF9AD9A9E3@mit.edu>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Sabin Dang wrote:
> Hi Everyone,
> 
> I assisted in restoring a server today that was connected to an  
> external raid that used LVM. Unfortunately there was no backup of the  
> LVM config files prior to reinstalling the operating system.
> 
> Is there any way to retrieve the data stored on the LVM without the  old 
> config files?

At least for LVM2, all meta data is stored on each PV/disk, too. Thus, until
you did not destroy your LVM header/metadata of your disk(s), the former
LVM should be recognized without any external config informations.
Else, you may have a problem. If you have overwritten the first part
of your previous PV, you may try to search the starting point(s) of former
LV(s), and if you are lucky, they have been allocated contiguously.
In this case you may have a good change to recover something.

Dieter. 
