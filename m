Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BAC0945D1
	for <linux-lvm@redhat.com>; Tue, 18 Aug 2020 14:02:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E8958EE625
	for <linux-lvm@redhat.com>; Tue, 18 Aug 2020 14:02:39 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id j10so9529785qvo.13
	for <linux-lvm@redhat.com>; Tue, 18 Aug 2020 07:02:33 -0700 (PDT)
MIME-Version: 1.0
References: <d077323c-fd76-8ebf-ea2d-db8ba7b876b0.ref@yahoo.co.uk>
	<d077323c-fd76-8ebf-ea2d-db8ba7b876b0@yahoo.co.uk>
	<eff09b4d-89c1-b8c9-5ea7-0a47af5f5d6e@redhat.com>
In-Reply-To: <eff09b4d-89c1-b8c9-5ea7-0a47af5f5d6e@redhat.com>
From: Christopher Jacoby <cjacoby75@gmail.com>
Date: Tue, 18 Aug 2020 07:02:20 -0700
Message-ID: <CANo1Oj30vp4RBFOEo8Z4zKcfW0o++uQQYUpt3RdOa+RFZNNFKQ@mail.gmail.com>
Content-Type: multipart/alternative; boundary="000000000000a0158705ad27565d"
Subject: Re: [linux-lvm] extend raid5 - how if possible?
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

--000000000000a0158705ad27565d
Content-Type: text/plain; charset="UTF-8"

Unsubscribe

On Tue, Aug 18, 2020, 12:28 AM Heinz Mauelshagen <heinzm@redhat.com> wrote:

> On 8/15/20 10:57 AM, lejeczek wrote:
>
> Hi guys
>
> In hope that experts roam this list I want to ask if it is
> possible to extend raid5.
> If I wanted to be specific, raid created this way:
>
> $ lvcreate -n raid5.1 -l 100%pv --stripes 5 --stripe-size 8
> ST2000_front.0 /dev/sdj /dev/sdk /dev/sdn /dev/sdo /dev/sdp
> /dev/sdq
>
> You can see I try to be specific about hard disks here. I
> hope that later I can add more of exact same hard disk to
> the system and extend such raid5.
>
>
> As you consumed all capacity on those disks, you either got the option to
> extend using lvextend (though you don't need the same disk sizes but you'd
> need 6 more disks to be able to extend all the given raid5 stripes using
> lvextend)  -or-  you can lvconvert adding stripes to your given raid5 which
> will also grow the RaidLV size by the added stripe capacities.   In that
> later case of adding stripes, you'd have to deploy N additional disks (N =
> number of stripes to add) of the same or larger size than the ones you got.
>
> Mind, you could also convert to e.g. raid6 in case your resilience
> requirements change which'll require another disk to store parity blocks.
>
> Heinz
>
>
>
> many thanks, L.
>
>
> _______________________________________________
> linux-lvm mailing listlinux-lvm@redhat.comhttps://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--000000000000a0158705ad27565d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Unsubscribe</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Aug 18, 2020, 12:28 AM Heinz Mauelsha=
gen &lt;<a href=3D"mailto:heinzm@redhat.com">heinzm@redhat.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div>
    <div>On 8/15/20 10:57 AM, lejeczek wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <pre>Hi guys

In hope that experts roam this list I want to ask if it is
possible to extend raid5.
If I wanted to be specific, raid created this way:

$ lvcreate -n raid5.1 -l 100%pv --stripes 5 --stripe-size 8
ST2000_front.0 /dev/sdj /dev/sdk /dev/sdn /dev/sdo /dev/sdp
/dev/sdq

You can see I try to be specific about hard disks here. I
hope that later I can add more of exact same hard disk to
the system and extend such raid5.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>As you consumed all capacity on those disks, you either got the
      option to extend using lvextend (though you don&#39;t need the same
      disk sizes but you&#39;d need 6 more disks to be able to extend all
      the given raid5 stripes using lvextend)=C2=A0 -or-=C2=A0 you can lvco=
nvert
      adding stripes to your given raid5 which will also grow the RaidLV
      size by the added stripe capacities. =C2=A0 In that later case of
      adding stripes, you&#39;d have to deploy N additional disks (N =3D
      number of stripes to add) of the same or larger size than the ones
      you got. <br>
    </p>
    <p>Mind, you could also convert to e.g. raid6 in case your
      resilience requirements change which&#39;ll require another disk to
      store parity blocks.<br>
    </p>
    <p>Heinz<br>
    </p>
    <blockquote type=3D"cite">
      <pre>

many thanks, L.
</pre>
      <br>
      <fieldset></fieldset>
      <pre>_______________________________________________
linux-lvm mailing list
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank" rel=3D"noreferrer=
">linux-lvm@redhat.com</a>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank" rel=3D"noreferrer">https://www.redhat.com/mailman/listinfo/linux-lvm</=
a>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank" rel=3D"noreferrer">http://tldp.org/HOWTO/LVM-HOWTO/</a></pre>
    </blockquote>
    <br>
  </div>

_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank" rel=3D"noreferrer=
">linux-lvm@redhat.com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">https://www.redhat.com/mailman/listinfo/=
linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" rel=3D"=
noreferrer noreferrer" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</=
a></blockquote></div>

--000000000000a0158705ad27565d--
