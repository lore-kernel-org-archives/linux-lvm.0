Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i82Dqx322689
	for <linux-lvm@redhat.com>; Thu, 2 Sep 2004 09:52:59 -0400
Received: from web60906.mail.yahoo.com (web60906.mail.yahoo.com
	[216.155.196.82])
	by mx3.redhat.com (8.12.11/8.12.10) with SMTP id i82DqrQc005781
	for <linux-lvm@redhat.com>; Thu, 2 Sep 2004 09:52:53 -0400
Message-ID: <20040902135247.13120.qmail@web60906.mail.yahoo.com>
Date: Thu, 2 Sep 2004 06:52:47 -0700 (PDT)
From: abhik das <abhikdas27@yahoo.com>
Subject: Re: [linux-lvm] Fedora core 2 issues
In-Reply-To: <200409020847.05627.stephen@theboulets.net>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-142580161-1094133167=:11484"
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
To: stephen@theboulets.net, LVM general discussion and development <linux-lvm@redhat.com>

--0-142580161-1094133167=:11484
Content-Type: text/plain; charset=us-ascii

Dear Stephen,
        I have faced a similar problem. I hope you cannot assure yourself by "df" command as far as the mounted LVs are concerned. It may also be possible that lvdisplay won't show you the proper size.
Regards,
    Abhik


Stephen Boulet <stephen@theboulets.net> wrote:Does fedora core 2 have issues installing on lvm2 partitions where the 
physical volumes are on extended (not primary) partitions?

I tried and it said that the size of my logical volumes were greater than that 
of the volume group containing it.

'df' showed the correct sizes when these logical volumes were mounted.

-- 

Stephen 

If your desktop gets out of control easily,
you probably have too much stuff on it that
doesn't need to be there.
Donna Smallin, "Unclutter Your Home"
_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


		
---------------------------------
Do you Yahoo!?
Win 1 of 4,000 free domain names from Yahoo! Enter now.
--0-142580161-1094133167=:11484
Content-Type: text/html; charset=us-ascii

<DIV>
<DIV>Dear Stephen,</DIV>
<DIV>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I have faced a similar problem. I hope you cannot assure yourself by "df" command as far as the mounted LVs are concerned. It may also be possible that lvdisplay won't show you the proper size.</DIV>
<DIV>Regards,</DIV>
<DIV>&nbsp;&nbsp;&nbsp; Abhik</DIV><BR><BR><B><I>Stephen Boulet &lt;stephen@theboulets.net&gt;</I></B> wrote:
<BLOCKQUOTE class=replbq style="PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-LEFT: #1010ff 2px solid">Does fedora core 2 have issues installing on lvm2 partitions where the <BR>physical volumes are on extended (not primary) partitions?<BR><BR>I tried and it said that the size of my logical volumes were greater than that <BR>of the volume group containing it.<BR><BR>'df' showed the correct sizes when these logical volumes were mounted.<BR><BR>-- <BR><BR>Stephen <BR><BR>If your desktop gets out of control easily,<BR>you probably have too much stuff on it that<BR>doesn't need to be there.<BR>Donna Smallin, "Unclutter Your Home"<BR>_______________________________________________<BR>linux-lvm mailing list<BR>linux-lvm@redhat.com<BR>https://www.redhat.com/mailman/listinfo/linux-lvm<BR>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/<BR></BLOCKQUOTE></DIV><p>
		<hr size=1>Do you Yahoo!?<br>
Win 1 of 4,000 free domain names from Yahoo! <a
href="http://us.rd.yahoo.com/evt=26640/*http://promotions.yahoo.com/goldrush">Enter now</a>.
--0-142580161-1094133167=:11484--
