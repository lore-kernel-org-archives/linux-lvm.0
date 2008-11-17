Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mAHDVPjn016563
	for <linux-lvm@redhat.com>; Mon, 17 Nov 2008 08:31:25 -0500
Received: from hs-out-0708.google.com (hs-out-0708.google.com [64.233.178.246])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mAHDTfQs013301
	for <linux-lvm@redhat.com>; Mon, 17 Nov 2008 08:29:41 -0500
Received: by hs-out-0708.google.com with SMTP id x43so1072471hsb.3
	for <linux-lvm@redhat.com>; Mon, 17 Nov 2008 05:29:40 -0800 (PST)
Message-ID: <d5dce2210811170529k68603cb7k21bb031c53ec6136@mail.gmail.com>
Date: Mon, 17 Nov 2008 18:59:40 +0530
From: "himanshu padmanabhi" <himanshu.padmanabhi@gmail.com>
Subject: Re: [linux-lvm] Editing LVM 2 metadata
In-Reply-To: <b072968d0811150444v2e23a535p21dc41bb25d114d4@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_15480_21352144.1226928580300"
References: <878853.96084.qm@web38301.mail.mud.yahoo.com>
	<20081115025515.GX30569@agk.fab.redhat.com>
	<309738.64869.qm@web38304.mail.mud.yahoo.com>
	<b072968d0811150444v2e23a535p21dc41bb25d114d4@mail.gmail.com>
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

------=_Part_15480_21352144.1226928580300
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

*Is this issue having connection with it.

Problem*

One IET target is having 2 luns as "Parent LV" and "its snapshot".

When MS initiator connects to it,it gets rebooted.

I came to know through forum that it is due to same disk signatures of the
two disks on initiator side.

If I attach "Parent LV" and "its snapshot" to different targets,then windows
initiator is behaving well.

But in Open-iSCSI initiator under linux,both cases work well,
*
Issues

*both parent lv and its snapshot are taking same IDs probably.How can i
change the id of snapshot.It determines ID internally through timestamps and
some other things.Both takes UUID obviously different.Windows might see
these either as two copies of the same volume or two paths to the same
volume, but their data diverges which causes Windows to freak out.Windows
stores a volume identifier in the MBR/GPT when a disk is first recognized
and uses that identifier for identification of storage volumes.But I cannot
make changes on client(initiator) side as my product is server machine.

basically *what changes should be made on the target side so that initiator
will recognize both as different disks?*

On Sat, Nov 15, 2008 at 6:14 PM, David Robinson <zxvdr.au@gmail.com> wrote:

> 2008/11/15 Michael Jensen <beachhangar@yahoo.com>:
> > The why is because I am attempting to use storage managed snapshots.  The
> > storage can present the master volume and the snapshot as separate LUN's
> but
> > they present identical contents in the header area (first 256
> sectors...).
> > So the effort is to modify the snapshot (doable with this storage)
> without
> > altering the contents of the master volume.  Hopefully the snapshot with
> > suitable edits to the UUID's would then pass vgscan test.
>
> Its easiest if you follow the steps listed here:
>
> https://www.redhat.com/archives/linux-lvm/2007-November/msg00039.html
>
> --Dave
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

------=_Part_15480_21352144.1226928580300
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<span><b>Is this issue having connection with it.<br><br>Problem</b><br><br>One IET target is having 2 luns as &quot;Parent LV&quot; and &quot;its snapshot&quot;.<br><br>When MS initiator connects to it,it gets rebooted.<br>
<br>I came to know through forum that it is due to same disk signatures of the two disks on initiator side.<br>
<br>If I attach &quot;Parent LV&quot; and &quot;its snapshot&quot; to different targets,then windows initiator is behaving well.<br><br></span>But in Open-iSCSI initiator under linux,both cases work well,<span></span><br clear="all">

<b><br>Issues<br><br></b>both parent lv and its snapshot are taking
same IDs probably.How can i change the id of snapshot.It determines ID
internally through timestamps and some other things.Both takes UUID
obviously different.Windows might see these either as two copies of the
same volume or two paths to the same volume, but their data diverges
which causes Windows to freak out.Windows stores a volume identifier in
the MBR/GPT when a disk is first recognized and uses that identifier
for identification of storage volumes.But I cannot make changes on
client(initiator) side as my product is server machine.<br>
<br>basically <b>what changes should be made on the target side so that initiator will recognize both as different disks?</b><br><br><div class="gmail_quote">On Sat, Nov 15, 2008 at 6:14 PM, David Robinson <span dir="ltr">&lt;<a href="mailto:zxvdr.au@gmail.com">zxvdr.au@gmail.com</a>&gt;</span> wrote:<br>
<blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">2008/11/15 Michael Jensen &lt;<a href="mailto:beachhangar@yahoo.com">beachhangar@yahoo.com</a>&gt;:<br>

<div class="Ih2E3d">&gt; The why is because I am attempting to use storage managed snapshots. &nbsp;The<br>
&gt; storage can present the master volume and the snapshot as separate LUN&#39;s but<br>
&gt; they present identical contents in the header area (first 256 sectors...).<br>
&gt; So the effort is to modify the snapshot (doable with this storage) without<br>
&gt; altering the contents of the master volume. &nbsp;Hopefully the snapshot with<br>
&gt; suitable edits to the UUID&#39;s would then pass vgscan test.<br>
<br>
</div>Its easiest if you follow the steps listed here:<br>
<br>
<a href="https://www.redhat.com/archives/linux-lvm/2007-November/msg00039.html" target="_blank">https://www.redhat.com/archives/linux-lvm/2007-November/msg00039.html</a><br>
<br>
--Dave<br>
<div><div></div><div class="Wj3C7c"><br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href="https://www.redhat.com/mailman/listinfo/linux-lvm" target="_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO/" target="_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</div></div></blockquote></div><br><br clear="all"><br>-- <br>Regards,<br>Himanshu Padmanabhi<br><br>

------=_Part_15480_21352144.1226928580300--
