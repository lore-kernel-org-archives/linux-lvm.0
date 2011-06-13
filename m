Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p5DF69UK001225
	for <linux-lvm@redhat.com>; Mon, 13 Jun 2011 11:06:09 -0400
Received: from mail-yw0-f46.google.com (mail-yw0-f46.google.com
	[209.85.213.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p5DF68mA004385
	for <linux-lvm@redhat.com>; Mon, 13 Jun 2011 11:06:08 -0400
Received: by ywe9 with SMTP id 9so2835900ywe.33
	for <linux-lvm@redhat.com>; Mon, 13 Jun 2011 08:06:08 -0700 (PDT)
In-Reply-To: <alpine.LRH.2.00.1106071133440.12374@bmsred.bmsi.com>
References: <BANLkTi=O_ua2rMCA3Cs4tvvExzjo5cxBOg@mail.gmail.com>
	<alpine.LRH.2.00.1106070822200.11302@bmsred.bmsi.com>
	<BANLkTikGwknQ7r5P76UqifeCeFRkaX=G=g@mail.gmail.com>
	<alpine.LRH.2.00.1106071124130.12374@bmsred.bmsi.com>
	<alpine.LRH.2.00.1106071133440.12374@bmsred.bmsi.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----5B3AT8LSL9A76GCUH8GGWYEEWSGB5C"
From: Andrew Z <formisc@gmail.com>
Date: Mon, 13 Jun 2011 11:05:41 -0400
Message-ID: <f326b4e3-21bd-49b8-a5c7-c89935cbb94f@email.android.com>
Subject: Re: [linux-lvm] Installation fails if VG is exported
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>LVM general discussion and development <linux-lvm@redhat.com>

------5B3AT8LSL9A76GCUH8GGWYEEWSGB5C
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 8bit

"Stuart D. Gathman" <stuart@bmsi.com> wrote:

On Tue, 7 Jun 2011, Stuart D. Gathman wrote: >>> Exporting the VG is *supposed* to prevent activation. You can reverse >>> this with vgimport. Why did you wish to prevent activation? Normally, >>> vgexport is used prior to physically removing a VG from the system. (And >>> then vgimport after attaching the drives to the new system.) >> >> Well, I just want to keep my data intact while i'm playing with the >> installation. I understand that @ this point it's just easier to pull >> the power on the HDs with the VG in question. But i'm curious why this >> is a problem... > > It isn't a problem, unless you expect the VG to be available at boot time, > which apparently you do. Do you have a root FS on the VG? I get it - you wanted to prevent your OS experimentation from activating and possibly writing over your VG. I can understand why vgexport seemed like a solution, but it only prevents activation and removes references from local LVM configuration (and prevents booting when th!
 at
depends on the VG as you discovered). It doesn't prevent a rogue/buggy OS from scribbling on the disks. So, physically disconnecting (or powering off) the disks is the best way to prevent that. -- 	 Stuart D. Gathman <stuart@bmsi.com> Business Management Systems Inc. Phone: 703 591-0911 Fax: 703 591-6154 "Confutatis maledictis, flammis acribus addictis" - background song for a Microsoft sponsored "Where do you want to go from here?" commercial._____________________________________________
linux-lvm mailing list linux-lvm@redhat.com https://www.redhat.com/mailman/listinfo/linux-lvm read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/ 


After stressing out about he insraller messing out with my "precious" :) data, the installation went remarkably well. I still think that it should not terminate because of exported volumes thou.
Andrew 
-- 
Sent from my Android phone with K-9 Mail. Please excuse my brevity.
------5B3AT8LSL9A76GCUH8GGWYEEWSGB5C
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head></head><body><div class="gmail_quote">&quot;Stuart D. Gathman&quot; &lt;stuart@bmsi.com&gt; wrote:<blockquote class="gmail_quote" style="margin: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
<pre style="white-space: pre-wrap; word-wrap:break-word; ">On Tue, 7 Jun 2011, Stuart D. Gathman wrote:

&gt;&gt;&gt; Exporting the VG is *supposed* to prevent activation.  You can reverse 
&gt;&gt;&gt; this with vgimport.  Why did you wish to prevent activation?  Normally,
&gt;&gt;&gt; vgexport is used prior to physically removing a VG from the system.  (And
&gt;&gt;&gt; then vgimport after attaching the drives to the new system.)
&gt;&gt; 
&gt;&gt; Well, I just want to keep my data intact while i'm playing with the
&gt;&gt; installation. I understand that @ this point it's just easier to pull
&gt;&gt; the power on the HDs with the VG in question. But i'm curious why this
&gt;&gt; is a problem...
&gt;
&gt; It isn't a problem, unless you expect the VG to be available at boot time,
&gt; which apparently you do.  Do you have a root FS on the VG?

I get it - you wanted to prevent your OS experimentation from activating and possibly writing over your VG.  I can understand why vgexport seemed like a solution, but it only prevents activation and removes references from local LVM configuration (and prevents booting when that depends on the VG as you discovered).

It doesn't prevent a rogue/buggy OS from scribbling on the disks.  So, physically disconnecting (or powering off) the disks is the best way to prevent that.

--
 	      Stuart D. Gathman &lt;stuart@bmsi.com&gt;
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for a Microsoft sponsored "Where do you want to go from here?" commercial.<hr />linux-lvm mailing list
linux-lvm@redhat.com
<a href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a> read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a>
</pre></blockquote></div><br clear="all">After stressing out about he insraller messing out with my &quot;precious&quot; :) data, the installation went remarkably well. I still think that it should not terminate because of exported volumes thou.<br>
Andrew <br>
-- <br>
Sent from my Android phone with K-9 Mail. Please excuse my brevity.</body></html>
------5B3AT8LSL9A76GCUH8GGWYEEWSGB5C--
