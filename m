Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0RMMjO08595
	for <linux-lvm@redhat.com>; Thu, 27 Jan 2005 17:22:45 -0500
Received: from rproxy.gmail.com (rproxy.gmail.com [64.233.170.207])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j0RMMdTn007776
	for <linux-lvm@redhat.com>; Thu, 27 Jan 2005 17:22:39 -0500
Received: by rproxy.gmail.com with SMTP id a41so604282rng
	for <linux-lvm@redhat.com>; Thu, 27 Jan 2005 14:22:36 -0800 (PST)
Message-ID: <3b24531c05012714224523e810@mail.gmail.com>
Date: Thu, 27 Jan 2005 16:22:36 -0600
From: Myrddin Emrys <myrddin@gmail.com>
Subject: Re: [linux-lvm] PE Size and Waste
In-Reply-To: <20050127191416.GC21230@percy.comedia.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <3b24531c050127035217717af5@mail.gmail.com>
	<20050127191416.GC21230@percy.comedia.it>
Reply-To: Myrddin Emrys <myrddin@gmail.com>,
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Very confusing. Then I must be mistaken... I think I know the culprit.
It must be my NFS client that is wrong. If so, my apologies for
spreading misinformation.


On Thu, 27 Jan 2005 20:14:16 +0100, Luca Berra <bluca@comedia.it> wrote:
> On Thu, Jan 27, 2005 at 05:52:57AM -0600, Myrddin Emrys wrote:
> >It appears that one PE can only hold a single file. Since my PE size
> >is 16MB, that means that the files on my LVM array are... well, less
> >than efficiently packed. What puzzles me is that this fact is never
> this is not true, there is no relation between PE size and filesystem.
> i wonder were you got this impression.
> 
> Regards,
> L.
> 
> --
> Luca Berra -- bluca@comedia.it
>         Communication Media & Services S.r.l.
>  /"\
>  \ /     ASCII RIBBON CAMPAIGN
>   X        AGAINST HTML MAIL
>  / \
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
