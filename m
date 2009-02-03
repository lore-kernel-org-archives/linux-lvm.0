Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n1374mCt007546
	for <linux-lvm@redhat.com>; Tue, 3 Feb 2009 02:04:48 -0500
Received: from karen.lavabit.com (karen.lavabit.com [72.249.41.33])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n1372icg011890
	for <linux-lvm@redhat.com>; Tue, 3 Feb 2009 02:03:34 -0500
Received: from d.earth.lavabit.com (d.earth.lavabit.com [192.168.111.13])
	by karen.lavabit.com (Postfix) with ESMTP id 65BF5C86A9
	for <linux-lvm@redhat.com>; Tue,  3 Feb 2009 01:02:44 -0600 (CST)
Received: from 192.168.0.11 (77.127.249.9)
	by lavabit.com with ESMTP id OVFCVEIO1YZM
	for <linux-lvm@redhat.com>; Tue, 03 Feb 2009 01:02:44 -0600
From: Shachar Or <dawnlight@lavabit.com>
Content-Type: multipart/mixed; boundary="=-ll2Bepvp0jnx3XTYk8JS"
Date: Tue, 03 Feb 2009 09:02:38 +0200
Message-Id: <1233644558.21625.12.camel@box0>
Mime-Version: 1.0
Subject: [linux-lvm] Is my xen hosting tech support misleading me?
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
To: linux-lvm@redhat.com


--=-ll2Bepvp0jnx3XTYk8JS
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello.

Attached is a question I've asked my xen hosting provider's technical
support and the answer they've supplied.

Sam sais "There is no LVM module available, so you would need to compile
LVM by yourself from the Xen kernel sources." but I've no problem
loading dm_mod and to my understanding of LVM, this is the only module
needed. So is he just wrong?

Thanks.

--=-ll2Bepvp0jnx3XTYk8JS
Content-Disposition: inline
Content-Description: =?UTF-8?Q?=D7=94=D7=95=D7=93=D7=A2=D7=94?=
	=?UTF-8?Q?_=D7=9E=D7=95=D7=A2=D7=91=D7=A8=D7=AA?= - <Ref1876314> DOMAIN
	:
Content-Type: message/rfc822

Return-Path: <hosting@support.gandi.net>
Received: from akio.gandi.net (217.70.182.129) by lavabit.com with ESMTP id
	PSGWAYW8X0K7 for <dawnlight@lavabit.com>;
	Mon, 02 Feb 2009 08:15:38 -0600
Delivery-date: Mon, 02 Feb 2009 15:09:30 +0100
Received: from localhost.gandi.net ([127.0.0.1] helo=akio2-v) by
	akio.gandi.net with esmtp (Exim 4.43) id 1LTzUO-0003mE-OY for
	dawnlight@lavabit.com; Mon, 02 Feb 2009 15:09:28 +0100
Message-ID: <11312694.1233583768760.JavaMail.akio-logger>
Date: Mon, 2 Feb 2009 15:09:28 +0100 (CET)
From: Gandi Hosting <hosting@support.gandi.net>
To: dawnlight@lavabit.com
Subject: <Ref1876314> DOMAIN :
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_Part_2517_20118407.1233583768541"
X-Akio-Used-Templates: 0
X-Akio-Version: v5-0-3-2 build 21109


------=_Part_2517_20118407.1233583768541
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,=20

Thank you for your patience.

There is no LVM module available, so you would need to compile LVM by yours=
elf from the Xen kernel sources.

You will then need to activate the module.

You should be able to find the appropriate help online.


I am at your disposal should you need any further information.

Best regards,
Sam

---------------------------------------
Are you satisfied with the quality of the reply you received?
YES: http://www.gandi.net/faq/feedback/yes
NO: http://www.gandi.net/faq/feedback/no

I would like to give more detailed feedback: http://www.gandi.net/faq/feedb=
ack
---------------------------------------

--=20
Help about hosting / aide sur l'h=EF=BF=BDbergement: http://wiki.gandi.net/

GANDI
http://www.gandi.net


--------------------------------------
Product     : hosting
Category    :=20
Question    :=20
FirstName   : Shachar
LastName    : Or
CompanyName :=20
Email       : dawnlight@lavabit.com
Domain      :=20
DomainNB    :=20
Handle      : SO866-GANDI
Anciennet  :=20
Transaction :=20
Message     : Hello.

This is a technical question about a problem I'm experiencing with LVM on m=
y virtual server.

The issue is that logical volumes are not activated on bootup. This prevent=
s me from using /etc/fstab to mount them.

root@shacharor:~# lvdisplay | grep 'LV Status' && udevtrigger && udevsettle=
 && lvdisplay | grep 'LV Status'
  LV Status              NOT available
  LV Status              available
root@shacharor:~#

This shows that udev handles logical volumes correctly and does activate th=
em. But why doesn't it do it on bootup?

Thanks.



------=_Part_2517_20118407.1233583768541
Content-Type: text/html; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

<html>
<body bgcolor=3D'#FFFFFF'>
<span id=3D"mailElm">Hello, <br /><br />Thank you for your patience.<br /><=
br />There is no LVM module available, so you would need to compile LVM by =
yourself from the Xen kernel sources. <br /><br />You will then need to act=
ivate the module. <br /><br />You should be able to find the appropriate he=
lp online.<br /><br /><br />I am at your disposal should you need any furth=
er information.<br /><br />Best regards,<br />Sam<br /><br />--------------=
-------------------------<br />Are you satisfied with the quality of the re=
ply you received?<br />YES: http://www.gandi.net/faq/feedback/yes<br />NO: =
http://www.gandi.net/faq/feedback/no<br /><br />I would like to give more d=
etailed feedback: http://www.gandi.net/faq/feedback<br />------------------=
---------------------<br /></span><br><br>
<br>
Help about hosting / aide sur l'h=EF=BF=BDbergement: <A HREF=3D"http://wiki=
.gandi.net/">http://wiki.gandi.net/</A><br>
<br>
GANDI<br>
<A HREF=3D"http://www.gandi.net">http://www.gandi.net</A>   <br>
<br>

<br>--------------------------------------
<br>Product&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;hosting
<br>Category&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;
<br>Question&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;
<br>FirstName&nbsp;&nbsp;&nbsp;:&nbsp;Shachar
<br>LastName&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;Or
<br>CompanyName&nbsp;:&nbsp;
<br>Email&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;dawnlight@lavabit=
.com
<br>Domain&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;
<br>DomainNB&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;
<br>Handle&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;SO866-GANDI
<br>Anciennet&nbsp;&nbsp;:&nbsp;
<br>Transaction&nbsp;:&nbsp;
<br>Message&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;Hello.
<br>
<br>This&nbsp;is&nbsp;a&nbsp;technical&nbsp;question&nbsp;about&nbsp;a&nbsp=
;problem&nbsp;I'm&nbsp;experiencing&nbsp;with&nbsp;LVM&nbsp;on&nbsp;my&nbsp=
;virtual&nbsp;server.
<br>
<br>The&nbsp;issue&nbsp;is&nbsp;that&nbsp;logical&nbsp;volumes&nbsp;are&nbs=
p;not&nbsp;activated&nbsp;on&nbsp;bootup.&nbsp;This&nbsp;prevents&nbsp;me&n=
bsp;from&nbsp;using&nbsp;/etc/fstab&nbsp;to&nbsp;mount&nbsp;them.
<br>
<br>root@shacharor:~#&nbsp;lvdisplay&nbsp;|&nbsp;grep&nbsp;'LV&nbsp;Status'=
&nbsp;&amp;&amp;&nbsp;udevtrigger&nbsp;&amp;&amp;&nbsp;udevsettle&nbsp;&amp=
;&amp;&nbsp;lvdisplay&nbsp;|&nbsp;grep&nbsp;'LV&nbsp;Status'
<br>&nbsp;&nbsp;LV&nbsp;Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NOT&nbsp;available
<br>&nbsp;&nbsp;LV&nbsp;Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;available
<br>root@shacharor:~#
<br>
<br>This&nbsp;shows&nbsp;that&nbsp;udev&nbsp;handles&nbsp;logical&nbsp;volu=
mes&nbsp;correctly&nbsp;and&nbsp;does&nbsp;activate&nbsp;them.&nbsp;But&nbs=
p;why&nbsp;doesn't&nbsp;it&nbsp;do&nbsp;it&nbsp;on&nbsp;bootup?
<br>
<br>Thanks.
<br>
<br>
<br>

</body>
</html>

------=_Part_2517_20118407.1233583768541--


--=-ll2Bepvp0jnx3XTYk8JS--
