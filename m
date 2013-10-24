Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r9OHaJL0019680
	for <linux-lvm@redhat.com>; Thu, 24 Oct 2013 13:36:19 -0400
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r9OHaFng002756
	for <linux-lvm@redhat.com>; Thu, 24 Oct 2013 13:36:15 -0400
Received: by mail-ea0-f176.google.com with SMTP id q16so1398082ead.35
	for <linux-lvm@redhat.com>; Thu, 24 Oct 2013 10:36:14 -0700 (PDT)
MIME-Version: 1.0
Sender: jinzishuai@gmail.com
In-Reply-To: <5269021B.5040205@redhat.com>
References: <CAFp1kvMoWy8okmvqXOg5uPCUcnRWbr9y_de4JDcCmLRk=6vLnQ@mail.gmail.com>
	<5269021B.5040205@redhat.com>
Date: Thu, 24 Oct 2013 11:30:03 -0600
Message-ID: <CAFp1kvMfpKvfuS1Vp5X6i5vGrEUHip=9WViuqHvzxkiHd+09iA@mail.gmail.com>
From: Shi Jin <sjin@datagardens.com>
Content-Type: multipart/alternative; boundary=001a11c3f75ee98e8904e97ffb25
Subject: Re: [linux-lvm] Unable to convert a broken LVM2 RAID1 to Linear
	volume
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

--001a11c3f75ee98e8904e97ffb25
Content-Type: text/plain; charset=UTF-8

thank you very much.

when i run your command, my machine froze but after reset,  the virtual
volumes undet the raid1 are now showing as regular volumes and i was able
to lvremove them and original volume keeps on working.

thanks a lot

Shi
On 2013-10-24 5:23 AM, "Marian Csontos" <mcsontos@redhat.com> wrote:

> On 10/23/2013 06:50 PM, Shi Jin wrote:
>
>> Hi there,
>>
>> I have setup a LVM2 raid1 mirror with
>>     lvconvert  -m 1 --type raid1 /dev/vg_data/lv_test /dev/sdd
>> and then after I remove one of its legs, the remaining leg keeps on
>> working just fine. However, I then want to convert this to a simple
>> Linux volume.
>>
>> it would fail:
>>
>> [root@shi-rhel63 ~]# lvconvert -m 0 /dev/vg_data/lv_test
>>    Couldn't find device with uuid QpjTRd-Cc0o-RC0y-7Gz8-GQ4u-**
>> 25FM-0vO4xt.
>>    Cannot change VG vg_data while PVs are missing.
>>    Consider vgreduce --removemissing.
>>
>
> Following worked for me except I ended up with unclean FS:
>
>     lvconvert -m 0 --repair -f vg_data/lv_test
>
> -- Marian
>
>
>> removemissing not working either
>>
>> [root@shi-rhel63 ~]# vgreduce  --removemissing vg_data
>>    Couldn't find device with uuid QpjTRd-Cc0o-RC0y-7Gz8-GQ4u-**
>> 25FM-0vO4xt.
>>    WARNING: Partial LV lv_test needs to be repaired or removed.
>>    WARNING: Partial LV lv_test_rmeta_1 needs to be repaired or removed.
>>    WARNING: Partial LV lv_test_rimage_1 needs to be repaired or removed.
>>    There are still partial LVs in VG vg_data.
>>    To remove them unconditionally use: vgreduce --removemissing --force.
>>    Proceeding to remove empty missing PVs.
>>
>> What should I do in my case to convert the LV to linear?
>>
>> My OS information:
>>
>> [root@shi-rhel63 ~]#  cat /etc/redhat-release
>> Red Hat Enterprise Linux Server release 6.3 (Santiago)
>> [root@shi-rhel63 ~]# uname -a
>> Linux shi-rhel63 2.6.32-279.el6.x86_64 #1 SMP Wed Jun 13 18:24:36 EDT
>> 2012 x86_64 x86_64 x86_64 GNU/Linux
>> [root@shi-rhel63 ~]# lvm version
>>    LVM version:     2.02.95(2)-RHEL6 (2012-05-16)
>>    Library version: 1.02.74-RHEL6 (2012-05-16)
>>    Driver version:  4.22.6
>>
>>
>> Thanks a lot.
>>
>> Shi
>>
>> ______________________________**_________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/**mailman/listinfo/linux-lvm<https://www.redhat.com/mailman/listinfo/linux-lvm>
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-**HOWTO/<http://tldp.org/HOWTO/LVM-HOWTO/>
>>
>>
> ______________________________**_________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/**mailman/listinfo/linux-lvm<https://www.redhat.com/mailman/listinfo/linux-lvm>
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-**HOWTO/<http://tldp.org/HOWTO/LVM-HOWTO/>
>

--001a11c3f75ee98e8904e97ffb25
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">thank you very much.</p>
<p dir=3D"ltr">when i run your command, my machine froze but after reset,=
=C2=A0 the virtual volumes undet the raid1 are now showing as regular volum=
es and i was able to lvremove them and original volume keeps on working.</p=
>
<p dir=3D"ltr">thanks a lot </p>
<p dir=3D"ltr">Shi</p>
<div class=3D"gmail_quote">On 2013-10-24 5:23 AM, &quot;Marian Csontos&quot=
; &lt;<a href=3D"mailto:mcsontos@redhat.com">mcsontos@redhat.com</a>&gt; wr=
ote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
On 10/23/2013 06:50 PM, Shi Jin wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Hi there,<br>
<br>
I have setup a LVM2 raid1 mirror with<br>
=C2=A0 =C2=A0 lvconvert =C2=A0-m 1 --type raid1 /dev/vg_data/lv_test /dev/s=
dd<br>
and then after I remove one of its legs, the remaining leg keeps on<br>
working just fine. However, I then want to convert this to a simple<br>
Linux volume.<br>
<br>
it would fail:<br>
<br>
[root@shi-rhel63 ~]# lvconvert -m 0 /dev/vg_data/lv_test<br>
=C2=A0 =C2=A0Couldn&#39;t find device with uuid QpjTRd-Cc0o-RC0y-7Gz8-GQ4u-=
<u></u>25FM-0vO4xt.<br>
=C2=A0 =C2=A0Cannot change VG vg_data while PVs are missing.<br>
=C2=A0 =C2=A0Consider vgreduce --removemissing.<br>
</blockquote>
<br>
Following worked for me except I ended up with unclean FS:<br>
<br>
=C2=A0 =C2=A0 lvconvert -m 0 --repair -f vg_data/lv_test<br>
<br>
-- Marian<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
removemissing not working either<br>
<br>
[root@shi-rhel63 ~]# vgreduce =C2=A0--removemissing vg_data<br>
=C2=A0 =C2=A0Couldn&#39;t find device with uuid QpjTRd-Cc0o-RC0y-7Gz8-GQ4u-=
<u></u>25FM-0vO4xt.<br>
=C2=A0 =C2=A0WARNING: Partial LV lv_test needs to be repaired or removed.<b=
r>
=C2=A0 =C2=A0WARNING: Partial LV lv_test_rmeta_1 needs to be repaired or re=
moved.<br>
=C2=A0 =C2=A0WARNING: Partial LV lv_test_rimage_1 needs to be repaired or r=
emoved.<br>
=C2=A0 =C2=A0There are still partial LVs in VG vg_data.<br>
=C2=A0 =C2=A0To remove them unconditionally use: vgreduce --removemissing -=
-force.<br>
=C2=A0 =C2=A0Proceeding to remove empty missing PVs.<br>
<br>
What should I do in my case to convert the LV to linear?<br>
<br>
My OS information:<br>
<br>
[root@shi-rhel63 ~]# =C2=A0cat /etc/redhat-release<br>
Red Hat Enterprise Linux Server release 6.3 (Santiago)<br>
[root@shi-rhel63 ~]# uname -a<br>
Linux shi-rhel63 2.6.32-279.el6.x86_64 #1 SMP Wed Jun 13 18:24:36 EDT<br>
2012 x86_64 x86_64 x86_64 GNU/Linux<br>
[root@shi-rhel63 ~]# lvm version<br>
=C2=A0 =C2=A0LVM version: =C2=A0 =C2=A0 2.02.95(2)-RHEL6 (2012-05-16)<br>
=C2=A0 =C2=A0Library version: 1.02.74-RHEL6 (2012-05-16)<br>
=C2=A0 =C2=A0Driver version: =C2=A04.22.6<br>
<br>
<br>
Thanks a lot.<br>
<br>
Shi<br>
<br>
______________________________<u></u>_________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/<u></u>mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-<u></u>HOWTO/</a><br>
<br>
</blockquote>
<br>
______________________________<u></u>_________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/<u></u>mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-<u></u>HOWTO/</a><br>
</blockquote></div>

--001a11c3f75ee98e8904e97ffb25--
