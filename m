Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1KFDDi22146
	for <linux-lvm@redhat.com>; Fri, 20 Feb 2004 10:13:13 -0500
Message-ID: <20040220151231.92039.qmail@web80002.mail.yahoo.com>
From: <cmc2slack-lvm@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] finding the right size for rootvg
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Fri Feb 20 10:12:13 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I'm re-installing slackware 9.1 on my linux box,
trying to set up LVM and ReiserFs. I'm pretty new
at this, learning as I go along.

I originally installed to another partition, now
I've creating a fresh partition and following the
LVM how-to about how to set up a root volume group. 
My questions are about partition and volume group size.

The first time I created a partition and PV I made
it 5GB and found that I had created the rootvg too
small by default to allocate enough space. So reading the
man pages I figured out that I need to specify a
certain extent size when I create the rootvg in order
to use the space properly. Right now the partition is
a little over 4GB and the rootvg is 3.97GB with an
extent size of 8MB. Is this small extent size a good
idea or will it cause problems later?

Thanks for any advice,
