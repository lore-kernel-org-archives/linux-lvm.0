Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m2QMwJBQ004661
	for <linux-lvm@redhat.com>; Wed, 26 Mar 2008 18:58:19 -0400
Received: from mxout.vub.ac.be (mxout.vub.ac.be [134.184.129.111])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m2QMw6Dp012310
	for <linux-lvm@redhat.com>; Wed, 26 Mar 2008 18:58:07 -0400
Received: from webmail-srv.ulb.ac.be (webmail-srv.ulb.ac.be [164.15.59.227])
	by mach.vub.ac.be (Postfix) with SMTP id 6BF307F
	for <linux-lvm@redhat.com>; Wed, 26 Mar 2008 23:58:00 +0100 (CET)
From: Marcelo-Julian Burda <mburda@ulb.ac.be>
Message-Id: <20080326225800.6BF307F@mach.vub.ac.be>
Date: Wed, 26 Mar 2008 23:58:00 +0100 (CET)
Subject: [linux-lvm] lost PV
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi,
i am a problem. using a amobable HD with a LVM PV we block my LVM
after this amovable HD was disconect i am the next error:

1 PV found fo VG: expected 2
Volume group "system"not found

i want recue logical volumens in this 1st PV, vgreduce --removemissing system
not work ( error PV segment corrupted in system )
than for your help

Marcelo
