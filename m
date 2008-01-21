Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m0LDVFPT017021
	for <linux-lvm@redhat.com>; Mon, 21 Jan 2008 08:31:15 -0500
Received: from ag-out-0708.google.com (ag-out-0708.google.com [72.14.246.248])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m0LDUrE6032093
	for <linux-lvm@redhat.com>; Mon, 21 Jan 2008 08:30:53 -0500
Received: by ag-out-0708.google.com with SMTP id 22so1516533agd.7
	for <linux-lvm@redhat.com>; Mon, 21 Jan 2008 05:30:53 -0800 (PST)
Message-ID: <ddaf98bd0801210530u2855b767p9bce691f3e88dc8c@mail.gmail.com>
Date: Mon, 21 Jan 2008 07:30:53 -0600
From: "Cory Zerwas" <gannas@gmail.com>
Subject: Re: [linux-lvm] Recover UUID
In-Reply-To: <e2be335f0801201942w1c3a7687gbe0d57df3cb754f5@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_18851_26455932.1200922253130"
References: <e2be335f0801201942w1c3a7687gbe0d57df3cb754f5@mail.gmail.com>
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

------=_Part_18851_26455932.1200922253130
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

This is pretty similar to what happened to me recently.  Hopefully someone
will take the time to help one, or both, of us out.  In the interim can you
do at least a "uname -r" to get your major kernel version and a "lvm" then
"version" within the lvm program to get the LVM version numbers, this can
assist people helping you.

Regards,
Cory

2008/1/20 J Lindsay <lindsay.james@gmail.com>:

> Hello,
> I recently had a hardware failure on my OS disk, which means I lost all
> files including /etc/lvm/archive. My LVM2 volume spans 3 disks, all of which
> are intact. How do I go about recreating this volume, without knowing the
> UUID's of the disks. I tried running uuid_fixer but was given the error
> "pv_read(): pv_flush". Running lvscan and pvscan returns no results.
>
> Thanks,
> James
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

------=_Part_18851_26455932.1200922253130
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

This is pretty similar to what happened to me recently.&nbsp; Hopefully someone will take the time to help one, or both, of us out.&nbsp; In the interim can you do at least a &quot;uname -r&quot; to get your major kernel version and a &quot;lvm&quot; then &quot;version&quot; within the lvm program to get the LVM version numbers, this can assist people helping you.
<br><br>Regards,<br>Cory<br><br><div class="gmail_quote">2008/1/20 J Lindsay &lt;<a href="mailto:lindsay.james@gmail.com">lindsay.james@gmail.com</a>&gt;:<br><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
Hello,<br>I recently had a hardware failure on my OS disk, which means I lost all files including /etc/lvm/archive. My LVM2 volume spans 3 disks, all of which are intact. How do I go about recreating this volume, without knowing the UUID&#39;s of the disks. I tried running uuid_fixer but was given the error &quot;pv_read(): pv_flush&quot;. Running lvscan and pvscan returns no results.
<br><br>Thanks,<br>James<br>
<br>_______________________________________________<br>linux-lvm mailing list<br><a href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br><a href="https://www.redhat.com/mailman/listinfo/linux-lvm" target="_blank">
https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO/" target="_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br></blockquote></div><br>

------=_Part_18851_26455932.1200922253130--
