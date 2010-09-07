Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o875nunq010237
	for <linux-lvm@redhat.com>; Tue, 7 Sep 2010 01:49:56 -0400
Received: from rd-fe01.sohu-rd.com (smtp.sohu-rd.com [202.106.180.43])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o875njmQ016149
	for <linux-lvm@redhat.com>; Tue, 7 Sep 2010 01:49:47 -0400
From: "Kirby Zhou" <kirbyzhou@sohu-rd.com>
References: <001901cb4ddf$d3bff6d0$7b3fe470$@com> <20100906201634.GC2377@racke>
In-Reply-To: <20100906201634.GC2377@racke>
Date: Tue, 7 Sep 2010 13:49:45 +0800
Message-ID: <0ed101cb4e50$79634450$6c29ccf0$@com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Language: zh-cn
Subject: Re: [linux-lvm] Does LVM-LV take system cache? Sure.
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

Thanks very much, 
the fact is actually what you said.

Regards,
   Kirby Zhou    
   from   SOHU-RD   +86-10-6272-8261


-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On
Behalf Of Lars Ellenberg
Sent: Tuesday, September 07, 2010 4:17 AM
To: linux-lvm@redhat.com
Subject: Re: [linux-lvm] Does LVM-LV take system cache? Sure.

On Tue, Sep 07, 2010 at 12:23:23AM +0800, Kirby Zhou wrote:
> Does LVM-LV take system cache?
> 
> In my test, it does not take system cache on a RHEL5 box, is it a bug or a
> feature?
> 
> Test1, run dd with raw block device, it seems system cache can boost up
> reread operation.
> 
> [@djt_18_69 ~]# dd if=/dev/sdc bs=1M of=/dev/null count=500
> 524288000 bytes (524 MB) copied, 1.88267 seconds, 278 MB/s
> [@djt_18_69 ~]# dd if=/dev/sdc bs=1M of=/dev/null count=500
> 524288000 bytes (524 MB) copied, 0.13445 seconds, 3.9 GB/s
>  
> 
> Test2, run dd with lv, it seems system cache CAN NOT boost up reread
> operation.
> 
> [@djt_18_69 ~]# dd if=/dev/vgext/lvtest5 bs=1M of=/dev/null count=500
> 524288000 bytes (524 MB) copied, 2.17848 seconds, 241 MB/s
> [@djt_18_69 ~]# dd if=/dev/vgext/lvtest5 bs=1M of=/dev/null count=500
> 524288000 bytes (524 MB) copied, 2.17451 seconds, 241 MB/s
> 
> Both 2.6.18-164.15.1.el5 and 2.6.18-194.el5 do the same behavior.

The last close() on a block device releases its cache.

As for sdc dd is most likely not the exclusive user at that time
(any mounts or other references on sdc itself, or its partitions,
count), dd's close() does not have this effect there.

Try this:

# sleep 3600 < /dev/vgext/lvtest5 & sleep_pid=$!
# dd if=/dev/vgext/lvtest5 bs=1M of=/dev/null count=500
# dd if=/dev/vgext/lvtest5 bs=1M of=/dev/null count=500
# kill $sleep_pid
# dd if=/dev/vgext/lvtest5 bs=1M of=/dev/null count=500

	Lars

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO@http://tldp.org/HOWTO/LVM-HOWTO/
