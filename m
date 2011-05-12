Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p4C3ruuF022356
	for <linux-lvm@redhat.com>; Wed, 11 May 2011 23:53:56 -0400
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p4C3rsic016446
	for <linux-lvm@redhat.com>; Wed, 11 May 2011 23:53:55 -0400
Received: from d03relay03.boulder.ibm.com (d03relay03.boulder.ibm.com
	[9.17.195.228])
	by e38.co.us.ibm.com (8.14.4/8.13.1) with ESMTP id p4C3jpKs002781
	for <linux-lvm@redhat.com>; Wed, 11 May 2011 21:45:51 -0600
Received: from d03av05.boulder.ibm.com (d03av05.boulder.ibm.com [9.17.195.85])
	by d03relay03.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP
	id p4C3roCe129638
	for <linux-lvm@redhat.com>; Wed, 11 May 2011 21:53:50 -0600
Received: from d03av05.boulder.ibm.com (loopback [127.0.0.1])
	by d03av05.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP
	id p4C3roie005494
	for <linux-lvm@redhat.com>; Wed, 11 May 2011 21:53:50 -0600
Received: from d03nm122.boulder.ibm.com (d03nm122.boulder.ibm.com
	[9.17.195.148])
	by d03av05.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	p4C3roxH005486
	for <linux-lvm@redhat.com>; Wed, 11 May 2011 21:53:50 -0600
In-Reply-To: <4DC85F38.5070506@spinn.net>
References: <20110509203822.GA29336@netfirms.com> <4DC85F38.5070506@spinn.net>
Message-ID: <OF9C8B8894.96A473CB-ON8725788E.0014F607-8625788E.00156812@us.ibm.com>
From: Christopher Cox <chrcox@us.ibm.com>
Date: Wed, 11 May 2011 22:53:49 -0500
MIME-Version: 1.0
Content-type: multipart/related; 
	Boundary="0__=08BBF21DDF8770978f9e8a93df938690918c08BBF21DDF877097"
Subject: Re: [linux-lvm] creating pv's on LVM's for virtual guests
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

--0__=08BBF21DDF8770978f9e8a93df938690918c08BBF21DDF877097
Content-type: multipart/alternative; 
	Boundary="1__=08BBF21DDF8770978f9e8a93df938690918c08BBF21DDF877097"

--1__=08BBF21DDF8770978f9e8a93df938690918c08BBF21DDF877097
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: quoted-printable


My personal experience in doing this worked... until I need to manipula=
te
some things... then the nested LVM data really made life miserable with=
 the
device mapper, etc... long story short... we decided NOT to create the
nested scenario.  Sure... it's not as nice and flexible, but seem to be=
 a
whole lot safer.

For now, we are using LVM on the hypervisor host and using disks as nor=
mal,
partitionable spaces (old style) on the VMs.  I would think the opposit=
e
would also work reasonably well... but again, we felt it was safer doin=
g it
the way we're doing it.

Somebody else feel free to chime in....




From:	allan <allane@spinn.net>
To:	LVM general discussion and development <linux-lvm@redhat.com>
Date:	05/09/2011 04:42 PM
Subject:	Re: [linux-lvm] creating pv's on LVM's for virtual guests
Sent by:	linux-lvm-bounces@redhat.com



Hi Steve,

I've had mixed results doing that very thing. Two servers perform very
differently.
One mach, an HP DL380G6 w/ dual quad core Zeon and 6 146G disks install=
ed
with CentOS 5.5 stock xen, lvm, etc. performs
very well. Another machine intended as a low class server, a desktop qu=
ad
core AMD, 4 SATA disks installed with stock
CentOS 5.5 same as first mach, has issues with disk perfomance on every=

DomU - writes are 1/10 the rate of Dom0 -- I'm
still troubleshooting it.
I see no problem with using LVM on Dom0, carving it up and offering to =
DomU
virtuals and the virtuals using LVM for
storage. One thing to avoid: do not duplicate an LVM names within the
entire machine. i.e. installer, when told to use
LVM, will create a vg of a specific name. If this name is not overridde=
n,
and you create multiple DomUs with same
process the VG name will be duplicated (as well as the LV names). Avoid=

name duplication.
I hope this helps.

Allan

Steve Shorter wrote:
> Howdy!
>
> 		 I am setting up virtual guests to have a LVM created
> from the host. It would be good to use LVM's in the
> guest also.. for easy volume expansion etc...
>
> ie. I am creating pv's/vg's/lvms on top of LVM's. It *seems* to
> work but some of the userland tools need the option -ff
>
> 		 Does anybody see any issues doing this?
>
> 		 thanx - steve
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
=

--1__=08BBF21DDF8770978f9e8a93df938690918c08BBF21DDF877097
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline
Content-transfer-encoding: quoted-printable

<html><body>
<p>My personal experience in doing this worked... until I need to manip=
ulate some things... then the nested LVM data really made life miserabl=
e with the device mapper, etc... long story short... we decided NOT to =
create the nested scenario.  Sure... it's not as nice and flexible, but=
 seem to be a whole lot safer.<br>
<br>
For now, we are using LVM on the hypervisor host and using disks as nor=
mal, partitionable spaces (old style) on the VMs.  I would think the op=
posite would also work reasonably well... but again, we felt it was saf=
er doing it the way we're doing it.<br>
<br>
Somebody else feel free to chime in....<br>
<br>
<br>
<img width=3D"16" height=3D"16" src=3D"cid:1__=3D08BBF21DDF8770978f9e8a=
93df938@us.ibm.com" border=3D"0" alt=3D"Inactive hide details for allan=
 ---05/09/2011 04:42:39 PM---Hi Steve, I've had mixed results doing tha=
t very thing. Two servers"><font color=3D"#424282">allan ---05/09/2011 =
04:42:39 PM---Hi Steve, I've had mixed results doing that very thing. T=
wo servers perform very differently.</font><br>
<br>
<font size=3D"2" color=3D"#5F5F5F">From:	</font><font size=3D"2">allan =
&lt;allane@spinn.net&gt;</font><br>
<font size=3D"2" color=3D"#5F5F5F">To:	</font><font size=3D"2">LVM gene=
ral discussion and development &lt;linux-lvm@redhat.com&gt;</font><br>
<font size=3D"2" color=3D"#5F5F5F">Date:	</font><font size=3D"2">05/09/=
2011 04:42 PM</font><br>
<font size=3D"2" color=3D"#5F5F5F">Subject:	</font><font size=3D"2">Re:=
 [linux-lvm] creating pv's on LVM's for virtual guests</font><br>
<font size=3D"2" color=3D"#5F5F5F">Sent by:	</font><font size=3D"2">lin=
ux-lvm-bounces@redhat.com</font><br>
<hr width=3D"100%" size=3D"2" align=3D"left" noshade style=3D"color:#80=
91A5; "><br>
<br>
<br>
<tt>Hi Steve,<br>
<br>
I've had mixed results doing that very thing. Two servers perform very =
differently.<br>
One mach, an HP DL380G6 w/ dual quad core Zeon and 6 146G disks install=
ed with CentOS 5.5 stock xen, lvm, etc. performs <br>
very well. Another machine intended as a low class server, a desktop qu=
ad core AMD, 4 SATA disks installed with stock <br>
CentOS 5.5 same as first mach, has issues with disk perfomance on every=
 DomU - writes are 1/10 the rate of Dom0 -- I'm <br>
still troubleshooting it.<br>
I see no problem with using LVM on Dom0, carving it up and offering to =
DomU virtuals and the virtuals using LVM for <br>
storage. One thing to avoid: do not duplicate an LVM names within the e=
ntire machine. i.e. installer, when told to use <br>
LVM, will create a vg of a specific name. If this name is not overridde=
n, and you create multiple DomUs with same <br>
process the VG name will be duplicated (as well as the LV names). Avoid=
 name duplication.<br>
I hope this helps.<br>
<br>
Allan<br>
<br>
Steve Shorter wrote:<br>
&gt; Howdy!<br>
&gt; <br>
&gt; 		 I am setting up virtual guests to have a LVM created<br>
&gt; from the host. It would be good to use LVM's in the<br>
&gt; guest also.. for easy volume expansion etc...<br>
&gt; <br>
&gt; ie. I am creating pv's/vg's/lvms on top of LVM's. It *seems* to<br=
>
&gt; work but some of the userland tools need the option -ff<br>
&gt; <br>
&gt; 		 Does anybody see any issues doing this?<br>
&gt; <br>
&gt; 		 thanx - steve<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; linux-lvm mailing list<br>
&gt; linux-lvm@redhat.com<br>
&gt; </tt><tt><a href=3D"https://www.redhat.com/mailman/listinfo/linux-=
lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a></tt><tt><br>=

&gt; read the LVM HOW-TO at </tt><tt><a href=3D"http://tldp.org/HOWTO/L=
VM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a></tt><tt><br>
&gt; <br>
&gt; <br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
linux-lvm@redhat.com<br>
</tt><tt><a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm">=
https://www.redhat.com/mailman/listinfo/linux-lvm</a></tt><tt><br>
read the LVM HOW-TO at </tt><tt><a href=3D"http://tldp.org/HOWTO/LVM-HO=
WTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a></tt><tt><br>
</tt><br>
</body></html>=


--1__=08BBF21DDF8770978f9e8a93df938690918c08BBF21DDF877097--


--0__=08BBF21DDF8770978f9e8a93df938690918c08BBF21DDF877097
Content-type: image/gif; 
	name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-ID: <1__=08BBF21DDF8770978f9e8a93df938@us.ibm.com>
Content-transfer-encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7

--0__=08BBF21DDF8770978f9e8a93df938690918c08BBF21DDF877097--
