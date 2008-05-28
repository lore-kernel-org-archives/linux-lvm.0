Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m4SEARXm000671
	for <linux-lvm@redhat.com>; Wed, 28 May 2008 10:10:27 -0400
Received: from ik-out-1112.google.com (ik-out-1112.google.com [66.249.90.177])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m4SEACpd026104
	for <linux-lvm@redhat.com>; Wed, 28 May 2008 10:10:13 -0400
Received: by ik-out-1112.google.com with SMTP id c30so1636477ika.3
	for <linux-lvm@redhat.com>; Wed, 28 May 2008 07:10:12 -0700 (PDT)
Message-ID: <1c748a490805280710u1de2daa1yea5102f7a823299c@mail.gmail.com>
Date: Wed, 28 May 2008 07:10:11 -0700
From: "Larry Dickson" <ldickson@cuttedge.com>
Subject: Re: [linux-lvm] Removing PVs from Volume Groups which have allocated
	LVs
In-Reply-To: <4835BC14.D5D9.0001.0@novell.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_10075_9586463.1211983811968"
References: <4835BC14.D5D9.0001.0@novell.com>
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

------=_Part_10075_9586463.1211983811968
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi all,

I ran onto a similar problem when trying to create a LV where the ramdisk PV
came FIRST. It wouldn't do it even though I ordered it first in the list. So
what I had to do was create a VG out of the first PV alone, and the LV on
it, and then keep adding PV to VG and extend the LV. That resulted in a
determinate ordering.

If the composite VG already exists, the only technique I know is to search
or even write characteristic data patterns in the LV and also in all the
PVs, thus determining offsets :-(

Larry Dickson
Cutting Edge Networked Storage

On 5/22/08, R Ramkumar <rramkumar@novell.com> wrote:
>
>
> Hi,
>
> I have a LVM setup where I have a VG with 3 PVs.. I have created 2 LVs from
> the VG which eventually has taken physical storage space from one or two of
> the PVs.. Now, when I want to shrink the VG, I need to know the unallocated
> PV so that I can remove from the VG..
>
> Is there anyway that I can find out which PV is unallocated and which PV to
> remove from the VG.. Please let me know your views..
>
> Thanks,
> Ram
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

------=_Part_10075_9586463.1211983811968
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div>Hi all,</div>
<div>&nbsp;</div>
<div>I ran onto a similar problem when trying to create a LV where the ramdisk PV came FIRST. It wouldn&#39;t do it even though I ordered it first in the list. So what I had to do was create a VG out of the first PV alone, and the LV on it, and then keep adding PV to VG and extend the LV. That resulted in a determinate ordering.</div>

<div>&nbsp;</div>
<div>If the composite VG already exists, the only technique I know is to search or even write characteristic data patterns in the LV and also in all the PVs, thus determining offsets :-(</div>
<div>&nbsp;</div>
<div>Larry Dickson<br>Cutting Edge Networked Storage<br>&nbsp;</div>
<div><span class="gmail_quote">On 5/22/08, <b class="gmail_sendername">R Ramkumar</b> &lt;<a href="mailto:rramkumar@novell.com">rramkumar@novell.com</a>&gt; wrote:</span>
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid"><br>Hi,<br><br>I have a LVM setup where I have a VG with 3 PVs.. I have created 2 LVs from the VG which eventually has taken physical storage space from one or two of the PVs.. Now, when I want to shrink the VG, I need to know the unallocated PV so that I can remove from the VG..<br>
<br>Is there anyway that I can find out which PV is unallocated and which PV to remove from the VG.. Please let me know your views..<br><br>Thanks,<br>Ram<br><br><br>_______________________________________________<br>linux-lvm mailing list<br>
<a href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br><a href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</blockquote></div><br>

------=_Part_10075_9586463.1211983811968--
