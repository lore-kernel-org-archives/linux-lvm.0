Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id k9HNLXVp023782
	for <linux-lvm@redhat.com>; Tue, 17 Oct 2006 19:21:33 -0400
Received: from hu-out-0506.google.com (hu-out-0506.google.com [72.14.214.229])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k9HNLSQh021386
	for <linux-lvm@redhat.com>; Tue, 17 Oct 2006 19:21:29 -0400
Received: by hu-out-0506.google.com with SMTP id 34so1908601hue
	for <linux-lvm@redhat.com>; Tue, 17 Oct 2006 16:21:28 -0700 (PDT)
Message-ID: <806e72ee0610171621p1cb6e9d2r795002ce70293177@mail.gmail.com>
Date: Tue, 17 Oct 2006 20:21:28 -0300
From: "Fabricio Candido" <fabricio.candido@gmail.com>
Subject: Re: [linux-lvm] Using lvm1 vg's in lvm2 systems (RHEL4)
In-Reply-To: <20061017223949.GP17654@agk.surrey.redhat.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_42639_29192051.1161127288137"
References: <806e72ee0610171500i26f4fa8ek469fa7d02031ae1@mail.gmail.com>
	<20061017223949.GP17654@agk.surrey.redhat.com>
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

------=_Part_42639_29192051.1161127288137
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Alasdair,

  Thanks for your helping.

  I got these messages when I just execute vgdisplay, vgscan or pvscan:

  LV lv_oracle_data012: inconsistent LE count 252 != 1008
  Internal error: LV segments corrupted in lv_oracle_data012.
  LV lv_oracle_redo003: inconsistent LE count 4 != 16
  Internal error: LV segments corrupted in lv_oracle_redo003.
  LV lv_oracle_data020: inconsistent LE count 252 != 1008
  Internal error: LV segments corrupted in lv_oracle_data020.

  I just imported these volumes in another RHEL3 server without problems.

Any ideas ?

Regards,

Fabricio

On 10/17/06, Alasdair G Kergon <agk@redhat.com> wrote:
>
> On Tue, Oct 17, 2006 at 07:00:52PM -0300, Fabricio Candido wrote:
> > Is it possible to my RHEL4 system use these lvm1 vgs without converting
> it ?
> > What is necessary ?
>
> Yes, provided you can manage without snapshots and pvmove.
> [Alternatively, you can run vgconvert to update your metadata in-situ to
> the
> new lvm2 format.]
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

------=_Part_42639_29192051.1161127288137
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<span style="font-family: verdana;">Alasdair, </span><br style="font-family: verdana;"><br style="font-family: verdana;"><span style="font-family: verdana;">&nbsp; Thanks for your helping. </span><br style="font-family: verdana;">
<br style="font-family: verdana;"><span style="font-family: verdana;">&nbsp; I got these messages when I just execute vgdisplay, vgscan or pvscan:</span><br style="font-family: verdana;"><br style="font-family: verdana;"><span style="font-family: verdana;">
&nbsp; LV lv_oracle_data012: inconsistent LE count 252 != 1008</span><br style="font-family: verdana;"><span style="font-family: verdana;">&nbsp; Internal error: LV segments corrupted in lv_oracle_data012.</span><br style="font-family: verdana;">
<span style="font-family: verdana;">&nbsp; LV lv_oracle_redo003: inconsistent LE count 4 != 16</span><br style="font-family: verdana;"><span style="font-family: verdana;">&nbsp; Internal error: LV segments corrupted in lv_oracle_redo003.
</span><br style="font-family: verdana;"><span style="font-family: verdana;">&nbsp; LV lv_oracle_data020: inconsistent LE count 252 != 1008</span><br style="font-family: verdana;"><span style="font-family: verdana;">&nbsp; Internal error: LV segments corrupted in lv_oracle_data020.
</span><br style="font-family: verdana;"><br style="font-family: verdana;"><span style="font-family: verdana;">&nbsp; I just imported these volumes in another RHEL3 server without problems.</span><br style="font-family: verdana;">
<br style="font-family: verdana;"><span style="font-family: verdana;">Any ideas ?<br><br>Regards,<br><br>Fabricio<br style="font-family: verdana;"></span><br style="font-family: verdana;"><div><span class="gmail_quote">On 10/17/06, 
<b class="gmail_sendername">Alasdair G Kergon</b> &lt;<a href="mailto:agk@redhat.com">agk@redhat.com</a>&gt; wrote:</span><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
On Tue, Oct 17, 2006 at 07:00:52PM -0300, Fabricio Candido wrote:<br>&gt; Is it possible to my RHEL4 system use these lvm1 vgs without converting it ?<br>&gt; What is necessary ?<br><br>Yes, provided you can manage without snapshots and pvmove.
<br>[Alternatively, you can run vgconvert to update your metadata in-situ to the<br>new lvm2 format.]<br><br>Alasdair<br>--<br><a href="mailto:agk@redhat.com">agk@redhat.com</a><br><br>_______________________________________________
<br>linux-lvm mailing list<br><a href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br><a href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO at 
<a href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a><br></blockquote></div><br>

------=_Part_42639_29192051.1161127288137--
