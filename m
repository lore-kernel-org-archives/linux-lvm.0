Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l02ALhbs008319
	for <linux-lvm@redhat.com>; Tue, 2 Jan 2007 05:21:44 -0500
Received: from web27605.mail.ukl.yahoo.com (web27605.mail.ukl.yahoo.com
	[217.146.177.224])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with SMTP id
	l02ALalt008898
	for <linux-lvm@redhat.com>; Tue, 2 Jan 2007 05:21:36 -0500
Message-ID: <20070102102130.744.qmail@web27605.mail.ukl.yahoo.com>
Date: Tue, 2 Jan 2007 11:21:30 +0100 (CET)
From: <jjletho67-mvl@yahoo.it>
MIME-Version: 1.0
Subject: [linux-lvm] snapshot on root file system
Reply-To: jjletho67-mvl@yahoo.it,
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi all,
I use to make hot backup of a running system using the
lvm snapshot feature. I do backup of both data and
system partition (including root and var). Randomly,
when creating the snapshot logical volumes lvm
completely hang the system forcing me to hw reset the
machine.

Searching around about this problem I found that also
other lvm users suffer of a similar problem when the
root partition is involved, but I was unable to
understand what is the cause of the problem and if
there is a way to avoid it. Does LVM really support
root partition ? Does the problem involves only
snapshot or also other aspetcs ? Workaround ?

Thank you very much.

Marco

__________________________________________________
Do You Yahoo!?
Poco spazio e tanto spam? Yahoo! Mail ti protegge dallo spam e ti da tanto spazio gratuito per i tuoi file e i messaggi 
http://mail.yahoo.it 
