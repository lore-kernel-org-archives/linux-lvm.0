Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6RCmtbf032024
	for <linux-lvm@redhat.com>; Mon, 27 Jul 2009 08:48:55 -0400
Received: from ey-out-2122.google.com (ey-out-2122.google.com [74.125.78.26])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n6RCmXq8013631
	for <linux-lvm@redhat.com>; Mon, 27 Jul 2009 08:48:34 -0400
Received: by ey-out-2122.google.com with SMTP id 9so719955eyd.39
	for <linux-lvm@redhat.com>; Mon, 27 Jul 2009 05:48:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4A6D9E00.2090600@redhat.com>
References: <29ae894c0907270525v63f0a334n464bb49ea60f71cf@mail.gmail.com>
	<4A6D9E00.2090600@redhat.com>
Date: Mon, 27 Jul 2009 14:48:33 +0200
Message-ID: <29ae894c0907270548i53245d96jba3ae51147beddde@mail.gmail.com>
Subject: Re: [linux-lvm] CLVMD Simple method to get who holds a lock in a 
	cluster
From: brem belguebli <brem.belguebli@gmail.com>
Content-Type: multipart/alternative; boundary=0016364c75902923f4046faf5f1d
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

--0016364c75902923f4046faf5f1d
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Chrissie,

RHEL 5.3 shipped  cman-2.0.9-1.el5, any updated RPM available for RHEL 5.3 ?

Thanks

Brem



2009/7/27, Christine Caulfield <ccaulfie@redhat.com>:
>
> On 07/27/2009 01:25 PM, brem belguebli wrote:
>
>> Hi,
>> In a clustered environment, without GFS, we plan to use CLVMD exclusive
>> activation of VG's in order to prevent a VG to be activated on more than
>> 1 node at a time.
>> I've been looking for how to check who holds a lock for a given VG but I
>> could'nt find no suitable way to do it.
>> The only way was to activate debug ( mount -t debugfs debug /debug) and
>> cat /debug/dlm/clvmd_locks.
>> Is there a way to request dlm (via dlm_tool) to get the lock holding
>> node or via  any LVM command.
>> Regards
>>
>>
>>
> Depending on the version you have dlm_tool will show you who holds the
> lock. But all it does is use the same debugfs interface you've already
> mentioned :-)
>
> Chrissie
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--0016364c75902923f4046faf5f1d
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Hi Chrissie,</div>
<div>=A0</div>
<div>RHEL 5.3 shipped =A0cman-2.0.9-1.el5, any updated RPM available for RH=
EL 5.3 ?</div>
<div>=A0</div>
<div>Thanks </div>
<div>=A0</div>
<div>Brem</div>
<div><br><br>=A0</div>
<div><span class=3D"gmail_quote">2009/7/27, Christine Caulfield &lt;<a href=
=3D"mailto:ccaulfie@redhat.com">ccaulfie@redhat.com</a>&gt;:</span>
<blockquote class=3D"gmail_quote" style=3D"PADDING-LEFT: 1ex; MARGIN: 0px 0=
px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">
<div><span class=3D"e" id=3D"q_122bc314c632c877_0">On 07/27/2009 01:25 PM, =
brem belguebli wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"PADDING-LEFT: 1ex; MARGIN: 0px 0=
px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">Hi,<br>In a clustered environmen=
t, without GFS, we plan to use CLVMD exclusive<br>activation of VG&#39;s in=
 order to prevent a VG to be activated on more than<br>
1 node at a time.<br>I&#39;ve been looking for how to check who holds a loc=
k for a given VG but I<br>could&#39;nt find no suitable way to do it.<br>Th=
e only way was to activate debug ( mount -t debugfs debug /debug) and<br>
cat /debug/dlm/clvmd_locks.<br>Is there a way to request dlm (via dlm_tool)=
 to get the lock holding<br>node or via =A0any LVM command.<br>Regards<br><=
br><br></blockquote><br></span></div>Depending on the version you have dlm_=
tool will show you who holds the lock. But all it does is use the same debu=
gfs interface you&#39;ve already mentioned :-)<br>
<br>Chrissie<br><br>_______________________________________________<br>linu=
x-lvm mailing list<br><a onclick=3D"return top.js.OpenExtLink(window,event,=
this)" href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@red=
hat.com</a><br>
<a onclick=3D"return top.js.OpenExtLink(window,event,this)" href=3D"https:/=
/www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_blank">https://www.r=
edhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO at <a oncli=
ck=3D"return top.js.OpenExtLink(window,event,this)" href=3D"http://tldp.org=
/HOWTO/LVM-HOWTO/" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><b=
r>
</blockquote></div><br>

--0016364c75902923f4046faf5f1d--
