Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p4P8Bg2x030015
	for <linux-lvm@redhat.com>; Wed, 25 May 2011 04:11:43 -0400
Received: from smtp.smtpout.orange.fr (smtp06.smtpout.orange.fr
	[80.12.242.128])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p4P8Bfb4003660
	for <linux-lvm@redhat.com>; Wed, 25 May 2011 04:11:42 -0400
Received: from localhost (localhost [127.0.0.1])
	by axege.com (Postfix) with ESMTP id 226D650089
	for <linux-lvm@redhat.com>; Wed, 25 May 2011 10:17:03 +0200 (CEST)
Received: from axege.com ([127.0.0.1])
	by localhost (axege.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w8Q8tP-65WRz for <linux-lvm@redhat.com>;
	Wed, 25 May 2011 10:17:02 +0200 (CEST)
Received: from [10.0.0.69] (unknown [10.0.0.69])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by axege.com (Postfix) with ESMTPSA id 957F750067
	for <linux-lvm@redhat.com>; Wed, 25 May 2011 10:17:02 +0200 (CEST)
From: "Franck Routier (personnel)" <alci@mecadu.org>
In-Reply-To: <20110524131451.GB27519@redhat.com>
References: <1306228823.2195.9.camel@franck-VPCCW2S1E>
	<1306230666.2195.10.camel@franck-VPCCW2S1E>
	<20110524131451.GB27519@redhat.com>
Date: Wed, 25 May 2011 10:11:38 +0200
Message-ID: <1306311098.3911.5.camel@franck-VPCCW2S1E>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Trim support on stripped volumes ?
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

Le mardi 24 mai 2011 à 09:14 -0400, Mike Snitzer a écrit :

> When using -o discard, ext4 will log a warning if a discard failed (and
> will disable discards).
> 
> So ext4 is a great indicator for whether discards are working on your
> striped LV volume.
> 

Just out of curiosity, how does ext4 tell if discards is working or
not ?
