Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q3OEqwX7003611
	for <linux-lvm@redhat.com>; Tue, 24 Apr 2012 10:52:58 -0400
Received: from www.bettercgi.com (www.bettercgi.com [74.122.122.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q3OEqtEM022052
	for <linux-lvm@redhat.com>; Tue, 24 Apr 2012 10:52:55 -0400
Received: from localhost (r74-192-17-33.bcstcmta01.clsttx.tl.dh.suddenlink.net
	[74.192.17.33])
	by www.bettercgi.com (Postfix) with ESMTPSA id 4A85F213CD
	for <linux-lvm@redhat.com>; Tue, 24 Apr 2012 09:52:52 -0500 (CDT)
Date: Tue, 24 Apr 2012 09:52:52 -0500
From: Ray Morris <support@bettercgi.com>
Message-ID: <20120424095252.15fdcb07@bettercgi.com>
In-Reply-To: <4F969B43.2080504@ki.tng.de>
References: <4F969B43.2080504@ki.tng.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] calculating size of metadata.
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
To: linux-lvm@redhat.com

It's good think about this because running out of metadata space is no
fun. We use 181KB for about 300 LVs, where each snapshot is counted as
two LVs because of the way it's stored.  That's based on the size of the
backup. vgs shows 8 MB of metadata used, though:

# vgs --units k -o vg_mda_count,vg_mda_free,vg_mda_size clones
vgs  #VMda VMdaFree  VMdaSize 
vgs      3  7973.50k 16444.00k

In any event, on a 19,950,000 MB partition, even 64 MB of metadata
would represent 0.0006% of the storage. To think of it another way, 64
MB costs roughly 0.03 cents, so allocate plenty.
-- 
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php




On Tue, 24 Apr 2012 14:23:31 +0200
Jan-Hendrik Palic <billgotchy@ki.tng.de> wrote:

> Hi there,
> 
> we planning to create a pv and vg on a 19,95TB partition running on 
> raid6. One issue I have is the size of the metadata. I am looking for
> a way to calculate the this size, but unfortunatly, I cannot find a
> some. Which size should I use?
> 
> Thanks in advance.
> 
> Jan
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
