Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
From: Brassow Jonathan <jbrassow@redhat.com>
In-Reply-To: <cef73213-71cc-845f-19a4-a9ecf9ec2ec6@yahoo.co.uk>
Date: Mon, 25 Sep 2017 16:36:07 -0500
Message-Id: <38D81D1A-3CBB-46FC-A521-DFC9645D154D@redhat.com>
References: <13f08f25-6b16-e930-b609-4cd2799b08da@yahoo.co.uk>
	<666DE320-FD89-4208-8056-DB6AA4F370B1@redhat.com>
	<f0c18f73-7f53-c64b-2a42-33dbabd9264d@yahoo.co.uk>
	<D9004294-FE5F-416F-95C4-C74D9681DB86@redhat.com>
	<0375938e-4a89-1432-9e31-94b54bcf2ec0@yahoo.co.uk>
	<0FACE6A4-64F5-4712-8F5E-F87A0508F906@redhat.com>
	<a2b02099-323c-c0cd-1821-7dd632fdf137@yahoo.co.uk>
	<cef73213-71cc-845f-19a4-a9ecf9ec2ec6@yahoo.co.uk>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] raid & its stripes
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>


> On Sep 23, 2017, at 10:35 AM, lejeczek <peljasz@yahoo.co.uk> wrote:
> 
> 
> 
> On 23/09/17 16:31, lejeczek wrote:
>> 
>> 
>> On 18/09/17 17:10, Brassow Jonathan wrote:
>>>> On Sep 15, 2017, at 6:59 AM, lejeczek <peljasz@yahoo.co.uk> wrote:
>>>> 
>>>> 
>>>> On 15/09/17 03:20, Brassow Jonathan wrote:
>>>>> There is definitely a difference here.  You have 2 stripes with 5 devices in each stripe.  If you were writing sequentially, you’d be bouncing between the first 2 devices until they are full, then the next 2, and so on.
>>>>> 
>>>>> When using the -i argument, you are creating 10 stripes. Writing sequentially causes the writes to go from one device to the next until all are written and then starts back at the first.  This is a very different pattern.
>>>>> 
>>>>> I think the result of any benchmark on these two very different layouts would be significantly different.
>>>>> 
>>>>>   brassow
>>>>> 
>>>>> BTW, I swear at one point that if you did not provide the ‘-i’ it would use all of the devices as a stripe, such that your two examples would result in the same thing.  I could be wrong though.
>>>>> 
>>>> that's what I thought I remembered too.
>>>> I guess a big question, from user/admin perspective is: are those two stripes LVM decides on(when no -i) is the best possible choice LVM makes after some elaborative determination so the number of stripes(no -i) would, might vary depending on raid type, phy devices number and maybe some other factors or, 2 stripes are simply hard-coded defaults?
>>> If it is a change in behavior, I’m sure it came as the result of some changes in the RAID handling code from recent updates and is not due to some uber-intellegent agent that is trying to figure out the best fit.
>>> 
>>>   brassow
>>> 
>> but if confuses, current state of affairs is confusing. To add to it:
>> 
>> ~]# lvcreate --type raid5 -n raid5-0 -l 96%vg caddy-six /dev/sd{a..f}
>>   Using default stripesize 64.00 KiB.
>>   Logical volume "raid5-0" created.
>> 
>> ~]# lvs -a -o +stripes caddy-six
>>   LV                 VG        Attr       LSize   Pool Origin Data% Meta%  Move Log Cpy%Sync Convert #Str
>>   raid5-0            caddy-six rwi-a-r--- 1.75t                                    0.28                3
>>   [raid5-0_rimage_0] caddy-six Iwi-aor--- 894.25g                                                        1
>>   [raid5-0_rimage_0] caddy-six Iwi-aor--- 894.25g                                                        1
>>   [raid5-0_rimage_1] caddy-six Iwi-aor--- 894.25g                                                        1
>>   [raid5-0_rimage_1] caddy-six Iwi-aor--- 894.25g                                                        1
>>   [raid5-0_rimage_2] caddy-six Iwi-aor--- 894.25g                                                        1
>>   [raid5-0_rimage_2] caddy-six Iwi-aor--- 894.25g                                                        1
>>   [raid5-0_rmeta_0]  caddy-six ewi-aor--- 4.00m                                                        1
>>   [raid5-0_rmeta_1]  caddy-six ewi-aor--- 4.00m                                                        1
>>   [raid5-0_rmeta_2]  caddy-six ewi-aor--- 4.00m                                                        1
>> 
>> VG and LV upon creating was told: use 6 PVs.
>> How can we rely on what lvcreate does when left to decide and/or use defaults?
>> Is above example with raid5 what LVM is suppose to do? Is it even correct raid5 layout(six phy disks)?
>> 
>> regards.
>> 
>> 
>  ~]# lvs -a -o +stripes,devices caddy-six
>   LV                 VG        Attr       LSize   Pool Origin Data% Meta%  Move Log Cpy%Sync Convert #Str Devices
>   raid5-0            caddy-six rwi-a-r--- 1.75t                                    2.36                3 raid5-0_rimage_0(0),raid5-0_rimage_1(0),raid5-0_rimage_2(0)
>   [raid5-0_rimage_0] caddy-six Iwi-aor--- 894.25g                                                        1 /dev/sda(1)
>   [raid5-0_rimage_0] caddy-six Iwi-aor--- 894.25g                                                        1 /dev/sdd(0)
>   [raid5-0_rimage_1] caddy-six Iwi-aor--- 894.25g                                                        1 /dev/sdb(1)
>   [raid5-0_rimage_1] caddy-six Iwi-aor--- 894.25g                                                        1 /dev/sde(0)
>   [raid5-0_rimage_2] caddy-six Iwi-aor--- 894.25g                                                        1 /dev/sdc(1)
>   [raid5-0_rimage_2] caddy-six Iwi-aor--- 894.25g                                                        1 /dev/sdf(0)
>   [raid5-0_rmeta_0]  caddy-six ewi-aor--- 4.00m                                                        1 /dev/sda(0)
>   [raid5-0_rmeta_1]  caddy-six ewi-aor--- 4.00m                                                        1 /dev/sdb(0)
>   [raid5-0_rmeta_2]  caddy-six ewi-aor--- 4.00m                                                        1 /dev/sdc(0)

Yeah, looks right to me.  It seems it is picking the minimum viable stripes for the particular RAID type.  RAID0 obviously needs at least 2 stripes.  If you give it 8 devices, it will still choose 2 stripes with 4 devices composing each “leg/image”.  Your RAID5 needs 3 devices (2 for stripe and 1 for parity).  Again, given 6 devices it will choose the minimum stripe count plus a parity.  I suspect RAID 6 would choose at least 3 stripes and the 2 mandatory parity - a minimum of 5 devices.

Bottom line, if you want a specific number of stripes, use ‘-i’.   Remember, ‘-i' specifies the number of stripes and the parity count is added automatically.

 brassow
