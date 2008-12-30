Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mBUJpCh5006478
	for <linux-lvm@redhat.com>; Tue, 30 Dec 2008 14:51:12 -0500
Received: from mu-out-0910.google.com (mu-out-0910.google.com [209.85.134.188])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mBUJotWh028490
	for <linux-lvm@redhat.com>; Tue, 30 Dec 2008 14:50:55 -0500
Received: by mu-out-0910.google.com with SMTP id g7so2148466muf.1
	for <linux-lvm@redhat.com>; Tue, 30 Dec 2008 11:50:55 -0800 (PST)
Message-ID: <8c87cb5a0812301150ibeeb939kaca1ea789a2e0a57@mail.gmail.com>
Date: Tue, 30 Dec 2008 14:50:55 -0500
From: "Doug Eubanks" <admin@dougware.net>
Subject: Re: [linux-lvm] Convert a non-striped LV to a striped LV without data
	loss?
In-Reply-To: <20081230185211.GB27523@seneca.muc.de>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_135672_15460507.1230666655068"
References: <8c87cb5a0812291854w2b56cb6cr3a14932442cfa80e@mail.gmail.com>
	<20081230185211.GB27523@seneca.muc.de>
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

------=_Part_135672_15460507.1230666655068
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

No, I have a current linear lv that I want to stripe across three different
hardware based RAID 5 controllers (3 pvs).

Sincerely,
Doug Eubanks
admin@dougware.net


On Tue, Dec 30, 2008 at 1:52 PM, Harald Milz <hm@seneca.muc.de> wrote:

> On Mon, Dec 29, 2008 at 09:54:20PM -0500, Doug Eubanks wrote:
> > Is it possible to convert a logical volume that's only on one physical
> > volume to a striped logical volume without data loss, and preferably
> online?
>
> No - only by copying data to a temp space before. But why would you want to
> stripe an LV on a single PV? Burn spare CPU cycles and stress the disk?
>
>
> --
> The trouble with superheros is what to do between phone booths.
>                -- Ken Kesey
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

------=_Part_135672_15460507.1230666655068
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

No, I have a current linear lv that I want to stripe across three different hardware based RAID 5 controllers (3 pvs).<br><br clear="all">Sincerely,<br>Doug Eubanks<br><a href="mailto:admin@dougware.net">admin@dougware.net</a><br>

<br><br><div class="gmail_quote">On Tue, Dec 30, 2008 at 1:52 PM, Harald Milz <span dir="ltr">&lt;<a href="mailto:hm@seneca.muc.de">hm@seneca.muc.de</a>&gt;</span> wrote:<br><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
<div class="Ih2E3d">On Mon, Dec 29, 2008 at 09:54:20PM -0500, Doug Eubanks wrote:<br>
&gt; Is it possible to convert a logical volume that&#39;s only on one physical<br>
&gt; volume to a striped logical volume without data loss, and preferably online?<br>
<br>
</div>No - only by copying data to a temp space before. But why would you want to<br>
stripe an LV on a single PV? Burn spare CPU cycles and stress the disk?<br>
<br>
<br>
--<br>
The trouble with superheros is what to do between phone booths.<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;-- Ken Kesey<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href="https://www.redhat.com/mailman/listinfo/linux-lvm" target="_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO/" target="_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</blockquote></div><br>

------=_Part_135672_15460507.1230666655068--
