Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2N9enj25895
	for <linux-lvm@redhat.com>; Tue, 23 Mar 2004 04:40:49 -0500
Received: from mtagate2.uk.ibm.com (mtagate2.uk.ibm.com [195.212.29.135])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2N9ecWA016496
	for <linux-lvm@redhat.com>; Tue, 23 Mar 2004 04:40:48 -0500
Received: from d06nrmr1307.portsmouth.uk.ibm.com
	(d06nrmr1307.portsmouth.uk.ibm.com [9.149.38.129])
	by mtagate2.uk.ibm.com (8.12.10/8.12.10) with ESMTP id i2N9dDUH102372
	for <linux-lvm@redhat.com>; Tue, 23 Mar 2004 09:39:20 GMT
Received: from d06ml064.portsmouth.uk.ibm.com (d06av02.portsmouth.uk.ibm.com
	[9.149.37.228])
	by d06nrmr1307.portsmouth.uk.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	i2N9Zg3X095940
	for <linux-lvm@redhat.com>; Tue, 23 Mar 2004 09:35:57 GMT
In-Reply-To: <405F5D9F.6030003@gbrmpa.gov.au>
MIME-Version: 1.0
Subject: Re: [linux-lvm] How do I pvresize?
Message-ID: <OF4B3BACF4.D1DB6ADC-ON80256E60.0033B677-80256E60.003466C2@uk.ibm.com>
From: Chris Laycock <LAYCOCKC@uk.ibm.com>
Date: Tue, 23 Mar 2004 09:37:10 +0000
Content-Type: multipart/alternative;
	boundary="=_alternative 003466C180256E60_="
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>

This is a multipart message in MIME format.
--=_alternative 003466C180256E60_=
Content-Type: text/plain; charset="US-ASCII"

Glen,

If you do a pvscan do you get  'PV "/dev/sda1"  etc' or 'PV "/dev/sda" 
etc'
If you get the former could you not create /dev/sda2 with the extra 250GB 
and add that to the LV as a separate PV
I'm assuming that you can have different partitions on the same array 
(actual disk) defined as separate PVs
I may be completely off track here, please feel free to correct.....

Regards,

Chris.

-------------------
Chris Laycock
IT Specialist 
IBM Global Services (IDO)

LITS, Stevenage
Mail point: K3 STEV UK
Email: LaycockC@uk.ibm.com
Tel : (01438) 76-9460  (internal: 44-9460)


Please respond to LVM general discussion and development 
<linux-lvm@redhat.com> 
Sent by:        linux-lvm-bounces@redhat.com
To:     LVM general discussion and development <linux-lvm@redhat.com>
cc:      
Subject:        Re: [linux-lvm] How do I pvresize?


I have already expanded the RAID slice by 250Gb, and now have a
/dev/sda which is 250Gb larger than it was before.

I now cannot remove that disk without either rebuilding the RAID
on the hot spare(back to square one) or destroying the RAID.

Please, can someone help me?

David Mohr wrote:
> I'm pretty new to LVM, so take my comment with a grain of salt.
> 
> Why do you need to resize the PV at all? If you need more space, create
> a new PV and add it to the LV, that should do the trick.
> 
> ~David
> 
> On Sun, 2004-03-21 at 15:01, Glen Harris wrote:
> 
>>We started running out of space on our backup server, so I bought a
>>couple of new 250Gb disks, added them to the 16 bay FC RAID array
>>and expanded the RAID, followed by the slice.
>>
>>I then went to expand the PV, and got a "Command not implemented yet."
>>message.
>>
>>This is a problem. This is a *BIG* problem.
>>
>>What are my options, short of destroying the volume and starting
>>from scratch?
>>_______________________________________________
>>linux-lvm mailing list
>>linux-lvm@redhat.com
>>https://www.redhat.com/mailman/listinfo/linux-lvm
>>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


--=_alternative 003466C180256E60_=
Content-Type: text/html; charset="US-ASCII"


<br><font size=2 face="sans-serif">Glen,</font>
<br>
<br><font size=2 face="Arial">If you do a pvscan do you get &nbsp;'PV &quot;/dev/sda1&quot;
&nbsp;etc' or 'PV &quot;/dev/sda&quot; &nbsp;etc'</font>
<br><font size=2 face="Arial">If you get the former could you not create
/dev/sda2 with the extra 250GB and add that to the LV as a separate PV</font>
<br><font size=2 face="Arial">I'm assuming that you can have different
partitions on the same array (actual disk) defined as separate PVs</font>
<br><font size=2 face="Arial">I may be completely off track here, please
feel free to correct.....</font>
<br>
<br><font size=2 face="sans-serif">Regards,<br>
<br>
Chris.<br>
<br>
-------------------<br>
Chris Laycock<br>
IT Specialist <br>
IBM Global Services (IDO)<br>
<br>
LITS, Stevenage<br>
Mail point: K3 STEV UK<br>
Email: LaycockC@uk.ibm.com<br>
Tel : (01438) 76-9460 &nbsp;(internal: 44-9460)<br>
<br>
</font>
<p><font size=1 color=#800080 face="sans-serif">Please respond to LVM general
discussion and development &lt;linux-lvm@redhat.com&gt; </font>
<p><font size=1 color=#800080 face="sans-serif">Sent by: &nbsp; &nbsp;
&nbsp; &nbsp;linux-lvm-bounces@redhat.com</font>
<p><font size=1 color=#800080 face="sans-serif">To: &nbsp; &nbsp; &nbsp;
&nbsp;</font><font size=1 face="sans-serif">LVM general discussion
and development &lt;linux-lvm@redhat.com&gt;</font>
<br><font size=1 color=#800080 face="sans-serif">cc: &nbsp; &nbsp; &nbsp;
&nbsp; </font>
<br><font size=1 color=#800080 face="sans-serif">Subject: &nbsp; &nbsp;
&nbsp; &nbsp;</font><font size=1 face="sans-serif">Re: [linux-lvm]
How do I pvresize?</font>
<br>
<br>
<br><font size=2><tt>I have already expanded the RAID slice by 250Gb, and
now have a<br>
/dev/sda which is 250Gb larger than it was before.<br>
<br>
I now cannot remove that disk without either rebuilding the RAID<br>
on the hot spare(back to square one) or destroying the RAID.<br>
<br>
Please, can someone help me?<br>
<br>
David Mohr wrote:<br>
&gt; I'm pretty new to LVM, so take my comment with a grain of salt.<br>
&gt; <br>
&gt; Why do you need to resize the PV at all? If you need more space, create<br>
&gt; a new PV and add it to the LV, that should do the trick.<br>
&gt; <br>
&gt; ~David<br>
&gt; <br>
&gt; On Sun, 2004-03-21 at 15:01, Glen Harris wrote:<br>
&gt; <br>
&gt;&gt;We started running out of space on our backup server, so I bought
a<br>
&gt;&gt;couple of new 250Gb disks, added them to the 16 bay FC RAID array<br>
&gt;&gt;and expanded the RAID, followed by the slice.<br>
&gt;&gt;<br>
&gt;&gt;I then went to expand the PV, and got a &quot;Command not implemented
yet.&quot;<br>
&gt;&gt;message.<br>
&gt;&gt;<br>
&gt;&gt;This is a problem. This is a *BIG* problem.<br>
&gt;&gt;<br>
&gt;&gt;What are my options, short of destroying the volume and starting<br>
&gt;&gt;from scratch?<br>
&gt;&gt;_______________________________________________<br>
&gt;&gt;linux-lvm mailing list<br>
&gt;&gt;linux-lvm@redhat.com<br>
&gt;&gt;https://www.redhat.com/mailman/listinfo/linux-lvm<br>
&gt;&gt;read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/<br>
&gt;&gt;<br>
&gt; <br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; linux-lvm mailing list<br>
&gt; linux-lvm@redhat.com<br>
&gt; https://www.redhat.com/mailman/listinfo/linux-lvm<br>
&gt; read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/<br>
_______________________________________________<br>
linux-lvm mailing list<br>
linux-lvm@redhat.com<br>
https://www.redhat.com/mailman/listinfo/linux-lvm<br>
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/<br>
</tt></font>
<br>
--=_alternative 003466C180256E60_=--
