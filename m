Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5DHc38a008488
	for <linux-lvm@redhat.com>; Tue, 13 Jun 2006 13:38:03 -0400
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5DHc1Fj020532
	for <linux-lvm@redhat.com>; Tue, 13 Jun 2006 13:38:02 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1FqCpr-00080L-M4
	for linux-lvm@redhat.com; Tue, 13 Jun 2006 19:37:51 +0200
Received: from 221.125.22.76 ([221.125.22.76])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Tue, 13 Jun 2006 19:37:51 +0200
Received: from thomas by 221.125.22.76 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Tue, 13 Jun 2006 19:37:51 +0200
From: "Thomas" <thomas@meiwing.com>
Date: Wed, 14 Jun 2006 01:37:33 +0800
Message-ID: <e6mt4v$nlp$1@sea.gmane.org>
References: <448EEF41.7000404@netshadow.at>
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] Re: undelete logical volume
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-lvm@redhat.com

Use RIP (R)ecovery (I)s (P)ossible! (v15.2)  to boot up.
And use command hexdump /dev/hda1 to collect the old LVM config information.
They are nearly 1200.
Use the information to create a metadata file.
Use cfgrestore to recover.
Then mount back the lost LogVol00.

Just my two cents.
"Andreas Unterkircher" <unki@netshadow.at> �b�l��
news:448EEF41.7000404@netshadow.at �����g...
> Hi,
>
> I made a big mistake and deleted a logical volume with some still needed
data.
>
> It was the only active lv and no other write access happened on the
physical
> disks till yet. Also I have no backup of lvm's metadata.
>
> Is there any way to recover the lost logical volume? (lvm2)
>
> Andreas
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
