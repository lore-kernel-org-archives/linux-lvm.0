Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k2DIO5112492
	for <linux-lvm@redhat.com>; Mon, 13 Mar 2006 13:24:05 -0500
Received: from priv-edtnes56.telusplanet.net (outbound01.telus.net
	[199.185.220.220])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k2DIO3mt008314
	for <linux-lvm@redhat.com>; Mon, 13 Mar 2006 13:24:03 -0500
Received: from p-squared.com ([137.186.214.78])
	by priv-edtnes56.telusplanet.net
	(InterMail vM.6.01.05.04 201-2131-123-105-20051025) with ESMTP id
	<20060313182300.LWDW20059.priv-edtnes56.telusplanet.net@p-squared.com>
	for <linux-lvm@redhat.com>; Mon, 13 Mar 2006 11:23:00 -0700
Received: from apache by p-squared.com with local (Exim 4.54)
	id 1FIrh3-0000jx-C5
	for linux-lvm@redhat.com; Mon, 13 Mar 2006 11:22:58 -0700
Message-ID: <32926.198.161.217.2.1142274177.squirrel@p-squared.com>
Date: Mon, 13 Mar 2006 11:22:57 -0700 (MST)
From: "Pete Pinter" <pinter@p-squared.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Apache <apache@p-squared.com>
Subject: [linux-lvm] Re: Really hoping data is still there... DOH!
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Never mind.

I just noticed only 1 (4MH) extent is consumed on the new LV, of which
only 29% is used for the lost+found directory, I guess.

Sorry for the waste of bandwidth...
