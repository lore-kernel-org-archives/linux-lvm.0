Received: from [10.15.80.229] (dhcp80-229.msp.redhat.com [10.15.80.229])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id k3PGU0IC022559
	for <linux-lvm@redhat.com>; Tue, 25 Apr 2006 12:30:00 -0400
Mime-Version: 1.0 (Apple Message framework v623)
In-Reply-To: <1cbd6f830604241436r22860bq709e1f496b41490e@mail.gmail.com>
References: <20060405232627.GA437@canterbury.faction42.com>
	<6738c87e4c4c4c50c5117ff7ad60e3d8@redhat.com>
	<1cbd6f830604241436r22860bq709e1f496b41490e@mail.gmail.com>
Content-Type: multipart/alternative; boundary=Apple-Mail-2-171784874
Message-Id: <f09683d3fd351ee27efbb35846856033@redhat.com>
From: Jonathan E Brassow <jbrassow@redhat.com>
Subject: Re: [linux-lvm] lvm2 pv failure
Date: Tue, 25 Apr 2006 11:31:49 -0500
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>


--Apple-Mail-2-171784874
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=ISO-8859-1;
	format=flowed

You could stuff in a new drive and 'dd' the contents of the failed=20
drive to the new drive (if the drive hasn't completely failed) using=20
the "noerror" option.

Now you might be able to (shutdown) pull the bad drive and reboot.

So far, you've risked nothing.  I'd see how this goes before trying=20
other things (like editing the lvm labels directly).

  brassow

On Apr 24, 2006, at 4:36 PM, Mag Gam wrote:

> Jon:
>
> How would you recover this? Just curious....
>
>
> On 4/6/06, Jonathan E Brassow <jbrassow@redhat.com > wrote:All the=20
> logical volumes on the remaining drive should be recoverable.
>> If you striped the two devices, you'll probably be hurting.=A0=A0If =
the=20
>> 1st
>> hard drive is only partially failed (some sectors fail, others =
don't),
>> then you should be able to retrieve most of that data too.
>>
>> =A0=A0brassow
>>
>> On Apr 5, 2006, at 6:26 PM, Uk1ah Sm1th wrote:
>>
>> > Hello-
>> >
>> > I had one of the two drives in my LVM2 array fail. It was the first
>> > drive. Is it possiable that any data on the second drive could be
>> > recovered? Or have I lost all my data on both drives?
>>  >
>> > .Ukiah Smith
>> >
>> > --
>> > "Well done is better than well said."
>> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0- Benjamin Franklin =
(1706-1790)
>> >
>> > _______________________________________________
>>  > linux-lvm mailing list
>> > linux-lvm@redhat.com
>> > https://www.redhat.com/mailman/listinfo/linux-lvm
>>  > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>> >
>>
>> _______________________________________________
>> linux-lvm mailing list
>>  linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/=

--Apple-Mail-2-171784874
Content-Transfer-Encoding: quoted-printable
Content-Type: text/enriched;
	charset=ISO-8859-1

You could stuff in a new drive and 'dd' the contents of the failed
drive to the new drive (if the drive hasn't completely failed) using
the "noerror" option.


Now you might be able to (shutdown) pull the bad drive and reboot.


So far, you've risked nothing.  I'd see how this goes before trying
other things (like editing the lvm labels directly).


 brassow


On Apr 24, 2006, at 4:36 PM, Mag Gam wrote:


<excerpt>Jon:


How would you recover this? Just curious....



On 4/6/06, <bold>Jonathan E Brassow</bold>
<<<color><param>0000,0000,EEEE</param>jbrassow@redhat.com</color> >
wrote:All the logical volumes on the remaining drive should be
recoverable.

<excerpt>If you striped the two devices, you'll probably be
hurting.=A0=A0If the 1st=20

hard drive is only partially failed (some sectors fail, others don't),

then you should be able to retrieve most of that data too.


=A0=A0brassow


On Apr 5, 2006, at 6:26 PM, Uk1ah Sm1th wrote:


> Hello-=20

>

> I had one of the two drives in my LVM2 array fail. It was the first

> drive. Is it possiable that any data on the second drive could be

> recovered? Or have I lost all my data on both drives?

 >

> .Ukiah Smith

>

> --

> "Well done is better than well said."

>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0- Benjamin Franklin =
(1706-1790)

>

> _______________________________________________

 > linux-lvm mailing list

> <color><param>0000,0000,EEEE</param>linux-lvm@redhat.com</color>

>
=
<color><param>0000,0000,EEEE</param>https://www.redhat.com/mailman/listinf=
o/linux-lvm</color>

 > read the LVM HOW-TO at
=
<color><param>0000,0000,EEEE</param>http://tldp.org/HOWTO/LVM-HOWTO/</colo=
r>

>


_______________________________________________

linux-lvm mailing list

<color><param>0000,0000,EEEE</param> linux-lvm@redhat.com</color>

=
<color><param>0000,0000,EEEE</param>https://www.redhat.com/mailman/listinf=
o/linux-lvm</color>

read the LVM HOW-TO at
<color><param>0000,0000,EEEE</param>http://tldp.org/HOWTO/LVM-HOWTO/ =
</color>

</excerpt>_______________________________________________

linux-lvm mailing list

linux-lvm@redhat.com

https://www.redhat.com/mailman/listinfo/linux-lvm

read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/</excerpt>=

--Apple-Mail-2-171784874--
