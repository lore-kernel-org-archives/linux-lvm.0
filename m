Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n27Fq1H2017499
	for <linux-lvm@redhat.com>; Sat, 7 Mar 2009 10:52:01 -0500
Received: from mail-qy0-f104.google.com (mail-qy0-f104.google.com
	[209.85.221.104])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n27FpfYZ017069
	for <linux-lvm@redhat.com>; Sat, 7 Mar 2009 10:51:41 -0500
Received: by qyk2 with SMTP id 2so491485qyk.23
	for <linux-lvm@redhat.com>; Sat, 07 Mar 2009 07:51:41 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <49B23E93.6090004@alexbrett.net>
References: <f9d0f9760903061911s6db14df3t1ac602afa411e7e1@mail.gmail.com>
	<49B23E93.6090004@alexbrett.net>
Date: Sat, 7 Mar 2009 12:51:41 -0300
Message-ID: <f9d0f9760903070751s601e5778gece391bd861a4910@mail.gmail.com>
Subject: Re: [linux-lvm] how to enlarge a logical volume that is a virtual 
	disk of a virtual machine that uses lvm too?
From: Ricardo Funke Ormieres <funke.listas@gmail.com>
Content-Type: multipart/alternative; boundary=0015175cba6c9d1ed704648960be
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

--0015175cba6c9d1ed704648960be
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Ok Alex, I'll try it online and offline to see what happen

Thank you very much! =)

2009/3/7 Alex Brett <alex@alexbrett.net>

> I'm not sure if you could do it online or not (I can't see any reason
> why not, but there may be issues), but you should just be able to resize
> the LV (lvresize) in dom0 (obviously make sure you enlarge it, not
> shrink it), then do a pvresize in the VM to enlarge the PV to use all
> the extra space.
>
> Alex
>
> Ricardo Funke Ormieres wrote:
> > Hello,
> >
> > I have a phisical machine with a xen vm installed and I'm using LVM in
> > both. The Virtual Machine is using a LogVol (that belongs to the Dom0)
> > as it's virtual hard disk.
> >
> > It's possible to enlarge this LogVol in order to enlarge the vm's hard
> disk?
> >
> > I know that I can just create another LogVol in the Dom0 and add it to
> > the vm's PV, but I'm curious for that possible alternative.
> >
> > Thanks in advance
> >
> >
> > ------------------------------------------------------------------------
> >
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

--0015175cba6c9d1ed704648960be
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Ok Alex, I&#39;ll try it online and offline to see what happen <br><br>Thank you very much! =)<br><br><div class="gmail_quote">2009/3/7 Alex Brett <span dir="ltr">&lt;<a href="mailto:alex@alexbrett.net">alex@alexbrett.net</a>&gt;</span><br>
<blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">I&#39;m not sure if you could do it online or not (I can&#39;t see any reason<br>
why not, but there may be issues), but you should just be able to resize<br>
the LV (lvresize) in dom0 (obviously make sure you enlarge it, not<br>
shrink it), then do a pvresize in the VM to enlarge the PV to use all<br>
the extra space.<br>
<br>
Alex<br>
<div><div></div><div class="h5"><br>
Ricardo Funke Ormieres wrote:<br>
&gt; Hello,<br>
&gt;<br>
&gt; I have a phisical machine with a xen vm installed and I&#39;m using LVM in<br>
&gt; both. The Virtual Machine is using a LogVol (that belongs to the Dom0)<br>
&gt; as it&#39;s virtual hard disk.<br>
&gt;<br>
&gt; It&#39;s possible to enlarge this LogVol in order to enlarge the vm&#39;s hard disk?<br>
&gt;<br>
&gt; I know that I can just create another LogVol in the Dom0 and add it to<br>
&gt; the vm&#39;s PV, but I&#39;m curious for that possible alternative.<br>
&gt;<br>
&gt; Thanks in advance<br>
&gt;<br>
&gt;<br>
</div></div>&gt; ------------------------------------------------------------------------<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; linux-lvm mailing list<br>
&gt; <a href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
&gt; <a href="https://www.redhat.com/mailman/listinfo/linux-lvm" target="_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
&gt; read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO/" target="_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href="https://www.redhat.com/mailman/listinfo/linux-lvm" target="_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO/" target="_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</blockquote></div><br>

--0015175cba6c9d1ed704648960be--
