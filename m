Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8KE1iDR012426
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 10:01:44 -0400
Received: from nexredback-216-168-119-94.nexicom.net (mail.fibrespeed.net
	[216.168.105.35] (may be forged))
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with SMTP id
	k8KE1eDC029118
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 10:01:41 -0400
Message-ID: <451149CD.3070804@mikebabcock.ca>
Date: Wed, 20 Sep 2006 10:01:49 -0400
From: "Michael T. Babcock" <mike@mikebabcock.ca>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="=_godzilla2.triplepc.com-302-1158760894-0001-2"
Subject: Re: [linux-lvm] LVM on RAID
References: <1158603016.7182.12.camel@localhost.localdomain>	<450EEEA0.7020703@mdmiller.com>	<1158606792.7182.15.camel@localhost.localdomain>	<1158607438.19905.30.camel@bounty.rider.geekspirit.net>	<1158608077.7182.18.camel@localhost.localdomain>	<1158608557.19905.37.camel@bounty.rider.geekspirit.net>	<1158609135.7182.21.camel@localhost.localdomain>	<1158609477.19905.38.camel@bounty.rider.geekspirit.net>	<Pine.LNX.4.63.0609191650560.1397@zeus.itg.uiuc.edu>
	<1158760524.26653.4.camel@merlin.Mines.EDU>
In-Reply-To: <1158760524.26653.4.camel@merlin.Mines.EDU>
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

--=_godzilla2.triplepc.com-302-1158760894-0001-2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I use LVM2 on software and hardware raid on a regular basis.  Almost 
every server I configure has hardware raid and all the machines I 
support run LVM.  No problems to report.

Matthew B. Brookover wrote:
> I have used LVM on top of software raid and ISCSI.  It works well.  It 
> also helps keep track of what device is where.  ISCSI does not export 
> its targets in the same order, some times sdb shows up as sdc....   
> LVM will keep track of what is what.
>
> On Tue, 2006-09-19 at 16:53 -0500, Alexander Lazarevich wrote:
>> We have several RAID devices (16-24 drive Fiber/SCSI attached RAID) which 
>> are currently single devices on our 64bit linux servers (RHEL-4, core5). 
>> We are considering LVM'ing 2 or more of the RAID's into a LVM group. I 
>> don't doubt the reliability and robustness of LVM2 on single drives, but I 
>> worry about it on top of RAID devices.
>>
>> Does anyone have any experience with LVM on to of RAID volumes, positive 
>> or negative?
>>     


--=_godzilla2.triplepc.com-302-1158760894-0001-2
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content="text/html;charset=UTF-8" http-equiv="Content-Type">
</head>
<body bgcolor="#ffffff" text="#000000">
I use LVM2 on software and hardware raid on a regular basis.  Almost
every server I configure has hardware raid and all the machines I
support run LVM.  No problems to report.<br>
<br>
Matthew B. Brookover wrote:
<blockquote cite="mid1158760524.26653.4.camel@merlin.Mines.EDU"
 type="cite">
  <meta http-equiv="Content-Type" content="text/html; ">
  <meta name="GENERATOR" content="GtkHTML/3.6.2">
I have used LVM on top of software raid and ISCSI.  It works well.  It
also helps keep track of what device is where.  ISCSI does not export
its targets in the same order, some times sdb shows up as sdc....   LVM
will keep track of what is what.<br>
  <br>
On Tue, 2006-09-19 at 16:53 -0500, Alexander Lazarevich wrote:
  <blockquote type="CITE">
    <pre><font color="#000000">We have several RAID devices (16-24 drive Fiber/SCSI attached RAID) which </font>
<font color="#000000">are currently single devices on our 64bit linux servers (RHEL-4, core5). </font>
<font color="#000000">We are considering LVM'ing 2 or more of the RAID's into a LVM group. I </font>
<font color="#000000">don't doubt the reliability and robustness of LVM2 on single drives, but I </font>
<font color="#000000">worry about it on top of RAID devices.</font>

<font color="#000000">Does anyone have any experience with LVM on to of RAID volumes, positive </font>
<font color="#000000">or negative?</font>
    </pre>
  </blockquote>
</blockquote>
<br>
</body>
</html>

--=_godzilla2.triplepc.com-302-1158760894-0001-2--
