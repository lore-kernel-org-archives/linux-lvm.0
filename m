Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2FBFYS14610
	for <linux-lvm@redhat.com>; Mon, 15 Mar 2004 06:15:34 -0500
Received: from grassmarket.ucs.ed.ac.uk (grassmarket.ucs.ed.ac.uk
	[129.215.166.64])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2FBFW07029824
	for <linux-lvm@redhat.com>; Mon, 15 Mar 2004 06:15:32 -0500
Received: from grassmarket.ucs.ed.ac.uk (localhost [127.0.0.1])
	by grassmarket.ucs.ed.ac.uk (8.12.10/8.12.10) with ESMTP id
	i2FBFVla013501
	for <linux-lvm@redhat.com>; Mon, 15 Mar 2004 11:15:31 GMT
Received: (from nobody@localhost)
	by grassmarket.ucs.ed.ac.uk (8.12.10/8.12.9/Submit) id i2FBFVob013496
	for linux-lvm@redhat.com; Mon, 15 Mar 2004 11:15:31 GMT
Message-ID: <1079349331.405590535c638@sms.ed.ac.uk>
Date: Mon, 15 Mar 2004 11:15:31 +0000
From: Rupert Hair <rupert.hair@ntlworld.com>
Subject: Re: [linux-lvm] VGs gone!
References: <20040315094504.30807.qmail@web80601.mail.yahoo.com>
In-Reply-To: <20040315094504.30807.qmail@web80601.mail.yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Quoting David Minor <sus4@sbcglobal.net>:

<SNIP>
> We had a problem with the
> root partition on the first drive, so we decided to
> restore from the mirror using dd.  After doing this,
> the VGs are not in existence anymore.  running
> 'vgscan' shows it creates /etc/lvmtab and
> /etc/lvmtab.d correctly, but they are empty.  
How were the drives mirrored?  Did you use some sort of raid or was it all done
by using dd to copy the whole drive?

What does pvscan show?

Rupert
