References: <CACj3i71bvspO5H_h8s=XBnDzRBvJwdL=Q18_4dvy+C7-ktdirw@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <53363824-396a-a4c6-9661-831637690936@redhat.com>
Date: Sat, 30 Sep 2017 19:24:06 +0200
MIME-Version: 1.0
In-Reply-To: <CACj3i71bvspO5H_h8s=XBnDzRBvJwdL=Q18_4dvy+C7-ktdirw@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Difference between Debian and some other
 distributions with thin provisioning
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Jan Tulak <jtulak@redhat.com>

Dne 29.9.2017 v 18:42 Jan Tulak napsal(a):
> Hi guys,
> I found out this difference and I'm not sure what is the cause. A
> command for creating a thin LV, which works on Archlinux, Centos and
> Fedora, fails on Debian and Ubuntu:
> 
> lvm lvcreate FOOvg1 \
>      -T \
>      -l 100%PVS \
>      -n FOOvg1_thin001 \
>      /dev/loop0 /dev/loop1 /dev/loop2

Hi

This command is not actually creating 'thin'  - only a thin-pool.
For 'thin' you need to specify -V  --virtualsize.

The usage of -T  is 'smart' flag - telling lvm2 to do 'something' 
thin/thin-pool oriented.

If you want to be 'exact' you can use --type thin  or --type thin-pool giving 
you more errors and requiring user more specific option for passing in.


> When it is created, lvs shows attributes "twi-a-tz--". But Debian and
> Ubuntu complain that  "--name may only be given when creating a new
> thin Logical volume or snapshot," even though the command states it
> should be thin with -T. A script that tests this issue is at the end
> of this email

Yep - the logic of command is internally enhanced over time and when user does 
specify parameters in a way where lvm2 can interpret them uniquely - it will 
do it.

BTW step-by around ;) for detailed explanation of all possible combination 
users can use to create  thin-pool or thin or both volumes at the same time.

> Do you know if there is a reason for this different behaviour?

It's not different -  newer version is 'enhanced' and just accepts wider 
syntax range.

> Versions seem to be close enough for it not to be a change in LVM

Hmm, close enough 111 and 171 ??


> behaviour, so I suspect some downstream or configuration changes. All
> tested distributions were run in their current stable versions, up to
> date. For example:

The original naming convention with pool names was to add the name next to VG 
name.

lvcreate -T -L10 vg/pool

Pool is 'special' type of LV - thus it got this privileged naming and standard 
option --name was normally left for  'thin' when user specifies -V.

Newer version of lvm2 can use  --name with --size specifier for pool name
when there is no virtual size given as its unique combination.

> Debian:
> # cat /etc/debian_version
> 8.9
> # lvm version
>    LVM version:     2.02.111(2) (2014-09-01)
>    Library version: 1.02.90 (2014-09-01) >    Driver version:  4.27.0

I'd suggest upgrading your Debian machine....

Regards

Zdenek
