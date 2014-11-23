Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sANBlgtH018188
	for <linux-lvm@redhat.com>; Sun, 23 Nov 2014 06:47:42 -0500
Received: from mail.fibbs.org (phineas.fibbs.org [109.234.106.32])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sANBldDt002722
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL)
	for <linux-lvm@redhat.com>; Sun, 23 Nov 2014 06:47:41 -0500
Received: from localhost (localhost [127.0.0.1])
	by mail.fibbs.org (Postfix) with ESMTP id C8D95200680
	for <linux-lvm@redhat.com>; Sun, 23 Nov 2014 12:47:38 +0100 (CET)
Received: from mail.fibbs.org ([127.0.0.1])
	by localhost (mail.fibbs.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id tbUoz8-YfNdT for <linux-lvm@redhat.com>;
	Sun, 23 Nov 2014 12:47:38 +0100 (CET)
Received: from [192.168.178.100] (p50895AA0.dip0.t-ipconnect.de
	[80.137.90.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mail.fibbs.org (Postfix) with ESMTPSA id 64687200431
	for <linux-lvm@redhat.com>; Sun, 23 Nov 2014 12:47:38 +0100 (CET)
Message-ID: <5471C959.7020301@mglug.de>
Date: Sun, 23 Nov 2014 12:47:37 +0100
From: Oliver Rath <rath@mglug.de>
MIME-Version: 1.0
References: <1416329721.17053.YahooMailBasic@web181504.mail.ne1.yahoo.com>
In-Reply-To: <1416329721.17053.YahooMailBasic@web181504.mail.ne1.yahoo.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] mixed ssd/disk szenario question: moving lv from
 ssd	->disk?
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

Hi Matthew,

i have to correct my last email: This works also with thinpool-lvs!
Better said: There was no error message executing  this command. Will
walk on this way for more reults. Maybe the lvconvert-manpage is outdated?

Tfh!
Oliver


Am 18.11.2014 um 17:55 schrieb matthew patton:
> I think 'lvconvert --replace /dev/<ssd> VG/LV /dev/<slow disk>'
> will do what you want.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
