Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r68Av3kH028439
	for <linux-lvm@redhat.com>; Mon, 8 Jul 2013 06:57:04 -0400
Received: from moutng.kundenserver.de (moutng.kundenserver.de [212.227.17.9])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r68Av133005560
	for <linux-lvm@redhat.com>; Mon, 8 Jul 2013 06:57:01 -0400
Message-ID: <51DA9AF9.7050807@deriva.de>
Date: Mon, 08 Jul 2013 12:56:57 +0200
From: =?ISO-8859-1?Q?Christian_Schr=F6der?= <cs@deriva.de>
MIME-Version: 1.0
References: <039e01ce7749$7874c6c0$695e5440$@deriva.de>
	<1372817573.68865.YahooMailNeo@web181501.mail.ne1.yahoo.com>
	<51D4222E.1020809@deriva.de>
	<1372859936.18752.YahooMailNeo@web181505.mail.ne1.yahoo.com>
	<51D811EF.7070102@deriva.de>
	<1373132415.9586.YahooMailNeo@web181505.mail.ne1.yahoo.com>
In-Reply-To: <1373132415.9586.YahooMailNeo@web181505.mail.ne1.yahoo.com>
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

On 06.07.2013 19:40, matthew patton wrote:
>> (either hard-coded or using tags) is *necessary* to make things working or if it
>> is just *adviseable* to prevent using a volume simultaneously from both clients?
>
> You could probably make a case for saying it's adviseable but why do you want to play roulette with your data? Force it to do the right thing and you won't have to run the risk of it doing something unintended. Why the trepidation to doing it correctly?

I just try to understand how things work. But you indeed convinced me to 
use tags.

>> logical values are found by vgscan / lvscan, but I cannot access it. Is this the
>> expected behavior? Is there any chance (besides rebooting the client machine) to
>> recover from such a situation?
>
> How did you disconnect from iSCSI? Did you gracefully log out of the client session? However you did it, it seems the kernel believes the device was just yanked offline and after repeated I/O failures marked it bad. Re-introducing the device doesn't magically clear the error state. Then again maybe it's as simple as you not bringing it fully online with a 'vgchange -ay <vg>' and an 'lvchange -ay <lv>'.

After some further investigation I think I have found the reason for the 
observed behavior: When I log out of the client session, the block 
device (/dev/sda in my case) still seems to be used, probably by the 
device mapper itself. So when I log in again, the iSCSI device gets 
another device node (/dev/sdb) which obviously doesn't help for the 
logical volume. When I deactivate and reactivate the LV, it gets 
connected to the new block device and works again.
It also works if I deactivate the LV before logging out of the iSCSI 
session. Then the block device is released and reused when I reconnect. 
In any case, it seems to be necessary to deactivate and reactivate the LV.

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
