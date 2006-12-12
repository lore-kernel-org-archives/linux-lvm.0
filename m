Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kBC0Bsgp022494
	for <linux-lvm@redhat.com>; Mon, 11 Dec 2006 19:11:54 -0500
Received: from nf-out-0910.google.com (nf-out-0910.google.com [64.233.182.184])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kBC0BrYi001218
	for <linux-lvm@redhat.com>; Mon, 11 Dec 2006 19:11:53 -0500
Received: by nf-out-0910.google.com with SMTP id k26so59499nfc
	for <linux-lvm@redhat.com>; Mon, 11 Dec 2006 16:11:52 -0800 (PST)
Message-ID: <c5530b840612111611t2c507226k9b9a494a26064a2f@mail.gmail.com>
Date: Mon, 11 Dec 2006 19:11:52 -0500
From: "Michael Lessard" <michael.lessard@gmail.com>
Subject: Re: [linux-lvm] LVM2 and OCFS2
In-Reply-To: <457D2F40.7060708@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_131024_31979342.1165882312258"
References: <c5530b840612090619v2f807944h361a5dc163cb69c4@mail.gmail.com>
	<457D2F40.7060708@redhat.com>
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

------=_Part_131024_31979342.1165882312258
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Thanks Patrick !  I appreciate and now understand why LVM are not cluster
aware !

 have good week !

Michael


On 12/11/06, Patrick Caulfield <pcaulfie@redhat.com> wrote:
>
> Michael Lessard wrote:
> > Hi Everyboy !
> >
> >  I read that LVM2 is not cluster aware (specially with OCFS2) from
> > different post on internet forum... If it's true, could someone could
> > confirm this information and point me where i can find this affirmation
> > in documentention ?
> >
> >  I do some test with OCFS2 on LVM2 and it's seems to run correctly , so
> > i have some interrogation about this fact !
>
> It's true that lvm is not cluster-aware. What that means is that if you
> update the volume groups on one node then the other nodes in
> the cluster will not see the changes and you could end up with the block
> devices on the machines dangerously out of sync.
>
> What you tried (it seems to me) is just created LVM volumes and run OCFS2
> on them. that /will/ work provided you never change the
> volume groups!
>
> To get clustered LVM you need to use clvm (RPM package lvm2-cluster) which
> synchronises LVM metadata updates across the cluster.
> This only works with Red Hat cluster suite though - you would need you
> write your own cluster management plugin for OCFS2 if you
> wanted to use that (hard, but not impossible). Of course, RHCS does offer
> GFS as the cluster filesystem, if that's what you really need!
>
> --
>
> patrick
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

------=_Part_131024_31979342.1165882312258
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Thanks Patrick !&nbsp; I appreciate and now understand why LVM are not cluster aware !<br><br>&nbsp;have good week !<br><br>Michael <br><br><br><div><span class="gmail_quote">On 12/11/06, <b class="gmail_sendername">Patrick Caulfield
</b> &lt;<a href="mailto:pcaulfie@redhat.com">pcaulfie@redhat.com</a>&gt; wrote:</span><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">Michael Lessard wrote:
<br>&gt; Hi Everyboy !<br>&gt;<br>&gt;&nbsp;&nbsp;I read that LVM2 is not cluster aware (specially with OCFS2) from<br>&gt; different post on internet forum... If it's true, could someone could<br>&gt; confirm this information and point me where i can find this affirmation
<br>&gt; in documentention ?<br>&gt;<br>&gt;&nbsp;&nbsp;I do some test with OCFS2 on LVM2 and it's seems to run correctly , so<br>&gt; i have some interrogation about this fact !<br><br>It's true that lvm is not cluster-aware. What that means is that if you update the volume groups on one node then the other nodes in
<br>the cluster will not see the changes and you could end up with the block devices on the machines dangerously out of sync.<br><br>What you tried (it seems to me) is just created LVM volumes and run OCFS2 on them. that /will/ work provided you never change the
<br>volume groups!<br><br>To get clustered LVM you need to use clvm (RPM package lvm2-cluster) which synchronises LVM metadata updates across the cluster.<br>This only works with Red Hat cluster suite though - you would need you write your own cluster management plugin for OCFS2 if you
<br>wanted to use that (hard, but not impossible). Of course, RHCS does offer GFS as the cluster filesystem, if that's what you really need!<br><br>--<br><br>patrick<br><br>_______________________________________________<br>
linux-lvm mailing list<br><a href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br><a href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO at 
<a href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a><br></blockquote></div><br>

------=_Part_131024_31979342.1165882312258--
