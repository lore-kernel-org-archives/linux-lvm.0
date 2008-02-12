Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m1CIKvEB025325
	for <linux-lvm@redhat.com>; Tue, 12 Feb 2008 13:20:57 -0500
Received: from wx-out-0506.google.com (wx-out-0506.google.com [66.249.82.229])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m1CIKKNR006585
	for <linux-lvm@redhat.com>; Tue, 12 Feb 2008 13:20:20 -0500
Received: by wx-out-0506.google.com with SMTP id t16so4562280wxc.6
	for <linux-lvm@redhat.com>; Tue, 12 Feb 2008 10:20:20 -0800 (PST)
From: hxsrmeng <hxsrmeng@gmail.com>
Date: Tue, 12 Feb 2008 13:16:55 -0500
Message-Id: <1202840216.4244.9.camel@OpenSUSE-desktop.Home>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] dm-io operations on LVs
Reply-To: hxsrmeng@gmail.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: LVM <linux-lvm@redhat.com>

Hi all,

I am working with a program which do writing and reading with the dm-io.

I am wondering whether dm-io can take logic volumes as its source?
Especially LVs which have md as their physical volumes?

Thanks.

Sorry if I post it on the wrong list. If you know a better place to ask,
please let me know. Thank you very much.
