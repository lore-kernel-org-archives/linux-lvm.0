Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1AH9B123635
	for <linux-lvm@redhat.com>; Fri, 10 Feb 2006 12:09:11 -0500
Received: from mail.davidb.org (mail.davidb.org [66.93.32.219])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k1AH992M022788
	for <linux-lvm@redhat.com>; Fri, 10 Feb 2006 12:09:09 -0500
Received: from davidb by mail.davidb.org with local (Exim 4.54 #1 (Debian))
	id 1F7blc-0001ps-Er
	for <linux-lvm@redhat.com>; Fri, 10 Feb 2006 09:09:08 -0800
Date: Fri, 10 Feb 2006 09:09:08 -0800
From: David Brown <lvm@davidb.org>
Subject: Re: [linux-lvm] Symbolic Link Related Query
Message-ID: <20060210170908.GA6918@old.davidb.org>
References: <DBFC31836FE4044AAC43F361228CA2F801A0427A@blr-m1-msg.wipro.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DBFC31836FE4044AAC43F361228CA2F801A0427A@blr-m1-msg.wipro.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Feb 10, 2006 at 07:07:39PM +0530, deepak.barua@wipro.com wrote:

> $ touch h
> $ ln h j
> $ ln -s h k
> $ ls -i h j k
>  176016 h   176016 j   176016 k
> $

Perhaps there is an 'ls' alias that is adding the '-L' option to
dereference symlinks.  Perhaps try:

  $ /bin/ls -i h j k

or

  $ stat h j k

David Brown
