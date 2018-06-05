References: <1973783.dFIIZJkBNM@monk> <2230803.usHgyXdh9J@monk>
	<deebd997-6278-e2a3-7b9f-3c3c58a56a51@redhat.com>
	<2010899.yIpkChuX4T@monk>
From: Marian Csontos <mcsontos@redhat.com>
Message-ID: <184ec98a-a34a-1338-a520-ff7669007e5d@redhat.com>
Date: Tue, 5 Jun 2018 10:14:16 +0200
MIME-Version: 1.0
In-Reply-To: <2010899.yIpkChuX4T@monk>
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Check of pool ernie/cache failed (status:1). Manual
 repair required!
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Dennis Schridde <devurandom@gmx.net>
Cc: Zdenek Kabelac <zkabelac@redhat.com>

On 06/04/2018 01:50 PM, Dennis Schridde wrote:
> Hello!
> 
> On Tuesday, 15 May 2018 13:15:55 CEST Zdenek Kabelac wrote:
>> To get direct access to metadata - you could use your latest lvm2 2.02.177
>> build (or even 'git master'). In these recent versions there is added
>> support to activate directly these 'subLVs'.  So with latest lvm2 you can:
>>
>> lvchange -ay  vg/lv_cmeta
> 
> This command was only successful in LVM 2.02.178-rc1, but failed in 2.02.177.
> 
>> and then you can capture content of this LV via 'dd' into file
>> and compress and attach 'xz' compressed to BZ.
> 
> I created a report in bugzilla [4], but since the `cache_cmeta` LV appears to
> contain parts of my personal files, I cannot attach it.  However, I gained

It definitely should not. _cdata is where fragments you your data are 
stored, and _cmeta contains only metadata (e.g. counters and references 
to cdata.)

If there really are fragments of data in _cmeta LV, something must have 
gone wrong elsewhere.

> access to the metadata LV now and would be able to provide you access to
> certain specific parts of it, if requested.
> 
> My goal is still to gain access to as much of the data as possible.
> 
> --Dennis
> 
> [4]: https://bugzilla.redhat.com/show_bug.cgi?id=1585670
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
