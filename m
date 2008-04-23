Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3NDO9iM016493
	for <linux-lvm@redhat.com>; Wed, 23 Apr 2008 09:24:09 -0400
Received: from py-out-1112.google.com (py-out-1112.google.com [64.233.166.177])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3NDNsDJ016527
	for <linux-lvm@redhat.com>; Wed, 23 Apr 2008 09:23:54 -0400
Received: by py-out-1112.google.com with SMTP id a29so3104788pyi.0
	for <linux-lvm@redhat.com>; Wed, 23 Apr 2008 06:23:53 -0700 (PDT)
Message-ID: <a71bd89a0804230623j6974f720o32e5f44746abcce5@mail.gmail.com>
Date: Wed, 23 Apr 2008 06:23:52 -0700
From: "Dan Kegel" <dank@kegel.com>
Sender: daniel.r.kegel@gmail.com
Subject: Re: [linux-lvm] Simple scripts for use in automated backups?
In-Reply-To: <480F3680.6030900@Media-Brokers.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <480F3680.6030900@Media-Brokers.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Charles Marcus <CMarcus@media-brokers.com> wrote:
>  Would any kind souls be willing to share some basic scripts that can be
> used to activate a snapshot, then 'do x' (this would be my rsnapshot
> command), then release the snapshot? The part that I don't have a clue about
> is how to check for errors - ie, did the snapshot activate ok? Did it
> release ok?...

Here's a few links I dug up a couple weeks ago on how
people use lvm to back up mysql:

http://en.oreilly.com/mysql2008/public/schedule/detail/252
http://forum.mysqlperformanceblog.com/s/m/782/
http://lenz.homelinux.org/mylvmbackup/
http://jcole.us/blog/archives/2006/04/25/plugin-based-backup-for-mysql/
http://www.mysqlperformanceblog.com/2006/08/21/using-lvm-for-mysql-backup-and-replication-setup/
