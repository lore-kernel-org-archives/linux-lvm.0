Return-Path: <SRS0=MfZM=PI=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81E86C433EF
	for <linux-lvm@archiver.kernel.org>; Wed, 20 Oct 2021 13:39:52 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECE20610A2
	for <linux-lvm@archiver.kernel.org>; Wed, 20 Oct 2021 13:39:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ECE20610A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bdmcc-us.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-8PDoX3SzOr-h03AWyLPBkw-1; Wed, 20 Oct 2021 09:39:46 -0400
X-MC-Unique: 8PDoX3SzOr-h03AWyLPBkw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02F0F46675;
	Wed, 20 Oct 2021 13:39:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 320A510023AB;
	Wed, 20 Oct 2021 13:39:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 92E5F4EA2A;
	Wed, 20 Oct 2021 13:38:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19KDctJY006083 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 20 Oct 2021 09:38:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C8D22BDC4C; Wed, 20 Oct 2021 13:38:55 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C2C75D0161
	for <linux-lvm@redhat.com>; Wed, 20 Oct 2021 13:38:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A65D800186
	for <linux-lvm@redhat.com>; Wed, 20 Oct 2021 13:38:50 +0000 (UTC)
Received: from friday.buadh-brath.com (drochaid.buadh-brath.com
	[45.33.103.245]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-553-7P61e7PJO3yqId7rvMh0sg-1; Wed, 20 Oct 2021 09:38:48 -0400
X-MC-Unique: 7P61e7PJO3yqId7rvMh0sg-1
Received: from [69.133.187.32] (helo=buadh-brath.com)
	by friday.buadh-brath.com with esmtp (Exim 4.89)
	(envelope-from <bdmc@mail.buadh-brath.com>) id 1mdBnq-00039e-VP
	for linux-lvm@redhat.com; Wed, 20 Oct 2021 13:38:47 +0000
Received: by buadh-brath.com (Postfix, from userid 1000)
	id 44FA9201C0; Wed, 20 Oct 2021 09:38:28 -0400 (EDT)
Date: Wed, 20 Oct 2021 09:38:28 -0400
From: Brian McCullough <bdmc@bdmcc-us.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Message-ID: <20211020133828.GE9096@bdmcc-us.com>
References: <20211018021719.GA16936@bdmcc-us.com>
	<CAAMCDedrphwa+RRr1PHLD0SXi8fEDM87zV82302T=twRa5qBZA@mail.gmail.com>
	<20211018194508.GC28815@bdmcc-us.com>
	<CAAMCDeeTwESRvs5jPNuTXn-q7Fse1xqAc+yd-0swjc7NrAyqAw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAMCDeeTwESRvs5jPNuTXn-q7Fse1xqAc+yd-0swjc7NrAyqAw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-lvm@redhat.com
Subject: Re: [linux-lvm] Recovering "broken" disk ( 17th )
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Oct 19, 2021 at 05:06:37AM -0500, Roger Heflin wrote:
> I would edit the vgconfig you dd'ed with an editor and make sure it looks
> reasonable for what you think you had.

It turns out, comparing the information that I pulled off of the drive
with what I find in /etc/lvm/backup, that the first part of the vgconfig
information is missing.  As I said in one of my messages, the
information that I retrieved from the disk starts at 0x1200.  I don't
know whether that is correct or not.  It does not appear to be a proper
"backup" file, which I think it should be.

I rebooted ( partially ) the machine and copied the vgconfig backup file
from that, but am somewhat concerned, because I don't seem to be able to
match the UUIDs.  The one that I seem to see in the vgconfig data that I
pulled off of the drive vs what I got out of /etc/lvm/backup.  Maybe I
am just mis-reading it.  I will continue my research for a bit.




> When you do the pvcreate --uuid it won't use anything except the uuid info
> so the rest may not need to be exactly right, if you have to do a
> vgcfgrestore to get it to read the rest of the info will be used.

Oh, thank you.   I did see that things got somewhat different on the
target drive when I did "pvcreate --uuid --restorefile."  I got paranoid
when I saw that, and re-copied the ddrestore file back to the target
drive before I did anything else.   Should I do "pvcreate --uuid
--norestorefile," instead?  Then, once it is back in the machine, do the
pvscan and vgcfgrestore, and expect good things?



> I have seen some weird disk controller failures that appeared to zero out
> the first bit of the disk (enough to get the partition table, grub, and the
> pv header depending on where the first partition starts).

I APPEAR to have a partition table, containing an NTFS partition, an LVM
partiton ( the one that I am concentrating on ) and a Linux partion.  I
would have thought that it was all LVM, but my memory could easily be
wrong.



> You will need to reinstall grub if this was the bootable disk, since there
> were 384 bytes of grub in the sector with the partition table that you know
> are missing.

Fortunately, this is all data, nothing to do with the boot sequence,
except that the machine will not boot with the missing PV.



Thank you,
Brian

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

