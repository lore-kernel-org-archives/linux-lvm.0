Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o0BG75GK003479
	for <linux-lvm@redhat.com>; Mon, 11 Jan 2010 11:07:05 -0500
Received: from smtp-auth.no-ip.com (smtp-auth.no-ip.com [204.16.252.95])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o0BG6svl010680
	for <linux-lvm@redhat.com>; Mon, 11 Jan 2010 11:06:54 -0500
Received: from [127.0.0.1] (unknown [62.58.16.80])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: simonloewen.com@noip-smtp)
	by smtp-auth.no-ip.com (Postfix) with ESMTPSA id 03DB0B4883D
	for <linux-lvm@redhat.com>; Mon, 11 Jan 2010 08:06:53 -0800 (PST)
Message-ID: <4B4B4C90.3030407@klunky.co.uk>
Date: Mon, 11 Jan 2010 17:06:40 +0100
From: Simon Loewenthal/NL/Tele2 <simon.loewenthal@klunky.co.uk>
MIME-Version: 1.0
References: <4B3B28E5.5030208@tele2.com> <4B3B2C05.1070902@tele2.com>
	<29ae894c0912300352k29bbd06dha89b7dd0045c550@mail.gmail.com>
	<1262609658.18517.3.camel@localhost>	<29ae894c1001040517sa6bb7f9v56915a22a820d2c4@mail.gmail.com>
	<4B4319D1.2020301@tele2.com> <4B4321A4.1030005@tele2.com>
	<4B4364F5.40209@tele2.com> <4B4B31DC.6030900@tele2.com>
	<f4f537b51001110718u598c1385v28c2143d2705be7d@mail.gmail.com>
In-Reply-To: <f4f537b51001110718u598c1385v28c2143d2705be7d@mail.gmail.com>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

I don't see the connection with multipath and the lvm.conf?  Multipath
is running well.
The setting :

write_cache_state = 1 

is in the lvm.conf.





Eugene Vilensky wrote:
>> How do I really know LVM is really using the mutlipath other than
>> disabling one of the ports on the switch, which I don't wish to do on a
>> production box.
>>     
>
> man multipath, specifically the -l and -ll flags.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>   
