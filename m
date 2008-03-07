Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m27G7D4B007403
	for <linux-lvm@redhat.com>; Fri, 7 Mar 2008 11:07:13 -0500
Received: from qb-out-0506.google.com (qb-out-0506.google.com [72.14.204.237])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m27G6bEP026650
	for <linux-lvm@redhat.com>; Fri, 7 Mar 2008 11:06:37 -0500
Received: by qb-out-0506.google.com with SMTP id o12so384716qba.17
	for <linux-lvm@redhat.com>; Fri, 07 Mar 2008 08:06:37 -0800 (PST)
Message-ID: <dd20e5b50803070806g1068b31djecbd683c38fea713@mail.gmail.com>
Date: Fri, 7 Mar 2008 11:06:35 -0500
From: "Lionel Kernux" <lionel.kernux@gmail.com>
Subject: Re: [linux-lvm] How to "clone" a logical volume
In-Reply-To: <47D162C8.4040104@wpkg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <dd20e5b50803070734o3eac4e18o156fe4e1552040c@mail.gmail.com>
	<47D162C8.4040104@wpkg.org>
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

Hi,

Thanks for the reply.

I'm talking about LVM uuid...I assumed that it is stored somwhere on
the actual LV...is this not the case? If not, my problem is solved!

So...Just to be sure:

If I dd my source LV to my destination LV (which has alraedy been
created through  lvcreate) then LVM wont care and will activate it and
all will be well?

Thanks

LK

On Fri, Mar 7, 2008 at 10:44 AM, Tomasz Chmielewski <mangoo@wpkg.org> wrote:
> Lionel Kernux schrieb:
>
> > Hi,
>  >
>  > Here's what I'm trying to do:
>  >
>  > I have an LV that is being used as a physical disk for a XEN virtual machine.
>  > I want to "clone" the VM.
>  > lvcreate -L 75G -n virtualmachine_clone_lv VG00
>  > dd if=/path/to/virtualmachine_lv of=/path/to/virtualmachine_clone_lvT
>  >
>  > This method would be perfect if it wasn't for the fact that now I have
>  > 2 LV's with the same uuid....not good...
>
>  What UUID are you talking about here? Filesystem UUID, or LVM UUID?
>
>  If about LVM UUID, it will not be the same if you dd a LV - UUID is
>  stored somewhere else.
>
>  Filesystem UUID (if any) will remain the same, of course, as it's the
>  exact copy.
>
>
>
>  --
>  Tomasz Chmielewski
>  http://wpkg.org
>
>  _______________________________________________
>  linux-lvm mailing list
>  linux-lvm@redhat.com
>  https://www.redhat.com/mailman/listinfo/linux-lvm
>  read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
