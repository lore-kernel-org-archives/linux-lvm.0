Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o9LMpwBC003060
	for <linux-lvm@redhat.com>; Thu, 21 Oct 2010 18:51:58 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o9LMpjDu016052
	for <linux-lvm@redhat.com>; Thu, 21 Oct 2010 18:51:46 -0400
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com
	[9.17.195.227])
	by e36.co.us.ibm.com (8.14.4/8.13.1) with ESMTP id o9LMlWgp022727
	for <linux-lvm@redhat.com>; Thu, 21 Oct 2010 16:47:32 -0600
Received: from d03av05.boulder.ibm.com (d03av05.boulder.ibm.com [9.17.195.85])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id
	o9LMpjWi258530
	for <linux-lvm@redhat.com>; Thu, 21 Oct 2010 16:51:45 -0600
Received: from d03av05.boulder.ibm.com (loopback [127.0.0.1])
	by d03av05.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP
	id o9LMpjfI012635
	for <linux-lvm@redhat.com>; Thu, 21 Oct 2010 16:51:45 -0600
Received: from d03nm122.boulder.ibm.com (d03nm122.boulder.ibm.com
	[9.17.195.148])
	by d03av05.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	o9LMpjAM012632
	for <linux-lvm@redhat.com>; Thu, 21 Oct 2010 16:51:45 -0600
In-Reply-To: <AANLkTinB4J+NkZHt1buQsFeZU7ErrvkR+wKMMssJrHQx@mail.gmail.com>
References: <AANLkTinB4J+NkZHt1buQsFeZU7ErrvkR+wKMMssJrHQx@mail.gmail.com>
Message-ID: <OF26B303BD.F146F691-ON872577C3.007CC24E-862577C3.007D9F4C@us.ibm.com>
From: Christopher Cox <chrcox@us.ibm.com>
Date: Thu, 21 Oct 2010 17:51:44 -0500
MIME-Version: 1.0
Content-type: multipart/related; 
	Boundary="0__=08BBFD50DFEF44DE8f9e8a93df938690918c08BBFD50DFEF44DE"
Subject: Re: [linux-lvm] Raid 10 and LVM stripe
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

--0__=08BBFD50DFEF44DE8f9e8a93df938690918c08BBFD50DFEF44DE
Content-type: multipart/alternative; 
	Boundary="1__=08BBFD50DFEF44DE8f9e8a93df938690918c08BBFD50DFEF44DE"

--1__=08BBFD50DFEF44DE8f9e8a93df938690918c08BBFD50DFEF44DE
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: quoted-printable


For a home grown setup, it sounds ok.

8 disks on a controller might be too many... depends.  Obviously, a LOT=
 of
standalone subystems have FAR  fewer controllers.

I would think you'd get some pretty nice numbers off of it.  Would you
consider getting yourself setup on the Phoronix Test Suite (run the dis=
k
benchmark)?  I wouldn't also mind seeing some bonnie++ benchmarks (make=

sure you include the version you used).

Your RAID 10.... how did you create that?  Is that somehow coordinated
using the 3ware RAID driver only.... or combination of 3ware RAID level=

plus Linux md?  Just curious.

Also... (just thinking out loud)... this box might want more memory.
Again, it depends on how/what the storage is being used for.  For examp=
le,
if this were to become a NAS box on a 10Gbit network, performance could=
 go
way up with more memory.  Post some benchies... would love to see them.=


Oh.. have you simulated a drive failure yet?  A multi-drive RAID 10
failure?  I think those are good tests.... just to make sure you really=

have a workable RAID10 on your hands.



From:	Fabricio Archanjo <farchanjo@gmail.com>
To:	LVM general discussion and development <linux-lvm@redhat.com>
Date:	10/21/2010 12:30 AM
Subject:	[linux-lvm] Raid 10 and LVM stripe
Sent by:	linux-lvm-bounces@redhat.com



Hey all,
I've made a storage by myself.
This box has 24x 1,5T SATA II disks, 3 controllers 3ware
PCI-Express,6G ram memory DDR3 1333Mhz. This disks are distributed for
each controller, 8 disks for each one.  I've done at each controller
Raid 10 with 256k stripe size, then I've created one volume group with
all disks and I've created one logical volume with 10G, 3 stripes and
256k of stripe size. I've gotten a great result with it, but i'd like
to know what all think about it.

Sorry my last e-mail, I'm falling asleep and i've sent  unintentionally=
.


Thanks all,
Fabricio

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
=

--1__=08BBFD50DFEF44DE8f9e8a93df938690918c08BBFD50DFEF44DE
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline
Content-transfer-encoding: quoted-printable

<html><body>
<p>For a home grown setup, it sounds ok.<br>
<br>
8 disks on a controller might be too many... depends.  Obviously, a LOT=
 of standalone subystems have FAR  fewer controllers.<br>
<br>
I would think you'd get some pretty nice numbers off of it.  Would you =
consider getting yourself setup on the Phoronix Test Suite (run the dis=
k benchmark)?  I wouldn't also mind seeing some bonnie++ benchmarks (ma=
ke sure you include the version you used).<br>
<br>
Your RAID 10.... how did you create that?  Is that somehow coordinated =
using the 3ware RAID driver only.... or combination of 3ware RAID level=
 plus Linux md?  Just curious.<br>
<br>
Also... (just thinking out loud)... this box might want more memory.  A=
gain, it depends on how/what the storage is being used for.  For exampl=
e, if this were to become a NAS box on a 10Gbit network, performance co=
uld go way up with more memory.  Post some benchies... would love to se=
e them.<br>
<br>
Oh.. have you simulated a drive failure yet?  A multi-drive RAID 10 fai=
lure?  I think those are good tests.... just to make sure you really ha=
ve a workable RAID10 on your hands.<br>
<br>
<img width=3D"16" height=3D"16" src=3D"cid:1__=3D08BBFD50DFEF44DE8f9e8a=
93df938@us.ibm.com" border=3D"0" alt=3D"Inactive hide details for Fabri=
cio Archanjo ---10/21/2010 12:30:40 AM---Hey all, I've made a storage b=
y myself."><font color=3D"#424282">Fabricio Archanjo ---10/21/2010 12:3=
0:40 AM---Hey all, I've made a storage by myself.</font><br>
<br>
<font size=3D"2" color=3D"#5F5F5F">From:	</font><font size=3D"2">Fabric=
io Archanjo &lt;farchanjo@gmail.com&gt;</font><br>
<font size=3D"2" color=3D"#5F5F5F">To:	</font><font size=3D"2">LVM gene=
ral discussion and development &lt;linux-lvm@redhat.com&gt;</font><br>
<font size=3D"2" color=3D"#5F5F5F">Date:	</font><font size=3D"2">10/21/=
2010 12:30 AM</font><br>
<font size=3D"2" color=3D"#5F5F5F">Subject:	</font><font size=3D"2">[li=
nux-lvm] Raid 10 and LVM stripe</font><br>
<font size=3D"2" color=3D"#5F5F5F">Sent by:	</font><font size=3D"2">lin=
ux-lvm-bounces@redhat.com</font><br>
<hr width=3D"100%" size=3D"2" align=3D"left" noshade style=3D"color:#80=
91A5; "><br>
<br>
<br>
<tt>Hey all,<br>
I've made a storage by myself.<br>
This box has 24x 1,5T SATA II disks, 3 controllers 3ware<br>
PCI-Express,6G ram memory DDR3 1333Mhz. This disks are distributed for<=
br>
each controller, 8 disks for each one. &nbsp;I've done at each controll=
er<br>
Raid 10 with 256k stripe size, then I've created one volume group with<=
br>
all disks and I've created one logical volume with 10G, 3 stripes and<b=
r>
256k of stripe size. I've gotten a great result with it, but i'd like<b=
r>
to know what all think about it.<br>
<br>
Sorry my last e-mail, I'm falling asleep and i've sent &nbsp;unintentio=
nally.<br>
<br>
<br>
Thanks all,<br>
Fabricio<br>
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


--1__=08BBFD50DFEF44DE8f9e8a93df938690918c08BBFD50DFEF44DE--


--0__=08BBFD50DFEF44DE8f9e8a93df938690918c08BBFD50DFEF44DE
Content-type: image/gif; 
	name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-ID: <1__=08BBFD50DFEF44DE8f9e8a93df938@us.ibm.com>
Content-transfer-encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7

--0__=08BBFD50DFEF44DE8f9e8a93df938690918c08BBFD50DFEF44DE--
