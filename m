Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8LELRkM024600
	for <linux-lvm@redhat.com>; Thu, 21 Sep 2006 10:21:27 -0400
Received: from ug-out-1314.google.com (ug-out-1314.google.com [66.249.92.172])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8LELQkn018166
	for <linux-lvm@redhat.com>; Thu, 21 Sep 2006 10:21:26 -0400
Received: by ug-out-1314.google.com with SMTP id 39so165958ugf
	for <linux-lvm@redhat.com>; Thu, 21 Sep 2006 07:21:21 -0700 (PDT)
Message-ID: <ab53550609210721n45754f87w91dd8d23400cf567@mail.gmail.com>
Date: Thu, 21 Sep 2006 10:21:20 -0400
From: "Bernard Fay" <bernard.fay@gmail.com>
Subject: Re: [linux-lvm] pvs and pvscan does not show my PV's
In-Reply-To: <20060921133843.GW17654@agk.surrey.redhat.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_855_3853625.1158848480845"
References: <ab53550609210628v3fbaf1a0sb9f569faf8542389@mail.gmail.com>
	<20060921133843.GW17654@agk.surrey.redhat.com>
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

------=_Part_855_3853625.1158848480845
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

That's exactly it!   I have version 2.02.06 on my Debian Etch system.

thanks

On 9/21/06, Alasdair G Kergon <agk@redhat.com> wrote:
>
> On Thu, Sep 21, 2006 at 09:28:15AM -0400, Bernard Fay wrote:
> > Does someone can tell my why on my actual system pvs or pvscan does not
> list
> > the PV's?
>
> Check what version of lvm2 you're using - broken for a while; fixed in
> 2.02.07.
>   Fix PV tools to include orphaned PVs in default output again.
>
> Alasdair
> --
> agk@redhat.com
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

------=_Part_855_3853625.1158848480845
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

That's exactly it!&nbsp;&nbsp; I have version 2.02.06 on my Debian Etch system.<br><br>thanks<br><br><div><span class="gmail_quote">On 9/21/06, <b class="gmail_sendername">Alasdair G Kergon</b> &lt;<a href="mailto:agk@redhat.com">agk@redhat.com
</a>&gt; wrote:</span><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">On Thu, Sep 21, 2006 at 09:28:15AM -0400, Bernard Fay wrote:<br>&gt; Does someone can tell my why on my actual system pvs or pvscan does not list
<br>&gt; the PV's?<br><br>Check what version of lvm2 you're using - broken for a while; fixed in 2.02.07.<br>&nbsp;&nbsp;Fix PV tools to include orphaned PVs in default output again.<br><br>Alasdair<br>--<br><a href="mailto:agk@redhat.com">
agk@redhat.com</a><br><br>_______________________________________________<br>linux-lvm mailing list<br><a href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br><a href="https://www.redhat.com/mailman/listinfo/linux-lvm">
https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a><br></blockquote></div><br>

------=_Part_855_3853625.1158848480845--
