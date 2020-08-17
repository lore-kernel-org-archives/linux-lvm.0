References: <d077323c-fd76-8ebf-ea2d-db8ba7b876b0.ref@yahoo.co.uk>
	<d077323c-fd76-8ebf-ea2d-db8ba7b876b0@yahoo.co.uk>
From: Heinz Mauelshagen <heinzm@redhat.com>
Message-ID: <eff09b4d-89c1-b8c9-5ea7-0a47af5f5d6e@redhat.com>
Date: Mon, 17 Aug 2020 13:29:35 +0200
MIME-Version: 1.0
In-Reply-To: <d077323c-fd76-8ebf-ea2d-db8ba7b876b0@yahoo.co.uk>
Content-Type: multipart/alternative;
	boundary="------------A424B2E3355B08C193445884"
Content-Language: en-US
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
To: LVM general discussion and development <linux-lvm@redhat.com>, lejeczek <peljasz@yahoo.co.uk>

This is a multi-part message in MIME format.
--------------A424B2E3355B08C193445884
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

On 8/15/20 10:57 AM, lejeczek wrote:
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


As you consumed all capacity on those disks, you either got the option 
to extend using lvextend (though you don't need the same disk sizes but 
you'd need 6 more disks to be able to extend all the given raid5 stripes 
using lvextend)  -or-  you can lvconvert adding stripes to your given 
raid5 which will also grow the RaidLV size by the added stripe 
capacities.   In that later case of adding stripes, you'd have to deploy 
N additional disks (N = number of stripes to add) of the same or larger 
size than the ones you got.

Mind, you could also convert to e.g. raid6 in case your resilience 
requirements change which'll require another disk to store parity blocks.

Heinz

>
> many thanks, L.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


--------------A424B2E3355B08C193445884
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 8/15/20 10:57 AM, lejeczek wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:d077323c-fd76-8ebf-ea2d-db8ba7b876b0@yahoo.co.uk">
      <pre class="moz-quote-pre" wrap="">Hi guys

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
      option to extend using lvextend (though you don't need the same
      disk sizes but you'd need 6 more disks to be able to extend all
      the given raid5 stripes using lvextend)  -or-  you can lvconvert
      adding stripes to your given raid5 which will also grow the RaidLV
      size by the added stripe capacities.   In that later case of
      adding stripes, you'd have to deploy N additional disks (N =
      number of stripes to add) of the same or larger size than the ones
      you got. <br>
    </p>
    <p>Mind, you could also convert to e.g. raid6 in case your
      resilience requirements change which'll require another disk to
      store parity blocks.<br>
    </p>
    <p>Heinz<br>
    </p>
    <blockquote type="cite"
      cite="mid:d077323c-fd76-8ebf-ea2d-db8ba7b876b0@yahoo.co.uk">
      <pre class="moz-quote-pre" wrap="">

many thanks, L.
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">_______________________________________________
linux-lvm mailing list
<a class="moz-txt-link-abbreviated" href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a>
<a class="moz-txt-link-freetext" href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a>
read the LVM HOW-TO at <a class="moz-txt-link-freetext" href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a></pre>
    </blockquote>
    <br>
  </body>
</html>

--------------A424B2E3355B08C193445884--
