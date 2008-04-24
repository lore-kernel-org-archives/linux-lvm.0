Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3OELY2n007307
	for <linux-lvm@redhat.com>; Thu, 24 Apr 2008 10:21:34 -0400
Received: from rv-out-0506.google.com (rv-out-0708.google.com [209.85.198.241])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3OELJPD023983
	for <linux-lvm@redhat.com>; Thu, 24 Apr 2008 10:21:19 -0400
Received: by rv-out-0506.google.com with SMTP id b17so1782311rvf.51
	for <linux-lvm@redhat.com>; Thu, 24 Apr 2008 07:21:18 -0700 (PDT)
Message-ID: <1c748a490804240721g639303d8g5b5071dea15332bb@mail.gmail.com>
Date: Thu, 24 Apr 2008 07:21:18 -0700
From: "Larry Dickson" <ldickson@cuttedge.com>
Subject: Re: [linux-lvm] Snapshot question... [scaling problem]
In-Reply-To: <a71bd89a0804232110o28f37e17j486315d745ae7724@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_852_27057332.1209046878543"
References: <480DBE54.1090406@Media-Brokers.com>
	<chaz20080422104744.GI20413@artesyncp.com>
	<1208880734.7871.86.camel@pc.ilinx>
	<1209009445.11656.97.camel@corn.betterworld.us>
	<a71bd89a0804232110o28f37e17j486315d745ae7724@mail.gmail.com>
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

------=_Part_852_27057332.1209046878543
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

There is also a subtle point here. If one of the older snapshots already
"saw" a change to that block, which came on before a newer snapshot was
started, then you will write to the new COW and not to the old. But as Dan
says, that can still leave a lot of sloshing around... especially with data
of the "hit each one rarely" type.

There's an almost trivial variant on this, where you keep the
(read-only) snapshots in a time-ordered sequence, and freeze the last
snapshot COW at the same moment as you start the next snapshot. Then writing
only ever hits the new snapshot COW, and reading from any older snapshot
(virtual) volume involves figuring out which is the first after that to hold
the block, but still involves reading only one block. I wonder why LVM does
not do this. Perhaps Zumastor does? Or somebody else?

Larry Dickson

On 4/23/08, Dan Kegel <dank@kegel.com> wrote:
>
> On Wed, Apr 23, 2008 at 8:57 PM, Ross Boylan <ross@biostat.ucsf.edu>
> wrote:
> >  > > but
> >  > > when you write to it, the system makes sure that unless it has
> >  > > been done already, the block you're modifying are being copied
> >  > > first from the "real" volume to COW volume before being modified
> >  > > in the "real" volume.
> >  >
> >  > And to be clear, the COW volumes of _all_ snapshots[1].  This is where
> >  > the snapshot scaling problem arises.
> >  Could someone say a bit more, because I definitely don't follow this.
>
> If you have a single original volume, and you keep ten snapshots
> of it, and then you write a block to the original volume, you
> may end up needing to write eleven blocks.  Ouch!
>
> Thus the write overhead of LVM snapshots scales poorly with the
> number of snapshots per volume.
>
> Note that LVM snapshots scale well with the number of volumes,
> but that's not interesting or surprising, as each volume is independent.
> - Dan
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

------=_Part_852_27057332.1209046878543
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div>There is also a subtle point here. If one of the older snapshots already &quot;saw&quot; a change to that block, which came on before a newer snapshot was started, then you will write to the new COW and not to the old. But as Dan says, that can still leave a lot of sloshing around... especially with data of the &quot;hit each one rarely&quot; type.</div>

<div>&nbsp;</div>
<div>There&#39;s an almost trivial variant on this, where you keep the (read-only)&nbsp;snapshots in a time-ordered sequence, and freeze the last snapshot COW&nbsp;at the same moment as you start the next snapshot. Then writing only ever hits the new snapshot COW, and reading from any older snapshot (virtual) volume involves figuring out which is the first after that to hold the block, but still involves reading only one block. I wonder why LVM does not do this. Perhaps Zumastor does? Or somebody else?<br>
&nbsp;</div>
<div>Larry Dickson<br>&nbsp;</div>
<div><span class="gmail_quote">On 4/23/08, <b class="gmail_sendername">Dan Kegel</b> &lt;<a onclick="return top.js.OpenExtLink(window,event,this)" href="mailto:dank@kegel.com" target="_blank">dank@kegel.com</a>&gt; wrote:</span> 
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">On Wed, Apr 23, 2008 at 8:57 PM, Ross Boylan &lt;<a onclick="return top.js.OpenExtLink(window,event,this)" href="mailto:ross@biostat.ucsf.edu" target="_blank">ross@biostat.ucsf.edu</a>&gt; wrote:<br>
&gt;&nbsp;&nbsp;&gt; &gt; but<br>&gt;&nbsp;&nbsp;&gt; &gt; when you write to it, the system makes sure that unless it has<br>&gt;&nbsp;&nbsp;&gt; &gt; been done already, the block you&#39;re modifying are being copied<br>&gt;&nbsp;&nbsp;&gt; &gt; first from the &quot;real&quot; volume to COW volume before being modified<br>
&gt;&nbsp;&nbsp;&gt; &gt; in the &quot;real&quot; volume.<br>&gt;&nbsp;&nbsp;&gt;<br>&gt;&nbsp;&nbsp;&gt; And to be clear, the COW volumes of _all_ snapshots[1].&nbsp;&nbsp;This is where<br>&gt;&nbsp;&nbsp;&gt; the snapshot scaling problem arises.<br>&gt;&nbsp;&nbsp;Could someone say a bit more, because I definitely don&#39;t follow this.<br>
<br>If you have a single original volume, and you keep ten snapshots<br>of it, and then you write a block to the original volume, you<br>may end up needing to write eleven blocks.&nbsp;&nbsp;Ouch!<br><br>Thus the write overhead of LVM snapshots scales poorly with the<br>
number of snapshots per volume.<br><br>Note that LVM snapshots scale well with the number of volumes,<br>but that&#39;s not interesting or surprising, as each volume is independent.<br>- Dan<br><br>_______________________________________________<br>
linux-lvm mailing list<br><a onclick="return top.js.OpenExtLink(window,event,this)" href="mailto:linux-lvm@redhat.com" target="_blank">linux-lvm@redhat.com</a><br><a onclick="return top.js.OpenExtLink(window,event,this)" href="https://www.redhat.com/mailman/listinfo/linux-lvm" target="_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a onclick="return top.js.OpenExtLink(window,event,this)" href="http://tldp.org/HOWTO/LVM-HOWTO/" target="_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br></blockquote></div><br>

------=_Part_852_27057332.1209046878543--
