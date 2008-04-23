Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3NJJ9ts001222
	for <linux-lvm@redhat.com>; Wed, 23 Apr 2008 15:19:09 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3NJIsob009077
	for <linux-lvm@redhat.com>; Wed, 23 Apr 2008 15:18:54 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id m3NJInU8017911
	for <linux-lvm@redhat.com>; Wed, 23 Apr 2008 15:18:49 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.6) with ESMTP id m3NJInHM025009
	for <linux-lvm@redhat.com>; Wed, 23 Apr 2008 15:18:49 -0400
Date: Wed, 23 Apr 2008 15:18:49 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Simple scripts for use in automated backups?
In-Reply-To: <480F3B0F.6010205@wpkg.org>
Message-ID: <Pine.LNX.4.44.0804231517220.24936-100000@bmsred.bmsi.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, 23 Apr 2008, Tomasz Chmielewski wrote:

> *Usually*, a command exits with code 0 if it finishes with a success.
> 
> In bash, you can check the exit code with $? variable.
> 
> So:
> 
> 
> lvmcommand --option1 --option2
> 
> if [ $? -eq 0 ] ; then
>     do_this
> else
>     do_that
> fi

Even easier, the shell considers exit code 0 as "true", so the above is simply:

if lvmcommand --option1 --option2; then
    do_this
else
    do_that
fi

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
