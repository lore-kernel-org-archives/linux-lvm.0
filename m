MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Fri, 06 Jan 2017 20:21:58 +0100
From: Xen <list@xenhideout.nl>
In-Reply-To: <20170106191902.GB22165@redhat.com>
References: <78cb8a27a39f59bc31b11e1044af620f@dds.nl>
	<20170106191902.GB22165@redhat.com>
Message-ID: <6191529afb210ae7042670822f5fe1ad@xenhideout.nl>
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
To: David Teigland <teigland@redhat.com>
Cc: list@xenhideout.nl, Linux lvm <linux-lvm@redhat.com>

David Teigland schreef op 06-01-2017 20:19:
> On Fri, Jan 06, 2017 at 08:10:20PM +0100, Xen wrote:
>> This is what I mean:
>> 
>>   Found duplicate PV 3U9ac3Ah5lcZUf03Iwm0cgMMaKxdflg0: using /dev/sdb4 
>> not
>> /dev/sdc4
> 
> The handling of duplicate PVs has been entirely redone in recent 
> versions.
> The problems you are having are well known and should now be fixed.

Oh right, I was going to write my LVM version, but did not manage to 
produce it yet, sorry :p.

Good to know. Yeah I am using 16.04 from Ubuntu's version.

   LVM version:     2.02.133(2) (2015-10-30)
   Library version: 1.02.110 (2015-10-30)
   Driver version:  4.34.0

Sigh... I guess I'll have to make some time to start using a recent 
version then on this system. Perhaps it was due time. Always these old 
versions...
