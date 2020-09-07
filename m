Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F05EA2166B28
	for <linux-lvm@redhat.com>; Mon,  7 Sep 2020 14:14:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96B28856DEC
	for <linux-lvm@redhat.com>; Mon,  7 Sep 2020 14:14:25 +0000 (UTC)
References: <CACrcyfJBtsVFwf8wFjDAc1sOKPiOVBJjKbDC3c+3G-z6v5SCpA@mail.gmail.com>
	<0B002628-0740-4DA4-A9BD-320A743A7A30@gmail.com>
	<alpine.LRH.2.02.2009070907110.5779@file01.intranet.prod.int.rdu2.redhat.com>
From: =?UTF-8?Q?Dalebj=c3=b6rk=2c_Tomas?= <tomas.dalebjork@gmail.com>
Message-ID: <30564577-1c0a-7405-f70e-81614b62dec0@gmail.com>
Date: Mon, 7 Sep 2020 16:14:16 +0200
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.2009070907110.5779@file01.intranet.prod.int.rdu2.redhat.com>
Content-Type: multipart/alternative;
	boundary="------------E6D7F23649AEFE52F024FDA6"
Content-Language: sv
Subject: Re: [linux-lvm] exposing snapshot block device
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
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>

This is a multi-part message in MIME format.
--------------E6D7F23649AEFE52F024FDA6
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

Hi Mikulas,

Thanks for the replies

I am confused now with the last message?

LVM doesn't support taking existing cow device and attaching it to an 
existing volume?

Isn't that what "lvconvert --splitsnapshot" & "lvconvert -s" is ment to 
be doing?

lets say that I create the snapshot on a different device using these steps:

root@src# lvcreate -s -L 10GB -n lvsnap vg/lv /dev/sdh
root@src# lvconvert ---splitsnapshot vg/lvsnap
root@src# echo "I now move /dev/sdb to another server"
root@tgt# lvconvert -s newvg/newlv vg/lvsnap


Regards Tomas

Den 2020-09-07 kl. 15:09, skrev Mikulas Patocka:
>
> On Fri, 4 Sep 2020, Tomas Dalebjörk wrote:
>
>> hi
>> I tried to perform as suggested
>> # lvconvert —splitsnapshot vg/lv-snap
>> works fine
>> # lvconvert -s vg/lv vg/lv-snap
>> works fine too
>>
>> but...
>> if I try to converting cow data directly from the meta device, than it doesn’t work
>> eg
>> # lvconvert -s vg/lv /dev/mycowdev
>> the tool doesn’t like the path
>> I tried to place a link in /dev/vg/mycowdev -> /dev/mycowdev
>> and retried the operations
>> # lvconveet -s vg/lv /dev/vg/mycowdev
>> but this doesn’t work either
>>
>> conclusion  even though the cow device is an exact copy of the cow
>> device that I have saved on /dev/mycowdev before the split, it wouldn’t
>> work to use to convert back as a lvm snapshot
>>
>> not sure if I understand the tool correctly, or if there are other
>> things needed to perform, such as creating virtual information about the
>> lvm VGDA data on the first of this virtual volume named /dev/mycowdev
> AFAIK LVM doesn't support taking existing cow device and attaching it to
> an existing volume. When you create a snapshot, you start with am empty
> cow.
>
> Mikulas
>
>> let me know what more steps are needed
>>
>> beat regards Tomas
>>
>> Sent from my iPhone
>>
>>        On 7 Nov 2019, at 18:29, Tomas Dalebjörk <tomas.dalebjork@gmail.com> wrote:
>>
>>        ﻿Great, thanks!
>>
>> Den tors 7 nov. 2019 kl 17:54 skrev Mikulas Patocka <mpatocka@redhat.com>:
>>
>>
>>        On Tue, 5 Nov 2019, Tomas Dalebjörk wrote:
>>
>>        > Thanks,
>>        >
>>        > That really helped me to understand how the snapshot works.
>>        > Last question:
>>        > - lets say that block 100 which is 1MB in size is in the cow device, and a write happen that wants to something or all data on that region of block
>>        100.
>>        > Than I assume; based on what have been previously said here, that the block in the cow device will be overwritten with the new changes.
>>
>>        Yes, the block in the cow device will be overwritten.
>>
>>        Mikulas
>>
>>        > Regards Tomas
>>
>>

--------------E6D7F23649AEFE52F024FDA6
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Mikulas,</p>
    <p>Thanks for the replies<br>
    </p>
    <p>I am confused now with the last message?</p>
    <p>LVM doesn't support taking existing cow device and attaching it
      to an existing volume?</p>
    <p>Isn't that what "lvconvert --splitsnapshot" &amp; "lvconvert -s"
      is ment to be doing?</p>
    <p>lets say that I create the snapshot on a different device using
      these steps:</p>
    <font face="Courier New, Courier, monospace">root@src# lvcreate -s
      -L 10GB -n lvsnap vg/lv /dev/sdh<br>
      root@src# lvconvert ---splitsnapshot vg/lvsnap<br>
      root@src# echo "I now move /dev/sdb to another server"<br>
      root@tgt# lvconvert -s newvg/newlv vg/lvsnap</font>
    <p><br>
    </p>
    <p>Regards Tomas<br>
    </p>
    <div class="moz-cite-prefix">Den 2020-09-07 kl. 15:09, skrev Mikulas
      Patocka:<br>
    </div>
    <blockquote type="cite"
cite="mid:alpine.LRH.2.02.2009070907110.5779@file01.intranet.prod.int.rdu2.redhat.com">
      <pre class="moz-quote-pre" wrap="">

On Fri, 4 Sep 2020, Tomas Dalebjörk wrote:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">hi
I tried to perform as suggested
# lvconvert —splitsnapshot vg/lv-snap
works fine
# lvconvert -s vg/lv vg/lv-snap
works fine too

but...
if I try to converting cow data directly from the meta device, than it doesn’t work
eg
# lvconvert -s vg/lv /dev/mycowdev
the tool doesn’t like the path
I tried to place a link in /dev/vg/mycowdev -&gt; /dev/mycowdev
and retried the operations 
# lvconveet -s vg/lv /dev/vg/mycowdev
but this doesn’t work either

conclusion  even though the cow device is an exact copy of the cow 
device that I have saved on /dev/mycowdev before the split, it wouldn’t 
work to use to convert back as a lvm snapshot 

not sure if I understand the tool correctly, or if there are other 
things needed to perform, such as creating virtual information about the 
lvm VGDA data on the first of this virtual volume named /dev/mycowdev 
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
AFAIK LVM doesn't support taking existing cow device and attaching it to 
an existing volume. When you create a snapshot, you start with am empty 
cow.

Mikulas

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">let me know what more steps are needed

beat regards Tomas

Sent from my iPhone

      On 7 Nov 2019, at 18:29, Tomas Dalebjörk <a class="moz-txt-link-rfc2396E" href="mailto:tomas.dalebjork@gmail.com">&lt;tomas.dalebjork@gmail.com&gt;</a> wrote:

      ﻿Great, thanks!

Den tors 7 nov. 2019 kl 17:54 skrev Mikulas Patocka <a class="moz-txt-link-rfc2396E" href="mailto:mpatocka@redhat.com">&lt;mpatocka@redhat.com&gt;</a>:


      On Tue, 5 Nov 2019, Tomas Dalebjörk wrote:

      &gt; Thanks,
      &gt;
      &gt; That really helped me to understand how the snapshot works.
      &gt; Last question:
      &gt; - lets say that block 100 which is 1MB in size is in the cow device, and a write happen that wants to something or all data on that region of block
      100.
      &gt; Than I assume; based on what have been previously said here, that the block in the cow device will be overwritten with the new changes.

      Yes, the block in the cow device will be overwritten.

      Mikulas

      &gt; Regards Tomas


</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------E6D7F23649AEFE52F024FDA6--
