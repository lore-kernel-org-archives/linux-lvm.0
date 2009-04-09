Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n396mHk9021739
	for <linux-lvm@redhat.com>; Thu, 9 Apr 2009 02:48:17 -0400
Received: from mail-gx0-f171.google.com (mail-gx0-f171.google.com
	[209.85.217.171])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n396lxuw032346
	for <linux-lvm@redhat.com>; Thu, 9 Apr 2009 02:47:59 -0400
Received: by gxk19 with SMTP id 19so1082021gxk.3
	for <linux-lvm@redhat.com>; Wed, 08 Apr 2009 23:47:59 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 9 Apr 2009 12:17:59 +0530
Message-ID: <ffa0f8300904082347k5e977b92hffb20c85a83a9a8@mail.gmail.com>
From: Tejas Sumant <tejas.sumant@gmail.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Stripe array
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

Hi There,

How to interpret this array in LVM metadata? Especially what does 50
mean in data sturcture below?
				stripes = [
					"pv0", 50
				]
thanks.
-- 
Tejas Sumant
