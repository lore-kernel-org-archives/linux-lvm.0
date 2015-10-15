Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t9F7USqO026746
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 15 Oct 2015 03:30:28 -0400
Received: from alukardd.org (alukardd.org [188.134.93.171])
	by mx1.redhat.com (Postfix) with ESMTPS id 26062A10A7
	for <linux-lvm@redhat.com>; Thu, 15 Oct 2015 07:30:27 +0000 (UTC)
Received: from alukardd.org ([172.17.0.101]:48840 helo=mail.alukardd.org)
	by alukardd.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84) (envelope-from <alukardd@alukardd.org>)
	id 1ZmcjG-0005kF-6K
	for linux-lvm@redhat.com; Thu, 15 Oct 2015 10:13:35 +0300
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Thu, 15 Oct 2015 10:13:34 +0300
From: Alexey <alukardd@alukardd.org>
In-Reply-To: <561EB8A1.10806@windriver.com>
References: <561EB8A1.10806@windriver.com>
Message-ID: <90c8e9f78fb27d380b22d2afdd6225be@alukardd.org>
Subject: Re: [linux-lvm] unexpected behaviour of "lvresize" with sparse
 volumes
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

Hello,

If you look at the output of `lvs myvg`, then you will understand whats 
happens.
When you create thin LV without specifying option `-T`, lvm 
automatically created TP for you with size equal to -L option.
And when you resize your sparsevol, your TP (auto name lvol1) still have 
old size.

Regards,
Alexey Mochkin

On 2015-10-14 23:18, Chris Friesen wrote:
> Hi,
> 
> I'm running the 3.14 kernel with lvm 2.02.98 and I ran into something
> unexpected with lvresize.
> 
> I created a sparse volume:
> 
> lvcreate -L 25M -V 50M -n sparsevol myvg
> 
> 
> This gives output in lvdisplay like this:
>   LV Size                52.00 MiB
>   Current LE             13
>   COW-table size         28.00 MiB
>   COW-table LE           7
> 
> I then resized the volume with lvresize:
> 
> lvresize -L 200M myvg/sparsevol
> 
> 
> This seems to resize the COW-table, but not the volume itself.  Now
> lvdisplay shows:
> 
>   LV Size                52.00 MiB
>   Current LE             13
>   COW-table size         200.00 MiB
>   COW-table LE           50
> 
> 
> At this point I've got 200MiB of backing store and running "lvs" shows
> an LSize of "200m" but I can only write 52MiB worth of data to the
> volume before it complains.
> 
> Is there a way to expand the "LV Size" shown in lvdisplay so that I
> can write the resized amount of data to the volume?
> 
> Thanks,
> Chris
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
