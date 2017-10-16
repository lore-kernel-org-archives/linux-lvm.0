Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BC3E4D6FE
	for <linux-lvm@redhat.com>; Mon, 16 Oct 2017 21:24:06 +0000 (UTC)
Received: from mail.stoffel.org (mail.stoffel.org [104.236.43.127])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3EFFD267C2
	for <linux-lvm@redhat.com>; Mon, 16 Oct 2017 21:24:05 +0000 (UTC)
Received: from quad.stoffel.org (66-189-75-104.dhcp.oxfr.ma.charter.com
	[66.189.75.104])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.stoffel.org (Postfix) with ESMTPSA id 857AA5FA87
	for <linux-lvm@redhat.com>; Mon, 16 Oct 2017 17:16:14 -0400 (EDT)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <23013.8606.182033.796766@quad.stoffel.home>
Date: Mon, 16 Oct 2017 17:16:14 -0400
From: "John Stoffel" <john@stoffel.org>
In-Reply-To: <cdc20ea7-200b-d998-a7f5-85ed622e84e2@yahoo.co.uk>
References: <cdc20ea7-200b-d998-a7f5-85ed622e84e2@yahoo.co.uk>
Subject: Re: [linux-lvm] raid10 to raid what? - convert
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


lejeczek> I'm sroogling and reading but before spend whole day doing
lejeczek> that, I was hoping you guys, gals, done conversion from
lejeczek> raid10?

Please post your configuration and explain what you're trying to do in
more detail.

lejeczek> I'm thinking best(natural?) would be to convert to two raid0
lejeczek> LVs, right. Am I right? Would it be optimal, and how do you
lejeczek> do it?

You don't put LVs directly ontop of RAID0, you put them in VGs, which
reside in PVs, which reside on disks or RAIDs, or iSCSI LUNs, etc.

It sounds like you have two filesystems, each in their own LV.  You
want to move them off a RAID10 (four disks, in two mirrored PAIRS,
stripped across them is what I assume), because why?

Give more details.  You do realize that while you will gain space, you
will lose reliability with RAID0, if one disk fails, all your data is
gone.

John
