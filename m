Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v26Aus7a008365
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Mon, 6 Mar 2017 05:56:55 -0500
Received: from nm29-vm1.bullet.mail.ir2.yahoo.com
	(nm29-vm1.bullet.mail.ir2.yahoo.com [212.82.97.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1F3FB83F3F
	for <linux-lvm@redhat.com>; Mon,  6 Mar 2017 10:56:53 +0000 (UTC)
References: <87a0048c-d443-bbda-5b27-ab7332278061@yahoo.co.uk>
	<483e1a7a-45c8-6a03-af3e-d54ecb8b3945@redhat.com>
From: lejeczek <peljasz@yahoo.co.uk>
Message-ID: <e8a18733-6531-a785-4f43-614b5fb3c5af@yahoo.co.uk>
Date: Mon, 6 Mar 2017 10:56:49 +0000
MIME-Version: 1.0
In-Reply-To: <483e1a7a-45c8-6a03-af3e-d54ecb8b3945@redhat.com>
Content-Type: multipart/alternative;
	boundary="------------68B2FE34FA9654DE0F6EBCCF"
Subject: Re: [linux-lvm] lvextend does not change/fix stripes & stripesize
 for the whole LV?
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
--------------68B2FE34FA9654DE0F6EBCCF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 06/03/17 09:47, Zdenek Kabelac wrote:
> Dne 4.3.2017 v 14:58 lejeczek napsal(a):
>> right?
>> Or it does?
>> From man pages my understanding is - it does not, an 
>> expression "the
>> extension" is used there.
>>
>> If I have a LV with 2 stripes and 64KiB stripesizes, then 
>> adding two more
>> stripes, like this:
>>
>> $ lvextend h300Int1/0 -i 2 -I 16 /dev/sd3 /dev/sd4 (if it 
>> was to succeed)
>>
>> will change the LV into 4 stripes LV, but what would 
>> happened to stripesize(s)?
>>
>
> Hi
>
> At this moment lvm2 supports extension only of the same 
> types.
> So extended/added segment will have some 'geometry' as the 
> last/previous segment of your extended LV.
>
> So if you do not add any 'striping' parameters - they will 
> be automatically detected from LV, if you add them - they 
> will be compared and in case of mismatch operation will be 
> rejected.
>
> Also if the allocation policy and free space in VG allows 
> - extension will try first to extend existing segment 
> before allocating new space somewhere else in VG.
>
> Regards
>
> Zdenek
>
many! thanks
may I share a comment - inasmuch as man pages for lvm are 
really good, there are places where some bits are missing.
Take LVEXTEND, it speaks of --alloc but does not elaborate 
on it at all.
Also says:
--use-policies              Resizes the logical volume 
according to configured policy.  See  lvm.conf
But I failed to find it there in lvm.conf.

Would be great to have man pages completed with these 
missing bits. It's rhel 7.3, lvm2-2.02.166-1.el7_3.2.x86_64

Ca I also ask you - reason I'm hoping I could downsize the 
stripesize is for I understand that with higher number of 
stripes stripesize could shrink so data(smaller files) would 
go to more(all?) stripes(increasing transfers speeds, phy 
devs are all SSDs in my case). Is my logic false here?

And if it is not, would then creating a second LV(the same 
VG) with different(smaller) stripesize, then moving data 
over there, then removing the first LV and finally extending 
that "second" LV be a good, a correct way?

b.w.
L

> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


--------------68B2FE34FA9654DE0F6EBCCF
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    <br>
    <div class="moz-cite-prefix">On 06/03/17 09:47, Zdenek Kabelac
      wrote:<br>
    </div>
    <blockquote
      cite="mid:483e1a7a-45c8-6a03-af3e-d54ecb8b3945@redhat.com"
      type="cite">Dne 4.3.2017 v 14:58 lejeczek napsal(a):
      <br>
      <blockquote type="cite">right?
        <br>
        Or it does?
        <br>
        From man pages my understanding is - it does not, an expression
        "the
        <br>
        extension" is used there.
        <br>
        <br>
        If I have a LV with 2 stripes and 64KiB stripesizes, then adding
        two more
        <br>
        stripes, like this:
        <br>
        <br>
        $ lvextend h300Int1/0 -i 2 -I 16 /dev/sd3 /dev/sd4 (if it was to
        succeed)
        <br>
        <br>
        will change the LV into 4 stripes LV, but what would happened to
        stripesize(s)?
        <br>
        <br>
      </blockquote>
      <br>
      Hi
      <br>
      <br>
      At this moment lvm2 supports extension only of the same types.
      <br>
      So extended/added segment will have some 'geometry' as the
      last/previous segment of your extended LV.
      <br>
      <br>
      So if you do not add any 'striping' parameters - they will be
      automatically detected from LV, if you add them - they will be
      compared and in case of mismatch operation will be rejected.
      <br>
      <br>
      Also if the allocation policy and free space in VG allows -
      extension will try first to extend existing segment before
      allocating new space somewhere else in VG.
      <br>
      <br>
      Regards
      <br>
      <br>
      Zdenek
      <br>
      <br>
    </blockquote>
    many! thanks<br>
    may I share a comment - inasmuch as man pages for lvm are really
    good, there are places where some bits are missing.<br>
    Take LVEXTEND, it speaks of --alloc but does not elaborate on it at
    all.<br>
    Also says:<br>
    --use-policies              Resizes the logical volume according to
    configured policy.  See  lvm.conf<br>
    But I failed to find it there in lvm.conf.<br>
    <br>
    Would be great to have man pages completed with these missing bits.
    It's rhel 7.3, lvm2-2.02.166-1.el7_3.2.x86_64<br>
    <br>
    Ca I also ask you - reason I'm hoping I could downsize the
    stripesize is for I understand that with higher number of stripes
    stripesize could shrink so data(smaller files) would go to
    more(all?) stripes(increasing transfers speeds, phy devs are all
    SSDs in my case). Is my logic false here?<br>
    <br>
    And if it is not, would then creating a second LV(the same VG) with
    different(smaller) stripesize, then moving data over there, then
    removing the first LV and finally extending that "second" LV be a
    good, a correct way?<br>
    <br>
    b.w.<br>
    L<br>
    <br>
    <blockquote
      cite="mid:483e1a7a-45c8-6a03-af3e-d54ecb8b3945@redhat.com"
      type="cite">_______________________________________________
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

--------------68B2FE34FA9654DE0F6EBCCF--
