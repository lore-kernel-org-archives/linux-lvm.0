Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBMBgp131631
	for <linux-lvm@redhat.com>; Thu, 22 Dec 2005 06:42:51 -0500
Received: from web36215.mail.mud.yahoo.com (web36215.mail.mud.yahoo.com
	[209.191.68.241])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id jBMBgjTJ027853
	for <linux-lvm@redhat.com>; Thu, 22 Dec 2005 06:42:45 -0500
Message-ID: <20051222114239.22962.qmail@web36215.mail.mud.yahoo.com>
Date: Thu, 22 Dec 2005 03:42:39 -0800 (PST)
From: Hale India <hale_india@yahoo.com>
Subject: Re: [linux-lvm] Recovery of data in LVM from a corrupt disk
In-Reply-To: <20051222112654.GM10278@strugglers.net>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-2084642595-1135251759=:85844"
Content-Transfer-Encoding: 8bit
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

--0-2084642595-1135251759=:85844
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

Hi Andy :
 
 Disks was not broken. Mother board was.
 
 I don't remember any hints.
 
 If you can give me how to proceed when you need to move your hardisks to another machine when you use LVM it would be very usefull for me and probably for other people facing a machine failure(Other than hardisk failure).
 If you can point mle to any LVM documentation capable to help in a such situation it can also help me.
 
 Best regards.
 
 Andre Legendre

Andy Smith <andy@strugglers.net> wrote: On Thu, Dec 22, 2005 at 03:09:43AM -0800, Hale India wrote:
>    If you can describe how to proceed when you need to move your hardisks
>    to another machine (In my case the cause when hardware failure of
>    mother board) and when boot disk doesnot accept to boot on the new
>    machine (in my case it was fedora 4 and probably some difference of
>    hardware.

I already did give you some hints and so did Alasdair Kergon.  It
should just work, your other problem being that you have the disks in
a machine that already has a VG named the same as the one you want
to find on the disk(s) you put in.

Like I said, depending on how broken the disk is (and it sounds like
it is since it no longer boots, but you didn't specify what messages
it gives exactly so we have no idea if that is hardware, bootloader,
kernel or what) you may not be able to recover anything.  Which is
really no different from the situation you'd be in with a
filesystem.

>    If you can give to us some guideline it would probably save some
>    situations.
>    If you can point us to documentation in LVM project usefull for such
>    case it would even be better.

Try the LVM2 HOWTO (google)
_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


--0-2084642595-1135251759=:85844
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

<div id="RTEContent">Hi Andy :<br> <br> Disks was not broken. Mother board was.<br> <br> I don't remember any hints.<br> <br> If you can give me how to proceed when you need to move your hardisks to another machine when you use LVM it would be very usefull for me and probably for other people facing a machine failure(Other than hardisk failure).<br> If you can point mle to any LVM documentation capable to help in a such situation it can also help me.<br> <br> Best regards.<br> <br> Andre Legendre<br><br><b><i>Andy Smith &lt;andy@strugglers.net&gt;</i></b> wrote:<blockquote class="replbq" style="border-left: 2px solid rgb(16, 16, 255); margin-left: 5px; padding-left: 5px;"> On Thu, Dec 22, 2005 at 03:09:43AM -0800, Hale India wrote:<br>&gt;    If you can describe how to proceed when you need to move your hardisks<br>&gt;    to another machine (In my case the cause when hardware failure of<br>&gt;    mother board) and when boot disk doesnot accept to boot on the new<br>&gt;   !
 machine
 (in my case it was fedora 4 and probably some difference of<br>&gt;    hardware.<br><br>I already did give you some hints and so did Alasdair Kergon.  It<br>should just work, your other problem being that you have the disks in<br>a machine that already has a VG named the same as the one you want<br>to find on the disk(s) you put in.<br><br>Like I said, depending on how broken the disk is (and it sounds like<br>it is since it no longer boots, but you didn't specify what messages<br>it gives exactly so we have no idea if that is hardware, bootloader,<br>kernel or what) you may not be able to recover anything.  Which is<br>really no different from the situation you'd be in with a<br>filesystem.<br><br>&gt;    If you can give to us some guideline it would probably save some<br>&gt;    situations.<br>&gt;    If you can point us to documentation in LVM project usefull for such<br>&gt;    case it would even be better.<br><br>Try the LVM2 HOWTO
 (google)<br>_______________________________________________<br>linux-lvm mailing list<br>linux-lvm@redhat.com<br>https://www.redhat.com/mailman/listinfo/linux-lvm<br>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/</blockquote><br></div>
--0-2084642595-1135251759=:85844--
