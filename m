Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m82MKaYR015398
	for <linux-lvm@redhat.com>; Tue, 2 Sep 2008 18:20:36 -0400
Received: from rv-out-0506.google.com (rv-out-0506.google.com [209.85.198.228])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m82MJsbq025852
	for <linux-lvm@redhat.com>; Tue, 2 Sep 2008 18:19:55 -0400
Received: by rv-out-0506.google.com with SMTP id f6so2371217rvb.51
	for <linux-lvm@redhat.com>; Tue, 02 Sep 2008 15:19:54 -0700 (PDT)
Message-ID: <1c748a490809021519i294d1d9fp912ce93cbf6f75d2@mail.gmail.com>
Date: Tue, 2 Sep 2008 15:19:53 -0700
From: "Larry Dickson" <ldickson@cuttedge.com>
Subject: Re: [linux-lvm] 15 snapshot limit?
In-Reply-To: <1c748a490809020731i39b214ebhc6e76fd964fc75b4@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_10109_6909390.1220393993317"
References: <1c748a490808291310g274df331ifc76fce539b56954@mail.gmail.com>
	<48B85CB6.1080403@redhat.com>
	<1c748a490808291412w17dd93f9qcd1454979e77c181@mail.gmail.com>
	<1c748a490809020731i39b214ebhc6e76fd964fc75b4@mail.gmail.com>
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

------=_Part_10109_6909390.1220393993317
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

More details: I found a /var/log/messages note that corresponded exactly to
the following bug:
==========================

http://www.linux-archive.org/debian-kernel/7067-bug-453254-linux-2-6-18-5-xen-686-unable-create-more-than-32-lvm-snapshots-total.html

11-28-2007, 01:34 AM
Peter de Zwart

Default Bug#453254: linux-2.6.18-5-xen-686: Unable to create more than 32
LVM snapshots in total
Package: linux-2.6.18-5-xen-686
Severity: normal


When attempting to create more than 32 LVM snapshots, the following error
message is sent from the Kernel:

device-mapper: table: 254:142: snapshot: Could not create kcopyd client
device-mapper: ioctl: error adding target to table

==========================
(End of reference; no follow-up found.) Except that in my case 15 is the max
snapshot count, not 32. Increasing memory from 4GB to 6GB does not help. I
notice mentions of this "Could not create kcopyd client" bug on the web all
the way back to 2004. Does anybody know any workaround? Our customer is not
happy about a 15-snapshot limit. Versions are (variants of) lvm2-2.02.38,
device-mapper-1.02.26, kernel-smp-2.6.20 (64 bit).

Larry
On 9/2/08, Larry Dickson <ldickson@cuttedge.com> wrote:
>
> Sorry, I did not make that last question clear:
>
> What (if any) is the formula by which I can predict the number of snapshots
> that are possible, given a certain size of the parent volume and/or
> snapshot and a certain amount of available memory? Milan implied there was
> such a limit, and I seem to remember it, but I can't seem to find it spelled
> out anywhere.
>
> Larry
>
> On 8/29/08, Larry Dickson <ldickson@cuttedge.com> wrote:
>
>> You said:
>>
>> > (But technically I tested >50 snapshot from one LV - should be limited
>> > only by available memory in recent kernels)
>>
>> What is that limit? I suspect that is what I have run up against.
>>
>> Larry
>>
>>  On 8/29/08, Milan Broz <mbroz@redhat.com> wrote:
>>>
>>> Larry Dickson wrote:
>>> > With a 768 GB logical volume in a 2235 GB volume group, and 4 GB of
>>> > memory, I try to set up lots of snapshots (of 45 or 50 GB each) and
>>> > can't get past 15. Sometimes I'll succeed in generating more than 15
>>> > COWs in /dev/mapper, but lvdisplay never shows more than 15 snapshots
>>> in
>>> > the "LV snapshot status source of" listing under the parent volume. I
>>> > searched and found 15 snapshots mentioned in a couple places like
>>> > wiki.samba.org/index.php/Shadow_Copies_with_Snapshots
>>> > <http://wiki.samba.org/index.php/Shadow_Copies_with_Snapshots> - but
>>> > nothing really authoritative.
>>> >
>>> > Is there really such a limit? Or is it a memory requirement - I seem to
>>> > remember so many MB memory per GB of storage, but can't find that
>>> > either. Versions are (variants of) lvm2-2.02.38, device-mapper-1.02.26,
>>> > kernel-smp-2.6.20 (64 bit).
>>>
>>> Hi,
>>> no, there is no hard limit for snapshots.
>>>
>>> But IIRC patches which solves some problems related with this (using
>>> private dm-io
>>> mempool) were commited in 2.6.22 kernel.
>>> But anyway, many snapshot from one origin causes serious performance
>>> degradation.
>>> (Current snapsot implementation is not ideal in this situation - every
>>> write to origin
>>> is replicated N-times to COW snapshot area - iow: every snapshot is
>>> independent and
>>> need copy changed area separately.)
>>>
>>> (But technically I tested >50 snapshot from one LV - should be limited
>>> only by available
>>> memory in recent kernels).
>>>
>>> Milan
>>> --
>>> mbroz@redhat.com
>>>
>>>
>>> _______________________________________________
>>> linux-lvm mailing list
>>> linux-lvm@redhat.com
>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>>
>>
>>
>

------=_Part_10109_6909390.1220393993317
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div>More details: I found a /var/log/messages note that corresponded exactly to the following bug:</div>
<div>==========================</div>
<div>
<p><a onclick="return top.js.OpenExtLink(window,event,this)" href="http://www.linux-archive.org/debian-kernel/7067-bug-453254-linux-2-6-18-5-xen-686-unable-create-more-than-32-lvm-snapshots-total.html" target="_blank">http://www.linux-archive.org/debian-kernel/7067-bug-453254-linux-2-6-18-5-xen-686-unable-create-more-than-32-lvm-snapshots-total.html</a></p>

<p>11-28-2007, 01:34 AM<br>Peter de Zwart<br>&nbsp;&nbsp; &nbsp;<br>Default Bug#453254: linux-2.6.18-5-xen-686: Unable to create more than 32 LVM snapshots in total<br>Package: linux-2.6.18-5-xen-686<br>Severity: normal</p>
<p><br>When attempting to create more than 32 LVM snapshots, the following error message is sent from the Kernel:</p>
<p>device-mapper: table: 254:142: snapshot: Could not create kcopyd client<br>device-mapper: ioctl: error adding target to table</p>
<p>==========================<br>(End of reference; no follow-up found.) Except that in my case 15 is the max snapshot count, not 32. Increasing memory from 4GB to 6GB does not help. I notice mentions of this &quot;Could not create kcopyd client&quot; bug on the web&nbsp;all the way back to 2004. Does anybody know any workaround? Our customer is not happy about a 15-snapshot limit.&nbsp;Versions are (variants of)&nbsp;lvm2-2.02.38, device-mapper-1.02.26, kernel-smp-2.6.20 (64 bit).</p>

<p>Larry</p></div>
<div><span class="gmail_quote">On 9/2/08, <b class="gmail_sendername">Larry Dickson</b> &lt;<a onclick="return top.js.OpenExtLink(window,event,this)" href="mailto:ldickson@cuttedge.com" target="_blank">ldickson@cuttedge.com</a>&gt; wrote:</span> 
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">
<div>Sorry, I did not make that last question clear:</div>
<div>&nbsp;</div>
<div>What (if any) is the formula by which I can predict the number of snapshots that are possible, given a certain size of the parent volume and/or snapshot&nbsp;and a certain amount of available&nbsp;memory? Milan implied there was such a limit, and I seem to remember it, but I can&#39;t seem to find it spelled out anywhere.</div>

<div>&nbsp;</div>
<div>Larry 
<div><span><br><br><span class="gmail_quote">On 8/29/08, <b class="gmail_sendername">Larry Dickson</b> &lt;<a onclick="return top.js.OpenExtLink(window,event,this)" href="mailto:ldickson@cuttedge.com" target="_blank">ldickson@cuttedge.com</a>&gt; wrote:</span></span></div>
</div>
<div><span>
<div>
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid"><span>
<div>You said:</div>
<div>&nbsp;</div>
<div>&gt; (But technically I tested &gt;50 snapshot from one LV - should be limited</div>
<div>&gt;&nbsp;only by available memory in recent kernels)<br>&nbsp;</div></span>
<div>What is that limit? I suspect that is what I have run up against.</div>
<div>&nbsp;</div><span>
<div>Larry<br>&nbsp;</div></span>
<div><span>
<div><span class="gmail_quote">On 8/29/08, <b class="gmail_sendername">Milan Broz</b> &lt;<a onclick="return top.js.OpenExtLink(window,event,this)" href="mailto:mbroz@redhat.com" target="_blank">mbroz@redhat.com</a>&gt; wrote:</span> 
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">Larry Dickson wrote:<br>&gt; With a 768 GB logical volume in a 2235 GB volume group, and 4 GB of<br>&gt; memory, I try to set up lots of snapshots (of 45 or 50 GB each) and<br>
&gt; can&#39;t get past 15. Sometimes I&#39;ll succeed in generating more than 15<br>&gt; COWs in /dev/mapper, but lvdisplay never shows more than 15 snapshots in<br>&gt; the &quot;LV snapshot status source of&quot; listing under the parent volume. I<br>
&gt; searched and found 15 snapshots mentioned in a couple places like<br>&gt; <a onclick="return top.js.OpenExtLink(window,event,this)" href="http://wiki.samba.org/index.php/Shadow_Copies_with_Snapshots" target="_blank">wiki.samba.org/index.php/Shadow_Copies_with_Snapshots</a><br>
&gt; &lt;<a onclick="return top.js.OpenExtLink(window,event,this)" href="http://wiki.samba.org/index.php/Shadow_Copies_with_Snapshots" target="_blank">http://wiki.samba.org/index.php/Shadow_Copies_with_Snapshots</a>&gt; - but<br>
&gt; nothing really authoritative.<br>&gt;<br>&gt; Is there really such a limit? Or is it a memory requirement - I seem to<br>&gt; remember so many MB memory per GB of storage, but can&#39;t find that<br>&gt; either. Versions are (variants of) lvm2-2.02.38, device-mapper-1.02.26,<br>
&gt; kernel-smp-2.6.20 (64 bit).<br><br>Hi,<br>no, there is no hard limit for snapshots.<br><br>But IIRC patches which solves some problems related with this (using private dm-io<br>mempool) were commited in 2.6.22 kernel.<br>
But anyway, many snapshot from one origin causes serious performance degradation.<br>(Current snapsot implementation is not ideal in this situation - every write to origin<br>is replicated N-times to COW snapshot area - iow: every snapshot is independent and<br>
need copy changed area separately.)<br><br>(But technically I tested &gt;50 snapshot from one LV - should be limited only by available<br>memory in recent kernels).<br><br>Milan<br>--<br><a onclick="return top.js.OpenExtLink(window,event,this)" href="mailto:mbroz@redhat.com" target="_blank">mbroz@redhat.com</a><br>
<br><br>_______________________________________________<br>linux-lvm mailing list<br><a onclick="return top.js.OpenExtLink(window,event,this)" href="mailto:linux-lvm@redhat.com" target="_blank">linux-lvm@redhat.com</a><br>
<a onclick="return top.js.OpenExtLink(window,event,this)" href="https://www.redhat.com/mailman/listinfo/linux-lvm" target="_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO at <a onclick="return top.js.OpenExtLink(window,event,this)" href="http://tldp.org/HOWTO/LVM-HOWTO/" target="_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</blockquote></div><br></span></div></blockquote></div><br></span></div></blockquote></div><br>

------=_Part_10109_6909390.1220393993317--
