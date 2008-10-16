Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m9GASi67005827
	for <linux-lvm@redhat.com>; Thu, 16 Oct 2008 06:28:44 -0400
Received: from rv-out-0506.google.com (rv-out-0506.google.com [209.85.198.225])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m9GARqnh017973
	for <linux-lvm@redhat.com>; Thu, 16 Oct 2008 06:27:52 -0400
Received: by rv-out-0506.google.com with SMTP id f6so3167675rvb.51
	for <linux-lvm@redhat.com>; Thu, 16 Oct 2008 03:27:52 -0700 (PDT)
Message-ID: <d5dce2210810160327r52de7ca4ne982934f5918aebc@mail.gmail.com>
Date: Thu, 16 Oct 2008 15:57:52 +0530
From: "himanshu padmanabhi" <himanshu.padmanabhi@gmail.com>
Subject: Re: [linux-lvm] [IMPORTANT]LVM+iSCSI issue..Local Disk disappeared..
In-Reply-To: <1224086814.7418.11.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_48458_7248202.1224152872119"
References: <d5dce2210810150620l2e9c4b44uc519eeeebadd604f@mail.gmail.com>
	<1224086814.7418.11.camel@localhost.localdomain>
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

------=_Part_48458_7248202.1224152872119
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

We configured it as
*
Case 1

*pv1= localdisk1    pv2 =localdisk2

Vg1= pv1,pv2

created lv1 of size =pv1size + pv2size

Deleted lv1,

removed pv2,

vg is getting displayed properly in vgs command

*
Case 2

*pv1= localdisk1    pv2 =remotedisk2(iscsi disk)

Vg1= pv1,pv2

created lv1 of size =pv1size + pv2size

Deleted lv1,

logout from iscsi target

vg is not getting displayed properly in vgs command


On Wed, Oct 15, 2008 at 9:36 PM, Peter Larsen <plarsen@ciber.com> wrote:

> On Wed, 2008-10-15 at 18:50 +0530, himanshu padmanabhi wrote:
> >
> > I am using "iscsi-initiator-utils-6.2.0.865-0.2.fc7" as initiator and
> > "iscsitarget-0.4.15-1" as target.
> >
> >
> > Following is the scenario
> >
> >
> > PV  =  local_disk1       remote_disk1  (i.e PV is formed using 2
> > disks
> > 1 local and 1 from iscsitarget)
>
> Strange construction?
> Why not simply format each target as a separate PV and then join them in
> a single VG? Much easier to manage.
>
> That aside - I wouldn't mix and match that way. You're getting very
> different response times and security issues on each device. I would
> treat them very different.
>
> > VG  =  Vgname
>
> You need to assign the PV's to your VG.
>
> > LV =  lv_localdisk_1       lv_localremotedisk1
> > lv_remotedisk1 (i.e. 1 lv only from local disk,1 from remote
> > iscsitarget and one from combination of both)
>
> That makes no sense. You don't use physical volumes when you create
> logical ones. You use groups. You don't assign physical devices like
> that when you do LVs.
>
> > I performed "logout" operation on "remote_disk1" after deactivating
> > "lv_localremotedisk1 and           lv_remotedisk1" on it using
> > "lvchange" command.
> >
> >
> > Then result I should at least get,
> >
> >
> > PV  =  local_disk1    (remote_disk1 is removed now)
> >
> >
> > VG = Vgname
> >
> >
> > LV = lv_localdisk1     (So LVs containing PVs as "remote_disk1" are
> > deactivated.It can be in combination with local disk also)
>
> No - things don't work that way. If you damage/remove a PV from a VG -
> everything in that VG gets disabled until the whole VG is operational.
> It doesn't matter if your LV is in the area damaged or not.
>
> > i.e They all were lost temporarily.
>
> Not temporarily. As long as the VG is bad, nothing is there. You should
> see all available PVs but the way you set it up, you didn't do a PV on
> each disk so when the disk-group sees one disk missing the whole disk
> group is offline, you loose your PV, your VG gets deactivated = the
> result you see.
>
> > When I logged in to the same target and activated the LVs on
> > "remote_disk1",I got my original configuration.i.e.
>
> Because your PV is now present, the VG can activate etc.
>
>
> ---
> Regards
>    Peter Larsen
>
> We have met the enemy, and he is us.
>                -- Walt Kelly
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

------=_Part_48458_7248202.1224152872119
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div dir="ltr">We configured it as<br><b><br>Case 1<br><br></b>pv1= localdisk1&nbsp;&nbsp;&nbsp; pv2 =localdisk2 <br><br>Vg1= pv1,pv2 <br><br>created lv1 of size =pv1size + pv2size <br><br>Deleted lv1,<br>&nbsp;<br>removed pv2,<br><br>vg is getting displayed properly in vgs command<br>

<br><b><br>Case 2<br><br></b>pv1= localdisk1&nbsp;&nbsp;&nbsp; pv2 =remotedisk2(iscsi disk)<br><br>Vg1= pv1,pv2<br><br>created lv1 of size =pv1size + pv2size <br>
<br>Deleted lv1,<br><br>logout from iscsi target<br><br>vg is not getting displayed properly in vgs command<br><br><br><div class="gmail_quote">On Wed, Oct 15, 2008 at 9:36 PM, Peter Larsen <span dir="ltr">&lt;<a href="mailto:plarsen@ciber.com">plarsen@ciber.com</a>&gt;</span> wrote:<br>
<blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;"><div class="Ih2E3d">On Wed, 2008-10-15 at 18:50 +0530, himanshu padmanabhi wrote:<br>
&gt;<br>
&gt; I am using &quot;iscsi-initiator-utils-6.2.0.865-0.2.fc7&quot; as initiator and<br>
&gt; &quot;iscsitarget-0.4.15-1&quot; as target.<br>
&gt;<br>
&gt;<br>
&gt; Following is the scenario<br>
&gt;<br>
&gt;<br>
&gt; PV &nbsp;= &nbsp;local_disk1 &nbsp; &nbsp; &nbsp; remote_disk1 &nbsp;(i.e PV is formed using 2<br>
&gt; disks<br>
&gt; 1 local and 1 from iscsitarget)<br>
<br>
</div>Strange construction?<br>
Why not simply format each target as a separate PV and then join them in<br>
a single VG? Much easier to manage.<br>
<br>
That aside - I wouldn&#39;t mix and match that way. You&#39;re getting very<br>
different response times and security issues on each device. I would<br>
treat them very different.<br>
<br>
&gt; VG &nbsp;= &nbsp;Vgname<br>
<br>
You need to assign the PV&#39;s to your VG.<br>
<div class="Ih2E3d"><br>
&gt; LV = &nbsp;lv_localdisk_1 &nbsp; &nbsp; &nbsp; lv_localremotedisk1<br>
&gt; lv_remotedisk1 (i.e. 1 lv only from local disk,1 from remote<br>
&gt; iscsitarget and one from combination of both)<br>
<br>
</div>That makes no sense. You don&#39;t use physical volumes when you create<br>
logical ones. You use groups. You don&#39;t assign physical devices like<br>
that when you do LVs.<br>
<div class="Ih2E3d"><br>
&gt; I performed &quot;logout&quot; operation on &quot;remote_disk1&quot; after deactivating<br>
&gt; &quot;lv_localremotedisk1 and &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; lv_remotedisk1&quot; on it using<br>
&gt; &quot;lvchange&quot; command.<br>
&gt;<br>
&gt;<br>
&gt; Then result I should at least get,<br>
&gt;<br>
&gt;<br>
&gt; PV &nbsp;= &nbsp;local_disk1 &nbsp; &nbsp;(remote_disk1 is removed now)<br>
&gt;<br>
&gt;<br>
&gt; VG = Vgname<br>
&gt;<br>
&gt;<br>
&gt; LV = lv_localdisk1 &nbsp; &nbsp; (So LVs containing PVs as &quot;remote_disk1&quot; are<br>
&gt; deactivated.It can be in combination with local disk also)<br>
<br>
</div>No - things don&#39;t work that way. If you damage/remove a PV from a VG -<br>
everything in that VG gets disabled until the whole VG is operational.<br>
It doesn&#39;t matter if your LV is in the area damaged or not.<br>
<div class="Ih2E3d"><br>
&gt; i.e They all were lost temporarily.<br>
<br>
</div>Not temporarily. As long as the VG is bad, nothing is there. You should<br>
see all available PVs but the way you set it up, you didn&#39;t do a PV on<br>
each disk so when the disk-group sees one disk missing the whole disk<br>
group is offline, you loose your PV, your VG gets deactivated = the<br>
result you see.<br>
<div class="Ih2E3d"><br>
&gt; When I logged in to the same target and activated the LVs on<br>
&gt; &quot;remote_disk1&quot;,I got my original configuration.i.e.<br>
<br>
</div>Because your PV is now present, the VG can activate etc.<br>
<br>
<br>
---<br>
Regards<br>
 &nbsp; &nbsp;Peter Larsen<br>
<br>
We have met the enemy, and he is us.<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;-- Walt Kelly<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href="https://www.redhat.com/mailman/listinfo/linux-lvm" target="_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO/" target="_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</blockquote></div><br><br clear="all"><br>-- <br>Regards,<br>Himanshu Padmanabhi<br><br>
</div>

------=_Part_48458_7248202.1224152872119--
