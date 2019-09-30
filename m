From: =?iso-8859-2?Q?Max_Halld=E9n?= <max.hallden@wisi.se>
Date: Mon, 30 Sep 2019 09:30:55 +0000
Message-ID: <b9d4c4b2-f51c-7ceb-9270-5a95043df38d@wisi.se>
References: <a308600f-4a00-038c-1c6d-947564130712@wisi.se>
	<1ba300a6-3d33-35d3-657a-3e4a35c87c5b@redhat.com>
In-Reply-To: <1ba300a6-3d33-35d3-657a-3e4a35c87c5b@redhat.com>
Content-Language: en-US
Content-ID: <E16DE1DAE9E38749986A220F844E1FAA@eurprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] vg activation without backup
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
To: Zdenek Kabelac <zkabelac@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

On 2019-09-30 11:06, Zdenek Kabelac wrote:
> Dne 27. 09. 19 v 11:14 Max Halld�n napsal(a):
>> Hi all,
>>
>> I'm running this command:
>>
>> root@(none):~# vgchange -A n -a y my_vg
>> �� -A option not necessary with -a option
>> �� Run `vgchange --help' for more information.
>>
>> It seems like activation (-a) implies autobackup (-A) since it
>> doesn't accept the option to disable it. Is the backup really
>> required when activating the group? I would rather skip it.
>>
>
> Hi
>
> This looks like regression in argument parsing� -� please open BZ
> for this case. Use either the community BZ:
>
> https://bugzilla.redhat.com/enter_bug.cgi?product=LVM%20and%20device-mapper
>
>
> or Fedora or RHEL one if you use those.
>
> Thank you.
>
> Zdenek

Thank you for the response,

I added a ticket:

https://bugzilla.redhat.com/show_bug.cgi?id=1756949

Regards,
Max
