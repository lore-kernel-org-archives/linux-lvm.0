Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3M45Vp05854
	for <linux-lvm@redhat.com>; Thu, 22 Apr 2004 00:05:31 -0400
Received: from newsguy.com (smtp.newsguy.com [129.250.170.69])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i3M45UMc010141
	for <linux-lvm@redhat.com>; Thu, 22 Apr 2004 00:05:31 -0400
Received: from pobox.com (node-423a1512.mdw.onnet.us.uu.net [66.58.21.18])
	by newsguy.com (8.12.9/8.12.8) with ESMTP id i3M45O4n040538
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2004 21:05:24 -0700 (PDT)
	(envelope-from msroark@pobox.com)
Message-ID: <4087447F.2060906@pobox.com>
Date: Wed, 21 Apr 2004 23:05:19 -0500
From: Mike Roark <msroark@pobox.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] OS (Debian Sarge) reinstall led to my lvm partition
	being marked 82 "Linux swap!"
References: <20040421160426.690797376D@hormel.redhat.com>
In-Reply-To: <20040421160426.690797376D@hormel.redhat.com>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

> 
> Just changing the partition type is perfectly safe - provided you don't change
> any other partition parameters! if the partition type is wrong then LVM1 will
> fail to recognise the VGs so that sounds like it is your problem.
> 
> 
> -- patrick

Patrick,
	Thanks for the advice. I was too afraid to try it, but after your input 
and some other people I know I gave it a shot and vgscan picked up the 
volume on the first try. Problem solved. I have also opened a bug with 
Debian over the potential issue with their new installer.
			Thanks again,

				-Mike
