Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o0BFIukZ012041
	for <linux-lvm@redhat.com>; Mon, 11 Jan 2010 10:18:56 -0500
Received: from fg-out-1718.google.com (fg-out-1718.google.com [72.14.220.152])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o0BFIec8029742
	for <linux-lvm@redhat.com>; Mon, 11 Jan 2010 10:18:41 -0500
Received: by fg-out-1718.google.com with SMTP id 19so1754168fgg.9
	for <linux-lvm@redhat.com>; Mon, 11 Jan 2010 07:18:40 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4B4B31DC.6030900@tele2.com>
References: <4B3B28E5.5030208@tele2.com> <4B3B2C05.1070902@tele2.com> 
	<29ae894c0912300352k29bbd06dha89b7dd0045c550@mail.gmail.com> 
	<1262609658.18517.3.camel@localhost>
	<29ae894c1001040517sa6bb7f9v56915a22a820d2c4@mail.gmail.com> 
	<4B4319D1.2020301@tele2.com> <4B4321A4.1030005@tele2.com> 
	<4B4364F5.40209@tele2.com> <4B4B31DC.6030900@tele2.com>
From: Eugene Vilensky <evilensky@gmail.com>
Date: Mon, 11 Jan 2010 09:18:20 -0600
Message-ID: <f4f537b51001110718u598c1385v28c2143d2705be7d@mail.gmail.com>
Subject: Re: [linux-lvm] LVM preference for multipath verses disk/by-id/scsi
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
Content-Transfer-Encoding: 7bit
To: simon.loewenthal@klunky.co.uk, LVM general discussion and development <linux-lvm@redhat.com>

> How do I really know LVM is really using the mutlipath other than
> disabling one of the ports on the switch, which I don't wish to do on a
> production box.

man multipath, specifically the -l and -ll flags.
