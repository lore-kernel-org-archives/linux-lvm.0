Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m7FLRZg6031898
	for <linux-lvm@redhat.com>; Fri, 15 Aug 2008 17:27:35 -0400
Received: from py-out-1112.google.com (py-out-1112.google.com [64.233.166.176])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m7FLRNaU023309
	for <linux-lvm@redhat.com>; Fri, 15 Aug 2008 17:27:23 -0400
Received: by py-out-1112.google.com with SMTP id a29so937251pyi.0
	for <linux-lvm@redhat.com>; Fri, 15 Aug 2008 14:27:23 -0700 (PDT)
Message-ID: <779919740808151427h4abd1ac0he05376d9b6eb8455@mail.gmail.com>
Date: Fri, 15 Aug 2008 15:27:22 -0600
From: "Jeremy Lyon" <jerlyon@gmail.com>
Subject: Re: [linux-lvm] Mapping LV's back to PV's
In-Reply-To: <48A5F32A.3020203@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_41946_11858451.1218835642315"
References: <779919740808151414n31fa2a9cr426b9af3ed728ba7@mail.gmail.com>
	<48A5F32A.3020203@redhat.com>
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

------=_Part_41946_11858451.1218835642315
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Perfect!  Thanks!!

On Fri, Aug 15, 2008 at 3:20 PM, Milan Broz <mbroz@redhat.com> wrote:

> Jeremy Lyon wrote:
> > I've been searching on this question, but can't find anything.  Is there
> > a pv/lv/vg command that I can use to find out what PV(s) a LV resides on?
>
> Something like this?
>
> lvs -o +devices
>
> Milan
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

------=_Part_41946_11858451.1218835642315
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div dir="ltr">Perfect!&nbsp; Thanks!!<br><br><div class="gmail_quote">On Fri, Aug 15, 2008 at 3:20 PM, Milan Broz <span dir="ltr">&lt;<a href="mailto:mbroz@redhat.com">mbroz@redhat.com</a>&gt;</span> wrote:<br><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
<div class="Ih2E3d">Jeremy Lyon wrote:<br>
&gt; I&#39;ve been searching on this question, but can&#39;t find anything. &nbsp;Is there<br>
&gt; a pv/lv/vg command that I can use to find out what PV(s) a LV resides on?<br>
<br>
</div>Something like this?<br>
<br>
lvs -o +devices<br>
<br>
Milan<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href="https://www.redhat.com/mailman/listinfo/linux-lvm" target="_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO/" target="_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</blockquote></div><br></div>

------=_Part_41946_11858451.1218835642315--
