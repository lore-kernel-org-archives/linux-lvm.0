Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mBUK4oTP010021
	for <linux-lvm@redhat.com>; Tue, 30 Dec 2008 15:04:50 -0500
Received: from rv-out-0506.google.com (rv-out-0506.google.com [209.85.198.235])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mBUK4XHW003131
	for <linux-lvm@redhat.com>; Tue, 30 Dec 2008 15:04:34 -0500
Received: by rv-out-0506.google.com with SMTP id f6so5611931rvb.51
	for <linux-lvm@redhat.com>; Tue, 30 Dec 2008 12:04:33 -0800 (PST)
Message-ID: <8c87cb5a0812301204p7df54dc0u707b36e99a89e104@mail.gmail.com>
Date: Tue, 30 Dec 2008 15:04:33 -0500
From: "Doug Eubanks" <admin@dougware.net>
Subject: Re: [linux-lvm] Convert a non-striped LV to a striped LV without data
	loss?
In-Reply-To: <Pine.LNX.4.64.0812301454250.26679@bmsred.bmsi.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_133943_17753052.1230667473395"
References: <8c87cb5a0812291854w2b56cb6cr3a14932442cfa80e@mail.gmail.com>
	<20081230185211.GB27523@seneca.muc.de>
	<8c87cb5a0812301150ibeeb939kaca1ea789a2e0a57@mail.gmail.com>
	<Pine.LNX.4.64.0812301454250.26679@bmsred.bmsi.com>
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

------=_Part_133943_17753052.1230667473395
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Yeah, that's basically what I want to do.  Technically, one of the pvs is in
use and has the lv on it.  I have three perc controllers in the system and
wanted to stripe the root partition across all three arrays instead of
having it sit on one array.

I think the only option I have is to extend the current lv and specify that
it should use 3 stripes for the extention, but I can't figure out how to
move the existing data from the old linear potion of the logical volume.
I'm hoping that some incarnation of lvreduce could do that.

Sincerely,
Doug Eubanks
admin@dougware.net


On Tue, Dec 30, 2008 at 2:57 PM, Stuart D. Gathman <stuart@bmsi.com> wrote:

> On Tue, 30 Dec 2008, Doug Eubanks wrote:
>
> > No, I have a current linear lv that I want to stripe across three
> different
> > hardware based RAID 5 controllers (3 pvs).
>
> I think he wants to know if he can add the 3 new PVs to the same volume
> group as the linear lv (of course), and then migrate the LV to be striped
> across the 3 PVs.
>
> As far as I can see, this is certainly possible with device mapper - but
> I'm not aware of any support in current user mode tools.
>
> --
>              Stuart D. Gathman <stuart@bmsi.com>
>    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
> "Confutatis maledictis, flammis acribus addictis" - background song for
> a Microsoft sponsored "Where do you want to go from here?" commercial.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

------=_Part_133943_17753052.1230667473395
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Yeah, that&#39;s basically what I want to do.&nbsp; Technically, one of the pvs is in use and has the lv on it.&nbsp; I have three perc controllers in the system and wanted to stripe the root partition across all three arrays instead of having it sit on one array.<br>
<br>I think the only option I have is to extend the current lv and specify that it should use 3 stripes for the extention, but I can&#39;t figure out how to move the existing data from the old linear potion of the logical volume.&nbsp; I&#39;m hoping that some incarnation of lvreduce could do that.<br>
<br clear="all">Sincerely,<br>Doug Eubanks<br><a href="mailto:admin@dougware.net">admin@dougware.net</a><br>
<br><br><div class="gmail_quote">On Tue, Dec 30, 2008 at 2:57 PM, Stuart D. Gathman <span dir="ltr">&lt;<a href="mailto:stuart@bmsi.com">stuart@bmsi.com</a>&gt;</span> wrote:<br><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
<div class="Ih2E3d">On Tue, 30 Dec 2008, Doug Eubanks wrote:<br>
<br>
&gt; No, I have a current linear lv that I want to stripe across three different<br>
&gt; hardware based RAID 5 controllers (3 pvs).<br>
<br>
</div>I think he wants to know if he can add the 3 new PVs to the same volume<br>
group as the linear lv (of course), and then migrate the LV to be striped<br>
across the 3 PVs.<br>
<br>
As far as I can see, this is certainly possible with device mapper - but<br>
I&#39;m not aware of any support in current user mode tools.<br>
<font color="#888888"><br>
--<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Stuart D. Gathman &lt;<a href="mailto:stuart@bmsi.com">stuart@bmsi.com</a>&gt;<br>
 &nbsp; &nbsp;Business Management Systems Inc. &nbsp;Phone: 703 591-0911 Fax: 703 591-6154<br>
&quot;Confutatis maledictis, flammis acribus addictis&quot; - background song for<br>
a Microsoft sponsored &quot;Where do you want to go from here?&quot; commercial.<br>
</font><div><div></div><div class="Wj3C7c"><br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href="https://www.redhat.com/mailman/listinfo/linux-lvm" target="_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO/" target="_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</div></div></blockquote></div><br>

------=_Part_133943_17753052.1230667473395--
