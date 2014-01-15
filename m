Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s0FCRsOT005605
	for <linux-lvm@redhat.com>; Wed, 15 Jan 2014 07:27:54 -0500
Received: from e28smtp06.in.ibm.com (e28smtp06.in.ibm.com [122.248.162.6])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s0FCRofK022274
	for <linux-lvm@redhat.com>; Wed, 15 Jan 2014 07:27:52 -0500
Received: from /spool/local
	by e28smtp06.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <linux-lvm@redhat.com> from <athunugu@linux.vnet.ibm.com>;
	Wed, 15 Jan 2014 17:57:50 +0530
Received: from d28relay05.in.ibm.com (d28relay05.in.ibm.com [9.184.220.62])
	by d28dlp02.in.ibm.com (Postfix) with ESMTP id A1AA2394005B
	for <linux-lvm@redhat.com>; Wed, 15 Jan 2014 17:57:47 +0530 (IST)
Received: from d28av01.in.ibm.com (d28av01.in.ibm.com [9.184.220.63])
	by d28relay05.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	s0FCRkLA4850158
	for <linux-lvm@redhat.com>; Wed, 15 Jan 2014 17:57:47 +0530
Received: from d28av01.in.ibm.com (localhost [127.0.0.1])
	by d28av01.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	s0FCRkAp025319
	for <linux-lvm@redhat.com>; Wed, 15 Jan 2014 17:57:46 +0530
Received: from [9.79.195.185] ([9.79.195.185])
	by d28av01.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	s0FCRjfJ025280
	for <linux-lvm@redhat.com>; Wed, 15 Jan 2014 17:57:46 +0530
Message-ID: <52D67EC0.3060107@linux.vnet.ibm.com>
Date: Wed, 15 Jan 2014 17:57:44 +0530
From: ARAVINDA B THUNUGUNTLA <athunugu@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="------------080903050507040609000000"
Subject: [linux-lvm] Request to spin a new version of LVM2 to support ppc64le
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.
--------------080903050507040609000000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I am working on a new architecture - ppc64le (powerpc 64-bit Little 
Endian) and I am building LVM2 package on our ppc64le environment 
downloaded from ftp://sources.redhat.com/pub/lvm2/LVM2.2.02.104.tgz
<www.libssh2.org/download/libssh2-1.4.3.tar.gz>
I found that LVM2 would require a patch to config.guess [or needs to 
pick up the latest automake (1.13.4 or above) version] from upstream.

The latest config.guess which has ppc64le patch can be found at :
http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess;hb=HEAD. 


Can you please pick this up and spin a new version which would support 
ppc64le?

Please let me know if you need any help.

Thanks and Regards,
Aravind

--------------080903050507040609000000
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <font face="monospace">Hi,<br>
      <br>
      I am working on a new architecture - ppc64le (powerpc 64-bit
      Little Endian) and I am building LVM2 package on our ppc64le
      environment downloaded from <a moz-do-not-send="true"
        href="www.libssh2.org/download/libssh2-1.4.3.tar.gz">ftp://sources.redhat.com/pub/lvm2/LVM2.2.02.104.tgz<br>
      </a><br>
      I found that LVM2 would require a patch to config.guess [or needs
      to pick up the latest automake (1.13.4 or above) version] from
      upstream. <br>
      <br>
      The latest config.guess which has ppc64le patch can be found at :
      <br>
      <a moz-do-not-send="true" class="moz-txt-link-freetext"
href="http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess;hb=HEAD">http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess;hb=HEAD</a>.
      <br>
      <br>
      Can you please pick this up and spin a new version which would
      support ppc64le? <br>
      <br>
      Please let me know if you need any help.<br>
      <br>
      Thanks and Regards, <br>
      Aravind </font>
  </body>
</html>

--------------080903050507040609000000--
