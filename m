Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mAAFBsoh016985
	for <linux-lvm@redhat.com>; Mon, 10 Nov 2008 10:11:54 -0500
Received: from fg-out-1718.google.com (fg-out-1718.google.com [72.14.220.152])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mAAFBeiS009068
	for <linux-lvm@redhat.com>; Mon, 10 Nov 2008 10:11:41 -0500
Received: by fg-out-1718.google.com with SMTP id e21so2356843fga.7
	for <linux-lvm@redhat.com>; Mon, 10 Nov 2008 07:11:40 -0800 (PST)
Message-ID: <1c748a490811100711m7b09f422nb1f4eeced5d2e2bb@mail.gmail.com>
Date: Mon, 10 Nov 2008 07:11:40 -0800
From: "Larry Dickson" <ldickson@cuttedge.com>
Subject: Re: [linux-lvm] write performance with active snapshot
In-Reply-To: <gf70ks$16f$1@ger.gmane.org>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_18005_6506931.1226329900119"
References: <gf70ks$16f$1@ger.gmane.org>
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

------=_Part_18005_6506931.1226329900119
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

My guess is that you are getting the typical seek overhead. Have you tried
making a volume group out of two separate RAID arrays (driving different
spindles), and using lvdisplay --maps to make sure the parent volume is on
one array, the snapshot(s) on the other?

Larry Dickson
Cutting Edge Networked Storage

On 11/9/08, Peter Daum <gator_ml@yahoo.de> wrote:
>
> Hi,
>
> for an application I am just working on it looks like lvm snapshots would
> be just what I need as far as functionality is concerned. Unfortunately,
> I am experiencing such a massive degradation in performance, that the
> result is almost useless.
>
> I'm working on a fairly fast machine (Quadcore, 8GB RAM) with a big
> hardware RAID array and lvm2 (Debian Lenny; Linux 2.6.26-1-amd64;
> LVM version:2.02.39 (2008-06-27)
> Library version: 1.02.27 (2008-06-25)
> Driver version:  4.13.0)
>
> Sequentially writing to a file (ext3) on a logical volume, I get a
> sustained performance of ~ 250 MB/sec. When I create a snapshot
> volume, the write throughput drops to 7-8 MB/secs (on the original
> volume; writing to the snapshot I see a significant degradation,
> but not nearly, as bad; read performance is o.k.).Is this "normal"
> or is there anything I can do to about it?
>
> I looked in this list and searched the WWW but couldn't find any
> concrete information on the performance impact of snapshots
> (except http://www.nikhef.nl/~dennisvd/lvmcrap.html).
> It seems like write performance should probably be less then 1/3
> of the original throughput, because every write to the source
> volume causes 3 I/O operations plus some overhead for meta data.
> More difficult to estimate would be the time lost by additional
> head movements. Still, a throughput degradation by a factor of 30
> seems pretty extreme.
>
> Any ideas?
>
> Regards,
>                         Peter Daum
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

------=_Part_18005_6506931.1226329900119
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div>My guess is that you are getting the typical seek overhead. Have you tried making a volume group out of two separate RAID arrays (driving different spindles), and using lvdisplay --maps to make sure the parent volume is on one array, the snapshot(s) on the other?</div>

<div>&nbsp;</div>
<div>Larry Dickson</div>
<div>Cutting Edge Networked Storage<br>&nbsp;</div>
<div><span class="gmail_quote">On 11/9/08, <b class="gmail_sendername">Peter Daum</b> &lt;<a href="mailto:gator_ml@yahoo.de">gator_ml@yahoo.de</a>&gt; wrote:</span>
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">Hi,<br><br>for an application I am just working on it looks like lvm snapshots would<br>be just what I need as far as functionality is concerned. Unfortunately,<br>
I am experiencing such a massive degradation in performance, that the<br>result is almost useless.<br><br>I&#39;m working on a fairly fast machine (Quadcore, 8GB RAM) with a big<br>hardware RAID array and lvm2 (Debian Lenny; Linux 2.6.26-1-amd64;<br>
LVM version:2.02.39 (2008-06-27)<br>Library version: 1.02.27 (2008-06-25)<br>Driver version: &nbsp;4.13.0)<br><br>Sequentially writing to a file (ext3) on a logical volume, I get a<br>sustained performance of ~ 250 MB/sec. When I create a snapshot<br>
volume, the write throughput drops to 7-8 MB/secs (on the original<br>volume; writing to the snapshot I see a significant degradation,<br>but not nearly, as bad; read performance is o.k.).Is this &quot;normal&quot;<br>or is there anything I can do to about it?<br>
<br>I looked in this list and searched the WWW but couldn&#39;t find any<br>concrete information on the performance impact of snapshots<br>(except <a onclick="return top.js.OpenExtLink(window,event,this)" href="http://www.nikhef.nl/~dennisvd/lvmcrap.html" target="_blank">http://www.nikhef.nl/~dennisvd/lvmcrap.html</a>).<br>
It seems like write performance should probably be less then 1/3<br>of the original throughput, because every write to the source<br>volume causes 3 I/O operations plus some overhead for meta data.<br>More difficult to estimate would be the time lost by additional<br>
head movements. Still, a throughput degradation by a factor of 30<br>seems pretty extreme.<br><br>Any ideas?<br><br>Regards,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Peter Daum<br><br><br>_______________________________________________<br>
linux-lvm mailing list<br><a onclick="return top.js.OpenExtLink(window,event,this)" href="mailto:linux-lvm@redhat.com" target="_blank">linux-lvm@redhat.com</a><br><a onclick="return top.js.OpenExtLink(window,event,this)" href="https://www.redhat.com/mailman/listinfo/linux-lvm" target="_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a onclick="return top.js.OpenExtLink(window,event,this)" href="http://tldp.org/HOWTO/LVM-HOWTO/" target="_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br></blockquote></div><br>

------=_Part_18005_6506931.1226329900119--
