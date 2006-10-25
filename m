Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id k9PFiJtS006462
	for <linux-lvm@redhat.com>; Wed, 25 Oct 2006 11:44:19 -0400
Received: from ug-out-1314.google.com (ug-out-1314.google.com [66.249.92.169])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k9PFgqwq007791
	for <linux-lvm@redhat.com>; Wed, 25 Oct 2006 11:43:57 -0400
Received: by ug-out-1314.google.com with SMTP id 39so130810ugf
	for <linux-lvm@redhat.com>; Wed, 25 Oct 2006 08:43:56 -0700 (PDT)
Message-ID: <806e72ee0610250843k4e340b02s238835ce02626e9f@mail.gmail.com>
Date: Wed, 25 Oct 2006 12:43:56 -0300
From: "Fabricio Candido" <fabricio.candido@gmail.com>
Subject: Re: [linux-lvm] Using lvm1 vg's in lvm2 systems (RHEL4)
In-Reply-To: <806e72ee0610171621p1cb6e9d2r795002ce70293177@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_16577_29064533.1161791036110"
References: <806e72ee0610171500i26f4fa8ek469fa7d02031ae1@mail.gmail.com>
	<20061017223949.GP17654@agk.surrey.redhat.com>
	<806e72ee0610171621p1cb6e9d2r795002ce70293177@mail.gmail.com>
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

------=_Part_16577_29064533.1161791036110
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi all.

   I've solved this problem downgrading the lvm version from RHEL4U2 to
RHEL4U1 included version.

Thanks all.

Fabricio

On 10/17/06, Fabricio Candido <fabricio.candido@gmail.com> wrote:
>
> Alasdair,
>
>   Thanks for your helping.
>
>   I got these messages when I just execute vgdisplay, vgscan or pvscan:
>
>   LV lv_oracle_data012: inconsistent LE count 252 != 1008
>   Internal error: LV segments corrupted in lv_oracle_data012.
>   LV lv_oracle_redo003: inconsistent LE count 4 != 16
>   Internal error: LV segments corrupted in lv_oracle_redo003.
>   LV lv_oracle_data020: inconsistent LE count 252 != 1008
>   Internal error: LV segments corrupted in lv_oracle_data020.
>
>   I just imported these volumes in another RHEL3 server without problems.
>
> Any ideas ?
>
> Regards,
>
> Fabricio
>
> On 10/17/06, Alasdair G Kergon <agk@redhat.com> wrote:
> >
> > On Tue, Oct 17, 2006 at 07:00:52PM -0300, Fabricio Candido wrote:
> > > Is it possible to my RHEL4 system use these lvm1 vgs without
> > converting it ?
> > > What is necessary ?
> >
> > Yes, provided you can manage without snapshots and pvmove.
> > [Alternatively, you can run vgconvert to update your metadata in-situ to
> > the
> > new lvm2 format.]
> >
> > Alasdair
> > --
> > agk@redhat.com
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >
>
>

------=_Part_16577_29064533.1161791036110
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi all.<br><br>&nbsp;&nbsp; I've solved this problem downgrading the lvm version from RHEL4U2 to RHEL4U1 included version.<br><br>Thanks all.<br><br>Fabricio<br><br><div><span class="gmail_quote">On 10/17/06, <b class="gmail_sendername">
Fabricio Candido</b> &lt;<a href="mailto:fabricio.candido@gmail.com">fabricio.candido@gmail.com</a>&gt; wrote:</span><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
<span style="font-family: verdana;">Alasdair, </span><br style="font-family: verdana;"><br style="font-family: verdana;"><span style="font-family: verdana;">&nbsp; Thanks for your helping. </span><br style="font-family: verdana;">

<br style="font-family: verdana;"><span style="font-family: verdana;">&nbsp; I got these messages when I just execute vgdisplay, vgscan or pvscan:</span><br style="font-family: verdana;"><br style="font-family: verdana;"><span style="font-family: verdana;">

&nbsp; LV lv_oracle_data012: inconsistent LE count 252 != 1008</span><br style="font-family: verdana;"><span style="font-family: verdana;">&nbsp; Internal error: LV segments corrupted in lv_oracle_data012.</span><br style="font-family: verdana;">

<span style="font-family: verdana;">&nbsp; LV lv_oracle_redo003: inconsistent LE count 4 != 16</span><br style="font-family: verdana;"><span style="font-family: verdana;">&nbsp; Internal error: LV segments corrupted in lv_oracle_redo003.
</span><br style="font-family: verdana;"><span style="font-family: verdana;">&nbsp; LV lv_oracle_data020: inconsistent LE count 252 != 1008</span><br style="font-family: verdana;"><span style="font-family: verdana;">&nbsp; Internal error: LV segments corrupted in lv_oracle_data020.
</span><br style="font-family: verdana;"><br style="font-family: verdana;"><span style="font-family: verdana;">&nbsp; I just imported these volumes in another RHEL3 server without problems.</span><br style="font-family: verdana;">

<br style="font-family: verdana;"><span style="font-family: verdana;">Any ideas ?<br><br>Regards,<br><span class="sg"><br>Fabricio<br style="font-family: verdana;"></span></span><div><span class="e" id="q_10e58945cbcc1415_3">
<br style="font-family: verdana;"><div><span class="gmail_quote">On 10/17/06, 
<b class="gmail_sendername">Alasdair G Kergon</b> &lt;<a href="mailto:agk@redhat.com" target="_blank" onclick="return top.js.OpenExtLink(window,event,this)">agk@redhat.com</a>&gt; wrote:</span><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">

On Tue, Oct 17, 2006 at 07:00:52PM -0300, Fabricio Candido wrote:<br>&gt; Is it possible to my RHEL4 system use these lvm1 vgs without converting it ?<br>&gt; What is necessary ?<br><br>Yes, provided you can manage without snapshots and pvmove.
<br>[Alternatively, you can run vgconvert to update your metadata in-situ to the<br>new lvm2 format.]<br><br>Alasdair<br>--<br><a href="mailto:agk@redhat.com" target="_blank" onclick="return top.js.OpenExtLink(window,event,this)">
agk@redhat.com</a><br><br>_______________________________________________
<br>linux-lvm mailing list<br><a href="mailto:linux-lvm@redhat.com" target="_blank" onclick="return top.js.OpenExtLink(window,event,this)">linux-lvm@redhat.com</a><br><a href="https://www.redhat.com/mailman/listinfo/linux-lvm" target="_blank" onclick="return top.js.OpenExtLink(window,event,this)">
https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO at 
<a href="http://tldp.org/HOWTO/LVM-HOWTO/" target="_blank" onclick="return top.js.OpenExtLink(window,event,this)">http://tldp.org/HOWTO/LVM-HOWTO/</a><br></blockquote></div><br>

</span></div></blockquote></div><br>

------=_Part_16577_29064533.1161791036110--
