Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i236CC820652
	for <linux-lvm@redhat.com>; Wed, 3 Mar 2004 01:12:12 -0500
Received: from mail.riseup.net (mail.riseup.net [216.162.217.191])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i236CBb22341
	for <linux-lvm@redhat.com>; Wed, 3 Mar 2004 01:12:11 -0500
Received: from pond (adsl-68-73-124-153.dsl.emhril.ameritech.net [68.73.124.153])
	(using TLSv1 with cipher EDH-RSA-DES-CBC3-SHA (168/168 bits))
	(No client certificate requested)
	by mail.riseup.net (Postfix) with ESMTP id B3B0270D2F
	for <linux-lvm@redhat.com>; Tue,  2 Mar 2004 22:12:05 -0800 (PST)
From: Micah Anderson <micah@riseup.net>
Subject: Re: [linux-lvm] ERROR: VGDA in kernel and lvmtab are NOT consistent
Message-ID: <20040303061200.GU10460@riseup.net>
References: <20040227233731.GO19709@riseup.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040227233731.GO19709@riseup.net>
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Wed Mar  3 01:10:05 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Additional information... I removed the webvg01 group by trashing the
information at the beginning of the disk (it had nothing in it). I
thought it might have been the problem. But it is still there... any
ideas?

micah

On Fri, 27 Feb 2004, Micah Anderson wrote:

> When I try to run vgdisplay, I get this error:
> 
> vgdisplay -- ERROR: VGDA in kernel and lvmtab are NOT consistent;
> please run vgscan
> 
> so, I run vgscan:
> 
> vgscan                                                       
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- found active volume group "rootvg"
> vgscan -- found active volume group "webvg01"
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your
> volume groups
> 
> then vgdisplay:
> 
> vgdisplay -- ERROR: VGDA in kernel and lvmtab are NOT consistent;
> please run vgscan
> 
> lvscan -- ERROR: VGDA in kernel and lvmtab are NOT consistent; 
>                please run vgscan
> 
> pvscan looks normal, tried doing pvscan, then vgscan/lvscan again, but
> got the same thing. I rebooted the machine, same thing. I removed
> webvg01 (it was empty), and redid things, same thing. I tried:
> 
> mv /etc/lvmtab /tmp
> pvscan
> vgscan
> vgdisplay
> 
> same problem....
> 
> This is debian stable, using kernel 2.4.22 LVM1, things seem to be
> working fine otherwise...
> 
> Thanks,
> micah
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
