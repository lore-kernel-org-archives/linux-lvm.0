From: darren.miller@philips.com
Subject: Re: [linux-lvm] LVM2-Snapshot
MIME-Version: 1.0
Message-ID: <OF8F98AF3D.A81E7162-ON80256E53.005BA186-80256E53.005BD70D@philips.com>
Content-Type: multipart/alternative; boundary="=_alternative 005BD6EE80256E53_="
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Wed Mar 10 11:41:07 2004
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com
Cc: linux-lvm-admin@redhat.com

This is a multipart message in MIME format.
--=_alternative 005BD6EE80256E53_=
Content-Type: text/plain; charset="us-ascii"

I have exactly the same problem m8
==============================================================================
Darren Miller 
Senior Systems Support Engineer
Microsoft Certified Professional
SCO Advanced Certified Engineer 
Infomation Systems Department (Core Server Support)
Philips Semiconductors,Milbrook Industrial Estate,Southampton,SO15 
0DJ,England
Direct Dial In: +44 (0) 2380 312681









Christoph Pleger <Christoph.Pleger@uni-dortmund.de>
Sent by: 
linux-lvm-admin@redhat.com
10/03/2004 16:30
Please respond to linux-lvm

 
        To:     linux-lvm@redhat.com
        cc:     (bcc: Darren Miller/SOU/SC/PHILIPS)
        Subject:        [linux-lvm] LVM2-Snapshot
        Classification: 



Hello,

I have problems when I try to create a snapshot of a logical volume
under LVM2 (Kernel 2.6.3). I get the following messages after using
"lvcreate -s -l 227 -n snap /dev/vg1/lv1":

device_mapper ioctl cmd 9 failed: Invalid argument
Couldn't load device 'vg1-snap'.
Problem reactivating origin lv1


How can I solve that?

Using google, I found that snapshots under LVM2 and Kernel 2.6 generally
do not work. I hope that that is no longer true, is it? 

Christoph

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/



--=_alternative 005BD6EE80256E53_=
Content-Type: text/html; charset="us-ascii"


<br><font size=2 face="sans-serif">I have exactly the same problem m8<br>
==============================================================================<br>
Darren Miller &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>
Senior Systems Support Engineer<br>
Microsoft Certified Professional<br>
SCO Advanced Certified Engineer &nbsp; &nbsp; &nbsp; &nbsp;<br>
Infomation Systems Department (Core Server Support)<br>
Philips Semiconductors,Milbrook Industrial Estate,Southampton,SO15 0DJ,England<br>
Direct Dial In: +44 (0) 2380 312681</font>
<br>
<br>
<br>
<table width=100%>
<tr valign=top>
<td>
<td>
<br>
<br>
<br>
<br>
<br><font size=1 face="sans-serif"><b>Christoph Pleger &lt;Christoph.Pleger@uni-dortmund.de&gt;</b></font>
<p><font size=1 face="sans-serif">Sent by: </font>
<br><font size=1 face="sans-serif">linux-lvm-admin@redhat.com</font>
<p><font size=1 face="sans-serif">10/03/2004 16:30</font>
<br><font size=1 face="sans-serif">Please respond to linux-lvm</font>
<br>
<td><font size=1 face="Arial">&nbsp; &nbsp; &nbsp; &nbsp; </font>
<br><font size=1 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; To: &nbsp; &nbsp; &nbsp; &nbsp;linux-lvm@redhat.com</font>
<br><font size=1 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; cc: &nbsp; &nbsp; &nbsp; &nbsp;(bcc: Darren Miller/SOU/SC/PHILIPS)</font>
<br><font size=1 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; Subject: &nbsp; &nbsp; &nbsp; &nbsp;[linux-lvm] LVM2-Snapshot</font>
<p><font size=1 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; Classification: &nbsp; &nbsp; &nbsp; &nbsp;</font>
<br></table>
<br>
<br>
<br><font size=2 face="Courier New">Hello,<br>
<br>
I have problems when I try to create a snapshot of a logical volume<br>
under LVM2 (Kernel 2.6.3). I get the following messages after using<br>
&quot;lvcreate -s -l 227 -n snap /dev/vg1/lv1&quot;:<br>
<br>
device_mapper ioctl cmd 9 failed: Invalid argument<br>
Couldn't load device 'vg1-snap'.<br>
Problem reactivating origin lv1<br>
<br>
<br>
How can I solve that?<br>
<br>
Using google, I found that snapshots under LVM2 and Kernel 2.6 generally<br>
do not work. I hope that that is no longer true, is it? <br>
<br>
Christoph<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
linux-lvm@redhat.com<br>
https://www.redhat.com/mailman/listinfo/linux-lvm<br>
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/<br>
</font>
<br>
<br>
--=_alternative 005BD6EE80256E53_=--
