From: darren.miller@philips.com
Subject: Re: [linux-lvm] LVM2-Snapshot
MIME-Version: 1.0
Message-ID: <OF36A82CA1.D42E4925-ON80256E54.003D7822-80256E54.003DD0DD@philips.com>
Content-Type: multipart/alternative; boundary="=_alternative 003DD0D280256E54_="
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
Date: Thu Mar 11 06:13:03 2004
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com
Cc: linux-lvm-admin@redhat.com

This is a multipart message in MIME format.
--=_alternative 003DD0D280256E54_=
Content-Type: text/plain; charset="us-ascii"

Tried to apply the udm patch selection to vanilla 2.6.4 kernel recieved a 
shed load of failures and the kernel refused to build.  I am not a 
programmer so I have no clue how to rectify these issues.  do you have 
anything that works?
==============================================================================
Darren Miller 
Senior Systems Support Engineer
Microsoft Certified Professional
SCO Advanced Certified Engineer 
Infomation Systems Department (Core Server Support)
Philips Semiconductors,Milbrook Industrial Estate,Southampton,SO15 
0DJ,England
Direct Dial In: +44 (0) 2380 312681









Joe Thornber <thornber@redhat.com>
Sent by: 
linux-lvm-admin@redhat.com
11/03/2004 09:20
Please respond to linux-lvm

 
        To:     linux-lvm@redhat.com
        cc:     (bcc: Darren Miller/SOU/SC/PHILIPS)
        Subject:        Re: [linux-lvm] LVM2-Snapshot
        Classification: 



On Wed, Mar 10, 2004 at 05:30:02PM +0100, Christoph Pleger wrote:
> Hello,
> 
> I have problems when I try to create a snapshot of a logical volume
> under LVM2 (Kernel 2.6.3). I get the following messages after using
> "lvcreate -s -l 227 -n snap /dev/vg1/lv1":
> 
> device_mapper ioctl cmd 9 failed: Invalid argument
> Couldn't load device 'vg1-snap'.
> Problem reactivating origin lv1
> 
> 
> How can I solve that?
> 
> Using google, I found that snapshots under LVM2 and Kernel 2.6 generally
> do not work. I hope that that is no longer true, is it? 

The snapshot target isn't in vanilla 2.6 yet, use my udm (unstable dm)
tree if you want that functionality.

http://people.sistina.com/~thornber/dm/

I _hope_ to submit this to lkml within the next month.

- Joe

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/



--=_alternative 003DD0D280256E54_=
Content-Type: text/html; charset="us-ascii"


<br><font size=2 face="sans-serif">Tried to apply the udm patch selection to vanilla 2.6.4 kernel recieved a shed load of failures and the kernel refused to build. &nbsp;I am not a programmer so I have no clue how to rectify these issues. &nbsp;do you have anything that works?<br>
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
<br><font size=1 face="sans-serif"><b>Joe Thornber &lt;thornber@redhat.com&gt;</b></font>
<p><font size=1 face="sans-serif">Sent by: </font>
<br><font size=1 face="sans-serif">linux-lvm-admin@redhat.com</font>
<p><font size=1 face="sans-serif">11/03/2004 09:20</font>
<br><font size=1 face="sans-serif">Please respond to linux-lvm</font>
<br>
<td><font size=1 face="Arial">&nbsp; &nbsp; &nbsp; &nbsp; </font>
<br><font size=1 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; To: &nbsp; &nbsp; &nbsp; &nbsp;linux-lvm@redhat.com</font>
<br><font size=1 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; cc: &nbsp; &nbsp; &nbsp; &nbsp;(bcc: Darren Miller/SOU/SC/PHILIPS)</font>
<br><font size=1 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; Subject: &nbsp; &nbsp; &nbsp; &nbsp;Re: [linux-lvm] LVM2-Snapshot</font>
<p><font size=1 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; Classification: &nbsp; &nbsp; &nbsp; &nbsp;</font>
<br></table>
<br>
<br>
<br><font size=2 face="Courier New">On Wed, Mar 10, 2004 at 05:30:02PM +0100, Christoph Pleger wrote:<br>
&gt; Hello,<br>
&gt; <br>
&gt; I have problems when I try to create a snapshot of a logical volume<br>
&gt; under LVM2 (Kernel 2.6.3). I get the following messages after using<br>
&gt; &quot;lvcreate -s -l 227 -n snap /dev/vg1/lv1&quot;:<br>
&gt; <br>
&gt; device_mapper ioctl cmd 9 failed: Invalid argument<br>
&gt; Couldn't load device 'vg1-snap'.<br>
&gt; Problem reactivating origin lv1<br>
&gt; <br>
&gt; <br>
&gt; How can I solve that?<br>
&gt; <br>
&gt; Using google, I found that snapshots under LVM2 and Kernel 2.6 generally<br>
&gt; do not work. I hope that that is no longer true, is it? <br>
<br>
The snapshot target isn't in vanilla 2.6 yet, use my udm (unstable dm)<br>
tree if you want that functionality.<br>
<br>
http://people.sistina.com/~thornber/dm/<br>
<br>
I _hope_ to submit this to lkml within the next month.<br>
<br>
- Joe<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
linux-lvm@redhat.com<br>
https://www.redhat.com/mailman/listinfo/linux-lvm<br>
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/<br>
</font>
<br>
<br>
--=_alternative 003DD0D280256E54_=--
