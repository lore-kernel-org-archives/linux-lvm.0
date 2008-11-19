Received: from dhcp80-216.msp.redhat.com (dhcp80-216.msp.redhat.com
	[10.15.80.216])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id mAJK5occ028963
	for <linux-lvm@redhat.com>; Wed, 19 Nov 2008 15:05:50 -0500
Message-Id: <15C43594-A901-44B0-A811-31FD9F9ADE79@redhat.com>
From: Jonathan Brassow <jbrassow@redhat.com>
In-Reply-To: <8131a5080811190338ne6fe00ek9c9733eea505df2@mail.gmail.com>
Content-Type: multipart/alternative; boundary=Apple-Mail-52--290221199
Mime-Version: 1.0 (Apple Message framework v929.2)
Subject: Re: [linux-lvm] automatic IO load balancing in LVM
Date: Wed, 19 Nov 2008 14:04:41 -0600
References: <8131a5080811190338ne6fe00ek9c9733eea505df2@mail.gmail.com>
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


--Apple-Mail-52--290221199
Content-Type: text/plain;
	charset=US-ASCII;
	format=flowed;
	delsp=yes
Content-Transfer-Encoding: 7bit

Where would this be appropriate?

Are you asking about read-balancing in Mirroring?  Not yet.

Or are you asking about load-balancing when there are multiple paths  
to a device?  If so, that would be handled by dm-multipath, not LVM.   
(dm-multipath does have a remedial form of load balancing, IIRC.)

  brassow

On Nov 19, 2008, at 5:38 AM, sandeep lvm wrote:

> Hi,
>
> Do we have automatic IO load balancing in LVM .
>
> --Sandeep
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


--Apple-Mail-52--290221199
Content-Type: text/html;
	charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

<html><body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
-webkit-line-break: after-white-space; ">Where would this be =
appropriate?<div><br></div><div>Are you asking about read-balancing in =
Mirroring? &nbsp;Not yet.</div><div><br></div><div>Or are you asking =
about load-balancing when there are multiple paths to a device? &nbsp;If =
so, that would be handled by dm-multipath, not LVM. &nbsp;(dm-multipath =
does have a remedial form of load balancing, =
IIRC.)</div><div><br></div><div>&nbsp;brassow</div><div><br><div><div>On =
Nov 19, 2008, at 5:38 AM, sandeep lvm wrote:</div><br =
class=3D"Apple-interchange-newline"><blockquote type=3D"cite"><div =
class=3D"MsoNormal" style=3D"MARGIN: 0in 0in 0pt"><font face=3D"Times =
New Roman">Hi,</font></div> <div class=3D"MsoNormal" style=3D"MARGIN: =
0in 0in 0pt">&nbsp;</div> <div class=3D"MsoNormal" style=3D"MARGIN: 0in =
0in 0pt"><font face=3D"Times New Roman">Do we have automatic IO load =
balancing in LVM .&nbsp;<span style=3D"mso-spacerun: =
yes">&nbsp;</span></font></div> <div class=3D"MsoNormal" style=3D"MARGIN: =
0in 0in 0pt"><font face=3D"Times New Roman"><span style=3D"mso-spacerun: =
yes"></span></font>&nbsp;</div><div style=3D"margin-top: 0in; =
margin-right: 0in; margin-bottom: 0pt; margin-left: 0in; "><font =
face=3D"Times New Roman">--Sandeep</font></div> =
_______________________________________________<br>linux-lvm mailing =
list<br><a =
href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>https://w=
ww.redhat.com/mailman/listinfo/linux-lvm<br>read the LVM HOW-TO at =
http://tldp.org/HOWTO/LVM-HOWTO/</blockquote></div><br></div></body></html=
>=

--Apple-Mail-52--290221199--
