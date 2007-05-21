Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l4LFH4tH030241
	for <linux-lvm@redhat.com>; Mon, 21 May 2007 11:17:06 -0400
Received: from web38204.mail.mud.yahoo.com (web38204.mail.mud.yahoo.com
	[209.191.124.147])
	by mx1.redhat.com (8.13.1/8.13.1) with SMTP id l4LFGqdH015619
	for <linux-lvm@redhat.com>; Mon, 21 May 2007 11:16:52 -0400
Date: Mon, 21 May 2007 08:16:46 -0700 (PDT)
From: Sean McGlynn <sean_mcglynn@yahoo.com>
Subject: Re: [linux-lvm] Disk /dev/dm-0 doesn't contain a valid partition table
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-487209000-1179760606=:69660"
Message-ID: <352095.69660.qm@web38204.mail.mud.yahoo.com>
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

--0-487209000-1179760606=:69660
Content-Type: text/plain; charset=ascii

Bryn,

Thank you for taking the time to reply.

I'm glad to see this is not an issue. 

As for "dev253," if I only have three physical devices, why four dm entries?

Thanks again.


----- Original Message ----
From: Bryn M. Reeves <breeves@redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Sent: Monday, May 21, 2007 10:28:35 AM
Subject: Re: [linux-lvm] Disk /dev/dm-0 doesn't contain a valid partition table


-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Sean McGlynn wrote:
> Hello,
> 
>  
> 
> I did an fdisk -l to review my partition table (see results below), and
> found four entries that end with "Disk /dev/dm-X doesn't contain a valid
> partition table."  I don't recall seeing this in the past, so I believe
> it is something new.

Later kernels include dm devices in the list of partitions in proc, so
fdisk will attempt to scan them for partition tables. It's not harmful,
just noise.

> I recently began using kernel 2.6.21.1, up from 2.6.9-42.  I don't know
> if perhaps this had some effect, or if the entries are normal and I just
> never noticed them.

If you don't like it & you've not configured anything to use /dev/dm-*
devices directly (instead of /dev/mapper/* or /dev/<volgroup>/* or
whatever) then you can reconfigure udev to not create the dm-* nodes.

- From memory, you need to comment out the rule that begins
"KERNEL="dm-[0-9]*" in /etc/udev/rules.d/50-udev.rules, or, for newer
udevs you can add ignore_device:

KERNEL=="dm-[0-9]*", ACTION=="add", OPTIONS+="ignore_device"

>  
> 
> What led me here is that sar -d output includes four entries for hard
> drives (dev253 entries) when there are only three on my system.  Fdisk
> is reporting four DM devices, so I'm thinking there is some correlation,
> but I don't know what.

Those "dev253" entries are your device-mapper devices. Take a look at
/dev/dm-* with ls -l and you will see that the major number is 253.

Kind regards,
Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFGUayT6YSQoMYUY94RAqJKAJ9dFJtaRg3fONo7kLOkDezcS/FizwCcDwFj
2McvW5Wl+zudmUZDO2aE1fQ=
=NHOE
-----END PGP SIGNATURE-----

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


       
____________________________________________________________________________________
Moody friends. Drama queens. Your life? Nope! - their life, your story. Play Sims Stories at Yahoo! Games.
http://sims.yahoo.com/  
--0-487209000-1179760606=:69660
Content-Type: text/html; charset=ascii

<html><head><style type="text/css"><!-- DIV {margin:0px;} --></style></head><body><div style="font-family:times new roman, new york, times, serif;font-size:12pt"><DIV style="FONT-SIZE: 12pt; FONT-FAMILY: times new roman, new york, times, serif">Bryn,</DIV>
<DIV style="FONT-SIZE: 12pt; FONT-FAMILY: times new roman, new york, times, serif">&nbsp;</DIV>
<DIV style="FONT-SIZE: 12pt; FONT-FAMILY: times new roman, new york, times, serif">Thank you for taking the time to reply.</DIV>
<DIV style="FONT-SIZE: 12pt; FONT-FAMILY: times new roman, new york, times, serif">&nbsp;</DIV>
<DIV style="FONT-SIZE: 12pt; FONT-FAMILY: times new roman, new york, times, serif">I'm glad to see this is not an issue.&nbsp;</DIV>
<DIV style="FONT-SIZE: 12pt; FONT-FAMILY: times new roman, new york, times, serif">&nbsp;</DIV>
<DIV style="FONT-SIZE: 12pt; FONT-FAMILY: times new roman, new york, times, serif">As for "dev253," if I only have three physical devices, why four dm entries?</DIV>
<DIV style="FONT-SIZE: 12pt; FONT-FAMILY: times new roman, new york, times, serif">&nbsp;</DIV>
<DIV style="FONT-SIZE: 12pt; FONT-FAMILY: times new roman, new york, times, serif">Thanks again.<BR><BR></DIV>
<DIV style="FONT-SIZE: 12pt; FONT-FAMILY: times new roman, new york, times, serif">----- Original Message ----<BR>From: Bryn M. Reeves &lt;breeves@redhat.com&gt;<BR>To: LVM general discussion and development &lt;linux-lvm@redhat.com&gt;<BR>Sent: Monday, May 21, 2007 10:28:35 AM<BR>Subject: Re: [linux-lvm] Disk /dev/dm-0 doesn't contain a valid partition table<BR><BR>
<DIV>-----BEGIN PGP SIGNED MESSAGE-----<BR>Hash: SHA1<BR><BR>Sean McGlynn wrote:<BR>&gt; Hello,<BR>&gt; <BR>&gt;&nbsp;&nbsp;<BR>&gt; <BR>&gt; I did an fdisk -l to review my partition table (see results below), and<BR>&gt; found four entries that end with "Disk /dev/dm-X doesn't contain a valid<BR>&gt; partition table."&nbsp;&nbsp;I don't recall seeing this in the past, so I believe<BR>&gt; it is something new.<BR><BR>Later kernels include dm devices in the list of partitions in proc, so<BR>fdisk will attempt to scan them for partition tables. It's not harmful,<BR>just noise.<BR><BR>&gt; I recently began using kernel 2.6.21.1, up from 2.6.9-42.&nbsp;&nbsp;I don't know<BR>&gt; if perhaps this had some effect, or if the entries are normal and I just<BR>&gt; never noticed them.<BR><BR>If you don't like it &amp; you've not configured anything to use /dev/dm-*<BR>devices directly (instead of /dev/mapper/* or /dev/&lt;volgroup&gt;/* or<BR>whatever) then you can reconfigure udev to
 not create the dm-* nodes.<BR><BR>- From memory, you need to comment out the rule that begins<BR>"KERNEL="dm-[0-9]*" in /etc/udev/rules.d/50-udev.rules, or, for newer<BR>udevs you can add ignore_device:<BR><BR>KERNEL=="dm-[0-9]*", ACTION=="add", OPTIONS+="ignore_device"<BR><BR>&gt;&nbsp;&nbsp;<BR>&gt; <BR>&gt; What led me here is that sar -d output includes four entries for hard<BR>&gt; drives (dev253 entries) when there are only three on my system.&nbsp;&nbsp;Fdisk<BR>&gt; is reporting four DM devices, so I'm thinking there is some correlation,<BR>&gt; but I don't know what.<BR><BR>Those "dev253" entries are your device-mapper devices. Take a look at<BR>/dev/dm-* with ls -l and you will see that the major number is 253.<BR><BR>Kind regards,<BR>Bryn.<BR><BR>-----BEGIN PGP SIGNATURE-----<BR>Version: GnuPG v1.4.7 (GNU/Linux)<BR>Comment: Using GnuPG with Fedora - <A href="http://enigmail.mozdev.org/"
 target=_blank>http://enigmail.mozdev.org</A><BR><BR>iD8DBQFGUayT6YSQoMYUY94RAqJKAJ9dFJtaRg3fONo7kLOkDezcS/FizwCcDwFj<BR>2McvW5Wl+zudmUZDO2aE1fQ=<BR>=NHOE<BR>-----END PGP SIGNATURE-----<BR><BR>_______________________________________________<BR>linux-lvm mailing list<BR>linux-lvm@redhat.com<BR><A href="https://www.redhat.com/mailman/listinfo/linux-lvm" target=_blank>https://www.redhat.com/mailman/listinfo/linux-lvm</A><BR>read the LVM HOW-TO at <A href="http://tldp.org/HOWTO/LVM-HOWTO/" target=_blank>http://tldp.org/HOWTO/LVM-HOWTO/</A></DIV></DIV>
<DIV style="FONT-SIZE: 12pt; FONT-FAMILY: times new roman, new york, times, serif"><BR></DIV></div><br>

<hr size=1>
Don't get soaked.  Take a<a href="
http://tools.search.yahoo.com/shortcuts/?fr=oni_on_mail&#news"> quick peak at the forecast </a><br> with the<a href="
http://tools.search.yahoo.com/shortcuts/?fr=oni_on_mail&#news">Yahoo! Search weather shortcut.</a></body></html>
--0-487209000-1179760606=:69660--
