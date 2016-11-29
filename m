Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uATASaNX001314
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 29 Nov 2016 05:28:36 -0500
Received: from mail.topit.si (mail.topit.si [91.250.118.231])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4471B4E040
	for <linux-lvm@redhat.com>; Tue, 29 Nov 2016 10:28:34 +0000 (UTC)
Received: from tomazb-desktop.topit.ng (BSN-61-68-33.static.siol.net
	[86.61.68.33]) by mail.topit.si (Postfix) with ESMTPSA id 378BC3D11
	for <linux-lvm@redhat.com>; Tue, 29 Nov 2016 11:28:32 +0100 (CET)
References: <59a4ab68-65cc-5205-65c6-6cd7ea41f582@topit.si>
From: Tomaz Beltram <tomaz.beltram@topit.si>
Message-ID: <77c42b07-5af7-a297-4562-cb4fcd9642c0@topit.si>
Date: Tue, 29 Nov 2016 11:28:31 +0100
MIME-Version: 1.0
In-Reply-To: <59a4ab68-65cc-5205-65c6-6cd7ea41f582@topit.si>
Content-Type: multipart/alternative;
	boundary="------------C1D4D45468B91F31BF518137"
Subject: Re: [linux-lvm] deadlock during lvm snapshot
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
--------------C1D4D45468B91F31BF518137
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 29. 11. 2016 09:38, Zdenek Kabelac wrote:
>
> Please switch to newer version of lvm2.
>
> Sequence with snapshot activation had been reworked to minimize
> possibility to hit this kernel race - race is still there even with
> the latest kernel, but in the real world you should not have a much chance to hit it.
Thanks for the explanation. I reported this to Ubuntu launchpad. Please
add your votes.

https://bugs.launchpad.net/ubuntu/+source/lvm2/+bug/1645636

--------------C1D4D45468B91F31BF518137
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    On 29. 11. 2016 09:38, Zdenek Kabelac wrote:<br>
    <blockquote cite="mid:59a4ab68-65cc-5205-65c6-6cd7ea41f582@topit.si"
      type="cite">
      <meta http-equiv="content-type" content="text/html; charset=utf-8">
      <p> </p>
      <div class="moz-text-plain" wrap="true" graphical-quote="true"
        style="font-family: -moz-fixed; font-size: 12px;"
        lang="x-unicode">
        <pre wrap="">Please switch to newer version of lvm2.

<tt>Sequence with  snapshot activation had been reworked to minimize possibility 
</tt><tt>to hit this kernel race - race is still there even with the latest kernel,
</tt>but in the real world you should not have a much chance to hit it.
</pre>
      </div>
    </blockquote>
    Thanks for the explanation. I reported this to Ubuntu launchpad.
    Please add your votes.<br>
    <br>
    <a class="moz-txt-link-freetext" href="https://bugs.launchpad.net/ubuntu/+source/lvm2/+bug/1645636">https://bugs.launchpad.net/ubuntu/+source/lvm2/+bug/1645636</a><br>
  </body>
</html>

--------------C1D4D45468B91F31BF518137--
