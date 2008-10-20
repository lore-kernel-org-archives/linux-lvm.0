Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m9K7eHvf011323
	for <linux-lvm@redhat.com>; Mon, 20 Oct 2008 03:40:17 -0400
Received: from rv-out-0506.google.com (rv-out-0506.google.com [209.85.198.226])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m9K7e2M3015387
	for <linux-lvm@redhat.com>; Mon, 20 Oct 2008 03:40:03 -0400
Received: by rv-out-0506.google.com with SMTP id f6so1645638rvb.51
	for <linux-lvm@redhat.com>; Mon, 20 Oct 2008 00:40:02 -0700 (PDT)
Message-ID: <d5dce2210810200040m29fc29b2n694979990f8d7ad8@mail.gmail.com>
Date: Mon, 20 Oct 2008 13:10:02 +0530
From: "himanshu padmanabhi" <himanshu.padmanabhi@gmail.com>
Subject: Re: [linux-lvm] [IMPORTANT]LVM+iSCSI issue..Local Disk disappeared..
In-Reply-To: <1224170455.7716.4.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_101436_618356.1224488402525"
References: <d5dce2210810150620l2e9c4b44uc519eeeebadd604f@mail.gmail.com>
	<1224086814.7418.11.camel@localhost.localdomain>
	<d5dce2210810160327r52de7ca4ne982934f5918aebc@mail.gmail.com>
	<1224170455.7716.4.camel@localhost.localdomain>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

------=_Part_101436_618356.1224488402525
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Thnx everyone(Esp. peter).....Your comments were really useful.

Just want to ask one thing....

We can get physical volumes associated with given LV using "lvdisplay -m
"/dev/vgname/lvname".....Is the information given by it no so sure.....

Because you specified that "we cannot get which PV's are associated with
which LV".


On Thu, Oct 16, 2008 at 8:50 PM, Peter Larsen <plarsen@ciber.com> wrote:

> On Thu, 2008-10-16 at 15:57 +0530, himanshu padmanabhi wrote:
> > We configured it as
> >
> > Case 1
> > [....]
> > Deleted lv1,
> > removed pv2,
> > vg is getting displayed properly in vgs command
> > Case 2
> > [...]
> > Deleted lv1,
> > logout from iscsi target
> > vg is not getting displayed properly in vgs command
>
> Those are not the same? In case 1 you tell LVM to drop a storage (I
> assume by removing pv2 you first take it out of the vg and then apply
> pvremove). In case 2 you you're simulating media failure to LVM. You
> can't just remove a media it depends on. Regardless if LVM has data on
> the PV or not.
>
> Are you trying to make failover work? If so, your approach is a bit
> wrong. Setup a software raid 1 first, then build your PV on that. Once
> done, you can remove one disk and your LVM will continue to run
> (degraded).
>
>
> ---
> Regards
>    Peter Larsen
>
> I don't kill flies, but I like to mess with their minds.  I hold them
> above
> globes.  They freak out and yell "Whooa, I'm *way* too high."
>                -- Bruce Baum
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>



-- 
Regards,
Himanshu Padmanabhi

------=_Part_101436_618356.1224488402525
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div dir="ltr">Thnx everyone(Esp. peter).....Your comments were really useful.<br><br>Just want to ask one thing....<br><br>We can get physical volumes associated with given LV using &quot;lvdisplay -m &quot;/dev/vgname/lvname&quot;.....Is the information given by it no so sure.....<br>
<br>Because you specified that &quot;we cannot get which PV&#39;s are associated with which LV&quot;.<br><br><br><div class="gmail_quote">On Thu, Oct 16, 2008 at 8:50 PM, Peter Larsen <span dir="ltr">&lt;<a href="mailto:plarsen@ciber.com">plarsen@ciber.com</a>&gt;</span> wrote:<br>
<blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;"><div class="Ih2E3d">On Thu, 2008-10-16 at 15:57 +0530, himanshu padmanabhi wrote:<br>
&gt; We configured it as<br>
&gt;<br>
&gt; Case 1<br>
</div>&gt; [....]<br>
<div class="Ih2E3d">&gt; Deleted lv1,<br>
&gt; removed pv2,<br>
&gt; vg is getting displayed properly in vgs command<br>
&gt; Case 2<br>
</div>&gt; [...]<br>
<div class="Ih2E3d">&gt; Deleted lv1,<br>
&gt; logout from iscsi target<br>
&gt; vg is not getting displayed properly in vgs command<br>
<br>
</div>Those are not the same? In case 1 you tell LVM to drop a storage (I<br>
assume by removing pv2 you first take it out of the vg and then apply<br>
pvremove). In case 2 you you&#39;re simulating media failure to LVM. You<br>
can&#39;t just remove a media it depends on. Regardless if LVM has data on<br>
the PV or not.<br>
<br>
Are you trying to make failover work? If so, your approach is a bit<br>
wrong. Setup a software raid 1 first, then build your PV on that. Once<br>
done, you can remove one disk and your LVM will continue to run<br>
(degraded).<br>
<br>
<br>
---<br>
Regards<br>
 &nbsp; &nbsp;Peter Larsen<br>
<br>
I don&#39;t kill flies, but I like to mess with their minds. &nbsp;I hold them<br>
above<br>
globes. &nbsp;They freak out and yell &quot;Whooa, I&#39;m *way* too high.&quot;<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;-- Bruce Baum<br>
<div><div></div><div class="Wj3C7c"><br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href="https://www.redhat.com/mailman/listinfo/linux-lvm" target="_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO/" target="_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</div></div></blockquote></div><br><br clear="all"><br>-- <br>Regards,<br>Himanshu Padmanabhi<br><br>
</div>

------=_Part_101436_618356.1224488402525--
