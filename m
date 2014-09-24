Received: from [10.10.57.246] (vpn-57-246.rdu2.redhat.com [10.10.57.246])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s8O4vVqQ003537
	for <linux-lvm@redhat.com>; Wed, 24 Sep 2014 00:57:31 -0400
From: Brassow Jonathan <jbrassow@redhat.com>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: multipart/alternative; boundary=Apple-Mail-11--564246313
Date: Tue, 23 Sep 2014 23:57:30 -0500
In-Reply-To: <4A8A2A3D96DD154BAD2EE08C0FFFBE5A815085E6@NDHEP50004.na.corp.mckesson.com>
References: <4A8A2A3D96DD154BAD2EE08C0FFFBE5A815067BF@NDHEP50004.na.corp.mckesson.com>
	<4A8A2A3D96DD154BAD2EE08C0FFFBE5A815085E6@NDHEP50004.na.corp.mckesson.com>
Message-Id: <AF09283B-A6CA-4F89-8D72-A9CB2A104DB5@redhat.com>
Subject: Re: [linux-lvm] LE to PE mapping
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


--Apple-Mail-11--564246313
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


On Sep 16, 2014, at 12:46 PM, Allen, Jack wrote:

> Hello:
>                 I have only received 1 direct reply about this. Nobody =
else has anything to add?
> =20
>                 Another question: Where is the mapping stored if I =
wanted to write a program to display it the way I want?
> =20

I don't think there is a way to do exactly what you want that I am aware =
of.  You need to know three things: the order of the devices, the stripe =
size, and the overall size.  You can compute what you want from that, =
but I don't think LVM will do that for you.

You can get those three fields from 'lvs', but I think you will have to =
do some scripting to get what you want from there.

As to the question of the mapping table...  The mapping table is not =
stored anywhere.  It is constructed from the LVs properties that are =
stored in the LVM metadata.  You can, however, get the table used to =
construct the device by calling 'dmsetup table <DM device>'.  The DM =
device is what /dev/<vg>/<lv> links to.

 brassow


--Apple-Mail-11--564246313
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space; =
"><br><div><div>On Sep 16, 2014, at 12:46 PM, Allen, Jack =
wrote:</div><br class=3D"Apple-interchange-newline"><blockquote =
type=3D"cite"><span class=3D"Apple-style-span" style=3D"border-collapse: =
separate; font-family: Helvetica; font-style: normal; font-variant: =
normal; font-weight: normal; letter-spacing: normal; line-height: =
normal; orphans: 2; text-align: -webkit-auto; text-indent: 0px; =
text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: =
0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: =
auto; -webkit-text-stroke-width: 0px; font-size: medium; "><div =
style=3D"margin-top: 0in; margin-right: 0in; margin-left: 0in; =
margin-bottom: 0.0001pt; font-size: 12pt; font-family: 'Times New =
Roman', serif; "><span style=3D"font-size: 11pt; font-family: Calibri, =
sans-serif; color: rgb(31, 73, 125); =
">Hello:<o:p></o:p></span></div><div style=3D"margin-top: 0in; =
margin-right: 0in; margin-left: 0in; margin-bottom: 0.0001pt; font-size: =
12pt; font-family: 'Times New Roman', serif; "><span style=3D"font-size: =
11pt; font-family: Calibri, sans-serif; color: rgb(31, 73, 125); =
">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; I have only received 1 direct reply about this. =
Nobody else has anything to add?<o:p></o:p></span></div><div =
style=3D"margin-top: 0in; margin-right: 0in; margin-left: 0in; =
margin-bottom: 0.0001pt; font-size: 12pt; font-family: 'Times New =
Roman', serif; "><span style=3D"font-size: 11pt; font-family: Calibri, =
sans-serif; color: rgb(31, 73, 125); =
"><o:p>&nbsp;</o:p></span></div><div style=3D"margin-top: 0in; =
margin-right: 0in; margin-left: 0in; margin-bottom: 0.0001pt; font-size: =
12pt; font-family: 'Times New Roman', serif; "><span style=3D"font-size: =
11pt; font-family: Calibri, sans-serif; color: rgb(31, 73, 125); =
">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; Another question: Where is the mapping stored if I =
wanted to write a program to display it the way I =
want?<o:p></o:p></span></div><div style=3D"margin-top: 0in; =
margin-right: 0in; margin-left: 0in; margin-bottom: 0.0001pt; font-size: =
12pt; font-family: 'Times New Roman', serif; "><span style=3D"font-size: =
11pt; font-family: Calibri, sans-serif; color: rgb(31, 73, 125); =
"><o:p>&nbsp;</o:p></span></div></span></blockquote></div><br><div>I =
don't think there is a way to do exactly what you want that I am aware =
of. &nbsp;You need to know three things: the order of the devices, the =
stripe size, and the overall size. &nbsp;You can compute what you want =
from that, but I don't think LVM will do that for =
you.</div><div><br></div><div>You can get those three fields from 'lvs', =
but I think you will have to do some scripting to get what you want from =
there.</div><div><br></div><div>As to the question of the mapping =
table... &nbsp;The mapping table is not stored anywhere. &nbsp;It is =
constructed from the LVs properties that are stored in the LVM metadata. =
&nbsp;You can, however, get the table used to construct the device by =
calling 'dmsetup table &lt;DM device&gt;'. &nbsp;The DM device is what =
/dev/&lt;vg&gt;/&lt;lv&gt; links =
to.</div><div><br></div><div>&nbsp;brassow</div><div><br></div></body></ht=
ml>=

--Apple-Mail-11--564246313--
