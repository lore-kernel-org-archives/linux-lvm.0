Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r2SIMRvU019809
	for <linux-lvm@redhat.com>; Thu, 28 Mar 2013 14:22:27 -0400
Received: from mail.bmsi.com (mail.bmsi.com [68.106.146.44])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r2SIMPa7026892
	for <linux-lvm@redhat.com>; Thu, 28 Mar 2013 14:22:25 -0400
Received: from sdg.bmsi.com (sdg.bmsi.com [192.168.9.34] (may be forged))
	(authenticated bits=0)
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id r2SIML3R003889
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 28 Mar 2013 14:22:22 -0400
Message-ID: <51548A5B.2040202@bmsi.com>
Date: Thu, 28 Mar 2013 14:22:19 -0400
From: Stuart D Gathman <stuart@bmsi.com>
MIME-Version: 1.0
References: <FAAB9C9B-FCA0-43CB-8B2C-F4F389941AAE@me.com>
	<533CFD97-2715-4B1C-A8C5-02161911747D@googlemail.com>
	<51509ECB.4050901@bmsi.com>
	<244E0086-C561-4034-BF26-31DFC419B72F@googlemail.com>
	<5150B555.4010207@bmsi.com>
	<0FEAF33E-7395-4820-9732-AFE70D3B5877@googlemail.com>
	<5150C1F8.8090107@bmsi.com>
	<CA+iDeo3Z80XNNzW4v9jwp4VuCi+L18RADtAi5WVcRXD68E8k3g@mail.gmail.com>
	<515351B4.8080804@bmsi.com>
	<A2373632-423B-435E-96D3-C52E46D19116@googlemail.com>
In-Reply-To: <A2373632-423B-435E-96D3-C52E46D19116@googlemail.com>
Content-Type: multipart/alternative;
	boundary="------------010204060401030303090200"
Subject: Re: [linux-lvm] vg disappeared after replacing disc in raid10
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
--------------010204060401030303090200
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable

On 03/27/2013 07:39 PM, Bj=EF=BF=BDrn Nadrowski expounded in part:
> I recovered my data.
> Thanks for all your help.
> The problem was in fact knoppix, but not because it had an older=20
> version of lvm2 or even lvm1.
>
> The problem was that the human-readable part I extracted from the=20
> beginning of the device contained invisible characters in front of the
> 'vol0' label in the file 'volt.txt' .
> These characters were not visible in terminal using 'cat', 'more', and=20
> they also did not appear in standard error as a consequence of the=20
> 'vgcfgrestore' command, as witnessed by the first line of the error:
>
And we owe some pizzas/beers/rawjuicedrinks to the LVM designer who=20
insisted on human readable metadata.  It has been invaluable in many=20
data recovery scenarios.

--------------010204060401030303090200
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 03/27/2013 07:39 PM, Bj&ouml;rn Nadrowski
      expounded in part:<br>
    </div>
    <blockquote
      cite="mid:A2373632-423B-435E-96D3-C52E46D19116@googlemail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html;
        charset=ISO-8859-1">
      I recovered my data.&nbsp;
      <div>Thanks for all your help.&nbsp;</div>
      <div>The problem was in fact knoppix, but not because it had an
        older version of lvm2 or even lvm1.</div>
      <div><br>
      </div>
      <div>The problem was that the human-readable part I extracted from
        the beginning of the device contained invisible characters in
        front of the&nbsp;</div>
      <div>'vol0' label in the file 'volt.txt' .</div>
      <div>These characters were not visible in terminal using 'cat',
        'more', and they also did not appear in standard error as a
        consequence of the 'vgcfgrestore' command, as witnessed by the
        first line of the error:</div>
      <br>
    </blockquote>
    And we owe some pizzas/beers/rawjuicedrinks to the LVM designer who
    insisted on human readable metadata.&nbsp; It has been invaluable in many
    data recovery scenarios.<br>
  </body>
</html>

--------------010204060401030303090200--
