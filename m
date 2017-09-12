References: <1806055156.426333.1505228581063.ref@mail.yahoo.com>
	<1806055156.426333.1505228581063@mail.yahoo.com>
	<f7d5f3b9-20fc-8043-2599-49946a598e5a@assyoma.it>
	<4eedd3e5-2284-1013-19a5-7463689c0bbe@redhat.com>
	<d92e283e074aab79c6fed31e856a395f@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <ed8101cb-31bb-1eac-1278-34a77ad6d6b4@redhat.com>
Date: Wed, 13 Sep 2017 01:11:39 +0200
MIME-Version: 1.0
In-Reply-To: <d92e283e074aab79c6fed31e856a395f@assyoma.it>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Reserve space for specific thin logical volumes
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
To: Gionatan Danti <g.danti@assyoma.it>, LVM general discussion and development <linux-lvm@redhat.com>

Dne 13.9.2017 v 00:55 Gionatan Danti napsal(a):
> Il 13-09-2017 00:41 Zdenek Kabelac ha scritto:
>> There are maybe few worthy comments - XFS is great on stanadar big
>> volumes, but there used to be some hidden details when used on thinly
>> provisioned volumes on older RHEL (7.0, 7.1)
>>
>> So now it depend how old distro you use (I'd probably highly recommend
>> upgrade to RH7.4 if you are on RHEL based distro)
> 
> Sure.
> 
>> Basically 'XFS' does not have similar 'remount-ro' on error behavior
>> which 'extX' provides - but now XFS knows how to shutdown itself when
>> meta/data updates starts to fail - although you may need to tune some
>> 'sysfs' params to get 'ideal' behavior.
> 
> True, with a catch: with the default data=ordered option, even ext4 does *not* 
> remount read only when data writeout fails. You need to use both 
> "errors=remount-ro" and "data=journal" which basically nobody uses.
> 
>> Personally for smaller sized thin volumes I'd prefer 'ext4' over XFS -
>> unless you demand some specific XFS feature...
> 
> Thanks for the input. So, do you run your ext4 filesystem with data=journal? 
> How they behave performane-wise?
> 

As said     data=journal   is big performance killer (especially on SSD)

Personally  I prefer early 'shutdown' in case the situation becomes critical
(i.e. 95% fullness because some process gets crazy)

But you can write any advanced scripting logic to suit best your needs -

i.e. replace all thins on thin-pool with 'error' target....
(which  is as simple as using  'dmsetup remove --force'.... - this will
make all future read/writes  giving you  i/o errors....)

Simply do all in user-space early enough before  thin-pool can ever get NEAR t 
being 100% full -  reaction is really quick - and you have at least 60seconds 
to solve the problem in worst case.....



Regards

Zdenek
