Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j4U86AO28241
	for <linux-lvm@redhat.com>; Mon, 30 May 2005 04:06:10 -0400
Received: from mauritiustelecom.com (mail.mauritiustelecom.com [202.123.2.83])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j4U8668J010955
	for <linux-lvm@redhat.com>; Mon, 30 May 2005 04:06:08 -0400
Received: from [202.123.1.2] (account hantzley.tauckoor@telecomplus.net HELO
	[127.0.0.1]) by mauritiustelecom.com (CommuniGate Pro SMTP 4.2)
	with ESMTP id 2817343 for linux-lvm@redhat.com;
	Mon, 30 May 2005 12:07:51 +0400
Message-ID: <429AC95E.2030200@telecomplus.net>
Date: Mon, 30 May 2005 12:05:50 +0400
From: Hantzley Tauckoor <hantzley@telecomplus.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM with Powerpath - incompatibility
References: <4296C82C.6090502@telecomplus.net>
	<20050530095253.24aa8e53@mwdsp001>
In-Reply-To: <20050530095253.24aa8e53@mwdsp001>
Content-Type: multipart/alternative;
	boundary="------------040200000509010801080803"
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

This is a multi-part message in MIME format.
--------------040200000509010801080803
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Thanks mate.

I'll dig into the doc.

Rgds,

Hantzley


Chris Osicki wrote:

>Hi Hantzley
>
>You should read PowerPath Release Notes (P/N 300-001-969) or at least it's page 15 ;-)
>"EMC pseudeo devices are not supported with LVM. Instead, native SCSI devices must be used..."
>
>I think EMC messed up with device names as seeen in /proc/devices under "Block devices" and
>LVM doesn't recognize them. They used to be called emcpower in older versions of PP I think,
>now they are "emcp".
>
>Regards,
>Chris
>
>
>On Fri, 27 May 2005 11:11:40 +0400
>Hantzley Tauckoor <hantzley@telecomplus.net> wrote:
>
>  
>
>>Hi,
>>
>>I have a CX300 Clariion and a x445 IBM (4 processors and 4GB RAM) server 
>>equipped with 2 Emulex FibreChannel cards which are directly connected 
>>to the cx300's controllers.
>>
>>My software config is as follows:
>>
>>Redhat ES 3.0 with Kernel 2.4.21-20.ELsmp
>>PowerPath 4.3.1
>>LPFC 2.4 driver kit 7.2.4-1
>>lvm-1.0.3-15
>>
>>
>>I created 2LUNs on the cx300, and therefore I can see 4 sd devices on 
>>linux (2 on one path and 2 on the other). After installing PowerPath, I 
>>am able to access the LUNs via /dev/emcpowera1 and /dev/emcpowerb1 
>>respectively.
>>
>>But I cannot use LVM on these devices directly. However LVM works with 
>>/dev/sd* devices. I wish to use it with the PowerPath devices instead, 
>>so as to have dynamic multipathing.
>>
>>I also tried to install Veritas Volume Manager; no luck, the eval 
>>version was compiled for kernel.2.4.xx-Hugemem - which is not my present 
>>kernel. I have incompatibility problems because PowerPath 4.3.1 requires 
>>at kernel 2.4.21-15 or 2.4.21-20.
>>
>>Is there someone who had the same type of problem? Any tip on how to 
>>make LVM run with PowerPath devices?
>>
>>Thank you in advance for your replies.
>>
>>Rgds,
>>
>>Hantzley Tauckoor
>>----------------------------------------------------
>>Project Manager
>>Telecom Plus Ltd
>>www.telecomplus.net
>>----------------------------------------------------
>>
>>
>>_______________________________________________
>>linux-lvm mailing list
>>linux-lvm@redhat.com
>>https://www.redhat.com/mailman/listinfo/linux-lvm
>>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>>    
>>
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>  
>


--------------040200000509010801080803
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content="text/html;charset=ISO-8859-1" http-equiv="Content-Type">
  <title></title>
</head>
<body bgcolor="#ffffff" text="#000000">
Thanks mate.<br>
<br>
I'll dig into the doc.<br>
<br>
Rgds,<br>
<br>
Hantzley<br>
<br>
<br>
Chris Osicki wrote:
<blockquote cite="mid20050530095253.24aa8e53@mwdsp001" type="cite">
  <pre wrap="">Hi Hantzley

You should read PowerPath Release Notes (P/N 300-001-969) or at least it's page 15 ;-)
"EMC pseudeo devices are not supported with LVM. Instead, native SCSI devices must be used..."

I think EMC messed up with device names as seeen in /proc/devices under "Block devices" and
LVM doesn't recognize them. They used to be called emcpower in older versions of PP I think,
now they are "emcp".

Regards,
Chris


On Fri, 27 May 2005 11:11:40 +0400
Hantzley Tauckoor <a class="moz-txt-link-rfc2396E" href="mailto:hantzley@telecomplus.net">&lt;hantzley@telecomplus.net&gt;</a> wrote:

  </pre>
  <blockquote type="cite">
    <pre wrap="">Hi,

I have a CX300 Clariion and a x445 IBM (4 processors and 4GB RAM) server 
equipped with 2 Emulex FibreChannel cards which are directly connected 
to the cx300's controllers.

My software config is as follows:

Redhat ES 3.0 with Kernel 2.4.21-20.ELsmp
PowerPath 4.3.1
LPFC 2.4 driver kit 7.2.4-1
lvm-1.0.3-15


I created 2LUNs on the cx300, and therefore I can see 4 sd devices on 
linux (2 on one path and 2 on the other). After installing PowerPath, I 
am able to access the LUNs via /dev/emcpowera1 and /dev/emcpowerb1 
respectively.

But I cannot use LVM on these devices directly. However LVM works with 
/dev/sd* devices. I wish to use it with the PowerPath devices instead, 
so as to have dynamic multipathing.

I also tried to install Veritas Volume Manager; no luck, the eval 
version was compiled for kernel.2.4.xx-Hugemem - which is not my present 
kernel. I have incompatibility problems because PowerPath 4.3.1 requires 
at kernel 2.4.21-15 or 2.4.21-20.

Is there someone who had the same type of problem? Any tip on how to 
make LVM run with PowerPath devices?

Thank you in advance for your replies.

Rgds,

Hantzley Tauckoor
----------------------------------------------------
Project Manager
Telecom Plus Ltd
<a class="moz-txt-link-abbreviated" href="http://www.telecomplus.net">www.telecomplus.net</a>
----------------------------------------------------


_______________________________________________
linux-lvm mailing list
<a class="moz-txt-link-abbreviated" href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a>
<a class="moz-txt-link-freetext" href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a>
read the LVM HOW-TO at <a class="moz-txt-link-freetext" href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a>

    </pre>
  </blockquote>
  <pre wrap=""><!---->
_______________________________________________
linux-lvm mailing list
<a class="moz-txt-link-abbreviated" href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a>
<a class="moz-txt-link-freetext" href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a>
read the LVM HOW-TO at <a class="moz-txt-link-freetext" href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a>

  </pre>
</blockquote>
<br>
</body>
</html>

--------------040200000509010801080803--
