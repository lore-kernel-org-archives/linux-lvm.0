Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4VMkhCj014728
	for <linux-lvm@redhat.com>; Wed, 31 May 2006 18:46:43 -0400
Received: from mail.gmx.net (mail.gmx.de [213.165.64.20])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with SMTP id
	k4VMkgNu023266
	for <linux-lvm@redhat.com>; Wed, 31 May 2006 18:46:42 -0400
Date: Thu, 01 Jun 2006 00:39:39 +0200
Subject: Re: [linux-lvm] rescue data after hd crash
References: <optae062jz51dxvh@notebook_chl.intern>
	<20060531124546.GF13142@dragonhold.org>
	<20060531213154.GA2236@redhat.com>
From: chris <cspot@gmx.at>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID: <optafs8dpg51dxvh@notebook_chl.intern>
In-Reply-To: <20060531213154.GA2236@redhat.com>
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
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="iso-8859-1"
To: mauelshagen@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>

Thanks Heinz,

this looks like what i was serching for. still, it didn't work out.

the first call of this command issued (apart from multiple "couln't find =20
device..")
"device-mapper ioctl cmd 9 failed: Das Argument ist ung=EF=BF=BDltig"
  (i hate german error messages, who invented this? it says "illegal =20
argument")

but also "1 logic voliume(s) .. now active".

lvscan says "Volume group ... not found"
mount fails.

what should i try next?

regards, Chris

PS: about the stripes, I don't think I have any.

On Wed, 31 May 2006 23:31:54 +0200, Heinz Mauelshagen =20
<mauelshagen@redhat.com> wrote:

>
> vgchange -ay --partial
>
> On Wed, May 31, 2006 at 01:45:46PM +0100, Graham Wood wrote:
>> On Wed, May 31, 2006 at 02:34:04PM +0200, chris wrote:
>> > I have create a volume group with 4 250GByte harddisks with an ext3 =20
>> file
>> > system on the 1TB result.
>> Stripe or concat?
>>
>> > now the third harddisk failed and the volume group is "dead" - =20
>> obviously.
>> The way you created the volume had no redundancy - therefore 25% of =20
>> your data is gone, as
>> well as the volume's "completeness".
>>
>> If you did a concat, then you (with playing) may be able to get some =20
>> data back from the
>> first 500GB of the volume - but I wouldn't want to rely on anything =20
>> that came back from it.
>> I'd suggest getting hold of 2 identical blank disks, and doing a binary =
=20
>> (dd) copy of disks 1
>> and 2 to them - and then work on them.  You might be able to use =20
>> vgcfg{backup,restore} to
>> tell the system that this volume is actually only on 2 disks....  =20
>> However, anything that
>> references data > 500GB into the volume is almost definitely lost - =20
>> because although you've
>> got 750G-1TB, it's almost all going to be linked back into the section  =

>> that you've lost.
>>
>> If you did a stripe, then you can forget getting any data back off it.  =
=20
>> You've lost every
>> 4th block of whatever size you striped on.  E.g. with a 64k stripe =20
>> size, you'll have lost
>> from 128k-192k, 384k-448k, etc. - and there's almost definitely going =20
>> to be nothing
>> salvagable from that.
>>
>> Graham
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
