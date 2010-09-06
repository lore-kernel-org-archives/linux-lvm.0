Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o8666eSw014674
	for <linux-lvm@redhat.com>; Mon, 6 Sep 2010 02:06:40 -0400
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o8666U9H007241
	for <linux-lvm@redhat.com>; Mon, 6 Sep 2010 02:06:31 -0400
Received: from r74-192-2-154.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.2.154] helo=raydesk1.bettercgi.com)
	by ps536.phatservers.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.66) (envelope-from <support@bettercgi.com>)
	id 1OsUqa-0002j6-MH
	for linux-lvm@redhat.com; Sun, 05 Sep 2010 23:06:28 -0700
Date: Mon, 06 Sep 2010 01:06:27 -0500
From: Ray Morris <support@bettercgi.com>
In-Reply-To: <4c844eef.6482e50a.4cd8.ffff8f39@mx.google.com> (from
	formisc@gmail.com on Sun Sep  5 21:16:09 2010)
Message-Id: <1283753187.12826.52@raydesk1.bettercgi.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Important diretories are missing after adding space.
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

On 09/05/2010 09:16:09 PM, For Miscelenious wrote:

> Re: extended partition overlap .
> Speaking of partitions. I'm looking at my other drives,
>  they do not have an extended partition somehow.
> I always thought that the only way to cteate multiple
> partitions is to have one primary and one extended. And
> then further partition it. Is it a case or lm just been naive?

   You can have up to four primary partitions.  The previous statement
is oversimplying, though, and not quite true.  Technically,
the partition table always lists _exactly_ four partitions, though
some may have zero size.  The reason you can (and must) have four
is beause there are exactly 64 bytes which tell where those partitions
are and what type they are.  More can not be described in the space
allowed.

   Of those four, one may be an extended partition.  Extended
partitions contain a partition table within the partition which
allows for four more partitions, one of which may be another
extended partition.

    All of the above is true of the DOS partition table format.
Remember in that format the whole partition table is 64 bytes -
sixteen bytes per partition.  The size of the partition is soted
in four bytes, and it's starting position in another four bytes.
Those four bytes are enough to describe a partition of up to 2 TB,
and one starting up to 2TB from the beginning of the disk.
Therefore, the DOS partition tabel format can only be used with
drives smaller than 4TB, and loses functionallity on drives more
than 2TB.  To get over 2TB, one must use a newer type of partition
table such as GPT.
--
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php


On 09/05/2010 09:16:09 PM, For Miscelenious wrote:
> -- I appologies for the terrible spelling - writing from the cell  
> phone is not smth I do well.
> 
> Re: extended partition overlap .
> Agree, that would be really stupid. Speaking of partitions. I'm  
> looking at my other drives, they do not have an extended partition  
> somehow. I always thought that the only way to cteate multiple  
> partitions is to have one primary and one extended. And then further  
> partition it. Is it a case or lm just been naive?
> 
> Re: log/messagesI actually have it (tail on /var/log/messages)  
> defaulted to 11 terminal- old habbit. And thru the whole ordeal I  
> didn't see anything worth mentioning.
> Thank you.
> Andrew
> -----Original message-----
> From: Stuart D Gathman <stuart@bmsi.com>
> To: linux-lvm@redhat.com
> Sent: Sun, Sep 5, 2010 23:23:18 GMT+00:00
> Subject: Re: [linux-lvm] Important diretories are missing after  
> adding space.
> 

------quoted attachment------
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
