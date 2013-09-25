Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r8PABNXC018563
	for <linux-lvm@redhat.com>; Wed, 25 Sep 2013 06:11:24 -0400
Received: from mail-ob0-f175.google.com (mail-ob0-f175.google.com
	[209.85.214.175])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r8PABMjd007441
	for <linux-lvm@redhat.com>; Wed, 25 Sep 2013 06:11:23 -0400
Received: by mail-ob0-f175.google.com with SMTP id uz6so6327278obc.6
	for <linux-lvm@redhat.com>; Wed, 25 Sep 2013 03:11:22 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 25 Sep 2013 18:11:22 +0800
Message-ID: <CAHuLeSnj8SrvF=Q5jq2WE5S1CjJwisX+3oTb5760uR94rkVfnw@mail.gmail.com>
From: Justin Lee <justinlee5455@gmail.com>
Subject: [linux-lvm] Failed to login LVM CVS
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

Hi,

I wanted to get the source code of LVM 2.02.86(2) (2011-07-08) and I
saw the instructions on web page
http://www.tldp.org/HOWTO/html_single/LVM-HOWTO/#checkoutsource to
check out the source from CVS. So I gave it a try and I got an error
like this:

$ cvs -d :pserver:cvs@sources.redhat.com:/cvs/lvm2 login cvs
Logging in to :pserver:cvs@sources.redhat.com:2401/cvs/lvm2
CVS password:
cvs [login aborted]: connect to
sources.redhat.com(209.132.183.64):2401 failed: Connection timed out

Any idea?
