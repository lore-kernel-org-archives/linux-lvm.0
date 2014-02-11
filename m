Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s1BG13a2004601
	for <linux-lvm@redhat.com>; Tue, 11 Feb 2014 11:01:04 -0500
Received: from mail.funsoft.com (funsoft.funsoft.com [198.186.141.88])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s1BG11w3016045
	for <linux-lvm@redhat.com>; Tue, 11 Feb 2014 11:01:01 -0500
Received: from [192.168.249.249] (unknown [192.168.249.249])
	by mail.funsoft.com (Postfix) with ESMTP id B5E5D11C3DC
	for <linux-lvm@redhat.com>; Tue, 11 Feb 2014 08:00:43 -0800 (PST)
Message-ID: <52FA492B.1050408@funsoft.com>
Date: Tue, 11 Feb 2014 11:00:43 -0500
From: Gary Eheman <eheman@funsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Doc or definition of max_archives setting for lvm.conf?
Reply-To: eheman@funsoft.com,
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux-lvm <linux-lvm@redhat.com>

There is an example syntax reference to a variable named "max_archives" in the man 
page for lvm.conf, but it does not provide a definition for the variable.  The actual 
lvm.conf on my distribution contains no references or comments to enlighten me on the 
specifics for max_archives.  While the variable name certainly gives me the clue that 
it is likely that not more than that many archive files would exist in the archive 
directory, can someone provide a more detailed description?

Since I can make no assumptions on this system, is it the case that if the 
max_archives specified in lvm.conf is reached that the oldest archive is 
automatically deleted as the newest one is created?

I have a lot of snapshot activity on the system where I want to implement 
max_archives, and the number of archives keeps growing.  Naturally, I have not yet 
reached the retain_days number of days, but would like to keep the number of archives 
below a reasonable number before retain_days might be reached.
-- 
Gary Eheman
Fundamental Software, Inc.
http://www.funsoft.com
