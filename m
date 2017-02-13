Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1DECMoo002333
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 13 Feb 2017 09:12:22 -0500
Received: from nm10-vm9.bullet.mail.ir2.yahoo.com
	(nm10-vm9.bullet.mail.ir2.yahoo.com [212.82.96.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5DA0283F46
	for <linux-lvm@redhat.com>; Mon, 13 Feb 2017 14:12:21 +0000 (UTC)
References: <bd71a2a1-9519-662b-f7a3-bd9d40049930@yahoo.co.uk>
	<36a67e3b-fea9-ae9c-a128-89fe6c1783de@whgl.uni-frankfurt.de>
From: lejeczek <peljasz@yahoo.co.uk>
Message-ID: <151019ed-8121-93e8-7dd5-0f2c8c95f7a8@yahoo.co.uk>
Date: Mon, 13 Feb 2017 14:12:18 +0000
MIME-Version: 1.0
In-Reply-To: <36a67e3b-fea9-ae9c-a128-89fe6c1783de@whgl.uni-frankfurt.de>
Content-Type: multipart/alternative;
	boundary="------------13F23EA9B9FF7E715D385358"
Subject: Re: [linux-lvm] discard with luks and the FS itself
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
To: LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.
--------------13F23EA9B9FF7E715D385358
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 13/02/17 13:08, Sven Eschenberg wrote:
> Depends on your storage stack configuration, but the 
> answer is mostly yes:

yes to - Does one have to flag mounts with discard for both 
crypttab and fstab in
order for TRIM to be in effect?
?
if the hole stack - then also lvm.conf?

thanks
L

> cryptsetup has discard disabled by default, for very good 
> reasons.
> filesystems vary, so you'd have to check on your 
> particular filesystem documentation.
>
> That's probably why you cannot find the ultimate answer - 
> there's none.
>
> Regards
>
> -Sven
>
>
> Am 13.02.2017 um 12:59 schrieb lejeczek:
>> hi everyone
>>
>> I realize question does not pertain LVM directly but 
>> knowing that on the
>> list wonder around some very crypt-savvy  guys&gals I 
>> thought I'd ask:
>>
>> Does one have to flag mounts with discard for both 
>> crypttab and fstab in
>> order for TRIM to be in effect?
>> Or just one? Just crypttab?
>>
>> I've searched but failed to find an ultimate answer.
>> b.w.
>> L.
>>
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


--------------13F23EA9B9FF7E715D385358
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    <br>
    <div class="moz-cite-prefix">On 13/02/17 13:08, Sven Eschenberg
      wrote:<br>
    </div>
    <blockquote
      cite="mid:36a67e3b-fea9-ae9c-a128-89fe6c1783de@whgl.uni-frankfurt.de"
      type="cite">Depends on your storage stack configuration, but the
      answer is mostly yes:<br>
    </blockquote>
    <br>
    yes to - Does one have to flag mounts with discard for both crypttab
    and fstab in<br>
    order for TRIM to be in effect?<br>
    ?<br>
    if the hole stack - then also lvm.conf?<br>
    <br>
    thanks<br>
    L<br>
    <br>
    <blockquote
      cite="mid:36a67e3b-fea9-ae9c-a128-89fe6c1783de@whgl.uni-frankfurt.de"
      type="cite">cryptsetup has discard disabled by default, for very
      good reasons.
      <br>
      filesystems vary, so you'd have to check on your particular
      filesystem documentation.
      <br>
      <br>
      That's probably why you cannot find the ultimate answer - there's
      none.
      <br>
      <br>
      Regards
      <br>
      <br>
      -Sven
      <br>
      <br>
      <br>
      Am 13.02.2017 um 12:59 schrieb lejeczek:
      <br>
      <blockquote type="cite">hi everyone
        <br>
        <br>
        I realize question does not pertain LVM directly but knowing
        that on the
        <br>
        list wonder around some very crypt-savvy  guys&amp;gals I
        thought I'd ask:
        <br>
        <br>
        Does one have to flag mounts with discard for both crypttab and
        fstab in
        <br>
        order for TRIM to be in effect?
        <br>
        Or just one? Just crypttab?
        <br>
        <br>
        I've searched but failed to find an ultimate answer.
        <br>
        b.w.
        <br>
        L.
        <br>
        <br>
        <br>
        _______________________________________________
        <br>
        linux-lvm mailing list
        <br>
        <a class="moz-txt-link-abbreviated" href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a>
        <br>
        <a class="moz-txt-link-freetext" href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a>
        <br>
        read the LVM HOW-TO at <a class="moz-txt-link-freetext" href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a>
        <br>
        <br>
      </blockquote>
      <br>
      _______________________________________________
      <br>
      linux-lvm mailing list
      <br>
      <a class="moz-txt-link-abbreviated" href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a>
      <br>
      <a class="moz-txt-link-freetext" href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a>
      <br>
      read the LVM HOW-TO at <a class="moz-txt-link-freetext" href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------13F23EA9B9FF7E715D385358--
