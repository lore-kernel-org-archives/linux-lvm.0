Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s0KCkbZk009717
	for <linux-lvm@redhat.com>; Mon, 20 Jan 2014 07:46:37 -0500
Received: from e28smtp08.in.ibm.com (e28smtp08.in.ibm.com [122.248.162.8])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s0KCkXqA023827
	for <linux-lvm@redhat.com>; Mon, 20 Jan 2014 07:46:35 -0500
Received: from /spool/local
	by e28smtp08.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <linux-lvm@redhat.com> from <athunugu@linux.vnet.ibm.com>;
	Mon, 20 Jan 2014 18:16:32 +0530
Received: from d28relay01.in.ibm.com (d28relay01.in.ibm.com [9.184.220.58])
	by d28dlp02.in.ibm.com (Postfix) with ESMTP id DED7A394003F
	for <linux-lvm@redhat.com>; Mon, 20 Jan 2014 18:16:29 +0530 (IST)
Received: from d28av03.in.ibm.com (d28av03.in.ibm.com [9.184.220.65])
	by d28relay01.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	s0KCkBYF54788136
	for <linux-lvm@redhat.com>; Mon, 20 Jan 2014 18:16:12 +0530
Received: from d28av03.in.ibm.com (localhost [127.0.0.1])
	by d28av03.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	s0KCkPjU018072
	for <linux-lvm@redhat.com>; Mon, 20 Jan 2014 18:16:25 +0530
Received: from [9.77.211.103] ([9.77.211.103])
	by d28av03.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	s0KCkNNI017917
	for <linux-lvm@redhat.com>; Mon, 20 Jan 2014 18:16:24 +0530
Message-ID: <52DD1AA0.5000304@linux.vnet.ibm.com>
Date: Mon, 20 Jan 2014 18:16:24 +0530
From: ARAVINDA B THUNUGUNTLA <athunugu@linux.vnet.ibm.com>
MIME-Version: 1.0
References: <52D67EC0.3060107@linux.vnet.ibm.com>
	<52D67FF0.7070608@linux.vnet.ibm.com>
In-Reply-To: <52D67FF0.7070608@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
	boundary="------------090001010501010905000709"
Subject: Re: [linux-lvm] Request to spin a new version of LVM2 to support
	ppc64le
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
--------------090001010501010905000709
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

Can you please tell whom to contact for this ?

Thanks in advance,
Aravind

On Wednesday 15 January 2014 06:02 PM, ARAVINDA B THUNUGUNTLA wrote:
> Hi,
>
> I am working on a new architecture - ppc64le (powerpc 64-bit Little 
> Endian) and I am building LVM2 package on our ppc64le environment 
> downloaded from ftp://sources.redhat.com/pub/lvm2/LVM2.2.02.104.tgz
> <www.libssh2.org/download/libssh2-1.4.3.tar.gz>
> I found that LVM2 would require a patch to config.guess [or needs to 
> pick up the latest automake (1.13.4 or above) version] from upstream.
>
> The latest config.guess which has ppc64le patch can be found at :
> http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess;hb=HEAD. 
>
>
> Can you please pick this up and spin a new version which would support 
> ppc64le?
>
> Please let me know if you need any help.
>
> Thanks and Regards,
> Aravind
>


--------------090001010501010905000709
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Hi all,<br>
    <br>
    Can you please tell whom to contact for this ?<br>
    <br>
    Thanks in advance,<br>
    Aravind<br>
    <br>
    <div class="moz-cite-prefix">On Wednesday 15 January 2014 06:02 PM,
      ARAVINDA B THUNUGUNTLA wrote:<br>
    </div>
    <blockquote cite="mid:52D67FF0.7070608@linux.vnet.ibm.com"
      type="cite">
      <meta http-equiv="content-type" content="text/html;
        charset=ISO-8859-1">
      Hi,<br>
      <div class="moz-forward-container"><font face="monospace"> <br>
          I am working on a new architecture - ppc64le (powerpc 64-bit
          Little Endian) and I am building LVM2 package on our ppc64le
          environment downloaded from <a moz-do-not-send="true"
            href="www.libssh2.org/download/libssh2-1.4.3.tar.gz">ftp://sources.redhat.com/pub/lvm2/LVM2.2.02.104.tgz<br>
          </a><br>
          I found that LVM2 would require a patch to config.guess [or
          needs to pick up the latest automake (1.13.4 or above)
          version] from upstream. <br>
          <br>
          The latest config.guess which has ppc64le patch can be found
          at : <br>
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
          Aravind </font> <br>
      </div>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------090001010501010905000709--
