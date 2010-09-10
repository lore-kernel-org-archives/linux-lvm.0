Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o8AERvOB026001
	for <linux-lvm@redhat.com>; Fri, 10 Sep 2010 10:27:57 -0400
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o8AERngh012073
	for <linux-lvm@redhat.com>; Fri, 10 Sep 2010 10:27:49 -0400
Received: from r74-192-2-154.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.2.154] helo=raydesk1.bettercgi.com)
	by ps536.phatservers.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.66) (envelope-from <support@bettercgi.com>)
	id 1Ou4Zt-0001c4-Kt
	for linux-lvm@redhat.com; Fri, 10 Sep 2010 07:27:46 -0700
Date: Fri, 10 Sep 2010 09:27:43 -0500
From: Ray Morris <support@bettercgi.com>
References: <4C868067.8050909@Media-Brokers.com> <4C8A3F22.3070908@cox.net>
In-Reply-To: <4C8A3F22.3070908@cox.net> (from rascal.jumper-747@cox.net on
	Fri Sep 10 09:22:26 2010)
Message-Id: <1284128863.20650.40@raydesk1.bettercgi.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Either the superblock or the partition table is
 likely to be corrupted
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
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="Flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

>> Dumb/obvious question... you did reduce the size of the filesystem
>> *before* reducing the size of the LV, right?
>> 
> 
> And, if it was done out of sequence, is there a way to still fix it?

   If you did not increase the ize of the lv-wf2 FILESYSTEM yet,
you should be able to undo what was done.  See vgcfgrestore.
--
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php


On 09/10/2010 09:22:26 AM, Clyde E. Kunkel wrote:
>  On 09/07/2010 02:11 PM, Charles Marcus wrote:
>> On 2010-09-07 12:45 PM, James Corteciano<james@linux-source.org>   
>> wrote:
>>> 2) I run system-config-lvm and reduce lv-wf1 from 160G to 70G and
>>> increased lv-wf2 from 10G to 30G.
>>> 
>>> Now, when I run the rhcs-nfs1 service using the command "clusvcadm
>>> -e rhcs-nfs1 -m rhcs-node1", I got failed result. I have checked the
>>> /var/log/messages and this is the output.
>> Dumb/obvious question... you did reduce the size of the filesystem
>> *before* reducing the size of the LV, right?
>> 
> 
> And, if it was done out of sequence, is there a way to still fix it?
> 
> TIA
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
