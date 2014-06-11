Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s5B7raR4012756
	for <linux-lvm@redhat.com>; Wed, 11 Jun 2014 03:53:36 -0400
Received: from mail.fibbs.org (phineas.fibbs.org [109.234.106.32])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s5B7rXIP007249
	for <linux-lvm@redhat.com>; Wed, 11 Jun 2014 03:53:34 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.fibbs.org (Postfix) with ESMTP id 00565200425
	for <linux-lvm@redhat.com>; Wed, 11 Jun 2014 09:53:31 +0200 (CEST)
Received: from mail.fibbs.org ([127.0.0.1])
	by localhost (mail.fibbs.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id wCjKfOwrb_bv for <linux-lvm@redhat.com>;
	Wed, 11 Jun 2014 09:53:29 +0200 (CEST)
Received: from [192.168.7.105] (p508945E9.dip0.t-ipconnect.de [80.137.69.233])
	(using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(Client did not present a certificate)
	by mail.fibbs.org (Postfix) with ESMTPSA id DE7B7200421
	for <linux-lvm@redhat.com>; Wed, 11 Jun 2014 09:53:28 +0200 (CEST)
Message-ID: <53980AF8.6060303@mglug.de>
Date: Wed, 11 Jun 2014 09:53:28 +0200
From: Oliver Rath <rath@mglug.de>
MIME-Version: 1.0
References: <CAFrGbuXWhQaPBGhc60oaE-WP__vrnJ32to-uWkcVZOrX2yBmzA@mail.gmail.com>
In-Reply-To: <CAFrGbuXWhQaPBGhc60oaE-WP__vrnJ32to-uWkcVZOrX2yBmzA@mail.gmail.com>
Content-Type: multipart/alternative;
	boundary="------------050602090105090503090700"
Subject: Re: [linux-lvm] pvs -a on a partition of ZFS block device
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
--------------050602090105090503090700
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Alex,

Im not sure if I understand right: You take a zfv-Volume to create a lvm
volume inside? Make it sense to mix two similar concepts in this way?
Imho zfs and lvm are focussed to different goals, so if you combine it,
you get the worse of both.

What is your goal mixing these concepts? If you have created a
zfs-volume, you can mount it directly without detouring over lvm and
vice versa.

I think it is much better to decide for one of these (zfs-volumes XOR
lvm-Volumes) depending on your needs.

Just my 2ct

Regards
Oliver


Am 10.06.2014 20:44, schrieb alessandro macuz:
> Hi all,
>
> the goal is to mount a LVM volume that is contained in a 8e partition
> of a zvol device.
>
> Since we speak about a production system I stated from the basic and I
> wanted to see if pvs would recognize the partition. No luck.
>
> root@server02:/mnt# pvs -a /dev/zd1168p2
>   Failed to read physical volume "/dev/zd1168p2"
>
> but on the other way on the same system I get 
>
> root@server02:/mnt# pvs -a /dev/sdb2
>   PV         VG         Fmt  Attr PSize   PFree
>   /dev/sdb2  vgserver01 lvm2 a-   464.83g 432.82g
>
> The only difference I can see between the 2 is the major number
>
> root@server02:/mnt# ls -la /dev/zd1168p2
> brw-rw---- 1 root disk 230, 1170 Jun 10 19:56 /dev/zd1168p2
>
> and 
>
> root@server02:/mnt# ls -la /dev/sdb2
> brw-rw---- 1 root disk 8, 18 Feb 11 10:43 /dev/sdb2
>
> Is it an expected behaviour that I pvs doesn't recognize "physical
> device" within ZFS block devices?
>
> Thanks, Alex
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


--------------050602090105090503090700
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">Hi Alex,<br>
      <br>
      Im not sure if I understand right: You take a zfv-Volume to create
      a lvm volume inside? Make it sense to mix two similar concepts in
      this way? Imho zfs and lvm are focussed to different goals, so if
      you combine it, you get the worse of both.<br>
      <br>
      What is your goal mixing these concepts? If you have created a
      zfs-volume, you can mount it directly without detouring over lvm
      and vice versa.<br>
      <br>
      I think it is much better to decide for one of these (zfs-volumes
      XOR lvm-Volumes) depending on your needs. <br>
      <br>
      Just my 2ct<br>
      <br>
      Regards<br>
      Oliver<br>
      <br>
      <br>
      Am 10.06.2014 20:44, schrieb alessandro macuz:<br>
    </div>
    <blockquote
cite="mid:CAFrGbuXWhQaPBGhc60oaE-WP__vrnJ32to-uWkcVZOrX2yBmzA@mail.gmail.com"
      type="cite">
      <div dir="ltr">Hi all,
        <div><br>
        </div>
        <div>the goal is to mount a LVM volume that is contained in a 8e
          partition of a zvol device.</div>
        <div><br>
        </div>
        <div>Since we speak about a production system I stated from the
          basic and I wanted to see if pvs would recognize the
          partition. No luck.</div>
        <div><br>
        </div>
        <div>
          <div>root@server02:/mnt# pvs -a /dev/zd1168p2</div>
          <div>&nbsp; Failed to read physical volume "/dev/zd1168p2"</div>
        </div>
        <div><br>
        </div>
        <div>but on the other way on the same system I get&nbsp;</div>
        <div>
          <br>
        </div>
        <div>
          <div>root@server02:/mnt# pvs -a /dev/sdb2</div>
          <div>&nbsp; PV &nbsp; &nbsp; &nbsp; &nbsp; VG &nbsp; &nbsp; &nbsp; &nbsp; Fmt &nbsp;Attr PSize &nbsp; PFree</div>
          <div>&nbsp; /dev/sdb2 &nbsp;vgserver01 lvm2 a- &nbsp; 464.83g 432.82g</div>
        </div>
        <div><br>
        </div>
        <div>The only difference I can see between the 2 is the major
          number</div>
        <div><br>
        </div>
        <div>
          <div>root@server02:/mnt# ls -la /dev/zd1168p2</div>
          <div>brw-rw---- 1 root disk 230, 1170 Jun 10 19:56
            /dev/zd1168p2</div>
        </div>
        <div><br>
        </div>
        <div>and&nbsp;</div>
        <div><br>
        </div>
        <div>
          <div>root@server02:/mnt# ls -la /dev/sdb2</div>
          <div>brw-rw---- 1 root disk 8, 18 Feb 11 10:43 /dev/sdb2</div>
        </div>
        <div><br>
        </div>
        <div>Is it an expected behaviour that I pvs doesn't recognize
          "physical device" within ZFS block devices?</div>
        <div><br>
        </div>
        <div>Thanks, Alex</div>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
linux-lvm mailing list
<a class="moz-txt-link-abbreviated" href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a>
<a class="moz-txt-link-freetext" href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a>
read the LVM HOW-TO at <a class="moz-txt-link-freetext" href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a></pre>
    </blockquote>
    <br>
  </body>
</html>

--------------050602090105090503090700--
