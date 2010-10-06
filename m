Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o96Gbf3w031695
	for <linux-lvm@redhat.com>; Wed, 6 Oct 2010 12:37:41 -0400
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o96GbUmx010798
	for <linux-lvm@redhat.com>; Wed, 6 Oct 2010 12:37:30 -0400
Received: from r74-192-2-154.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.2.154] helo=raydesk1.bettercgi.com)
	by ps536.phatservers.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.66) (envelope-from <support@bettercgi.com>)
	id 1P3WzX-0006p9-VO
	for linux-lvm@redhat.com; Wed, 06 Oct 2010 09:37:21 -0700
Date: Wed, 06 Oct 2010 11:37:18 -0500
From: Ray Morris <support@bettercgi.com>
References: <87y6adm5hs.fsf@twilight.int.mornfall.net>
	<11404.7696.qm@web120712.mail.ne1.yahoo.com>
In-Reply-To: <11404.7696.qm@web120712.mail.ne1.yahoo.com> (from
	jrharris19@yahoo.com on Wed Oct  6 10:50:41 2010)
Message-Id: <1286383038.7114.6@raydesk1.bettercgi.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] LVM mirror questions
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

   Please let us know the results of your mirror testing.
--
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php


On 10/06/2010 10:50:41 AM, Jay wrote:
> Hi Petr,
> 
> Thanks for the reply.  "Should continue to work.." leaves me with  
> some doubt.
>  My intent for a mirror is for a datastore that has reliability at  
> the expense
> of space.   In addition, when a large datastore is rebooted, there  
> would be a
> period of time when the data is being mirrored, which leaves a window  
> of
> peril. After I migrate my data off of lvm and onto an md device, I  
> will test
> lvm.
> 
> Test #1 will be start a huge write operation on a mirror that  
> consists of 2
> mirrors and 1 log, all on seperate pvs.   While the write operation is
> happening, I will unplug the log drive and see if lvm switches in  
> midstream to a
> memory log without loss.
> 
> Test #2 will be to see if I can make lvm activate lvs or vgs in a  
> certain order.
>   That way I could make the first 20 extents of every physical device  
> part of a
> vg/lv that houses mirror logs.   These log lvs would be mirrored  
> across all
> physical devices.   The log lvs would have memory logs, which would  
> be ok since
> they will be so small.     The window of peril is reduced from hours  
> to a few
> seconds.
> 
> Anyways, thanks again for the answer!
> 
> Jason Harris
> 
> 
> 
> ________________________________
> From: Petr Rockai <prockai@redhat.com>
> To: LVM general discussion and development <linux-lvm@redhat.com>
> Sent: Tue, October 5, 2010 1:02:55 AM
> Subject: Re: [linux-lvm] LVM mirror questions
> 
> Jay <jrharris19@yahoo.com> writes:
> > What happens to an lvm mirror if the disk log is lost?
> 
> The mirror should continue to work with a core (memory) log.
> 
> Yours,
>    Petr.
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
> 
> 

------quoted attachment------
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
