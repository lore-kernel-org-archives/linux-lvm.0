Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l4LG2kZK023968
	for <linux-lvm@redhat.com>; Mon, 21 May 2007 12:02:46 -0400
Received: from web38202.mail.mud.yahoo.com (web38202.mail.mud.yahoo.com
	[209.191.124.145])
	by mx1.redhat.com (8.13.1/8.13.1) with SMTP id l4LG2b6O009281
	for <linux-lvm@redhat.com>; Mon, 21 May 2007 12:02:37 -0400
Date: Mon, 21 May 2007 09:02:31 -0700 (PDT)
From: Sean McGlynn <sean_mcglynn@yahoo.com>
Subject: Re: [linux-lvm] Disk /dev/dm-0 doesn't contain a valid partition table
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1944293628-1179763351=:67769"
Message-ID: <395121.67769.qm@web38202.mail.mud.yahoo.com>
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

--0-1944293628-1179763351=:67769
Content-Type: text/plain; charset=ascii

I see.  I thought it was physical disks.  Yes, I have four logical volumes.

Thank you again for all your help.


----- Original Message ----
From: Bryn M. Reeves <breeves@redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Sent: Monday, May 21, 2007 11:44:39 AM
Subject: Re: [linux-lvm] Disk /dev/dm-0 doesn't contain a valid partition table


-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Sean McGlynn wrote:
> Bryn,
>  
> Thank you for taking the time to reply.
>  
> I'm glad to see this is not an issue. 
>  
> As for "dev253," if I only have three physical devices, why four dm entries?
>  
> Thanks again.
> 

The "dev253" entries are the logical volumes (or other device-mapper
devices), not the physical devices themselves.

I see you have three PVs in the volume group (sda1, sdb2 & sdc1), but
how many LVs do you have in your volume group?

Just post the output of the "lvs" command if you're unsure.

Kind regards,
Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFGUb5n6YSQoMYUY94RAomyAKDAbKh46jVdf/rnfjPrx8deodF4tQCZAWJj
aBE96ivGnSiu1/X1lNX4QIM=
=Tvod
-----END PGP SIGNATURE-----

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


 
____________________________________________________________________________________
Get your own web address.  
Have a HUGE year through Yahoo! Small Business.
http://smallbusiness.yahoo.com/domains/?p=BESTDEAL
--0-1944293628-1179763351=:67769
Content-Type: text/html; charset=ascii

<html><head><style type="text/css"><!-- DIV {margin:0px;} --></style></head><body><div style="font-family:times new roman, new york, times, serif;font-size:12pt"><DIV style="FONT-SIZE: 12pt; FONT-FAMILY: times new roman, new york, times, serif">I see.&nbsp; I thought it was physical disks.&nbsp; Yes, I have four logical volumes.</DIV>
<DIV style="FONT-SIZE: 12pt; FONT-FAMILY: times new roman, new york, times, serif">&nbsp;</DIV>
<DIV style="FONT-SIZE: 12pt; FONT-FAMILY: times new roman, new york, times, serif">Thank you again for all your help.<BR><BR></DIV>
<DIV style="FONT-SIZE: 12pt; FONT-FAMILY: times new roman, new york, times, serif">----- Original Message ----<BR>From: Bryn M. Reeves &lt;breeves@redhat.com&gt;<BR>To: LVM general discussion and development &lt;linux-lvm@redhat.com&gt;<BR>Sent: Monday, May 21, 2007 11:44:39 AM<BR>Subject: Re: [linux-lvm] Disk /dev/dm-0 doesn't contain a valid partition table<BR><BR>
<DIV>-----BEGIN PGP SIGNED MESSAGE-----<BR>Hash: SHA1<BR><BR>Sean McGlynn wrote:<BR>&gt; Bryn,<BR>&gt;&nbsp;&nbsp;<BR>&gt; Thank you for taking the time to reply.<BR>&gt;&nbsp;&nbsp;<BR>&gt; I'm glad to see this is not an issue. <BR>&gt;&nbsp;&nbsp;<BR>&gt; As for "dev253," if I only have three physical devices, why four dm entries?<BR>&gt;&nbsp;&nbsp;<BR>&gt; Thanks again.<BR>&gt; <BR><BR>The "dev253" entries are the logical volumes (or other device-mapper<BR>devices), not the physical devices themselves.<BR><BR>I see you have three PVs in the volume group (sda1, sdb2 &amp; sdc1), but<BR>how many LVs do you have in your volume group?<BR><BR>Just post the output of the "lvs" command if you're unsure.<BR><BR>Kind regards,<BR>Bryn.<BR><BR>-----BEGIN PGP SIGNATURE-----<BR>Version: GnuPG v1.4.7 (GNU/Linux)<BR>Comment: Using GnuPG with Fedora - <A href="http://enigmail.mozdev.org/"
 target=_blank>http://enigmail.mozdev.org</A><BR><BR>iD8DBQFGUb5n6YSQoMYUY94RAomyAKDAbKh46jVdf/rnfjPrx8deodF4tQCZAWJj<BR>aBE96ivGnSiu1/X1lNX4QIM=<BR>=Tvod<BR>-----END PGP SIGNATURE-----<BR><BR>_______________________________________________<BR>linux-lvm mailing list<BR>linux-lvm@redhat.com<BR><A href="https://www.redhat.com/mailman/listinfo/linux-lvm" target=_blank>https://www.redhat.com/mailman/listinfo/linux-lvm</A><BR>read the LVM HOW-TO at <A href="http://tldp.org/HOWTO/LVM-HOWTO/" target=_blank>http://tldp.org/HOWTO/LVM-HOWTO/</A></DIV></DIV>
<DIV style="FONT-SIZE: 12pt; FONT-FAMILY: times new roman, new york, times, serif"><BR></DIV></div><br>

<hr size=1>Expecting? Get great news right away with <a href="http://us.rd.yahoo.com/evt=49982/*http://advision.webevents.yahoo.com/mailbeta/newmail_tools.html">email Auto-Check.</a><br>Try the <a href="http://us.rd.yahoo.com/evt=49982/*http://advision.webevents.yahoo.com/mailbeta/newmail_tools.html">Yahoo! Mail Beta.</a></body></html>
--0-1944293628-1179763351=:67769--
