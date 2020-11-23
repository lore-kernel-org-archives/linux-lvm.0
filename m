Received: from localhost.localdomain (unknown [10.33.36.184])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C2F8960871
	for <linux-lvm@redhat.com>; Mon, 23 Nov 2020 12:52:25 +0000 (UTC)
Date: Mon, 23 Nov 2020 12:52:22 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
Message-ID: <20201123125222.GA2229389@localhost.localdomain>
References: <CAMaziXuSe+YncMw622UAeGp_3DKtoCuz-US1yh6+tkrmDyQ4=g@mail.gmail.com>
	<20201120111433.GI1787072@localhost.localdomain>
	<CAMaziXuxo6oHSN63T1Jms8kcv3HKVXe_2BtR18g9w=GyNhSFbA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMaziXuxo6oHSN63T1Jms8kcv3HKVXe_2BtR18g9w=GyNhSFbA@mail.gmail.com>
Subject: Re: [linux-lvm] Unusually long boot times with LVM Snapshots
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, Nov 21, 2020 at 01:51:42PM +0530, Sreyan Chakravarty wrote:
> On Fri, Nov 20, 2020 at 4:45 PM Bryn M. Reeves <bmr@redhat.com> wrote:
> 
> > What type of snapshot are you using? LVM2 allows either "classic" CoW
> > snaps,
> > or the newer thin provisioned snapshots using the dm-thinp target.
> >
> > Classic snapshots are known to have very poor IO performance when multiple
> > snapshots of the same volume exist simultaneously (especially for write-
> > heavy workloads).
> >
> > Thin provisioned snapshots are not normally activated at boot time unless
> > they are explicitly requested (via dracut's rd.lvm.lv options) since they
> > have the skip activation flag set by default.
> >
> 
> I tried thin snapshots, but what use are they if I can't use my system all
> together.

I'm not following this statement. Can you explain what happened when you
tried thin snapshots?
 
> Once my root logical volume was marked read only I could not revert it back
> to writable, after the snapshot was created.

That's not a normal outcome of creating a snapshot - it sounds like you
ran into some problem with the snaphot or the volume group, but without
more details of the situation and what actually happened it's very hard
to give you guidance to help avoid it in future.

Regards,
Bryn.
