Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m27IJmS7004789
	for <linux-lvm@redhat.com>; Fri, 7 Mar 2008 13:19:48 -0500
Received: from qb-out-0506.google.com (qb-out-0506.google.com [72.14.204.228])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m27IJDRl025650
	for <linux-lvm@redhat.com>; Fri, 7 Mar 2008 13:19:13 -0500
Received: by qb-out-0506.google.com with SMTP id o12so480883qba.17
	for <linux-lvm@redhat.com>; Fri, 07 Mar 2008 10:19:13 -0800 (PST)
Message-ID: <dd20e5b50803071019l7f22d3ccm608ec884d9d0a493@mail.gmail.com>
Date: Fri, 7 Mar 2008 13:19:12 -0500
From: "Lionel Kernux" <lionel.kernux@gmail.com>
Subject: Re: [linux-lvm] How to "clone" a logical volume
In-Reply-To: <47D16F33.8050905@wpkg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <dd20e5b50803070734o3eac4e18o156fe4e1552040c@mail.gmail.com>
	<47D162C8.4040104@wpkg.org>
	<dd20e5b50803070806g1068b31djecbd683c38fea713@mail.gmail.com>
	<47D16F33.8050905@wpkg.org>
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

YES!

Thanks...worked like a charm....

LK


On Fri, Mar 7, 2008 at 11:37 AM, Tomasz Chmielewski <mangoo@wpkg.org> wrote:
> Lionel Kernux schrieb:
>
> > Hi,
>  >
>  > Thanks for the reply.
>  >
>  > I'm talking about LVM uuid...I assumed that it is stored somwhere on
>  > the actual LV...is this not the case? If not, my problem is solved!
>  >
>  > So...Just to be sure:
>  >
>  > If I dd my source LV to my destination LV (which has alraedy been
>  > created through  lvcreate) then LVM wont care and will activate it and
>  > all will be well?
>
>  Yep, it will work just fine.
>
>  You may also consider using snapshots, although it has some performance
>  penalties involved.
>
>  --
>
>
> Tomasz Chmielewski
>  http://wpkg.org
>
>  _______________________________________________
>  linux-lvm mailing list
>  linux-lvm@redhat.com
>  https://www.redhat.com/mailman/listinfo/linux-lvm
>  read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
