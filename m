Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k89NriuS000639
	for <linux-lvm@redhat.com>; Sat, 9 Sep 2006 19:53:44 -0400
Received: from wx-out-0506.google.com (wx-out-0506.google.com [66.249.82.228])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k89NrYts025398
	for <linux-lvm@redhat.com>; Sat, 9 Sep 2006 19:53:34 -0400
Received: by wx-out-0506.google.com with SMTP id i30so2743533wxd
	for <linux-lvm@redhat.com>; Sat, 09 Sep 2006 16:53:34 -0700 (PDT)
Message-ID: <b91808310609091653o63dbdb0fi9f34848cb4479a1d@mail.gmail.com>
Date: Sun, 10 Sep 2006 01:53:34 +0200
From: "=?ISO-8859-2?Q?Martin_Dvo=F8=E1k?=" <155144@gmail.com>
Subject: Re: [linux-lvm] Cannot get rid of root filesystem LVM snapshot
In-Reply-To: <20060909231739.GB13859@agk.surrey.redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <b91808310609091349tf363c5dy57ced3b611523c18@mail.gmail.com>
	<20060909231739.GB13859@agk.surrey.redhat.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Thanks for info. I suggest to stress the fact that snapshotting of
root filesystem is not yet supported somewhere in documentation,
HOWTOs etc. Many people might not be as lucky as me and find it out
only after they are left with frozen or even corrupted system.

Martin

2006/9/10, Alasdair G Kergon <agk@redhat.com>:
> The tools do not support root snapshots properly yet - whether or not they
> work is down to chance.  To remove one reliably you need lvremove from a
> rescue environment - you're lucky lvremove is refusing to proceed - if it
> got further it could hang your machine.  In principle you can recover
> without rebooting but you'll need to write a custom script to run various
> dmsetup commands from a ramdisk, for example, and then fix up the lvm2
> metadata with activation disabled.  [If you learn how snapshots are
> created/destroyed you can work out what to do: sorry, it's too much for me
> to explain here.  This is what the tools will want enhancing to do to
> provide proper support.]
>
> Older kernels like yours however can get into a state where recovery is only
> possible by writing directly to kernel memory, if you already ran certain
> commands in the wrong sequence.
>
> Alasdair
> --
> agk@redhat.com
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
