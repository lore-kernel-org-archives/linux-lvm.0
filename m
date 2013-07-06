Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r66ClqDR007887
	for <linux-lvm@redhat.com>; Sat, 6 Jul 2013 08:47:52 -0400
Received: from moutng.kundenserver.de (moutng.kundenserver.de [212.227.17.9])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r66ClkGp030699
	for <linux-lvm@redhat.com>; Sat, 6 Jul 2013 08:47:47 -0400
Message-ID: <51D811EF.7070102@deriva.de>
Date: Sat, 06 Jul 2013 14:47:43 +0200
From: =?ISO-8859-1?Q?Christian_Schr=F6der?= <cs@deriva.de>
MIME-Version: 1.0
References: <039e01ce7749$7874c6c0$695e5440$@deriva.de>
	<1372817573.68865.YahooMailNeo@web181501.mail.ne1.yahoo.com>
	<51D4222E.1020809@deriva.de>
	<1372859936.18752.YahooMailNeo@web181505.mail.ne1.yahoo.com>
In-Reply-To: <1372859936.18752.YahooMailNeo@web181505.mail.ne1.yahoo.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Is cLVM necessary when accessing different logical
 volumes on a shared iSCSI target?
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-lvm@redhat.com

Hi Matthew,
thanks again for your comments. The idea to use tags is very 
interesting. I will have a deeper look at it. However, I still do not 
understand if filtering (either hard-coded or using tags) is *necessary* 
to make things working or if it is just *adviseable* to prevent using a 
volume simultaneously from both clients?
When I tried to set up the scenario as described, I encountered another 
problem which might be related to the sharing stuff: When I virtually 
disconnect the physical volume (by disconnecting from the iSCSI server) 
and reconnect again, I get i/o errors when I try to access a logical 
volume. I have tried pvscan, vgscan and lvscan, but nothing helps. 
Interestingly, the volume group and all logical values are found by 
vgscan / lvscan, but I cannot access it. Is this the expected behavior? 
Is there any chance (besides rebooting the client machine) to recover 
from such a situation?

Regards,
Christian

-- 
Deriva GmbH                         Tel.: +49 551 489500-42
Financial IT and Consulting         Fax:  +49 551 489500-91
Hans-B�ckler-Stra�e 2                  http://www.deriva.de
D-37079 G�ttingen

Amtsgericht G�ttingen | HRB 3240
Gesch�ftsf�hrer: Dirk Baule, Christian Schr�der
Deriva CA Certificate: http://www.deriva.de/deriva-ca.cer
