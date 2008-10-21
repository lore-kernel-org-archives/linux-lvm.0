Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m9LE7nmS011568
	for <linux-lvm@redhat.com>; Tue, 21 Oct 2008 10:07:49 -0400
Received: from rv-out-0506.google.com (rv-out-0506.google.com [209.85.198.228])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m9LE7Z9c019385
	for <linux-lvm@redhat.com>; Tue, 21 Oct 2008 10:07:37 -0400
Received: by rv-out-0506.google.com with SMTP id f6so2311457rvb.51
	for <linux-lvm@redhat.com>; Tue, 21 Oct 2008 07:07:35 -0700 (PDT)
Message-ID: <1c748a490810210707t2f006ff7q6e38b6330730e5cc@mail.gmail.com>
Date: Tue, 21 Oct 2008 07:07:34 -0700
From: "Larry Dickson" <ldickson@cuttedge.com>
Subject: Re: [linux-lvm] LVs corrupted after pvresize
In-Reply-To: <48FDB947.3090509@mortent.org>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_4829_15622389.1224598054843"
References: <48F7AD78.1000002@knebb.de>
	<Pine.LNX.4.64.0810161829570.14457@bmsred.bmsi.com>
	<48F80EFB.30404@knebb.de>
	<1224221030.7772.17.camel@localhost.localdomain>
	<Pine.LNX.4.64.0810201136250.14488@bmsred.bmsi.com>
	<1224528632.6013.66.camel@localhost.localdomain>
	<48FDB947.3090509@mortent.org>
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
To: morten@mortent.org, LVM general discussion and development <linux-lvm@redhat.com>

------=_Part_4829_15622389.1224598054843
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I thought lvdisplay --maps gave you the PV to LV mappings.

Larry Dickson
Cutting Edge Networked Storage

On 10/21/08, Morten Torstensen <morten@mortent.org> wrote:
>
> Peter Larsen wrote:
>
>> Can you give an example or two on how the LVM differs on the
>> user-friendliness areas?
>>
>
> Say you want to mirror a LV, then you just do a "mklvcopy mylvname 2" to
> have 2 copies of data (one extra, like raid-1). If you want to migrate your
> disks to a new system, add the new PV to your VG and do a "mklvcopy mylvname
> 3 newpv", then when it finish remove your old mirrors and delete the old
> PVs.
>
> The AIX concept of physical extent/logical extent mapping is sorely missed
> on linux.
>
> Generally speaking, LVM on AIX is also more mature. Exporting and importing
> VGs (to move VGs between systems) works better in my experience, clustering
> is more stable, but that is also something where YMMV can show.
>
> Managing mirrors, data placement and hotspot detection are what I mainly
> miss on Linux.
>
> --
>
> //Morten Torstensen
> //Email: morten@mortent.org
> //IM: Cartoon@jabber.no morten.torstensen@gmail.com
>
> And if it turns out that there is a God, I don't believe that he is evil.
> The worst that can be said is that he's an underachiever.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

------=_Part_4829_15622389.1224598054843
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div>I thought lvdisplay --maps gave you the PV to LV mappings.</div>
<div>&nbsp;</div>
<div>Larry Dickson</div>
<div>Cutting Edge Networked Storage<br>&nbsp;</div>
<div><span class="gmail_quote">On 10/21/08, <b class="gmail_sendername">Morten Torstensen</b> &lt;<a href="mailto:morten@mortent.org">morten@mortent.org</a>&gt; wrote:</span>
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid"><span class="q">Peter Larsen wrote:<br>
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">Can you give an example or two on how the LVM differs on the<br>user-friendliness areas?<br></blockquote><br>
</span>Say you want to mirror a LV, then you just do a &quot;mklvcopy mylvname 2&quot; to have 2 copies of data (one extra, like raid-1). If you want to migrate your disks to a new system, add the new PV to your VG and do a &quot;mklvcopy mylvname 3 newpv&quot;, then when it finish remove your old mirrors and delete the old PVs.<br>
<br>The AIX concept of physical extent/logical extent mapping is sorely missed on linux.<br><br>Generally speaking, LVM on AIX is also more mature. Exporting and importing VGs (to move VGs between systems) works better in my experience, clustering is more stable, but that is also something where YMMV can show.<br>
<br>Managing mirrors, data placement and hotspot detection are what I mainly miss on Linux.<br><span class="sg"><br>-- <br><br>//Morten Torstensen<br>//Email: <a onclick="return top.js.OpenExtLink(window,event,this)" href="mailto:morten@mortent.org" target="_blank">morten@mortent.org</a><br>
//IM: <a onclick="return top.js.OpenExtLink(window,event,this)" href="mailto:Cartoon@jabber.no" target="_blank">Cartoon@jabber.no</a> <a onclick="return top.js.OpenExtLink(window,event,this)" href="mailto:morten.torstensen@gmail.com" target="_blank">morten.torstensen@gmail.com</a><br>
<br>And if it turns out that there is a God, I don&#39;t believe that he is evil.<br>The worst that can be said is that he&#39;s an underachiever.</span> 
<div><span class="e" id="q_11d1f1ca9fe0e4d0_3"><br><br>_______________________________________________<br>linux-lvm mailing list<br><a onclick="return top.js.OpenExtLink(window,event,this)" href="mailto:linux-lvm@redhat.com" target="_blank">linux-lvm@redhat.com</a><br>
<a onclick="return top.js.OpenExtLink(window,event,this)" href="https://www.redhat.com/mailman/listinfo/linux-lvm" target="_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO at <a onclick="return top.js.OpenExtLink(window,event,this)" href="http://tldp.org/HOWTO/LVM-HOWTO/" target="_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</span></div></blockquote></div><br>

------=_Part_4829_15622389.1224598054843--
