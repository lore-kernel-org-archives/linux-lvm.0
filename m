Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iB6LP4r02992
	for <linux-lvm@redhat.com>; Mon, 6 Dec 2004 16:25:04 -0500
Received: from delirium.voip.primustel.com ([209.227.165.143])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iB6LOvia009281
	for <linux-lvm@redhat.com>; Mon, 6 Dec 2004 16:24:58 -0500
Received: from male.ia.us.primus (male.cv.telegroup.com [10.40.40.244])
	by delirium.voip.primustel.com (Postfix) with ESMTP id 6D4EEEE9F
	for <linux-lvm@redhat.com>; Mon,  6 Dec 2004 21:24:52 +0000 (UTC)
Received: from benway.cv.telegroup.com (benway.cv.telegroup.com [10.40.41.175])
	by male.ia.us.primus (8.12.10/8.12.10) with ESMTP id iB6LM0xl001090
	for <linux-lvm@redhat.com>; Mon, 6 Dec 2004 15:22:00 -0600
Subject: Re: [linux-lvm] Huge memory allocation...
From: Aran Cox <acox@ia.primustel.com>
In-Reply-To: <1102350496.3579.49.camel@benway>
References: <1102350496.3579.49.camel@benway>
Date: Mon, 06 Dec 2004 15:21:59 -0600
Message-Id: <1102368120.3579.67.camel@benway>
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

On Mon, 2004-12-06 at 10:28 -0600, Aran Cox wrote:
>  Could there be metadata lurking on
> that disk that confuses the utilities?  

I basically did a:
pvremove /dev/hdb

And now the error messages are gone.  It looks like I had lvm1 metadata
(corrupt or not) on the /dev/hdb device.  

I guess I posted a little too soon...

-- 
Aran Cox <acox@ia.primustel.com>
