Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iA1G1nr20563
	for <linux-lvm@redhat.com>; Mon, 1 Nov 2004 11:01:49 -0500
Received: from nexredback-216-168-119-94.nexicom.net
	(nexredback-216-168-119-94.nexicom.net [216.168.119.94])
	by mx3.redhat.com (8.12.11/8.12.11) with SMTP id iA1G1hnm009600
	for <linux-lvm@redhat.com>; Mon, 1 Nov 2004 11:01:43 -0500
Message-ID: <41865DE3.6040409@mikebabcock.ca>
Date: Mon, 01 Nov 2004 11:01:39 -0500
From: "Michael T. Babcock" <mike@mikebabcock.ca>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="=_godzilla2.triplepc.com-7161-1099324898-0001-2"
Subject: Re: [linux-lvm] Re: Software raid on top of lvm logical volume
References: <41801ADE.6030308@monjoin.net>
	<20041028011738.GD13737@kluge.net>	<41808B37.40406@monjoin.net>	<20041028063530.GA13279@percy.comedia.it>
	<n6t752-uf2.ln1@triangulo.it.uc3m.es>
In-Reply-To: <n6t752-uf2.ln1@triangulo.it.uc3m.es>
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

This is a MIME-formatted message.  If you see this text it means that your
E-mail software does not support MIME-formatted messages.

--=_godzilla2.triplepc.com-7161-1099324898-0001-2
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Peter T. Breuer wrote:

>>i do not believe you would have any advantage in stacking md above lvm
>>anyway.
>>    
>>
>
>That is right. In fact it sounds downright risky to me.
>  
>

I've actually considered a few times how one might be able to merge the 
md functionality into LVM2 (device-mapper) for having software-RAID part 
of the logical volume system (since a software-RAID partition is a 
logical volume of another type anyway).

It would require some significant effort, but it seems doable.
-- 
Michael T. Babcock
http://mikebabcock.ca

--=_godzilla2.triplepc.com-7161-1099324898-0001-2
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content="text/html;charset=ISO-8859-1" http-equiv="Content-Type">
  <title></title>
</head>
<body bgcolor="#ffffff" text="#000000">
Peter T. Breuer wrote:<br>
<blockquote cite="midn6t752-uf2.ln1@triangulo.it.uc3m.es" type="cite">
  <blockquote type="cite">
    <pre wrap="">i do not believe you would have any advantage in stacking md above lvm
anyway.
    </pre>
  </blockquote>
  <pre wrap=""><!---->
That is right. In fact it sounds downright risky to me.
  </pre>
</blockquote>
<br>
I've actually considered a few times how one might be able to merge the
md functionality into LVM2 (device-mapper) for having software-RAID
part of the logical volume system (since a software-RAID partition is a
logical volume of another type anyway).<br>
<br>
It would require some significant effort, but it seems doable.<br>
-- <br>
Michael T. Babcock<br>
<a class="moz-txt-link-freetext" href="http://mikebabcock.ca">http://mikebabcock.ca</a><br>
</body>
</html>

--=_godzilla2.triplepc.com-7161-1099324898-0001-2--
