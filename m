Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8IJP2V5004083
	for <linux-lvm@redhat.com>; Fri, 18 Sep 2009 15:25:02 -0400
Received: from destar.net (mail.destar.net [12.12.38.18])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id n8IJOh6C023903
	for <linux-lvm@redhat.com>; Fri, 18 Sep 2009 15:24:44 -0400
Message-ID: <20090918112442.8724527embwl13sw@www.destar.net>
Date: Fri, 18 Sep 2009 11:24:42 -0800
From: jonr@destar.net
Subject: Re: [linux-lvm] Striping an LVM
References: <20090918111953.192836xilg10rvqc@www.destar.net>
In-Reply-To: <20090918111953.192836xilg10rvqc@www.destar.net>
MIME-Version: 1.0
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="flowed"
To: linux-lvm@redhat.com

Er, make that raid1 and not raid0.

Quoting jonr@destar.net:

> Hello List,
>
> I am reading about striping with LVM's across multiple disks. My  
> question is why would I want to do this when I could set it up with  
> raid0? Also, if I striped across three drives with my LV wouldn't I  
> then run the risk of losing all data if one of the three drives  
> failed?
>
> Have I missed something?
>
> Jon
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
