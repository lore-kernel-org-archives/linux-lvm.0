Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: multipart/alternative; boundary=Apple-Mail-1--256205473
From: Brassow Jonathan <jbrassow@redhat.com>
In-Reply-To: <CACjhXxfZak7n=zBvfPX3FtpZeBM88eBm8RnweguOZjpwdoG0ew@mail.gmail.com>
Date: Tue, 2 Sep 2014 17:00:07 -0500
Message-Id: <590C03FA-0051-4DCF-B568-C0A47B16AA49@redhat.com>
References: <CACjhXxfZak7n=zBvfPX3FtpZeBM88eBm8RnweguOZjpwdoG0ew@mail.gmail.com>
Subject: Re: [linux-lvm] Setting up LVM cache causes crash
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
Cc: data <data@cogolabs.com>


--Apple-Mail-1--256205473
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


On Aug 25, 2014, at 11:45 AM, Elvin Cako wrote:

> Hello,
>=20
> Kernel:
> 3.10.0-123.6.3.el7.x86_64 #1 SMP Wed Aug 6 21:12:36 UTC 2014 x86_64 =
x86_64 x86_64 GNU/Linux
>=20
> Issue:
> In trying to set up the new LVM caching, I've run into some issues. I =
have followed the steps in the lvm manual:

Thanks for trying LVM caching.

My first guess is that not all the devices are visible to LVM when it =
tries to construct the LVs.  This could have been due to MD running =
after lvmetad - I'm not sure.  However, testing without lvmetad (as you =
have done) should have yielded different results then.  Even without the =
devices being visible, 'vgchange' should not crash.

We could use a couple pieces of information:
1) what is the verbose trace of 'vgchange -ay'?  (Add '-vvvv' for "very =
verbose" and capture the output.)

2) What do you mean by "crash"?  Does the system go down?  Does the =
command hang or segfault?

 brassow=

--Apple-Mail-1--256205473
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space; =
"><br><div><div>On Aug 25, 2014, at 11:45 AM, Elvin Cako wrote:</div><br =
class=3D"Apple-interchange-newline"><blockquote type=3D"cite"><span =
class=3D"Apple-style-span" style=3D"border-collapse: separate; =
font-family: Helvetica; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: 2; text-align: -webkit-auto; text-indent: 0px; text-transform: =
none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: =
0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: =
auto; -webkit-text-stroke-width: 0px; font-size: medium; "><span =
class=3D"Apple-style-span" style=3D"font-family: arial, sans-serif; =
font-size: 13px; =
"><div>Hello,</div><div><br></div><div>Kernel:</div><div><div =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; font-size: 11px; font-family: Menlo; =
">3.10.0-123.6.3.el7.x86_64 #1 SMP Wed Aug 6 21:12:36 UTC 2014 x86_64 =
x86_64 x86_64 GNU/Linux</div></div><div><br></div><div>Issue:</div>In =
trying to set up the new LVM caching, I've run into some issues. I have =
followed the steps in the lvm manual:</span></span><br =
class=3D"Apple-interchange-newline"></blockquote></div><br><div>Thanks =
for trying LVM caching.</div><div><br></div><div>My first guess is that =
not all the devices are visible to LVM when it tries to construct the =
LVs. &nbsp;This could have been due to MD running after lvmetad - I'm =
not sure. &nbsp;However, testing without lvmetad (as you have done) =
should have yielded different results then. &nbsp;Even without the =
devices being visible, 'vgchange' should not =
crash.</div><div><br></div><div>We could use a couple pieces of =
information:</div><div>1) what is the verbose trace of 'vgchange -ay'? =
&nbsp;(Add '-vvvv' for "very verbose" and capture the =
output.)</div><div><br></div><div>2) What do you mean by "crash"? =
&nbsp;Does the system go down? &nbsp;Does the command hang or =
segfault?</div><div><br></div><div>&nbsp;brassow</div></body></html>=

--Apple-Mail-1--256205473--
