Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3RCR0Za030832
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2016 08:27:00 -0400
Received: from nm6.bullet.mail.ne1.yahoo.com (nm6.bullet.mail.ne1.yahoo.com
	[98.138.90.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3FF087F0A0
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2016 12:26:59 +0000 (UTC)
Date: Wed, 27 Apr 2016 12:26:57 +0000 (UTC)
From: matthew patton <pattonme@yahoo.com>
Message-ID: <518072682.2617983.1461760017772.JavaMail.yahoo@mail.yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <518072682.2617983.1461760017772.JavaMail.yahoo.ref@mail.yahoo.com>
Subject: Re: [linux-lvm] thin handling of available space
Reply-To: matthew patton <pattonme@yahoo.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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

It is not the OS' responsibility to coddle stupid sysadmins. If you're not watching for high-water marks in FS growth vis a vis the underlying, you're not doing your job. If there was anything more than the remotest chance that the FS would grow to full size it should not have been thin in the first place.

The FS already has a notion of 'reserved'. man(1) tune2fs -r
