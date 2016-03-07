Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u27K3EQR009690
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Mon, 7 Mar 2016 15:03:14 -0500
Received: from mailrelay.lanline.com (mailrelay.lanline.com [216.187.10.16])
	by mx1.redhat.com (Postfix) with ESMTPS id 88EAE7F0AB
	for <linux-lvm@redhat.com>; Mon,  7 Mar 2016 20:03:13 +0000 (UTC)
Received: from mycroft.westnet.com (Mycroft.westnet.com [216.187.52.7])
	by mailrelay.lanline.com (8.14.5/8.14.5) with ESMTP id u27K0fDP084690
	for <linux-lvm@redhat.com>; Mon, 7 Mar 2016 15:00:41 -0500 (EST)
	(envelope-from john@stoffel.org)
Received: from quad.stoffel.org (66-189-26-192.dhcp.oxfr.ma.charter.com
	[66.189.26.192]) (authenticated bits=0)
	by mycroft.westnet.com (8.14.4/8.14.4) with ESMTP id u27Jk96d025956
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 7 Mar 2016 14:46:10 -0500 (EST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <22237.56958.981481.778563@quad.stoffel.home>
Date: Mon, 7 Mar 2016 15:03:10 -0500
From: "John Stoffel" <john@stoffel.org>
In-Reply-To: <56DDBAF8.8040105@yahoo.co.uk>
References: <56DDBAF8.8040105@yahoo.co.uk>
Subject: Re: [linux-lvm] lvm protected against crypt/luks
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


lejeczek> would you know if kernel/lvm protects PVs (or any other 
lejeczek> parts for that matter) from being encrypted?

Not beyond the usual unix permissions.  I.e. user's can't generally
write to raw volumes/PVs/LVs.  But root can do whatever it wants.
Sometimes it tries to stop you from over-writing mounted filesystems,
but that can be gotten around without much hassle.

lejeczek> Do I need to wipe block devices clean off any LVM traces in 
lejeczek> order to encrypt them?

No... but it's probably a good idea to do so initially, which is
really to just zero it out. But LV information is stored within the
VG, which is stored within the PVs which make it up.

So when you do a pvremove, it will wipe the device which holds the VG
data.  

lejeczek> BTW, LVs cannot be luks encrypted, can they?

Of course they can.  Then you just loop mount the encrypted LUKS
device (physical disk or LV, or even a file) and then put a filesystem
on the new device.  Then you mount that filesystem and away you go.

I would look up on google for beginner tutorials on using LUKs.

John
