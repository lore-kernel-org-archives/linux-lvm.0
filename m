Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5KGr9u10315
	for <linux-lvm@redhat.com>; Mon, 20 Jun 2005 12:53:09 -0400
Received: from ramoth.dragonhold.org (ramoth.dragonhold.org [80.229.192.20])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j5KGr7j2016520
	for <linux-lvm@redhat.com>; Mon, 20 Jun 2005 12:53:08 -0400
Message-ID: <51748.212.162.208.163.1119286377.squirrel@212.162.208.163>
In-Reply-To: <ufa8y15nfco.fsf@epithumia.math.uh.edu>
References: <42B6F00D.3060801@redshift.com>
	<ufa8y15nfco.fsf@epithumia.math.uh.edu>
Date: Mon, 20 Jun 2005 17:52:57 +0100 (BST)
Subject: Re: [linux-lvm] LVM2 Volume and Volume group naming nomenclature
From: gwood@dragonhold.org
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

>>>>>> "SR" == Sam Rogers <srogers@redshift.com> writes:
> I think you must be confused, or you're not talking about what I think
> you are:

And from a machine I just kickstarted today:

/dev/vg00/root
/dev/vg00/opt
/dev/vg00/usr
/dev/vg00/var
/dev/vg00/swap

You can probably guess where those have been mounted :)  The only thing
that's not under LVM control is /boot.
