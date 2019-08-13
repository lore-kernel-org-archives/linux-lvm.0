Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 288C1805E3
	for <linux-lvm@redhat.com>; Tue, 13 Aug 2019 21:25:49 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
	[209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1548BC00861F
	for <linux-lvm@redhat.com>; Tue, 13 Aug 2019 21:25:48 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id h8so20002382edv.7
	for <linux-lvm@redhat.com>; Tue, 13 Aug 2019 14:25:48 -0700 (PDT)
Received: from DB7PR08MB3307.eurprd08.prod.outlook.com ([2603:1026:5:19::5])
	by smtp.gmail.com with ESMTPSA id
	cd24sm1284373ejb.89.2019.08.13.14.25.44 for <linux-lvm@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Aug 2019 14:25:45 -0700 (PDT)
From: Bernd Eckenfels <ecki@zusammenkunft.net>
Date: Tue, 13 Aug 2019 21:25:43 +0000
Message-ID: <DB7PR08MB3307023F548797EE6D6D60ACFFD20@DB7PR08MB3307.eurprd08.prod.outlook.com>
References: <843935217a8de82c4cf47f02953489c6@cs.uni-dortmund.de>,
	<7f6f03e1-dbb1-971c-7f1f-f6c380a16b77@redhat.com>
In-Reply-To: <7f6f03e1-dbb1-971c-7f1f-f6c380a16b77@redhat.com>
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DB7PR08MB3307023F548797EE6D6D60ACFFD20DB7PR08MB3307eurp_"
MIME-Version: 1.0
Subject: Re: [linux-lvm] dmsetup says "Device does not exist",
 though it exists
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
To: LVM general discussion and development <linux-lvm@redhat.com>

--_000_DB7PR08MB3307023F548797EE6D6D60ACFFD20DB7PR08MB3307eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I did not know dmsetup works with lvm file names, did you try to run `dmset=
up ls` to see the known devices and the dm compatible name?

Gruss
Bernd


--
http://bernd.eckenfels.net

________________________________
Von: linux-lvm-bounces@redhat.com im Auftrag von Zdenek Kabelac <zkabelac@r=
edhat.com>
Gesendet: Dienstag, August 13, 2019 3:54 PM
An: LVM general discussion and development; Christoph Pleger
Betreff: Re: [linux-lvm] dmsetup says "Device does not exist", though it ex=
ists

Dne 13. 08. 19 v 9:11 Christoph Pleger napsal(a):
> Hello,
>
> I have a volume group with 20 logical volumes. Only the last one of these
> volumes has a strange problem with dmsetup, shown by these commands and o=
utput
> on the command line:
>
> root@host:/home/linux# /sbin/dmsetup info -c -o name --noheadings /dev/vg=
/lv20
> Device does not exist.
> Command failed
>
> root@host:/home/linux# lvdisplay -c /dev/vg/lv20
>   /dev/vg/lv20:vg:3:1:-1:0:4194304:512:-1:0:-1:253:19
>
> root@host:/home/linux# mount /dev/vg/lv20 /mnt
> root@host:/home/linux# ls /mnt
> lost+found data1 data2
>
> That is, dmsetup says "Device does not exist" about a logical volume, tho=
ugh
> the volume exists and is operating normally. What is the possible problem=
 here?
>

Hi

Have you tried strace ?

Are you using this only in singly machine with properly running udev ?
Kernel version, lvm version, distribution... ?


Zdenek

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--_000_DB7PR08MB3307023F548797EE6D6D60ACFFD20DB7PR08MB3307eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div><style id=3D"ms-outlook-ios-style" type=3D"text/css">html {
background-color: transparent !important;
}

body {
background-color: transparent !important;
color: #333;
line-height: 150%;
font-family: "-apple-system", "HelveticaNeue";
margin: 0;
}

.ms-outlook-ios-reference-expand {
display: block;
color: #999;
padding: 20px 0px;
text-decoration: none;
}

.ms-outlook-ios-availability-container {
max-width: 500px;
margin: auto;
padding: 12px 15px 15px 15px;
border: 1px solid #C7E0F4;
border-radius: 4px;
}

.ms-outlook-ios-availability-container > .ms-outlook-ios-availability-delet=
e-button {
width: 25px;
height: 25px;
right: -12px;
top: -12px;
background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEsAAA=
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
BzRAPSFNM7HEAAAAASUVORK5CYII=3D");
background-size: 25px 25px;
background-position: center;
}

#ms-outlook-ios-main-container {
margin: 0 0 0 0;
margin-top: 120;
padding: 8;
}

#ms-outlook-ios-content-container {
padding: 0;
padding-top: 12;
padding-bottom: 20;
}

.ms-outlook-ios-mention {
color: #333;
background-color: #f1f1f1;
border-radius: 4px;
padding: 0 2px 0 2px;
pointer-events: none;
text-decoration: none;
}

.ms-outlook-ios-mention-external {
color: #ba8f0d;
background-color: #fdf7e7;
}

.ms-outlook-ios-mention-external-clear-design {
color: #ba8f0d;
background-color: #f1f1f1;
}</style><style id=3D"ms-outlook-ios-dark-mode-style" type=3D"text/css">.ms=
-outlook-ios-dark-mode {
color: #E1E1E1 !important;
}

.ms-outlook-ios-dark-mode .ms-outlook-ios-reference-expand {
color: #777777 !important;
}

.ms-outlook-ios-dark-mode a:not([class]) {
color: #0086F0;
}

.ms-outlook-ios-dark-mode font[color=3D"#000000"] {
color: #E1E1E1 !important;
}

.ms-outlook-ios-dark-mode .ms-outlook-ios-availability-container {
border-color: #0086F0 !important;
}

.ms-outlook-ios-dark-mode .ms-outlook-ios-availability-container .ms-outloo=
k-ios-availability-timeslot-container {
background-color: rgba(0, 120, 215, 0.2) !important;
}

.ms-outlook-ios-dark-mode .ms-outlook-ios-availability-container .ms-outloo=
k-ios-availability-border {
border-top: 1px solid #0086F0 !important;
}

.ms-outlook-ios-dark-mode .ms-outlook-ios-availability-container > .ms-outl=
ook-ios-availability-delete-button {
filter: invert(100%) grayscale(100%) brightness(90%) sepia(100%) hue-rotate=
(-180deg) saturate(700%) contrast(0.8);
}

.ms-outlook-ios-dark-mode .ms-outlook-ios-mention {
color: #A8A8AC !important;
background-color: #292929 !important;
}</style>
<meta name=3D"viewport" content=3D"width=3Ddevice-width, user-scalable=3Dno=
, initial-scale=3D1.0, minimum-scale=3D1.0, maximum-scale=3D1.0">
<div style=3D"direction: ltr;">
<div>
<div style=3D"direction: ltr;">Hello,</div>
<div><br>
</div>
<div style=3D"direction: ltr;">I did not know dmsetup works with lvm file n=
ames, did you try to run `dmsetup ls` to see the known devices and the dm c=
ompatible name?</div>
<div><br>
</div>
<div style=3D"direction: ltr;">Gruss</div>
<div style=3D"direction: ltr;">Bernd</div>
</div>
<div><br>
</div>
<div class=3D"ms-outlook-ios-signature">
<div><br>
</div>
<div style=3D"direction: ltr;">-- </div>
<div style=3D"direction: ltr;">http://bernd.eckenfels.net</div>
</div>
</div>
<div>&nbsp;</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"dir=3D&quot;ltr&quot;"><font face=3D"Calib=
ri, sans-serif" style=3D"font-size:11pt" color=3D"#000000"><b>Von:</b> linu=
x-lvm-bounces@redhat.com im Auftrag von Zdenek Kabelac &lt;zkabelac@redhat.=
com&gt;<br>
<b>Gesendet:</b> Dienstag, August 13, 2019 3:54 PM<br>
<b>An:</b> LVM general discussion and development; Christoph Pleger<br>
<b>Betreff:</b> Re: [linux-lvm] dmsetup says &quot;Device does not exist&qu=
ot;, though it exists
<div>&nbsp;</div>
</font></div>
Dne 13. 08. 19 v 9:11 Christoph Pleger napsal(a): <br>
&gt; Hello, <br>
&gt; <br>
&gt; I have a volume group with 20 logical volumes. Only the last one of th=
ese <br>
&gt; volumes has a strange problem with dmsetup, shown by these commands an=
d output <br>
&gt; on the command line: <br>
&gt; <br>
&gt; root@host:/home/linux# /sbin/dmsetup info -c -o name --noheadings /dev=
/vg/lv20 <br>
&gt; Device does not exist. <br>
&gt; Command failed <br>
&gt; <br>
&gt; root@host:/home/linux# lvdisplay -c /dev/vg/lv20 <br>
&gt; &nbsp; /dev/vg/lv20:vg:3:1:-1:0:4194304:512:-1:0:-1:253:19 <br>
&gt; <br>
&gt; root@host:/home/linux# mount /dev/vg/lv20 /mnt <br>
&gt; root@host:/home/linux# ls /mnt <br>
&gt; lost&#43;found data1 data2 <br>
&gt; <br>
&gt; That is, dmsetup says &quot;Device does not exist&quot; about a logica=
l volume, though <br>
&gt; the volume exists and is operating normally. What is the possible prob=
lem here?
<br>
&gt; <br>
<br>
Hi <br>
<br>
Have you tried strace ? <br>
<br>
Are you using this only in singly machine with properly running udev ? <br>
Kernel version, lvm version, distribution... ? <br>
<br>
<br>
Zdenek <br>
<br>
_______________________________________________ <br>
linux-lvm mailing list <br>
linux-lvm@redhat.com <br>
https://www.redhat.com/mailman/listinfo/linux-lvm <br>
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/ <br>
</div>
</body>
</html>

--_000_DB7PR08MB3307023F548797EE6D6D60ACFFD20DB7PR08MB3307eurp_--
