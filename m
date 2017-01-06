References: <78cb8a27a39f59bc31b11e1044af620f@dds.nl>
	<20170106191902.GB22165@redhat.com>
	<6191529afb210ae7042670822f5fe1ad@xenhideout.nl>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <88a5fbe3-0806-ac5f-7da2-0555fc6d3ff7@redhat.com>
Date: Fri, 6 Jan 2017 21:06:17 +0100
MIME-Version: 1.0
In-Reply-To: <6191529afb210ae7042670822f5fe1ad@xenhideout.nl>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] how to change UUID of PV of duplicate partition
	(followup)
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: list@xenhideout.nl

Dne 6.1.2017 v 20:21 Xen napsal(a):
> David Teigland schreef op 06-01-2017 20:19:
>> On Fri, Jan 06, 2017 at 08:10:20PM +0100, Xen wrote:
>>> This is what I mean:
>>>
>>>   Found duplicate PV 3U9ac3Ah5lcZUf03Iwm0cgMMaKxdflg0: using /dev/sdb4 not
>>> /dev/sdc4
>>
>> The handling of duplicate PVs has been entirely redone in recent versions.
>> The problems you are having are well known and should now be fixed.
>
> Oh right, I was going to write my LVM version, but did not manage to produce
> it yet, sorry :p.
>
> Good to know. Yeah I am using 16.04 from Ubuntu's version.
>
>   LVM version:     2.02.133(2) (2015-10-30)
>   Library version: 1.02.110 (2015-10-30)
>   Driver version:  4.34.0
>
> Sigh... I guess I'll have to make some time to start using a recent version
> then on this system. Perhaps it was due time. Always these old versions...
>
> _______________________________________________


You can always 'fix it' you way.

Just setup  device filter in  lvm.conf  so you either  see diskA or diskB

In you particular  case:

  filter = [ "r|/dev/sdb4|" ]

or

  filter = [ "r|/dev/sdc4|" ]


And set/change things with your existing lvm2 version....

Regards

Zdenek
