Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3OHKH2i026218
	for <linux-lvm@redhat.com>; Thu, 24 Apr 2008 13:20:17 -0400
Received: from hu-out-0506.google.com (hu-out-0506.google.com [72.14.214.225])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3OHK0FS022372
	for <linux-lvm@redhat.com>; Thu, 24 Apr 2008 13:20:03 -0400
Received: by hu-out-0506.google.com with SMTP id 19so2568693hue.21
	for <linux-lvm@redhat.com>; Thu, 24 Apr 2008 10:20:00 -0700 (PDT)
Message-ID: <1c748a490804241019l30e33fceyfd6b410119f94e15@mail.gmail.com>
Date: Thu, 24 Apr 2008 10:19:56 -0700
From: "Larry Dickson" <ldickson@cuttedge.com>
Subject: Re: [linux-lvm] Snapshot question... [scaling problem]
In-Reply-To: <Pine.LNX.4.44.0804241151140.30374-100000@bmsred.bmsi.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_6438_1095271.1209057596567"
References: <1c748a490804240721g639303d8g5b5071dea15332bb@mail.gmail.com>
	<Pine.LNX.4.44.0804241151140.30374-100000@bmsred.bmsi.com>
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

------=_Part_6438_1095271.1209057596567
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

>Then you can't delete an older snapsnot until you delete all newer ones.

Not true of what I was proposing - are we talking past each other? If snap 0
is the current (live) COW, and snap -k refers to time(-k) = time(snap 0) -
k*(interval), then reading the virtual
data for time(-k) involves looking at snap -k, then snap -k+1, ... snap 0,
current data; but stopping the first time your block gets a hit. The only
point with a race is {snap 0, current data}. So you can't delete a NEWER
snapshot until you delete all OLDER ones (because the virtual older snaps
need the newer COWs). That seems a small price to pay, since normally you
throw them away oldest first.

Larry

On 4/24/08, Stuart D. Gathman <stuart@bmsi.com> wrote:
>
> On Thu, 24 Apr 2008, Larry Dickson wrote:
>
> > There's an almost trivial variant on this, where you keep the
> > (read-only) snapshots in a time-ordered sequence, and freeze the last
> > snapshot COW at the same moment as you start the next snapshot. Then
> writing
> > only ever hits the new snapshot COW, and reading from any older snapshot
> > (virtual) volume involves figuring out which is the first after that to
> hold
> > the block, but still involves reading only one block. I wonder why LVM
> does
> > not do this. Perhaps Zumastor does? Or somebody else?
>
> Then you can't delete an older snapsnot until you delete all newer ones.
>
> Zumastor works by using one COW table shared between all snapshots
> for a volume.  Blocks are added to the COW in time order.  The origin
> ignores COW blocks before the last time point (block offset), writing a
> new COW
> block for any modified since that time point.  The snapshots also use
> timepoints in a way that is straightforward, but I don't want to think
> about it at the moment :-)
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

------=_Part_6438_1095271.1209057596567
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div>&gt;Then you can&#39;t delete an older snapsnot until you delete all newer ones.<br>&nbsp;</div>
<div>Not true of what I was proposing - are we talking past each other? If snap 0 is the current (live) COW, and snap -k refers to time(-k) = time(snap 0) - k*(interval), then reading the virtual</div>
<div>data for time(-k) involves looking at snap -k, then snap -k+1, ... snap 0, current data; but stopping the first time your block gets a hit. The only point with a race is {snap 0, current data}. So you can&#39;t delete a NEWER snapshot until you delete all OLDER ones (because the virtual older snaps need the newer COWs). That seems a small price to pay, since normally you throw them away oldest first.</div>

<div>&nbsp;</div>
<div>Larry<br>&nbsp;</div>
<div><span class="gmail_quote">On 4/24/08, <b class="gmail_sendername">Stuart D. Gathman</b> &lt;<a href="mailto:stuart@bmsi.com">stuart@bmsi.com</a>&gt; wrote:</span>
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">On Thu, 24 Apr 2008, Larry Dickson wrote:<br><br>&gt; There&#39;s an almost trivial variant on this, where you keep the<br>
&gt; (read-only) snapshots in a time-ordered sequence, and freeze the last<br>&gt; snapshot COW at the same moment as you start the next snapshot. Then writing<br>&gt; only ever hits the new snapshot COW, and reading from any older snapshot<br>
&gt; (virtual) volume involves figuring out which is the first after that to hold<br>&gt; the block, but still involves reading only one block. I wonder why LVM does<br>&gt; not do this. Perhaps Zumastor does? Or somebody else?<br>
<br>Then you can&#39;t delete an older snapsnot until you delete all newer ones.<br><br>Zumastor works by using one COW table shared between all snapshots<br>for a volume.&nbsp;&nbsp;Blocks are added to the COW in time order.&nbsp;&nbsp;The origin<br>
ignores COW blocks before the last time point (block offset), writing a new COW<br>block for any modified since that time point.&nbsp;&nbsp;The snapshots also use<br>timepoints in a way that is straightforward, but I don&#39;t want to think<br>
about it at the moment :-)<br><br>--<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Stuart D. Gathman &lt;<a href="mailto:stuart@bmsi.com">stuart@bmsi.com</a>&gt;<br>&nbsp;&nbsp; Business Management Systems Inc.&nbsp;&nbsp;Phone: 703 591-0911 Fax: 703 591-6154<br>&quot;Confutatis maledictis, flammis acribus addictis&quot; - background song for<br>
a Microsoft sponsored &quot;Where do you want to go from here?&quot; commercial.<br><br>_______________________________________________<br>linux-lvm mailing list<br><a href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</blockquote></div><br>

------=_Part_6438_1095271.1209057596567--
