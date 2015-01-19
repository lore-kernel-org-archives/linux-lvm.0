Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t0JL5hij024986
	for <linux-lvm@redhat.com>; Mon, 19 Jan 2015 16:05:43 -0500
Received: from mail-qa0-f54.google.com (mail-qa0-f54.google.com
	[209.85.216.54])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t0JL5eAm005039
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Mon, 19 Jan 2015 16:05:41 -0500
Received: by mail-qa0-f54.google.com with SMTP id w8so24844365qac.13
	for <linux-lvm@redhat.com>; Mon, 19 Jan 2015 13:05:40 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 19 Jan 2015 14:05:39 -0700
Message-ID: <CAPWkaSVZEeL6yP+3ax2Z0Z7iMJQezEGUvVOXZ8PUrA7ytEeA=w@mail.gmail.com>
From: John Griffith <john.griffith8@gmail.com>
Subject: [linux-lvm]  Slow response from lvs and vgs commands
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi All,

Wondering if anybody had any info on why lvs and vgs commands may be
taking up to 3 minutes to respond?  In my particular case I'm running
Ubuntu 14.04 as a KVM Instance, with the default version of LVM2
(2.02.98).

There's not anything overly interesting going on with the system, I've
had as few as 1 Volume and as many as 5 when this occurs.  The only
thing that may be unique is that this is during testing so there's a
lot of create/delete activity taking place.  Don't know if that might
have anything to do with it.

I'm wondering if there's something I should be looking at more closely
to debug this, or if there's a way to filter the lvs and vgs commands
to make them more efficient?

Any help or suggestions would be greatly appreciated.

Thanks,
John
