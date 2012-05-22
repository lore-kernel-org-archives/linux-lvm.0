Mime-Version: 1.0 (Apple Message framework v1084)
Content-Type: multipart/alternative; boundary=Apple-Mail-1-777686165
From: Brassow Jonathan <jbrassow@redhat.com>
In-Reply-To: <54198.172.16.0.29.1337704836.squirrel@beer.org.uk>
Date: Tue, 22 May 2012 14:24:15 -0500
Message-Id: <9014EE43-9993-4CA7-B3B0-B1F85B668206@redhat.com>
References: <53772.172.16.0.29.1337698212.squirrel@beer.org.uk>
	<CAOAgVpw2_EoEVSKW2hbODsrD517+bXf=KGcbL=P8-n3i9scmqw@mail.gmail.com>
	<54088.172.16.0.29.1337700576.squirrel@beer.org.uk>
	<4FBBB834.302@redhat.com>
	<54198.172.16.0.29.1337704836.squirrel@beer.org.uk>
Subject: Re: [linux-lvm] Fun and games with mirroring
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
To: lvm@beer.org.uk, LVM general discussion and development <linux-lvm@redhat.com>


--Apple-Mail-1-777686165
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


On May 22, 2012, at 11:40 AM, Vic wrote:

>>=20
>> Ideally you'd want the initramfs scripts to carry out the same =
actions
>> as the defined mirror repair policy during startup (or to invoke
>> lvconvert --repair to do the same).
>=20
> Well, we can call it Somebody Else's Problem, or perhaps LVM should be
> able to use a broken mirror - that's how every other mirror system =
works,
> and is generally the very reason for having a mirror at all. I =
consider
> this to be a bug within LVM.

LVM requires that for an LV to be activated while there are missing PVs, =
the '--partial' flag must be used.  If the script running vgchange does =
not include '--partial', your mirror won't be activated.

There are also 2 different ways of doing mirroring in LVM now also.  You =
can choose the 'mirror' segment type or the 'raid1' segment type.  The =
'raid1' segment type is a newer offering, but leverages the MD RAID1 =
personality.  The critical difference between the two is that 'raid1' =
can operate while there is a faulty device present and the 'mirror' =
segment type must have something intervene and remove/replace the failed =
device before it will allow I/O.

It seems to me that the solution might be to attempt to activate the =
volume group without the partial flag first.  Failing that, activate any =
'raid1' LV with a --partial flag and repair and activate any 'mirror' =
LVs.

 brassow=

--Apple-Mail-1-777686165
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space; =
"><br><div><div>On May 22, 2012, at 11:40 AM, Vic wrote:</div><br =
class=3D"Apple-interchange-newline"><blockquote type=3D"cite"><span =
class=3D"Apple-style-span" style=3D"border-collapse: separate; =
font-family: Helvetica; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: 2; text-align: -webkit-auto; text-indent: 0px; text-transform: =
none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: =
0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: =
auto; -webkit-text-stroke-width: 0px; font-size: medium; "><blockquote =
type=3D"cite"><br class=3D"Apple-interchange-newline">Ideally you'd want =
the initramfs scripts to carry out the same =
actions<br></blockquote><blockquote type=3D"cite">as the defined mirror =
repair policy during startup (or to invoke<br></blockquote><blockquote =
type=3D"cite">lvconvert --repair to do the =
same).<br></blockquote><br>Well, we can call it Somebody Else's Problem, =
or perhaps LVM should be<br>able to use a broken mirror - that's how =
every other mirror system works,<br>and is generally the very reason for =
having a mirror at all. I consider<br>this to be a bug within =
LVM.<br></span></blockquote></div><br><div>LVM requires that for an LV =
to be activated while there are missing PVs, the '--partial' flag must =
be used. &nbsp;If the script running vgchange does not include =
'--partial', your mirror won't be =
activated.</div><div><br></div><div>There are also 2 different ways of =
doing mirroring in LVM now also. &nbsp;You can choose the 'mirror' =
segment type or the 'raid1' segment type. &nbsp;The 'raid1' segment type =
is a newer offering, but leverages the MD RAID1 personality. &nbsp;The =
critical difference between the two is that 'raid1' can operate while =
there is a faulty device present and the 'mirror' segment type must have =
something intervene and remove/replace the failed device before it will =
allow I/O.</div><div><br></div><div>It seems to me that the solution =
might be to attempt to activate the volume group without the partial =
flag first. &nbsp;Failing that, activate any 'raid1' LV with a --partial =
flag and repair and activate any 'mirror' =
LVs.</div><div><br></div><div>&nbsp;brassow</div></body></html>=

--Apple-Mail-1-777686165--
