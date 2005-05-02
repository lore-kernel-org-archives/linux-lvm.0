Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j42CwwO08863
	for <linux-lvm@redhat.com>; Mon, 2 May 2005 08:58:58 -0400
Received: from nexredback-216-168-119-94.nexicom.net
	(nexredback-216-168-119-94.nexicom.net [216.168.119.94])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id j42Cwu4n019307
	for <linux-lvm@redhat.com>; Mon, 2 May 2005 08:58:57 -0400
Message-ID: <42762406.9010000@mikebabcock.ca>
Date: Mon, 02 May 2005 08:58:46 -0400
From: "Michael T. Babcock" <mike@mikebabcock.ca>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="=_godzilla2.triplepc.com-5428-1115038727-0001-2"
Subject: Re: [linux-lvm] swap on LVM
References: <4270E3C4.1090408@nextra.ro> <4270ED4E.8090500@mikebabcock.ca>
	<20050430154315.GB806@bobby.schwinge.homeip.net>
In-Reply-To: <20050430154315.GB806@bobby.schwinge.homeip.net>
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

This is a MIME-formatted message.  If you see this text it means that your
E-mail software does not support MIME-formatted messages.

--=_godzilla2.triplepc.com-5428-1115038727-0001-2
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Thomas Schwinge wrote:

>>I've had crashes directly attributable to Swap on LVM both LVM1 and LVM2.
>>    
>>
>
>I can't confirm that, as I've been using swap partitions on LVs on
>several systems with both LVM1 and LVM2 for some years without problems.
>
>  
>

Everything seemed to be working fine on those servers -- except that 
once every few months, the customer would call and complain that the 
machine had "locked up" without reason.  Usually it was when they'd been 
doing something memory intensive.

In each case, moving swap onto its own partition or into a file on a 
non-LVM partition fixed the problem.
-- 
Michael T. Babcock

--=_godzilla2.triplepc.com-5428-1115038727-0001-2
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content="text/html;charset=ISO-8859-1" http-equiv="Content-Type">
</head>
<body bgcolor="#ffffff" text="#000000">
Thomas Schwinge wrote:
<blockquote cite="mid20050430154315.GB806@bobby.schwinge.homeip.net"
 type="cite">
  <blockquote type="cite">
    <pre wrap="">I've had crashes directly attributable to Swap on LVM both LVM1 and LVM2.
    </pre>
  </blockquote>
  <pre wrap=""><!---->
I can't confirm that, as I've been using swap partitions on LVs on
several systems with both LVM1 and LVM2 for some years without problems.

  </pre>
</blockquote>
<br>
Everything seemed to be working fine on those servers -- except that
once every few months, the customer would call and complain that the
machine had "locked up" without reason.&nbsp; Usually it was when they'd
been doing something memory intensive.<br>
<br>
In each case, moving swap onto its own partition or into a file on a
non-LVM partition fixed the problem.<br>
-- <br>
Michael T. Babcock<br>
</body>
</html>

--=_godzilla2.triplepc.com-5428-1115038727-0001-2--
