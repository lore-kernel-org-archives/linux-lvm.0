Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r63D83kn017003
	for <linux-lvm@redhat.com>; Wed, 3 Jul 2013 09:08:03 -0400
Received: from moutng.kundenserver.de (moutng.kundenserver.de [212.227.17.8])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r63D81LM010947
	for <linux-lvm@redhat.com>; Wed, 3 Jul 2013 09:08:02 -0400
Message-ID: <51D4222E.1020809@deriva.de>
Date: Wed, 03 Jul 2013 15:07:58 +0200
From: =?ISO-8859-1?Q?Christian_Schr=F6der?= <cs@deriva.de>
MIME-Version: 1.0
References: <039e01ce7749$7874c6c0$695e5440$@deriva.de>
	<1372817573.68865.YahooMailNeo@web181501.mail.ne1.yahoo.com>
In-Reply-To: <1372817573.68865.YahooMailNeo@web181501.mail.ne1.yahoo.com>
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
thank a lot for your helpful comments. Unfortunately, it seems that I did not describe in enough
detail what I want to achieve ...

 >> and it is always visible, but unavailable to the other client.
 >> So far, everything seems to work fine. Now my question is: Is this setup
 >> sufficient or do I need cLVM?
 > You don't need cLVM just as long as you never screw up. It's been a while since I played with just such a setup but,
 >
 > 1) edit lvm.conf and disable all metadata caching

I have searched the lvm documentation, but could not find anything about metadata caching.
I did find some notes about the the Metadata Daemon (lvmetad), but it does not seem to be used by default.
Could you give me a hint which setting should be used to disable caching?

 > 2) edit lvm.conf and set the locking style to '4' and set wait_for_locks=0

The clients have a local volume group besides the shared one. Setting the locking style to 4 prevents
modification of this local volume group, too, so it does not seem to be an option.

 > The main complication is with (de)activating LV and assigning it to the other host. I forget what happens if you do an 'lvchange -ay ' on a common LV and the other host has already done so. In any event you'll want to make sure all LVs are NOT automatically activated (default) on bootup.

Each LV is statically assigned to one single host. I do not plan to detach a LV from one host and assign
it to the other. I simply want to give the same (large) volume group to both hosts so each of them can
create its own (private) LVs in it.

 > The best option is to implement your own locking module (ie. repurpose the negotiation/handshake/quorum code from eg. CARP) and your locking module just checks to see if "am I master? T or F" and punts if not. More than a handful of hosts and I would spend the energy getting cLVM working. Though it took me way longer than it should have to get things to stop hanging for all eternity (kernel messages about stalled threads and what not) and for it to behave correctly even if I willy-nilly power-reset the boxes.

As I tried to describe above, the hosts do not behave as master or slave. That's why I would not actually
talk about a cluster. Instead, the iSCSI target should behave like some kind of network storage (like,
let's say, NetApp) that provides a huge disk (i.e. volume group) in which the clients can create their LVs
without any further dependencies between each other.
Is this possible with or without cLVM?

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
