Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mB97oV3j001290
	for <linux-lvm@redhat.com>; Tue, 9 Dec 2008 02:50:31 -0500
Received: from nf-out-0910.google.com (nf-out-0910.google.com [64.233.182.185])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mB97mVKw025391
	for <linux-lvm@redhat.com>; Tue, 9 Dec 2008 02:48:32 -0500
Received: by nf-out-0910.google.com with SMTP id d3so744445nfc.21
	for <linux-lvm@redhat.com>; Mon, 08 Dec 2008 23:48:31 -0800 (PST)
Message-ID: <d66ef690812082348y2bc19b6bo34ff84e8ada21959@mail.gmail.com>
Date: Tue, 9 Dec 2008 15:48:31 +0800
From: "wu jessinay" <jessinay@gmail.com>
Subject: Re: [linux-lvm] system-config-lvm bug with using lv as swap space
In-Reply-To: <1228768424.4271.1.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_56885_19638970.1228808911140"
References: <d66ef690812080037k5d99dbcdm1ce11ab32744efff@mail.gmail.com>
	<1228768424.4271.1.camel@localhost.localdomain>
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

------=_Part_56885_19638970.1228808911140
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello jim
I have created a bugzilla with my patch attached.
the bug no is 475434.

Another thing I'd like to know is that if you have plan
to enhance system-config-lvm with more functions.
Such as add swap entries to /etc/fstab and create swap
partition on a lv

Thanks



2008/12/9, jim parsons <jparsons@redhat.com>:
>
> Hello, Wu. Thanks for your help. Can you please file a new bugzilla and
> attach your patch, please?
>
> Much obliged,
>
> -Jim
>
> On Mon, 2008-12-08 at 16:37 +0800, wu jessinay wrote:
> > Hi,all
> > I have encountered several bugs of system-config-lvm.
> > The first one is if there is a logical volume entry in /etc/fstab
> > and another raw device entry for swap
> > such as
> > /dev/my_vg1/my_lv1   swap  swap  defaults 0 0
> > /dev/hda1       swap    swap   defaults   0  0
> >
> > then if we use system-config-lvm to remove my_lv1,
> > Not only the my_lv1 entry,but all other swap entries in /etc/fstab
> > will get removed.
> >
> > After some investigation on the system-config-lvm python source file.
> > It seems that the problem is in the InputController.py file.
> > When we click the remove button,the program will check if there is any
> > entry of the removed logical volume in /etc/fstab.
> > If any entry exist in /etc/fstab, it will remove this line
> > from /etc/fstab so that when the system reboot it won't mount this
> > logical volume(since it has been removed).
> >
> > This procedure is OK.However,the program will delete the corresponding
> > entry in the following way:
> > 1.check what is the mount point of this logical volume.(in our case it
> > is swap)
> > 2.search /etc/fstab file,delete all the entries with the same mount
> > point.This won't result in any trouble if the logical volume is
> > mounted on /mnt/mylv1 .but if the mount point is swap ,it will delete
> > all swap entries in /etc/fstab file.
> >
> > I have created a patch to solve this problem,which modify the removing
> > procedure if the mount point is swap.
> >
> > There is several other bugs with system-config-lvm but the root cause
> > should be the same.
> >
> > this problem exist in enterprise linux 5 and enterprise linux 5 U1.
> > Is this a fixed bug?Any advice is appreciated!
> >
> > Thanks
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

------=_Part_56885_19638970.1228808911140
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div>Hello jim</div>
<div>I have created a bugzilla with my patch attached.</div>
<div>the bug no is 475434.</div>
<div>&nbsp;</div>
<div>Another thing I&#39;d like to know is that if you have plan</div>
<div>to enhance system-config-lvm with more functions.</div>
<div>Such as add swap entries to /etc/fstab and create swap</div>
<div>partition on a lv</div>
<div>&nbsp;</div>
<div>Thanks</div>
<div><br><br>&nbsp;</div>
<div><span class="gmail_quote">2008/12/9, jim parsons &lt;<a href="mailto:jparsons@redhat.com">jparsons@redhat.com</a>&gt;:</span>
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">Hello, Wu. Thanks for your help. Can you please file a new bugzilla and<br>attach your patch, please?<br><br>
Much obliged,<br><br>-Jim<br><br>On Mon, 2008-12-08 at 16:37 +0800, wu jessinay wrote:<br>&gt; Hi,all<br>&gt; I have encountered several bugs of system-config-lvm.<br>&gt; The first one is if there is a logical volume entry in /etc/fstab<br>
&gt; and another raw device entry for swap<br>&gt; such as<br>&gt; /dev/my_vg1/my_lv1&nbsp;&nbsp; swap&nbsp;&nbsp;swap&nbsp;&nbsp;defaults 0 0<br>&gt; /dev/hda1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; swap&nbsp;&nbsp;&nbsp;&nbsp;swap&nbsp;&nbsp; defaults&nbsp;&nbsp; 0&nbsp;&nbsp;0<br>&gt;<br>&gt; then if we use system-config-lvm to remove my_lv1,<br>
&gt; Not only the my_lv1 entry,but all other swap entries in /etc/fstab<br>&gt; will get removed.<br>&gt;<br>&gt; After some investigation on the system-config-lvm python source file.<br>&gt; It seems that the problem is in the InputController.py file.<br>
&gt; When we click the remove button,the program will check if there is any<br>&gt; entry of the removed logical volume in /etc/fstab.<br>&gt; If any entry exist in /etc/fstab, it will remove this line<br>&gt; from /etc/fstab so that when the system reboot it won&#39;t mount this<br>
&gt; logical volume(since it has been removed).<br>&gt;<br>&gt; This procedure is OK.However,the program will delete the corresponding<br>&gt; entry in the following way:<br>&gt; 1.check what is the mount point of this logical volume.(in our case it<br>
&gt; is swap)<br>&gt; 2.search /etc/fstab file,delete all the entries with the same mount<br>&gt; point.This won&#39;t result in any trouble if the logical volume is<br>&gt; mounted on /mnt/mylv1 .but if the mount point is swap ,it will delete<br>
&gt; all swap entries in /etc/fstab file.<br>&gt;<br>&gt; I have created a patch to solve this problem,which modify the removing<br>&gt; procedure if the mount point is swap.<br>&gt;<br>&gt; There is several other bugs with system-config-lvm but the root cause<br>
&gt; should be the same.<br>&gt;<br>&gt; this problem exist in enterprise linux 5 and enterprise linux 5 U1.<br>&gt; Is this a fixed bug?Any advice is appreciated!<br>&gt;<br>&gt; Thanks<br>&gt; _______________________________________________<br>
&gt; linux-lvm mailing list<br>&gt; <a href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>&gt; <a href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
&gt; read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a><br><br>_______________________________________________<br>linux-lvm mailing list<br><a href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</blockquote></div><br>

------=_Part_56885_19638970.1228808911140--
