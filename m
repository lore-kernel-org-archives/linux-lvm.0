Received: from [10.10.49.113] (vpn-49-113.rdu2.redhat.com [10.10.49.113])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s6BNFDdp006022
	for <linux-lvm@redhat.com>; Fri, 11 Jul 2014 19:15:14 -0400
Message-ID: <53C07001.2090700@redhat.com>
Date: Fri, 11 Jul 2014 19:15:13 -0400
From: Jack Waterworth <jack@redhat.com>
MIME-Version: 1.0
References: <CAAWpFTHEnzeC_K5WGwbUjaw8JE54AF8NAbfnQkHF0k=PysS=rw@mail.gmail.com>	<53BD71DA.7000801@redhat.com>
	<CAAWpFTFehTVd2J7vq6w2Yo266fsh2anGGosv8PruBBbhmmQNdw@mail.gmail.com>
In-Reply-To: <CAAWpFTFehTVd2J7vq6w2Yo266fsh2anGGosv8PruBBbhmmQNdw@mail.gmail.com>
Content-Type: multipart/alternative;
	boundary="------------020202060100030203090400"
Subject: Re: [linux-lvm] lvm2 conf on boot disk
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
--------------020202060100030203090400
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

The rebuild of the ramdisk should use the 'mkinitrd' command:

     # mkinitrd /boot/initrd-<version>.img <version>

grub install would be either 'grub' or 'grub-install'.

     # grub-install /dev/sda

If you have an active Red Hat subscription both procedures should be 
documented on the customer portal.

   Jack Waterworth, RHCE
   Senior Technical Support Engineer
   Red Hat Global Support Services
   919.610.2024 -- jack@redhat.com

On 07/11/2014 08:54 AM, Alfredo De Luca wrote:
> Hi Jack.
> Thanks for that. I did pretty much what you said but not sure how to
> re-create the initrd then install the grub.
> Do you have a specific procedure?
> I followed the procedure in attachment but it's slightly different
> from what I am looking for.
>
>
> On Thu, Jul 10, 2014 at 2:46 AM, Jack Waterworth <jack@redhat.com> wrote:
>> There is no way to do an in-place convert from a partitioned device to LVM
>> without losing data. I would recommend adding a new disk, reinstall the OS
>> on the new disk with LVM, and then moving over any data that was required
>> after installation.
>>
>> You may be able to do this in rescue mode within a chrooted environment, but
>> things could get messy. Add the new device, build the lvm stack, copy over
>> the data then chroot into the NEW lvm root. Mount everything appropriately,
>> recreate the initrd and re-install grub onto the new disk.  Go in with the
>> expectation that you may be fixing things after the reboot from rescue mode.
>>
>>    Jack Waterworth, RHCE
>>    Senior Technical Support Engineer
>>    Red Hat Global Support Services
>>    919.610.2024 -- jack@redhat.com
>>
>> On 07/08/2014 05:56 AM, Alfredo De Luca wrote:
>>> Hi all.
>>> I have red hat 5.7 with no lvm2 installed. Now I want to configure
>>> lvm2 on the root and swap partition then later on adding a couple of
>>> LUNs to create a VG
>>> What's the best practice/procedure to install lvm2 on the boot disk?
>>> Is it possible? I guess I have to run Linux CD in rescue mode
>>>
>>> Regards
>>>
>>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


--------------020202060100030203090400
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix"><tt>The rebuild of the ramdisk should
        use the 'mkinitrd' command:</tt><tt><br>
      </tt><tt><br>
      </tt><tt>&nbsp;&nbsp;&nbsp; # mkinitrd /boot/initrd-&lt;version&gt;.img
        &lt;version&gt;</tt><tt><br>
      </tt><tt><br>
      </tt><tt>grub install would be either 'grub' or 'grub-install'.</tt><tt><br>
      </tt><tt><br>
      </tt><tt>&nbsp;&nbsp;&nbsp; # grub-install /dev/sda<br>
        <br>
        If you have an active Red Hat subscription both procedures
        should be documented on the customer portal.<br>
      </tt>
      <pre class="moz-signature" cols="72">  Jack Waterworth, RHCE
  Senior Technical Support Engineer
  Red Hat Global Support Services
  919.610.2024 -- <a class="moz-txt-link-abbreviated" href="mailto:jack@redhat.com">jack@redhat.com</a></pre>
      On 07/11/2014 08:54 AM, Alfredo De Luca wrote:<br>
    </div>
    <blockquote
cite="mid:CAAWpFTFehTVd2J7vq6w2Yo266fsh2anGGosv8PruBBbhmmQNdw@mail.gmail.com"
      type="cite">
      <pre wrap="">Hi Jack.
Thanks for that. I did pretty much what you said but not sure how to
re-create the initrd then install the grub.
Do you have a specific procedure?
I followed the procedure in attachment but it's slightly different
from what I am looking for.


On Thu, Jul 10, 2014 at 2:46 AM, Jack Waterworth <a class="moz-txt-link-rfc2396E" href="mailto:jack@redhat.com">&lt;jack@redhat.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">There is no way to do an in-place convert from a partitioned device to LVM
without losing data. I would recommend adding a new disk, reinstall the OS
on the new disk with LVM, and then moving over any data that was required
after installation.

You may be able to do this in rescue mode within a chrooted environment, but
things could get messy. Add the new device, build the lvm stack, copy over
the data then chroot into the NEW lvm root. Mount everything appropriately,
recreate the initrd and re-install grub onto the new disk.  Go in with the
expectation that you may be fixing things after the reboot from rescue mode.

  Jack Waterworth, RHCE
  Senior Technical Support Engineer
  Red Hat Global Support Services
  919.610.2024 -- <a class="moz-txt-link-abbreviated" href="mailto:jack@redhat.com">jack@redhat.com</a>

On 07/08/2014 05:56 AM, Alfredo De Luca wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="">
Hi all.
I have red hat 5.7 with no lvm2 installed. Now I want to configure
lvm2 on the root and swap partition then later on adding a couple of
LUNs to create a VG
What's the best practice/procedure to install lvm2 on the boot disk?
Is it possible? I guess I have to run Linux CD in rescue mode

Regards


</pre>
        </blockquote>
        <pre wrap="">
_______________________________________________
linux-lvm mailing list
<a class="moz-txt-link-abbreviated" href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a>
<a class="moz-txt-link-freetext" href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a>
read the LVM HOW-TO at <a class="moz-txt-link-freetext" href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a>
</pre>
      </blockquote>
      <pre wrap="">


</pre>
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

--------------020202060100030203090400--
