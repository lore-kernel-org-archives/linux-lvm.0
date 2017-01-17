Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v0HGRni3001865
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 17 Jan 2017 11:27:49 -0500
Received: from mail.cropusainsurance.com (67-60-77-244.cpe.cableone.net
	[67.60.77.244]) by mx1.redhat.com (Postfix) with ESMTP id 9A80961E5B
	for <linux-lvm@redhat.com>; Tue, 17 Jan 2017 16:27:46 +0000 (UTC)
Date: Tue, 17 Jan 2017 08:27:40 -0800 (PST)
From: Ken Goods <kgoods@cropusainsurance.com>
Message-ID: <15337358.38.1484670456030.JavaMail.kgoods@Ken-PC>
In-Reply-To: <afb0ab23-80bd-97bc-4e87-0e4e65e5196e@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_37_20912667.1484670456028"
Subject: Re: [linux-lvm] multipath_component_detection
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
To: Peter Rajnoha <prajnoha@redhat.com>
Cc: linux-lvm Mailing List <linux-lvm@redhat.com>

------=_Part_37_20912667.1484670456028
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Thanks so much Peter, exactly what I was looking for. Also thanks for the heads up on external_device_info_source, I'll use it. 

----- Original Message -----

From: "Peter Rajnoha" <prajnoha@redhat.com> 
To: kgoods@cropusainsurance.com 
Cc: "LVM general discussion and development" <linux-lvm@redhat.com> 
Sent: Tuesday, January 17, 2017 3:19:44 AM 
Subject: Re: [linux-lvm] multipath_component_detection 

On 01/16/2017 08:46 PM, Ken Goods wrote: 
> Hi all, 
> Just a quick question. I've been setting up a (iscsi) LUN and want to 
> create an LVM PV on it. 
> 
> The docs I have read are somewhat conflicted. Some say that the 
> underlying devices should be filtered, however according to comments in 
> lvm.conf it says that if multipath_component_detection is enabled, "LVM2 
> will ignore devices used as component paths of device-mapper multipath 
> devices". 
> 
> So filtering is no longer necessary with LVM2? 
> 

The multipath component detection is an automatic filter in LVM2 (if 
enabled with devices/multipath_component_detection=1 in LVM 
configuration - that is used by default). So in this case you don't need 
to set up devices/global_filter (or devices/filter) manually. LVM will 
filter multipath components automatically by looking at the device stack 
and if it detects that there's a multipath device on top of certain set 
of devices, such devices are assumed as multipath components and they're 
filtered automatically. 

Of course, for this automatic filter to work correctly, you also need to 
have your multipath correctly configured - LVM doesn't know that the 
devices are multipath components unless there's multipath device already 
set up and running on top of those components. 

However, there's one improvement in this detection if you use 
devices/external_device_info_source="udev" in your LVM configuration 
(this is not used by default yet). In this case, LVM reads information 
from udev database which in turn has this information about multipath 
components directly from multipath and that one takes this information 
from its own configuration (the component WWID list in multipath's 
configuraton) - so in this case you don't even need to have multipath 
device set up yet on top of multipath components for LVM to detect 
multipath components properly. 

But usually, if your system is properly configured, you always have 
multipath device set up and running on top of multipath components. 

-- 
Peter 


------=_Part_37_20912667.1484670456028
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><style type=3D'text/css'>p { margin: 0; }</style></head><body><=
div style=3D'font-family: arial,helvetica,sans-serif; font-size: 10pt; colo=
r: #000000'>Thanks so much Peter, exactly what I was looking for. Also than=
ks for the heads up on external_device_info_source, I'll use it.<br><br><hr=
 id=3D"zwchr"><div style=3D"color: rgb(0, 0, 0); font-weight: normal; font-=
style: normal; text-decoration: none; font-family: Helvetica,Arial,sans-ser=
if; font-size: 12pt;"><b>From: </b>"Peter Rajnoha" &lt;prajnoha@redhat.com&=
gt;<br><b>To: </b>kgoods@cropusainsurance.com<br><b>Cc: </b>"LVM general di=
scussion and development" &lt;linux-lvm@redhat.com&gt;<br><b>Sent: </b>Tues=
day, January 17, 2017 3:19:44 AM<br><b>Subject: </b>Re: [linux-lvm] multipa=
th_component_detection<br><br>On 01/16/2017 08:46 PM, Ken Goods wrote:<br>&=
gt; Hi all,<br>&gt; Just a quick question. I've been setting up a (iscsi) L=
UN and want to<br>&gt; create an LVM PV on it.<br>&gt; <br>&gt; The docs I =
have read are somewhat conflicted. Some say that the<br>&gt; underlying dev=
ices should be filtered, however according to comments in<br>&gt; lvm.conf =
it says that if multipath_component_detection is enabled, "LVM2<br>&gt; wil=
l ignore devices used as component paths of device-mapper multipath<br>&gt;=
 devices".<br>&gt; <br>&gt; So filtering is no longer necessary with LVM2?<=
br>&gt; <br><br>The multipath component detection is an automatic filter in=
 LVM2 (if<br>enabled with devices/multipath_component_detection=3D1 in LVM<=
br>configuration - that is used by default). So in this case you don't need=
<br>to set up devices/global_filter (or devices/filter) manually. LVM will<=
br>filter multipath components automatically by looking at the device stack=
<br>and if it detects that there's a multipath device on top of certain set=
<br>of devices, such devices are assumed as multipath components and they'r=
e<br>filtered automatically.<br><br>Of course, for this automatic filter to=
 work correctly, you also need to<br>have your multipath correctly configur=
ed - LVM doesn't know that the<br>devices are multipath components unless t=
here's multipath device already<br>set up and running on top of those compo=
nents.<br><br>However, there's one improvement in this detection if you use=
<br>devices/external_device_info_source=3D"udev" in your LVM configuration<=
br>(this is not used by default yet). In this case, LVM reads information<b=
r>from udev database which in turn has this information about multipath<br>=
components directly from multipath and that one takes this information<br>f=
rom its own configuration (the component WWID list in multipath's<br>config=
uraton) - so in this case you don't even need to have multipath<br>device s=
et up yet on top of multipath components for LVM to detect<br>multipath com=
ponents properly.<br><br>But usually, if your system is properly configured=
, you always have<br>multipath device set up and running on top of multipat=
h components.<br><br>-- <br>Peter<br></div><br></div></body></html>
------=_Part_37_20912667.1484670456028--
