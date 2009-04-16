Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n3GNA01G001824
	for <linux-lvm@redhat.com>; Thu, 16 Apr 2009 19:10:00 -0400
Received: from mail.mediacell.com (mail.mediacell.com [74.92.210.145])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n3GN9gsf006341
	for <linux-lvm@redhat.com>; Thu, 16 Apr 2009 19:09:42 -0400
Received: from [192.168.0.229] (asbestos.bish0p.org [74.92.210.149])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mediacell.com (Postfix) with ESMTPSA id 8BBB51E0460
	for <linux-lvm@redhat.com>; Thu, 16 Apr 2009 17:09:41 -0600 (MDT)
Subject: Re: [linux-lvm] Simulating LVM Mirror Failure and recovery
From: Don Bishop <donbishop@mediacell.com>
In-Reply-To: <49E73987.3040604@brunson.com>
References: <29070.706.qm@web94806.mail.in2.yahoo.com>
	<49E71F9D.3010401@sivell.com>	<20090416125403.GU7843@agk.fab.redhat.com>
	<49E7345B.1040002@brunson.com>  <49E73987.3040604@brunson.com>
Content-Type: multipart/alternative; boundary="=-9y8l8QZ7EkdeAasXsFqC"
Date: Thu, 16 Apr 2009 08:18:39 -0600
Message-Id: <1239891519.7191.54.camel@zit>
Mime-Version: 1.0
Reply-To: donbishop@mediacell.com,
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
To: LVM general discussion and development <linux-lvm@redhat.com>


--=-9y8l8QZ7EkdeAasXsFqC
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hey Eric

Nice to see your still around. How's it all going?

best,
Don B



On Thu, 2009-04-16 at 07:58 -0600, Eric Brunson wrote:

> On 04/16/2009 07:36 AM, Eric Brunson wrote:
> > On 04/16/2009 06:54 AM, Alasdair G Kergon wrote:
> >> On Thu, Apr 16, 2009 at 07:07:57AM -0500, vu pham wrote:
> >>> yogeen honnavar wrote:
> >>>> Dear users,
> >>>> dd if=/dev/zero of=/dev/vg1/lv1 count=10
> >>>> as per the redhat guide this should result in mirror leg failure 
> >>>> and any
> >>
> >> Can you provide the reference - where does it say this?
> >>
> >> Alasdair
> >
> > I believe this is the reference.
> >
> > http://www.redhat.com/docs/en-US/Red_Hat_Enterprise_Linux/5/html/Cluster_Logical_Volume_Manager/mirrorrecover.html 
> >
> >
> > Their example may be in error.
> >
> >
> 
> Upon review, I think it's correct, but worded awkwardly:
> 
>     In this example, the primary leg of the mirror |/dev/sda1| fails.
>     Any write activity to the mirrored volume causes LVM to detect the
>     failed mirror. When this occurs, LVM converts the mirror into a
>     single linear volume. In this case, to trigger the conversion, we
>     execute a |dd| command
> 
>     [root@link-08 ~]#*|dd if=/dev/zero of=/dev/vg/groupfs count=10|*
>     10+0 records in
>     10+0 records out
> 
> 
> I believe the dd is not to cause the failure, it's simply to generate 
> write activity to the volume group after the mirror leg has been caused 
> to fail through other means not documented.
> 
> Anyone else think that's the case?
> 
> e.
> 
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
> 

CONFIDENTIALITY NOTICE
This electronic mail transmission and any accompanying documents contain
information belonging to the sender that may be confidential and legally
privileged.  This information is intended only for the use of the
individual or entity to whom this electronic mail transmission was sent
as indicated above.  If you are not the intended recipient, any
disclosure, copying, distribution, or action taken in reliance on the
contents of the information contained in this transmissions is strictly
prohibited.  If you have received this transmission in error, please
reply by e-mail to let me know and then permanently delete the message.
Thank you.

--=-9y8l8QZ7EkdeAasXsFqC
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/3.24.5">
</HEAD>
<BODY>
Hey Eric<BR>
<BR>
Nice to see your still around. How's it all going?<BR>
<BR>
best,<BR>
Don B<BR>
<BR>
<BR>
<BR>
On Thu, 2009-04-16 at 07:58 -0600, Eric Brunson wrote:
<BLOCKQUOTE TYPE=CITE>
<PRE>
On 04/16/2009 07:36 AM, Eric Brunson wrote:
&gt; On 04/16/2009 06:54 AM, Alasdair G Kergon wrote:
&gt;&gt; On Thu, Apr 16, 2009 at 07:07:57AM -0500, vu pham wrote:
&gt;&gt;&gt; yogeen honnavar wrote:
&gt;&gt;&gt;&gt; Dear users,
&gt;&gt;&gt;&gt; dd if=/dev/zero of=/dev/vg1/lv1 count=10
&gt;&gt;&gt;&gt; as per the redhat guide this should result in mirror leg failure 
&gt;&gt;&gt;&gt; and any
&gt;&gt;
&gt;&gt; Can you provide the reference - where does it say this?
&gt;&gt;
&gt;&gt; Alasdair
&gt;
&gt; I believe this is the reference.
&gt;
&gt; <A HREF="http://www.redhat.com/docs/en-US/Red_Hat_Enterprise_Linux/5/html/Cluster_Logical_Volume_Manager/mirrorrecover.html">http://www.redhat.com/docs/en-US/Red_Hat_Enterprise_Linux/5/html/Cluster_Logical_Volume_Manager/mirrorrecover.html</A> 
&gt;
&gt;
&gt; Their example may be in error.
&gt;
&gt;

Upon review, I think it's correct, but worded awkwardly:

    In this example, the primary leg of the mirror |/dev/sda1| fails.
    Any write activity to the mirrored volume causes LVM to detect the
    failed mirror. When this occurs, LVM converts the mirror into a
    single linear volume. In this case, to trigger the conversion, we
    execute a |dd| command

    [root@link-08 ~]#*|dd if=/dev/zero of=/dev/vg/groupfs count=10|*
    10+0 records in
    10+0 records out


I believe the dd is not to cause the failure, it's simply to generate 
write activity to the volume group after the mirror leg has been caused 
to fail through other means not documented.

Anyone else think that's the case?

e.

&gt; _______________________________________________
&gt; linux-lvm mailing list
&gt; <A HREF="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</A>
&gt; <A HREF="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</A>
&gt; read the LVM HOW-TO at <A HREF="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</A>

_______________________________________________
linux-lvm mailing list
<A HREF="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</A>
<A HREF="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</A>
read the LVM HOW-TO at <A HREF="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</A>


</PRE>
</BLOCKQUOTE>
<TABLE CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
<TR>
<TD>
<TABLE CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
<TR>
<TD>
<FONT SIZE="2"><FONT COLOR="#b03060">CONFIDENTIALITY NOTICE</FONT></FONT><BR>
<FONT SIZE="2"><FONT COLOR="#b03060">This electronic mail transmission and any accompanying documents contain information belonging to the sender that may be confidential and legally privileged.&nbsp; This information is intended only for the use of the individual or entity to whom this electronic mail transmission was sent as indicated above.&nbsp; If you are not the intended recipient, any disclosure, copying, distribution, or action taken in reliance on the contents of the information contained in this transmissions is strictly prohibited.&nbsp; If you have received this transmission in error, please reply by e-mail to let me know and then permanently delete the message.&nbsp; Thank you.</FONT></FONT>
</TD>
</TR>
</TABLE>
</TD>
</TR>
</TABLE>
</BODY>
</HTML>

--=-9y8l8QZ7EkdeAasXsFqC--
