Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iB730Fr15438
	for <linux-lvm@redhat.com>; Mon, 6 Dec 2004 22:00:15 -0500
Received: from desire.voip.primustel.com (_postfix@[208.219.5.17])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iB7304mT030251
	for <linux-lvm@redhat.com>; Mon, 6 Dec 2004 22:00:14 -0500
Received: from cain (benway.cv.telegroup.com [10.40.41.175])
	by desire.voip.primustel.com (Postfix) with ESMTP id 3C61311C72
	for <linux-lvm@redhat.com>; Tue,  7 Dec 2004 02:26:34 +0000 (UTC)
Subject: Re: [linux-lvm] Huge memory allocation...
From: Aran Cox <acox@ia.primustel.com>
In-Reply-To: <1102368120.3579.67.camel@benway>
References: <1102350496.3579.49.camel@benway> <1102368120.3579.67.camel@benway>
Date: Mon, 06 Dec 2004 20:26:33 -0600
Message-Id: <1102386393.5390.0.camel@cain>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, 2004-12-06 at 15:21 -0600, Aran Cox wrote:
> On Mon, 2004-12-06 at 10:28 -0600, Aran Cox wrote:
> >  Could there be metadata lurking on
> > that disk that confuses the utilities?  
> 
> I basically did a:
> pvremove /dev/hdb
> 
Once again I posted too soon.  I also had to recreate the partition
table on that disk after the pvremove.   Still, all's well that ends
well I guess.
-- 
Aran Cox <acox@ia.primustel.com>
