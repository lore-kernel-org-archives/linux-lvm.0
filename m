Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8GN26dL003019
	for <linux-lvm@redhat.com>; Tue, 16 Sep 2008 19:02:07 -0400
Received: from rv-out-0506.google.com (rv-out-0506.google.com [209.85.198.231])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m8GN1W4u005073
	for <linux-lvm@redhat.com>; Tue, 16 Sep 2008 19:01:32 -0400
Received: by rv-out-0506.google.com with SMTP id f6so2912226rvb.51
	for <linux-lvm@redhat.com>; Tue, 16 Sep 2008 16:01:32 -0700 (PDT)
Message-ID: <1c748a490809161601q6e1040a3i90861648c1d7fc92@mail.gmail.com>
Date: Tue, 16 Sep 2008 16:01:32 -0700
From: "Larry Dickson" <ldickson@cuttedge.com>
Subject: Re: [linux-lvm] Mirrored LV
In-Reply-To: <1221599565.6037.82.camel@localhost>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_9773_6804335.1221606092204"
References: <1221592827.6037.57.camel@localhost>
	<20080916204241.GA9810@us.ibm.com>
	<1221599565.6037.82.camel@localhost>
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

------=_Part_9773_6804335.1221606092204
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

How often does the log get written in normal use, and how big does it get,
how fast? If it's a low-bandwidth sort of thing, could it go to some kind of
solid-state storage?

Larry Dickson
Cutting Edge Networked Storage

On 9/16/08, Koen Vermeer <koen@vermeer.tv> wrote:
>
> Op dinsdag 16-09-2008 om 13:42 uur [tijdzone -0700], schreef
> malahal@us.ibm.com:
> > The log records what regions of your master device are in sync with your
> > other mirror device. It is used to synchronize the failed regions from
> > the master to your other device when your 'other device' comes back to
> > life. This should work whether your log device is in memory or on a PV
> > by itself as long as you don't de-activate or restart your machine. The
> > log data on a PV can be useful for reboots.
>
> I had written a lot of text with extra questions, but it seems I just
> don't get it - yet.
>
> If I understand you correctly, you're statements are about when the
> 'other device' is failing. Is this right? If so, then the log should
> normally show that everything is synced. In that case, it's not of much
> use in normal operation. Now, when one disk fails, I need to replace it,
> and rebuild the mirror. So again, I don't need it, because I have to
> copy everything anyway. Only when a disk is temporarily gone, it may be
> of some use. Does this make sense?
>
> Best,
> Koen
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

------=_Part_9773_6804335.1221606092204
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div>How often does the log get written in normal use, and how big does it get, how fast? If it&#39;s a low-bandwidth sort of thing, could it go to some kind of solid-state storage?</div>
<div>&nbsp;</div>
<div>Larry Dickson</div>
<div>Cutting Edge Networked Storage<br>&nbsp;</div>
<div><span class="gmail_quote">On 9/16/08, <b class="gmail_sendername">Koen Vermeer</b> &lt;<a href="mailto:koen@vermeer.tv">koen@vermeer.tv</a>&gt; wrote:</span>
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">Op dinsdag 16-09-2008 om 13:42 uur [tijdzone -0700], schreef<br><a href="mailto:malahal@us.ibm.com">malahal@us.ibm.com</a>:<br>
&gt; The log records what regions of your master device are in sync with your<br>&gt; other mirror device. It is used to synchronize the failed regions from<br>&gt; the master to your other device when your &#39;other device&#39; comes back to<br>
&gt; life. This should work whether your log device is in memory or on a PV<br>&gt; by itself as long as you don&#39;t de-activate or restart your machine. The<br>&gt; log data on a PV can be useful for reboots.<br><br>I had written a lot of text with extra questions, but it seems I just<br>
don&#39;t get it - yet.<br><br>If I understand you correctly, you&#39;re statements are about when the<br>&#39;other device&#39; is failing. Is this right? If so, then the log should<br>normally show that everything is synced. In that case, it&#39;s not of much<br>
use in normal operation. Now, when one disk fails, I need to replace it,<br>and rebuild the mirror. So again, I don&#39;t need it, because I have to<br>copy everything anyway. Only when a disk is temporarily gone, it may be<br>
of some use. Does this make sense?<br><br>Best,<br>Koen<br><br><br>_______________________________________________<br>linux-lvm mailing list<br><a href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br><a href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a><br></blockquote></div><br>

------=_Part_9773_6804335.1221606092204--
