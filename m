Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p1NGDX4g021833
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 11:13:33 -0500
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p1NGDPsQ012624
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 11:13:25 -0500
Received: from r74-192-17-33.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.17.33] helo=localhost)
	by ps536.phatservers.com with esmtpa (Exim 4.66)
	(envelope-from <support@bettercgi.com>) id 1PsHKm-0000mY-Fr
	for linux-lvm@redhat.com; Wed, 23 Feb 2011 08:13:04 -0800
Date: Wed, 23 Feb 2011 10:12:59 -0600
From: Ray Morris <support@bettercgi.com>
Message-ID: <20110223101259.77143753@bettercgi.com>
In-Reply-To: <4D651735.1000802@abpni.co.uk>
References: <4D64FF3C.6080602@abpni.co.uk> <1298466573.19562.147.camel@ubuntu>
	<4D65124C.1070505@abpni.co.uk> <1298470564.19562.150.camel@ubuntu>
	<4D651735.1000802@abpni.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Snapshots and disk re-use
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

On 23/02/11 14:16, Joe Thornber wrote:
>  And how do I zero just exception store?


In this example, the normal lv is c1_s1.
It has two snapshots, c1_s1_snap0 and c1_s1_snap1.

List the underlying volumes like so:

[root@clonebox2 ~]# ls -1  /dev/mapper/clones-c1_s1*
/dev/mapper/clones-c1_s1
/dev/mapper/clones-c1_s1-real
/dev/mapper/clones-c1_s1_snap0
/dev/mapper/clones-c1_s1_snap0-cow
/dev/mapper/clones-c1_s1_snap1
/dev/mapper/clones-c1_s1_snap1-cow

Half of those would be hidden to lvdisplay, though the man 
page will probably tell you how to show hidden LVs.  "ls"
shows them all.

c1_s1_snap0-cow and c1_s1_snap1-cow are the copy on write 
volumes, the exception stores, I believe.  -real is where 
the current data lives, and c1_s1, the "main" LV is a basically 
a proxy which reads directly from -rela, but diverts writes
so that old data is copied to -cow.  -snap0 is a proxy which 
reads from either -cow or -real as needed.  Hopefully someone 
will tell me where I'm wrong, if I am.

Zeroing c1_s1 first, then c1_s1_snap0-cow would zero everything, 
or zeroing -real and -cow would be more efficient because you 
avoid the copy on write penalty when zeroing the origin. I haven't
actually tested this, only reasoned through it.
-- 
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php




On Wed, 23 Feb 2011 14:18:29 +0000
Jonathan Tripathy <jonnyt@abpni.co.uk> wrote:

> 

> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
