Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E5C79969E
	for <linux-lvm@redhat.com>; Mon, 10 Apr 2017 11:16:22 +0000 (UTC)
Received: from nm29-vm7.bullet.mail.ir2.yahoo.com
	(nm29-vm7.bullet.mail.ir2.yahoo.com [212.82.97.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 555C2624CD
	for <linux-lvm@redhat.com>; Mon, 10 Apr 2017 11:16:20 +0000 (UTC)
References: <2048a92a-0505-78c3-da00-8bf2043f4cbf@yahoo.co.uk>
	<38e06f2a-5af9-6469-ec2c-5bde2c1b199b@gmail.com>
From: lejeczek <peljasz@yahoo.co.uk>
Message-ID: <3e790d03-8da8-13c4-d1d3-e1f5f7b3c6f9@yahoo.co.uk>
Date: Mon, 10 Apr 2017 12:16:18 +0100
MIME-Version: 1.0
In-Reply-To: <38e06f2a-5af9-6469-ec2c-5bde2c1b199b@gmail.com>
Content-Type: multipart/alternative;
	boundary="------------92848A768EB7A8496D7113B7"
Subject: Re: [linux-lvm] stripped LV with segments vs one segment
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
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>, LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.
--------------92848A768EB7A8496D7113B7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/04/17 12:03, Zdenek Kabelac wrote:
> Dne 10.4.2017 v 11:29 lejeczek napsal(a):
>> hi there
>>
>> I could not extend my stripped LV, had 3 stripes and 
>> wanted to add one more.
>> Only way LVM let me do it was where I ended up with this:
>>
>>   --- Segments ---
>>   Logical extents 0 to 751169:
>>     Type        striped
>>     Stripes        3
>>     Stripe size        16.00 KiB
>>     Stripe 0:
>>       Physical volume    /dev/sdd
>>       Physical extents    0 to 250389
>>     Stripe 1:
>>       Physical volume    /dev/sde
>>       Physical extents    0 to 250389
>>     Stripe 2:
>>       Physical volume    /dev/sdc
>>       Physical extents    0 to 250389
>>
>>   Logical extents 751170 to 1001559:
>>     Type        linear
>>     Physical volume    /dev/sdf
>>     Physical extents    0 to 250389
>>
>> 1st question - was this really the only way LVM would 
>> extend?
>> 2nd - is there performance penalty with segments like 
>> above vs one stripped
>> segment?
>>
>
> Hi
>
>
> Not really sure what you aim to do.
>
> If you have LV segment with 3 stripes - you have to keep 
> also extension using 3 stripes -  you can't  have 1st. 
> halve of LV spanning 3 disk and add there a new LV segment 
> as linear - as listed in this post.
>
> Both segments must by striped.
>
> Regards
>
> Zdenek

I had 3 stripe LV, you know, three PVs, and wanted the LV to 
have 4 stripes, wanted to add 4th PV, you can see it from 
above lvdisplay.
I tried these and each time it errored:
$ lvextend -v -i 4 -l+100%free dellH200.InternalB/0
$ lvextend -v -i 4 -l+100%pv dellH200.InternalB/0 /dev/sdf
$ lvextend -i 4 -l 100%vg dellH200.InternalB/0

I did have only one segment, an LV spanning 100%vg with 
100%each-pv.
And the above is the result of: $ lvextend -i 1 -l +100%free 
dellH200.InternalB/0 /dev/sdf

so, either I'm not getting it right or a stripped LV cannot 
be extended this way - then: is there performance penalty 
with segments like above vs one stripped
segment?




--------------92848A768EB7A8496D7113B7
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    <br>
    <div class="moz-cite-prefix">On 10/04/17 12:03, Zdenek Kabelac
      wrote:<br>
    </div>
    <blockquote
      cite="mid:38e06f2a-5af9-6469-ec2c-5bde2c1b199b@gmail.com"
      type="cite">Dne 10.4.2017 v 11:29 lejeczek napsal(a):
      <br>
      <blockquote type="cite">hi there
        <br>
        <br>
        I could not extend my stripped LV, had 3 stripes and wanted to
        add one more.
        <br>
        Only way LVM let me do it was where I ended up with this:
        <br>
        <br>
          --- Segments ---
        <br>
          Logical extents 0 to 751169:
        <br>
            Type        striped
        <br>
            Stripes        3
        <br>
            Stripe size        16.00 KiB
        <br>
            Stripe 0:
        <br>
              Physical volume    /dev/sdd
        <br>
              Physical extents    0 to 250389
        <br>
            Stripe 1:
        <br>
              Physical volume    /dev/sde
        <br>
              Physical extents    0 to 250389
        <br>
            Stripe 2:
        <br>
              Physical volume    /dev/sdc
        <br>
              Physical extents    0 to 250389
        <br>
        <br>
          Logical extents 751170 to 1001559:
        <br>
            Type        linear
        <br>
            Physical volume    /dev/sdf
        <br>
            Physical extents    0 to 250389
        <br>
        <br>
        1st question - was this really the only way LVM would extend?
        <br>
        2nd - is there performance penalty with segments like above vs
        one stripped
        <br>
        segment?
        <br>
        <br>
      </blockquote>
      <br>
      Hi
      <br>
      <br>
      <br>
      Not really sure what you aim to do.
      <br>
      <br>
      If you have LV segment with 3 stripes - you have to keep also
      extension using 3 stripes -  you can't  have 1st. halve of LV
      spanning 3 disk and add there a new LV segment as linear - as
      listed in this post.
      <br>
      <br>
      Both segments must by striped.
      <br>
      <br>
      Regards
      <br>
      <br>
      Zdenek
      <br>
    </blockquote>
    <br>
    I had 3 stripe LV, you know, three PVs, and wanted the LV to have 4
    stripes, wanted to add 4th PV, you can see it from above lvdisplay.<br>
    I tried these and each time it errored:<br>
    $ lvextend -v -i 4 -l+100%free dellH200.InternalB/0<br>
    $ lvextend -v -i 4 -l+100%pv dellH200.InternalB/0 /dev/sdf<br>
    $ lvextend -i 4 -l 100%vg dellH200.InternalB/0<br>
    <br>
    I did have only one segment, an LV spanning 100%vg with 100%each-pv.<br>
    And the above is the result of: $ lvextend -i 1 -l +100%free
    dellH200.InternalB/0 /dev/sdf<br>
    <br>
    so, either I'm not getting it right or a stripped LV cannot be
    extended this way - then: is there performance penalty with segments
    like above vs one stripped
    <br>
    segment?<br>
    <br>
    <br>
    <br>
  </body>
</html>

--------------92848A768EB7A8496D7113B7--
