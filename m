Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1RNbk819176
	for <linux-lvm@redhat.com>; Fri, 27 Feb 2004 18:37:46 -0500
Received: from mail.riseup.net (mail.riseup.net [216.162.217.191])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1RNbib30528
	for <linux-lvm@redhat.com>; Fri, 27 Feb 2004 18:37:45 -0500
Received: from pond (adsl-68-78-111-196.dsl.emhril.ameritech.net [68.78.111.196])
	(using TLSv1 with cipher EDH-RSA-DES-CBC3-SHA (168/168 bits))
	(No client certificate requested)
	by mail.riseup.net (Postfix) with ESMTP id BA5D46FC0E
	for <linux-lvm@redhat.com>; Fri, 27 Feb 2004 15:37:37 -0800 (PST)
From: Micah Anderson <micah@riseup.net>
Message-ID: <20040227233731.GO19709@riseup.net>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] ERROR: VGDA in kernel and lvmtab are NOT consistent
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
Date: Fri Feb 27 18:36:04 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

When I try to run vgdisplay, I get this error:

vgdisplay -- ERROR: VGDA in kernel and lvmtab are NOT consistent;
please run vgscan

so, I run vgscan:

vgscan                                                       
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "rootvg"
vgscan -- found active volume group "webvg01"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your
volume groups

then vgdisplay:

vgdisplay -- ERROR: VGDA in kernel and lvmtab are NOT consistent;
please run vgscan

lvscan -- ERROR: VGDA in kernel and lvmtab are NOT consistent; 
               please run vgscan

pvscan looks normal, tried doing pvscan, then vgscan/lvscan again, but
got the same thing. I rebooted the machine, same thing. I removed
webvg01 (it was empty), and redid things, same thing. I tried:

mv /etc/lvmtab /tmp
pvscan
vgscan
vgdisplay

same problem....

This is debian stable, using kernel 2.4.22 LVM1, things seem to be
working fine otherwise...

Thanks,
micah
