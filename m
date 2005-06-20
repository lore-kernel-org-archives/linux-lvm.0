Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5KGnJu09402
	for <linux-lvm@redhat.com>; Mon, 20 Jun 2005 12:49:19 -0400
Received: from epithumia.math.uh.edu (epithumia.math.uh.edu [129.7.128.2])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j5KGnHIb015393
	for <linux-lvm@redhat.com>; Mon, 20 Jun 2005 12:49:18 -0400
Received: from epithumia.math.uh.edu (epithumia.math.uh.edu [127.0.0.1])
	by epithumia.math.uh.edu (8.12.11/8.12.5) with ESMTP id j5KGnCM3018716
	for <linux-lvm@redhat.com>; Mon, 20 Jun 2005 11:49:12 -0500
Subject: Re: [linux-lvm] LVM2 Volume and Volume group naming nomenclature
References: <42B6F00D.3060801@redshift.com>
From: Jason L Tibbitts III <tibbs@math.uh.edu>
Date: Mon, 20 Jun 2005 11:49:11 -0500
In-Reply-To: <42B6F00D.3060801@redshift.com> (Sam Rogers's message of "Mon,
	20 Jun 2005 09:34:21 -0700")
Message-ID: <ufa8y15nfco.fsf@epithumia.math.uh.edu>
MIME-Version: 1.0
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

>>>>> "SR" == Sam Rogers <srogers@redshift.com> writes:

SR> But there is a major problem. LVM2 will not (from what I can see)
SR> recognize volume group names like VG00.

I think you must be confused, or you're not talking about what I think
you are:

# vgdisplay

  --- Volume group ---
  VG Name               vg0
[...]

Heck, you can call them whatever you want.  I use "sys" and "data" on
some of my machines.  You can even rename them with vgrename.

 - J<
